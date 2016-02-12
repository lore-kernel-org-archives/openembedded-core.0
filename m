Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 547CC766E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:34:24 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 892A420435
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 06:34:23 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute2.internal (MEProxy); Fri, 12 Feb 2016 06:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=lVwgSrw1CveEmJ2
	QoZkcz3hxspI=; b=ObNlrB62BcmmGoBYApwdT5pAGx0sr3LNKEs3HV/of2qfW4m
	JHCuWsbXQlhN7TzRKbHkdHLb8E/lEV0yH15I6WoXaxlo+nQ1OGyJ0sJtQATxcCeY
	dea3zzhcXeJaNSoSYLohFFqKCHDCbfhuGLMyMmyz9sVXAA6zkOO+c2v+hRn0=
X-Sasl-enc: oY1bRkxDMqcmFfwnKcqr4lDB1eqziBFf+wl8Zira/VX4 1455276863
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id E2E71C0001A;
	Fri, 12 Feb 2016 06:34:22 -0500 (EST)
Message-ID: <1455276861.1450.7.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: alexander.kanavin@linux.intel.com
Date: Fri, 12 Feb 2016 13:34:21 +0200
In-Reply-To: <62334.10.252.9.169.1455279065.squirrel@linux.intel.com>
References: <1452754378-2096-1-git-send-email-tanuk@iki.fi>
	<5697824A.8040503@linux.intel.com> <1452774089.11077.100.camel@iki.fi>
	<62334.10.252.9.169.1455279065.squirrel@linux.intel.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] alsa-lib: 1.0.29 -> 1.1.0
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
X-List-Received-Date: Fri, 12 Feb 2016 11:34:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-02-12 at 14:11 +0200, alexander.kanavin@linux.intel.com wrote:
> > > > Changelog: http://alsa-project.org/main/index.php/Changes_v1.0.29_v
> > > > 1.1.0
> > > 
> > > What about all the other alsa-* recipes?
> > 
> > They are coming.
> 
> 
> The window for version updates is closing at the end of February, so you
> should hurry up. Also, pulseaudio is now two major releases behind.

It's closing so soon? Hmm, I didn't realize that. Luckily the patches
are at this point only lacking build testing on all archs. PulseAudio
update is included.

-- 
Tanu

