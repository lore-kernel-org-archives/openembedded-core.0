Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id F24D17E704
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 14:56:28 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 17EC8249AFA;
	Wed, 12 Jun 2019 10:56:30 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id 2jUPrgCD4bT0; Wed, 12 Jun 2019 10:56:29 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id B42F4249AF4;
	Wed, 12 Jun 2019 10:56:29 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com B42F4249AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1560351389;
	bh=l3S3cC864P58o3CkW1Ie7LjinPADGoAMleryQA1uaWc=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=L1hofRbjjdHQHkPEP5aiWNdFqlB7gUSUmcHi+PgUdWKbtxF121sjpSV4DkJeYOSCi
	P0jsxp0FN9NzjBMtjgRUOk0kOPzIh0lD/4y69ObB6L7zdSarHehClwer3jFJ236SEa
	XCEeLL4YnFtmOlyyE/AfAIIAWtegHzBruUbBt1RwYd8IUy358LsUVu5QZoLwG8uSk3
	O54HMNaUqYCjLV4tV4XIqU0omvglr4DlkzCBtraDPyTUw+hW+YeWRE2owilMmONMZ9
	Beo4uWvUFh8+WqNgUEmn+xDhIPRKATyQPu3cRJgj5mfOT5RBEnOiBJXSH5GRg5EvXt
	r+ZE5ZccADGuA==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id IJM3aFzrIHRH; Wed, 12 Jun 2019 10:56:29 -0400 (EDT)
Received: from joraj-alpa (192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 7E73A249AE3;
	Wed, 12 Jun 2019 10:56:29 -0400 (EDT)
Date: Wed, 12 Jun 2019 10:56:26 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: He Zhe <zhe.he@windriver.com>
Message-ID: <20190612145626.GA972@joraj-alpa>
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
	<be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
	<20190612105114.GA23143@localhost>
	<1859381600.42862.1560337102909.JavaMail.zimbra@efficios.com>
	<0ea3a599-7adb-a001-dbdd-3843d0fa8b6e@windriver.com>
	<20190612145236.GA27613@joraj-alpa>
MIME-Version: 1.0
In-Reply-To: <20190612145236.GA27613@joraj-alpa>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	lttng-dev <lttng-dev@lists.lttng.org>,
	Jeremie Galarneau <jgalar@efficios.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH v2] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jun 2019 14:56:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 10:52:36AM -0400, Jonathan Rajotte-Julien wrote:
> Hi,
> 
> > > Please don't base distributions on -rc tags. They are not meant for this.
> > >
> > > We always integrate support for newer kernel versions instrumentation back
> > > into our current stable release. So as soon as 5.2 final comes out, we will
> > > release a 2.10.x version including support for it in lttng-modules.
> > 
> > I'm one of the people who need to use lttng-modules on rc kernel.
> 
> If so, please use a git based recipe building the HEAD of the latest released
> stable branch (stable-2.10 currently since 2.11 is in currently in the RC
> stage). If you have problem, report them on our mailing list [1] or our bug
> tracker [2]. We have extensive CI jobs for lttng-modules against the vanilla
> kernel [3] and other usual suspects [4]. We normally catch those problems
> quite quickly. Keep in mind that in no way should a production image be built
> with a non tagged release.
> 
> As for the oe-core recipe, please send us a quick email to let us know, patch
> level releases are cheap. Keep in mind that we are chasing a moving target
> here.
> 
> To add to Mathieu statement, not only do we integrate support for newer kernels into
> the current stable branch but also in all the supported stable branch when
> possible. The supported stable release are normally the 3 latest minor-level releases.

3 -> 2 latest release.

> Currently this set is : 2.8, 2.9, 2.10 .

Slight correction : 2.9, 2.10

> 
> [1] https://lists.lttng.org/cgi-bin/mailman/listinfo/lttng-dev
> [2] https://bugs.lttng.org/
> [3] An example of such job running: https://ci.lttng.org/view/LTTng-modules/job/lttng-modules_master_build-vanilla/648/console
>     This job validate that lttng-modules master builds against the following vanilla kernel tags. We have
>     similar jobs for master, stable 2.11, stable 2.10, stable 2.9, stable 2.10 lttng-modules branch.
>       v3.0.101
>       v3.1.10
>       v3.2.102
>       v3.3.8
>       v3.4.113
>       v3.5.7
>       v3.6.11
>       v3.7.10
>       v3.8.13
>       v3.9.11
>       v3.10.108
>       v3.11.10
>       v3.12.74
>       v3.13.11
>       v3.14.79
>       v3.15.10
>       v3.16.68
>       v3.17.8
>       v3.18.140
>       v3.19.8
>       v4.0.9
>       v4.1.52
>       v4.2.8
>       v4.3.6
>       v4.4.181
>       v4.5.7
>       v4.6.7
>       v4.7.10
>       v4.8.17
>       v4.9.181
>       v4.10.17
>       v4.11.12
>       v4.12.14
>       v4.13.16
>       v4.14.125
>       v4.15.18
>       v4.16.18
>       v4.17.19
>       v4.18.20
>       v4.19.50
>       v4.20.17
>       v5.0.21
>       v5.1.9
>       v5.2-rc4
> [4] https://ci.lttng.org/view/LTTng-modules/
> 
> -- 
> Jonathan Rajotte-Julien
> EfficiOS

-- 
Jonathan Rajotte-Julien
EfficiOS

