Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6434D72EA0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 07:04:19 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id n20so103786ual.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 00:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=nbqfLA8Vb8ScJtS3TON7lJpb9EPE9cT2zt90owW19Kg=;
	b=sNLauVO+HFz4TZg7YM6dW1qEiypppAnEPsotaCzysvMNFoav73/OPcG8EZuqPbdACi
	H4dGFi8jj6e0JiWHUBEcTRlmRaAR7FUZ/d1xheBecnUb5Ju6Eh9Ayb4dlKOMGU8xkykx
	UsRiZno6We3wzvuZ0g2KM+RYC4jJIL6VnLEmoLy+w5d6fsk+uQRJXMVPMOYwLmVzMUsM
	8tRzg5YXqRZPYLwSVn2aIyOY7lXwQaR9jRCvho4qtSwBsa49UQXV5uuqeoWn24kF7U+P
	FayvDTUHNMx3Kh8kMoR+V/1KR8NaLRw1mVuhfwNYpj89A2325hGczW5OeiCDnnBN+CJR
	UTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=nbqfLA8Vb8ScJtS3TON7lJpb9EPE9cT2zt90owW19Kg=;
	b=iltBPjH0WiaNc0xRTI23kwW9jH+0P2S7V2LOhQDlX+oI+2MuBbsD2i5EndHUhnmW2O
	aJkGwIYfQPt4TGRGpgqTCJ9ASHK6+EaWNBnJx5tYScEGi7o/V1svwzbzw7UY2mo7T2Hr
	mr+CpdQu5TEsszk3lGvb4sGwSYWIMclWX1yb89a7K41ib1xllkyDX5EINqQAQWdEk0dd
	I9SZAHgjxOwk4AWCsqKUl4E+dEp1puCXcBSX4Ysplnb17OlHKPXfsw+Qpj47w0NNI/8u
	Uqm7G9MAhXSPQw0UaMD5iRRUlpMgwkFPKF/pvPDxkAnc+lKyTq+FAMVhRESqCUxgQPDR
	Ml6w==
X-Gm-Message-State: ALQs6tA557vz6Z+HWaRR0m2aVyjCWqY6/UI80wMzJpRKO1yyakWmB2Da
	U+DTeqDADZkkjPbRDn2ocYmr5SAuuLv8si+nDPqLng==
X-Google-Smtp-Source: AIpwx48jUX1Zk0QgLvkgZofM82TNpv/Kf1q65XutgZBO3H95Ysiy3GlalU23Ejb6tUI23X58bCfV/gWh/xi8vJGpdvk=
X-Received: by 10.159.61.203 with SMTP id e11mr16108951uaj.115.1522998257049; 
	Fri, 06 Apr 2018 00:04:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.219.149 with HTTP; Fri, 6 Apr 2018 00:04:16 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Fri, 6 Apr 2018 12:34:16 +0530
Message-ID: <CAPGMVzHrMfL77A2A2+JLFugomdnW_OB2EikVamyqTJjqoDxmUA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	"bmwcarit/meta-ros" <meta-ros@noreply.github.com>, "bmwcarit/meta-ros"
	<reply+0166d8af28c94d998a94f8bd02e5dbf7dee27d85a84e804992cf0000000116d0c5d292a169ce126349f1@reply.github.com>
Subject: [oe] [meta-ros] ros build error on poky
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
X-List-Received-Date: Fri, 06 Apr 2018 07:04:19 -0000
Content-Type: multipart/alternative; boundary="089e082450281ae33a056928aa86"

--089e082450281ae33a056928aa86
Content-Type: text/plain; charset="UTF-8"

1. i'd like to know does the process being followed in this link lead us to
installation of ROS-kinetic / indigo or others, hope i am clear..? that is
want to know if the process of including and compiling meta-ros layer for
yocto equal to install ros on ubuntu i mean in literal sense

http://wiki.ros.org/hydro/Installation/OpenEmbedded

2. Is the wxwidgets_2.9.5.bb recipe important because i am getting the
below error when 'bitbake roslaunch' is used

ERROR: ExpansionError during parsing
/home/jarvis/poky/meta-ros/recipes-extended/wxwidgets/wxwidgets_2.9.5.bb
| ETA:  0:02:07
Traceback (most recent call last):
bb.data_smart.ExpansionError: Failure expanding variable CXXFLAGS[:=],
expression was ${@oe_filter_out('-fvisibility-inlines-hidden', ' -O2 -pipe
-g -feliminate-unused-debug-types
-fdebug-prefix-map=/home/jarvis/poky/openembedded-core/build/tmp-glibc/work/i586-oe-linux/wxwidgets/2.9.5-r0=/usr/src/debug/wxwidgets/2.9.5-r0
-fdebug-prefix-map=/home/jarvis/poky/openembedded-core/build/tmp-glibc/work/i586-oe-linux/wxwidgets/2.9.5-r0/recipe-sysroot-native=
-fdebug-prefix-map=/home/jarvis/poky/openembedded-core/build/tmp-glibc/work/i586-oe-linux/wxwidgets/2.9.5-r0/recipe-sysroot=
-fvisibility-inlines-hidden', d)} which triggered exception NameError: name
'oe_filter_out' is not defined


Thanks

--089e082450281ae33a056928aa86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>1. i&#39;d like to know does the process being f=
ollowed in this link lead us to installation of ROS-kinetic / indigo or oth=
ers, hope i am clear..? that is want to know if the process of including an=
d compiling meta-ros layer for yocto equal to install ros on ubuntu i mean =
in literal sense<br><br><a href=3D"http://wiki.ros.org/hydro/Installation/O=
penEmbedded">http://wiki.ros.org/hydro/Installation/OpenEmbedded</a><br><br=
></div>2. Is the <a href=3D"http://wxwidgets_2.9.5.bb">wxwidgets_2.9.5.bb</=
a> recipe important because i am getting the below error when &#39;bitbake =
roslaunch&#39; is used<br><br>ERROR: ExpansionError during parsing /home/ja=
rvis/poky/meta-ros/recipes-extended/wxwidgets/<a href=3D"http://wxwidgets_2=
.9.5.bb">wxwidgets_2.9.5.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ETA:=C2=A0 0:02:07<br>Traceback (most r=
ecent call last):<br>bb.data_smart.ExpansionError: Failure expanding variab=
le CXXFLAGS[:=3D], expression was ${@oe_filter_out(&#39;-fvisibility-inline=
s-hidden&#39;, &#39; -O2 -pipe -g -feliminate-unused-debug-types -fdebug-pr=
efix-map=3D/home/jarvis/poky/openembedded-core/build/tmp-glibc/work/i586-oe=
-linux/wxwidgets/2.9.5-r0=3D/usr/src/debug/wxwidgets/2.9.5-r0 -fdebug-prefi=
x-map=3D/home/jarvis/poky/openembedded-core/build/tmp-glibc/work/i586-oe-li=
nux/wxwidgets/2.9.5-r0/recipe-sysroot-native=3D -fdebug-prefix-map=3D/home/=
jarvis/poky/openembedded-core/build/tmp-glibc/work/i586-oe-linux/wxwidgets/=
2.9.5-r0/recipe-sysroot=3D=C2=A0 -fvisibility-inlines-hidden&#39;, d)} whic=
h triggered exception NameError: name &#39;oe_filter_out&#39; is not define=
d<br><br><br></div>Thanks<br></div>

--089e082450281ae33a056928aa86--
