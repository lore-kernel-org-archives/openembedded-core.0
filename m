Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 04A8A6DCFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 21:21:47 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id ec20so5192969lab.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 13:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=somzSpztNrLsXl+9vm2zILftyyX2djzAYvZwog61p1s=;
	b=0ydyNIJIMg14pxUy+LShgUe2tSlLkeTFktUfpuhL6O1zobtvlp00Zf/B6+jsDrG8EO
	PMfuef4y7ucGNOjyPeFvxzxuKz1yLkrJzBVVG5ghFUvmFzEilAvAvHyt/bxnwpuMk4l/
	U1ZfuEI8DmyyJd/9Uf49lZb08uz/Xjev3n816JVsQm2M1oX7ejmjamHqMWHTHsnmArMM
	y6YMye6trtqcDmG4I7AL7ZaO6I4j/gu3cUfheAYif/+soM207TIJ+Tqv4ADxwmrcqzT1
	t7p8wFT0dO+TfrrIfFX/kPbItuj3k/UB9LdDpBpqWYGwNg/PzMyRnd7t4eM8loYf3GW2
	1lLw==
MIME-Version: 1.0
X-Received: by 10.112.33.108 with SMTP id q12mr22406978lbi.8.1392067308176;
	Mon, 10 Feb 2014 13:21:48 -0800 (PST)
Received: by 10.112.53.35 with HTTP; Mon, 10 Feb 2014 13:21:48 -0800 (PST)
Date: Mon, 10 Feb 2014 22:21:48 +0100
Message-ID: <CAPbeDC=S-U3d=c5uZUYeDXqA0hWf56E5YwGii11pXZHAyo63WQ@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Problem with libicudata.so in OE master
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
X-List-Received-Date: Mon, 10 Feb 2014 21:21:48 -0000
Content-Type: multipart/alternative; boundary=14dae947362f6848d604f213ed9e

--14dae947362f6848d604f213ed9e
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm having problems with running Qt5 apps using OE master. I'm using a
couple of other layers, but as the problem seems to be related to
libicudata.so I figured I'd post it here, my apologies if the mail should
go somewhere else.

When starting the Qt5 app I get:
error while loading shared libraries: /usr/lib/libicudata.so.51: internal
error

I'm building for Wandboard Solo machine from meta-fsl-arm-extra layer.

TUNE_FEATURES = "armv7a vfp neon callconvention-hard cortexa9"
TARGET_FPU = "vfp-neon"

[jkroon@localhost oe-devel]$ readelf -A
build/tmp-eglibc/sysroots/wandboard-solo/usr/lib/libicudata.so.51.2
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3
  Tag_Advanced_SIMD_arch: NEONv1

Things work in oe-core 091d395e43836575587112ee1696a18c401505bb, although
this was together with older versions of the additional layers as well.
IIRC the readelf output was identical in this case. Not quite sure how to
debug this, anyone have any pointers ?
I tried looking for another application that uses libicudata, but couldn't
find an easy one to try out.

  -- Jacob

--14dae947362f6848d604f213ed9e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>I&#39;m having problems wi=
th running Qt5 apps using OE master. I&#39;m using a couple of other layers=
, but as the problem seems to be related to libicudata.so I figured I&#39;d=
 post it here, my apologies if the mail should go somewhere else.<br>
<br></div><div>When starting the Qt5 app I get:<br>error while loading shar=
ed libraries: /usr/lib/libicudata.so.51: internal error<br><br></div><div>I=
&#39;m building for Wandboard Solo machine from meta-fsl-arm-extra layer.<b=
r>
<br>TUNE_FEATURES =3D &quot;armv7a vfp neon callconvention-hard cortexa9&qu=
ot;<br>TARGET_FPU =3D &quot;vfp-neon&quot;<br><br></div><div>[jkroon@localh=
ost oe-devel]$ readelf -A build/tmp-eglibc/sysroots/wandboard-solo/usr/lib/=
libicudata.so.51.2 <br>
Attribute Section: aeabi<br>File Attributes<br>=A0 Tag_CPU_name: &quot;7-A&=
quot;<br>=A0 Tag_CPU_arch: v7<br>=A0 Tag_CPU_arch_profile: Application<br>=
=A0 Tag_ARM_ISA_use: Yes<br>=A0 Tag_THUMB_ISA_use: Thumb-2<br>=A0 Tag_FP_ar=
ch: VFPv3<br>
=A0 Tag_Advanced_SIMD_arch: NEONv1<br><br>Things work in oe-core 091d395e43=
836575587112ee1696a18c401505bb, although this was together with older versi=
ons of the additional layers as well. IIRC the readelf output was identical=
 in this case. Not quite sure how to debug this, anyone have any pointers ?=
<br>
</div></div>I tried looking for another application that uses libicudata, b=
ut couldn&#39;t find an easy one to try out.<br><div><br><div><div><div><di=
v>=A0 -- Jacob
</div></div></div></div></div></div>

--14dae947362f6848d604f213ed9e--
