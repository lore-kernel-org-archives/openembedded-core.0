Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id BE3F071AFF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 01:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8CA8331C225D;
	Wed,  7 Dec 2016 02:41:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BenTSYb3YGQf; Wed,  7 Dec 2016 02:41:18 +0100 (CET)
Received: from [172.22.22.61] (55d40c51.access.ecotel.net [85.212.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 965BE31C1B5B;
	Wed,  7 Dec 2016 02:41:18 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-29-git-send-email-obi@opendreambox.org>
	<CAJTo0LbmQkctYKqyYvbHyd+Jf-j8gkdUpH-hcPWwggWN-jinyQ@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <56ed03e3-eb14-6037-126b-3ef862326baa@opendreambox.org>
Date: Wed, 7 Dec 2016 02:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbmQkctYKqyYvbHyd+Jf-j8gkdUpH-hcPWwggWN-jinyQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 28/33] dpkg: update packages and files to match Debian more closely
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
X-List-Received-Date: Wed, 07 Dec 2016 01:41:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06.12.2016 21:13, Burton, Ross wrote:
> 
> On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org
> <mailto:obi@opendreambox.org>> wrote:
> 
>     +RRECOMMENDS_dpkg-perl = "gnupg gpgv"
> 
> 
> With plain master this causes a build failure:
> 
> ERROR: Multiple versions of gnupg are due to be built
> (/home/ross/Yocto/poky/meta/recipes-support/gnupg/gnupg_2.1.14.bb
> <http://gnupg_2.1.14.bb>
> /home/ross/Yocto/poky/meta/recipes-support/gnupg/gnupg_1.4.7.bb
> <http://gnupg_1.4.7.bb>). Only one version of a given PN should be built
> in any given build. You likely need to set PREFERRED_VERSION_gnupg to
> select the correct version or don't depend on multiple versions.
> 
> As gnupg 1.4.7 provides gpgv, but 2.1.14 doesn't.
> 
> No idea where 2.1.14 should, what gpgv is, or what the solution is, as
> it's late and I'm going to crash on the sofa. :)

Version 1.4.7 splits-out gpgv to its own package. It can be used to
verify signatures, but can't encrypt or sign anything. I'm using it in
an initramfs for its small size, unrelated to dpkg though.

I didn't notice this, because I have PREFERRED_VERSION_gnupg set to
1.4.7, which however RDEPENDS on gpgv, so the obvious fix is:

RRECOMMENDS_dpkg-perl = "gnupg"

I don't remember where it came from, maybe I took it from Debian.

Thank you for your review! I'm going to update my branch now (obi/deb on
openembedded-core-contrib) with all your comments addressed, hopefully.
Do you want me to submit v2 to the mailing list, too?

Regards,
Andreas


