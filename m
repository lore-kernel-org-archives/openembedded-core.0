Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 310DF738C9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 11:47:09 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so11799173qgf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 03:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T9lhxtB8NMduyYsBwfGGfy9/s66GZm3HJEQT8AhtrO4=;
	b=G9EZkBabgthhwwmYAQU6Fx795/9h35iIlvM6gONuV2JYCmYGYGeD55p6HsYcmsTbY+
	2QTXeTXa2a+RNLinlsyFYntqKndgbwSaYoRCgKVW+aWb6/8LBvf58UyhJ1k5P2ddEp4p
	uBEbPslV61xh/pacwB1GcU0uH3Bf5mvTtNqVmPVS2rRBFVctzrCKRgSDZHm/LUzxV+Ra
	18r+3M48wO35Ew4F2Nr1T48xHCVQs23kdMjdpnlu8/pIzKl14jtAExKxE6c4W+dakz7H
	P046ajEWMG0Ta7iIU8IThUZwi/UCC5L28o26moSAkKt5MNuHf5bMZDRNty1mFtlCfHIF
	MriA==
X-Gm-Message-State: ALoCoQkYNu3+34LGvtX2WLmoFWnqPOQGMzJOO7AovH8fArCV4weO+TNSRMGAJAryphEnBubaUxjW
X-Received: by 10.55.21.12 with SMTP id f12mr28044098qkh.40.1425642430793;
	Fri, 06 Mar 2015 03:47:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 6 Mar 2015 03:46:50 -0800 (PST)
In-Reply-To: <1425408376-16981-1-git-send-email-florian.boor@kernelconcepts.de>
References: <1425408376-16981-1-git-send-email-florian.boor@kernelconcepts.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Mar 2015 11:46:50 +0000
Message-ID: <CAJTo0LZL=jaHMLP-txpcDFWbpi_c4R3xWJQ0dk51mbF7ZdaWgQ@mail.gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: Florian Boor <florian@kernelconcepts.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb: Allow native builds of directfb 1.7.6
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
X-List-Received-Date: Fri, 06 Mar 2015 11:47:10 -0000
Content-Type: multipart/alternative; boundary=001a1147f3f4aa21a905109d3ebf

--001a1147f3f4aa21a905109d3ebf
Content-Type: text/plain; charset=UTF-8

On 3 March 2015 at 18:46, Florian Boor <florian.boor@kernelconcepts.de>
wrote:

> Required by some DirectFB applications like dfbsee.
>

ERROR: Nothing PROVIDES 'tslib-native' (but
virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-graphics/directfb/
directfb_1.7.6.bb DEPENDS on or otherwise requires it). Close matches:
  zlib-native
  libxt-native
  libsm-native
ERROR: Nothing PROVIDES 'sysfsutils-native' (but
virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-graphics/directfb/
directfb_1.7.6.bb DEPENDS on or otherwise requires it). Close matches:
  elfutils-native
  findutils-native
  dosfstools-native

Presumably you have patches to enable those for native, or would it be best
to disable them in the native case as presumably all you need are the tools?

Ross

--001a1147f3f4aa21a905109d3ebf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 March 2015 at 18:46, Florian Boor <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:florian.boor@kernelconcepts.de" target=3D"_blank">florian.boor@kernelco=
ncepts.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":3iw" class=
=3D"" style=3D"overflow:hidden">Required by some <span class=3D"">DirectFB<=
/span> applications like dfbsee.<br></div></blockquote></div><br><div class=
=3D"gmail_extra">ERROR: Nothing PROVIDES &#39;tslib-native&#39; (but virtua=
l:native:/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/bui=
ld/meta/recipes-graphics/directfb/<a href=3D"http://directfb_1.7.6.bb">dire=
ctfb_1.7.6.bb</a> DEPENDS on or otherwise requires it). Close matches:</div=
><div class=3D"gmail_extra">=C2=A0 zlib-native</div><div class=3D"gmail_ext=
ra">=C2=A0 libxt-native</div><div class=3D"gmail_extra">=C2=A0 libsm-native=
</div><div class=3D"gmail_extra">ERROR: Nothing PROVIDES &#39;sysfsutils-na=
tive&#39; (but virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worke=
r/build-appliance/build/meta/recipes-graphics/directfb/<a href=3D"http://di=
rectfb_1.7.6.bb">directfb_1.7.6.bb</a> DEPENDS on or otherwise requires it)=
. Close matches:</div><div class=3D"gmail_extra">=C2=A0 elfutils-native</di=
v><div class=3D"gmail_extra">=C2=A0 findutils-native</div><div class=3D"gma=
il_extra">=C2=A0 dosfstools-native</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Presumably you have patches to enable those fo=
r native, or would it be best to disable them in the native case as presuma=
bly all you need are the tools?</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div></div>

--001a1147f3f4aa21a905109d3ebf--
