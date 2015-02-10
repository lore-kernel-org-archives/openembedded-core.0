Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA4C6E593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 15:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1AFtlwi016859; Tue, 10 Feb 2015 15:55:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AX04cf0dSS3P; Tue, 10 Feb 2015 15:55:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1AFtVUe016842
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 Feb 2015 15:55:42 GMT
Message-ID: <1423583731.20217.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 15:55:31 +0000
In-Reply-To: <CAJTo0LaNQLGjMWDUQr0SMFDDRe3KTH_MxoUbHMJ9ex9W854jKg@mail.gmail.com>
References: <cover.1423420390.git.pab@pabigot.com>
	<CABcZANmkGNPwvdt==h_LAA-Q6e5Umwti2g=qvj3r_vyQrqxjHA@mail.gmail.com>
	<CAJTo0LaNQLGjMWDUQr0SMFDDRe3KTH_MxoUbHMJ9ex9W854jKg@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 00/10] bluez4/bluez5 selection fixing Yocto 5031
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
X-List-Received-Date: Tue, 10 Feb 2015 15:55:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-02-10 at 15:43 +0000, Burton, Ross wrote:
> 
> On 8 February 2015 at 21:16, Christopher Larson <clarson@kergoth.com>
> wrote:
>                     DISTRO_FEATURES_append = " bluez5"
>                     PREFERRED_PROVIDER_bluez-hcidump = "bluez5"
>                     PNBLACKLIST[bluez-hcidump] = "superseded by
>                 bluez5"
>                     PNBLACKLIST[gst-plugin-bluetooth] = "dropped from
>                 bluez5"
>                     PNBLACKLIST[bluez4] = "superseded by bluez5"
>
>         For what it's worth, I like the look of this series (and have
>         since they were first posted). Hopefully it gets merged.
>
> My concern with this series is using DISTRO_FEATURES to control what
> version of BlueZ is used in the image.  What makes BlueZ so special
> that it deserves a DISTRO_FEATURE as opposed to a
> PREFERRED_PROVIDER_virtual/bluez or a variable such as BLUEZ_VERSION
> defined in bluetooth.bbclass?

I think that concern has been holding this up for a while but I don't
see a good way to avoid it. I'd observe that:

* DISTRO_FEATURES was created to have a common place to enable/disable 
  things rather than individual variables
* There is precedent for package specific issues in DISTRO_FEATURES 
  (e.g. libc)
* PREFERRED_PROVIDER is not a good match for this problem as the 
  providers are not identical, or a drop in replacement, far from it.

So whilst I understand the concern I think we have to move past that
based on the above.

Cheers,

Richard




