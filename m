Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ED8C970259
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:47:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GLlKVh025393; Wed, 16 Jul 2014 22:47:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jVrgivilvnyJ; Wed, 16 Jul 2014 22:47:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GLlDWU025383
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 22:47:15 +0100
Message-ID: <1405547228.3668.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jul 2014 22:47:08 +0100
In-Reply-To: <CAJTo0LYPQvPP0f_4w1bV=56KoUvMDCmwqpMp2Q8mHg+_krZ0Wg@mail.gmail.com>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
	<742f62754f3a09352af1aa87c3072472f6e6549d.1405527926.git.richard.purdie@linuxfoundation.org>
	<CAJTo0LYPQvPP0f_4w1bV=56KoUvMDCmwqpMp2Q8mHg+_krZ0Wg@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/19] xserver-xorg: Fix build determinism problem
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
X-List-Received-Date: Wed, 16 Jul 2014 21:47:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-16 at 21:38 +0100, Burton, Ross wrote:
> On 16 July 2014 17:26, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > WARNING: QA Issue: xserver-xorg rdepends on nettle but its not a build dependency? [build-deps]
> >
> > We list openssl in DEPENDS so we need to specify that as the sha1 provider
> > rather that nettle which is autodetected.
> 
> If xserver is seeing both openssl and nettle installed but picking
> nettle, should we switch the build dependency from openssl to nettle?
> The nettle library is half the size of openssl and has saner
> licensing, so this seems like a win to me.

Happy to have a follow up patch. I just fixed it so it was at least
doing what we were supposedly configuring it to.

Cheers,

Richard


