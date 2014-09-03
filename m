Return-Path: <niqingliang2003@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 67B4165D56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 07:05:17 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id a1so7895618wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 00:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=eVdVtD+/Z0LFyNTO3Y9Ihx1igVf4btpzBWOhklCtISg=;
	b=b67uF/0Ifqld2qAFdJUh2C9/IOrc9znroHd9CPokoQdoBwgwYESTWr1yoWPFlnK8YR
	xQlKnul6SWQ8ApSa0eXToFRg2VpYGw1z9Zdu4oJDKb7G4KVa4H3BFSAg1ID2J2A8KPsA
	nOAo7gRkUBq5imUr5wXoBcVxHD7XIy+gc7HQXIKoGP31UUDuaO91gqTP+N9LAhy9MrLB
	yk8PdUMF/e9xxca+Rd4iorV+0QRp2iWJ393YktRcEM9S3vmXUpr39E0mSnj2f8mZEhPA
	hQRmIkNOZhn7NTpKKqlJql35zLrzpVPO5Rtn/tL5y0JYGCvxAz3rmQhW6usmtSLI369h
	SASg==
MIME-Version: 1.0
X-Received: by 10.180.107.100 with SMTP id hb4mr32328279wib.59.1409727918400; 
	Wed, 03 Sep 2014 00:05:18 -0700 (PDT)
Received: by 10.217.141.72 with HTTP; Wed, 3 Sep 2014 00:05:18 -0700 (PDT)
Date: Wed, 3 Sep 2014 07:05:18 +0000
Message-ID: <CADwFkYe-T3MdkwmwwfW8nb6UsxUxbsSNbznGfJ54+Uz3ud5=+Q@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: libav
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
X-List-Received-Date: Wed, 03 Sep 2014 07:05:23 -0000
Content-Type: multipart/alternative; boundary=e89a8f3baee3ce6baf050223dbac

--e89a8f3baee3ce6baf050223dbac
Content-Type: text/plain; charset=UTF-8

why there are two versions libav in oe-core? what's the difference?
why the opencv will use the 0.8.x version, but not 9.x version?
does it should use the higher version?

libav 0.8.x has warning:

WARNING: QA Issue: ELF binary
'/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.0'
has relocations in .text [textrel]
WARNING: QA Issue: ELF binary
'/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.0.0'
has relocations in .text [textrel]
WARNING: QA Issue: ELF binary
'/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libavutil/usr/lib/libavutil.so.51.22.2'
has relocations in .text [textrel]
WARNING: QA Issue: ELF binary
'/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libavformat/usr/lib/libavformat.so.53.21.1'
has relocations in .text [textrel]
WARNING: QA Issue: ELF binary
'/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libavfilter/usr/lib/libavfilter.so.2.15.0'
has relocations in .text [textrel]
WARNING: QA Issue: ELF binary
'/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libavdevice/usr/lib/libavdevice.so.53.2.0'
has relocations in .text [textrel]
WARNING: QA Issue: ELF binary
'/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libavcodec/usr/lib/libavcodec.so.53.35.0'
has relocations in .text [textrel]

--e89a8f3baee3ce6baf050223dbac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">why there are two versions libav in oe-core? what&#39;s th=
e difference?<br>why the opencv will use the 0.8.x version, but not 9.x ver=
sion?<div>does it should use the higher version?</div><div><br></div><div>
libav 0.8.x has warning:</div><div><br></div><div><div>WARNING: QA Issue: E=
LF binary &#39;/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linux-gnueabi/=
libav/0.8.15-r0/packages-split/libswscale/usr/lib/libswscale.so.2.1.0&#39; =
has relocations in .text [textrel]</div>
<div>WARNING: QA Issue: ELF binary &#39;/mnt/qt5-test/build/tmp/work/armv6-=
vfp-jilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libpostproc/usr/lib=
/libpostproc.so.52.0.0&#39; has relocations in .text [textrel]</div><div>
WARNING: QA Issue: ELF binary &#39;/mnt/qt5-test/build/tmp/work/armv6-vfp-j=
ilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libavutil/usr/lib/libavu=
til.so.51.22.2&#39; has relocations in .text [textrel]</div><div>WARNING: Q=
A Issue: ELF binary &#39;/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-linu=
x-gnueabi/libav/0.8.15-r0/packages-split/libavformat/usr/lib/libavformat.so=
.53.21.1&#39; has relocations in .text [textrel]</div>
<div>WARNING: QA Issue: ELF binary &#39;/mnt/qt5-test/build/tmp/work/armv6-=
vfp-jilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libavfilter/usr/lib=
/libavfilter.so.2.15.0&#39; has relocations in .text [textrel]</div><div>
WARNING: QA Issue: ELF binary &#39;/mnt/qt5-test/build/tmp/work/armv6-vfp-j=
ilong-linux-gnueabi/libav/0.8.15-r0/packages-split/libavdevice/usr/lib/liba=
vdevice.so.53.2.0&#39; has relocations in .text [textrel]</div><div>WARNING=
: QA Issue: ELF binary &#39;/mnt/qt5-test/build/tmp/work/armv6-vfp-jilong-l=
inux-gnueabi/libav/0.8.15-r0/packages-split/libavcodec/usr/lib/libavcodec.s=
o.53.35.0&#39; has relocations in .text [textrel]</div>
</div><div><br></div></div>

--e89a8f3baee3ce6baf050223dbac--
