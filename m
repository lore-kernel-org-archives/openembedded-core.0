Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5A29C60684
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 23:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21NrNRO009878; Wed, 1 Mar 2017 23:53:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dHVbwZvTVQ9U; Wed,  1 Mar 2017 23:53:23 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21NrLpY009875
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 23:53:22 GMT
Message-ID: <1488412401.24526.48.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 01 Mar 2017 23:53:21 +0000
In-Reply-To: <8bbaa675-7c8b-d00d-3b22-f051abf763a2@windriver.com>
References: <8bbaa675-7c8b-d00d-3b22-f051abf763a2@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: About scripts/oe-find-native-sysroot
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
X-List-Received-Date: Wed, 01 Mar 2017 23:53:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-01 at 13:58 +0800, Robert Yang wrote:
> Hi RP,
> 
> The common STAGING_DIR_NATIVE is gone, so the OECORE_NATIVE_SYSROOT
> defined in scripts/oe-find-native-sysroot doesn't make any sense
> currently:
> 
> OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d
> '"' -f2`
> 
> But the following ones depend on it:
> 
> meta/classes/populate_sdk_ext.bbclass
> meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> scripts/oe-run-native
> scripts/runqemu-export-rootfs
> scripts/runqemu-extract-sdk
> 
> What shall we do on oe-find-native-sysroot? Remove it and
> make other ones work without it? Or let it depend on build-sysroots,
> please ?

If we could make other things survive without it that would be good.
Some might want to use the addto_recipe_sysroot task:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ce79111e735529546e8a20e4315e3566a556a936

In some cases build-sysroots would likely make the most sense.

Cheers,

Richard

