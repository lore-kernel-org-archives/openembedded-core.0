Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 82A876DC01
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2013 07:31:41 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id gq1so10808570obb.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 23:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=e4XmAGAtc+yqybwlLm4NrEbc4P8uRVOaXBxaz6Y8JPs=;
	b=XekRxZzMZZVNNcI8RCwT+39rIrNQ186Oel7WBm8Tad8ztyYPQ90nNYR4P54ffCOzGW
	dAXjsIjoRVCKfNzzPME8yJqFd95qrgDqjCaSX76aiEO3gLrOr3fGmVakhVCDfvO5jbc2
	MOpK2lNVaZV8SuVNN0JCiHzu9qk/PspyhCGf5yct/5rH/OQswe0HxzTOi5bY4QFGEQk6
	uojT0kWI2xXgUD9c+O/DCUC013+Nijcnm8qKB9V+HvJSNYnsTlU7mcILd88bpiqUnc+T
	LiyNIIdqLTMAC8tuoSpVAuV3Xcz+tVBOTcfyO7OJ9FbSeP5eOx0nGQh2ydXCvo7euI4Z
	5m1g==
X-Gm-Message-State: ALoCoQnpfNQymIejKAb6AXjDFPfSWyko7ck1oqKwqDqxLCDaTZ5zMHMgwJ+w3qxp4YFAVyBTxGXj
X-Received: by 10.60.136.196 with SMTP id qc4mr635170oeb.41.1385796700150;
	Fri, 29 Nov 2013 23:31:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.0.50 with HTTP; Fri, 29 Nov 2013 23:31:20 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sat, 30 Nov 2013 08:31:20 +0100
Message-ID: <CAP71WjwWJf2U3f3iC6LKyvyFkjNoQy3gioUaLZgJcaa+nwTKqA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: unable to use bitbake -c populate_sdk core-image-minimal on dora
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
X-List-Received-Date: Sat, 30 Nov 2013 07:31:43 -0000
Content-Type: multipart/alternative; boundary=047d7b33962f0b361004ec5ff074

--047d7b33962f0b361004ec5ff074
Content-Type: text/plain; charset=ISO-8859-1

hi,

i am unable to build a proper SDK for core-image-minimal using OE-core +
dora. I am seeing I think 2 different problems.

1- problem related to update-alternative and opkg:

update-alternatives: Error: cannot register alternative opkg to
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/opkg since it
is already registered to /usr/bin/opkg


2- problem related to shadow(-native/-nativesdk)

Configuring
nativesdk-perl-module-pod-plaintex/work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//var/lib/opkg/info/nativesdk-shadow.posti\
nst: line 7: pwconv: command not found
/work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//var/lib/opkg/info/nativesdk-shadow.postinst:
line 8: grpconv: command not found
update-alternatives: Error: cannot register alternative passwd to
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/passwd since
it is already registered to /usr/bin/passwd
update-alternatives: Linking
/work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//usr/local/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\
-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/chfn
to /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/chfn.shadow
update-alternatives: Linking
/work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//usr/local/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\
-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/newgrp
to
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/newgrp.shadow
update-alternatives: Linking
/work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//usr/local/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\
-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/chsh
to /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/chsh.shadow
update-alternatives: Error: cannot register alternative groups to
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/groups since
it is already registered to /usr/bin/groups
update-alternatives: Linking
/work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//usr/local/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\
-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/sbin/chpasswd
to
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/sbin/chpasswd.shadow
update-alternatives: Error: cannot register alternative login to
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/bin/login since it is
already registered to /bin/login
update-alternatives: Linking
/work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//usr/local/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\
-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/sbin/vipw to
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/sbin/vipw.shadow
update-alternatives: Linking
/work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//usr/local/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\
-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/sbin/vigr to
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/sbin/vigr.shadow
update-alternatives: Error: cannot register alternative su to
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/bin/su since it is
already registered to /bin/su

If i revert the following commits (on dora), then at least #2 seems to be
going away... but i am not completely sure if this is right or wrong...

829edcb nativesdk-packagegroup-sdk-host: Add nativesdk-shadow
f90e1a4 shadow: Add nativesdk to BBCLASSEXTEND
44fafdb shadow: Turn shadow-native into a BBCLASSEXTEND

I would expect that SDK is being tested properly, so i must be doing
something wrong along the lines... any help would be much appreciated.

thanks

nicolas

--047d7b33962f0b361004ec5ff074
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hi,<div><br></div><div>i am unable to build a proper SDK f=
or core-image-minimal using OE-core + dora. I am seeing I think 2 different=
 problems.</div><div><br></div><div>1- problem related to update-alternativ=
e and opkg:</div>

<div><br></div><div><div>update-alternatives: Error: cannot register altern=
ative opkg to /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/=
opkg since it is already registered to /usr/bin/opkg</div></div><div><br>

</div><div><br></div><div>2- problem related to shadow(-native/-nativesdk)<=
/div><div><br></div><div><div>Configuring nativesdk-perl-module-pod-plainte=
x/work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/c=
ore-image-minimal/1.0-r0/sdk/image//var/lib/opkg/info/nativesdk-shadow.post=
i\</div>

<div>nst: line 7: pwconv: command not found</div><div>/work/test/oe-test/bu=
ild-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-=
r0/sdk/image//var/lib/opkg/info/nativesdk-shadow.postinst: line 8: grpconv:=
 command not found</div>

<div>update-alternatives: Error: cannot register alternative passwd to /usr=
/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/passwd since it is=
 already registered to /usr/bin/passwd</div><div>update-alternatives: Linki=
ng /work/test/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi=
/core-image-minimal/1.0-r0/sdk/image//usr/local/oecore-x86_64/sysroots/armv=
7a-vfp-neon-oe-linux\</div>

<div>-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/=
chfn to /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/chfn.s=
hadow</div><div>update-alternatives: Linking /work/test/oe-test/build-bbb/t=
mp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/im=
age//usr/local/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\</div>

<div>-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/=
newgrp to /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/newg=
rp.shadow</div><div>update-alternatives: Linking /work/test/oe-test/build-b=
bb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sd=
k/image//usr/local/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\</div>

<div>-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/=
chsh to /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/chsh.s=
hadow</div><div>update-alternatives: Error: cannot register alternative gro=
ups to /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/groups =
since it is already registered to /usr/bin/groups</div>

<div>update-alternatives: Linking /work/test/oe-test/build-bbb/tmp-eglibc/w=
ork/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//usr/lo=
cal/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\</div><div>-gnueabi//us=
r/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/sbin/chpasswd to /usr=
/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/sbin/chpasswd.shadow</=
div>

<div>update-alternatives: Error: cannot register alternative login to /usr/=
local/oecore-x86_64/sysroots/x86_64-oesdk-linux/bin/login since it is alrea=
dy registered to /bin/login</div><div>update-alternatives: Linking /work/te=
st/oe-test/build-bbb/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image=
-minimal/1.0-r0/sdk/image//usr/local/oecore-x86_64/sysroots/armv7a-vfp-neon=
-oe-linux\</div>

<div>-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/sbin/vip=
w to /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/sbin/vipw.shadow<=
/div><div>update-alternatives: Linking /work/test/oe-test/build-bbb/tmp-egl=
ibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/sdk/image//u=
sr/local/oecore-x86_64/sysroots/armv7a-vfp-neon-oe-linux\</div>

<div>-gnueabi//usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/sbin/vig=
r to /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/sbin/vigr.shadow<=
/div><div>update-alternatives: Error: cannot register alternative su to /us=
r/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/bin/su since it is alread=
y registered to /bin/su</div>

<div><br></div></div><div>If i revert the following commits (on dora), then=
 at least #2 seems to be going away... but i am not completely sure if this=
 is right or wrong...</div><div><br></div><div><div>829edcb nativesdk-packa=
gegroup-sdk-host: Add nativesdk-shadow</div>

<div>f90e1a4 shadow: Add nativesdk to BBCLASSEXTEND<br></div></div><div><di=
v>44fafdb shadow: Turn shadow-native into a BBCLASSEXTEND</div></div><div><=
br></div><div>I would expect that SDK is being tested properly, so i must b=
e doing something wrong along the lines... any help would be much appreciat=
ed.</div>

<div><br></div><div>thanks</div><div><br></div><div>nicolas</div></div>

--047d7b33962f0b361004ec5ff074--
