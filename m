Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4734760767
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 17:34:29 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id f124so5717523vkg.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 10:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=eOgfnGP9KENOELM1r6CU6Z5HiqonNzE9uJjhIwtmEN0=;
	b=kS4oZF39gtRH5Zc0bL1faSmBL8bxgq1gk12gXShkTdrCr9+bQjHAv9UlHZEfApDk/y
	o5SP4rpdB1yqo8BseQPGyLnhMPo+NCkpMlEGYCkTmpoD0uLLDcYRQveC2cC+JXJCaVQV
	M28CsWguqwHJJAEnHGf7vZqip3YzURhL6jUSjDnyXck6HXna+5CTxWasrlR5Y3gKtJpq
	nPNE4cjB3TTLMBTJIWBUGHsY8sN4iZ0KVwfLFdSdmZscnQk7+YmWYbCTRl24rcgQsAOq
	Xi85bIWtecBuMzJcryhPWBICmTPSRcZZpp1DiAtsmZNdSI/aI6+p8f2bHdP4SeVPQ9OK
	mcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=eOgfnGP9KENOELM1r6CU6Z5HiqonNzE9uJjhIwtmEN0=;
	b=klIpdGkado8pn6nC5nDxhi9GHcfxzL15kXdXnIOOrg3TSh44xUE2gTHSAzw0A9frOW
	ktqYPv+5ytyNjV9AQbJznO3TRTCxO9VSsX4/uKdWnQ58CTMRDfEwEsfzD2BLZi9y/3Tj
	OjC1ZK4+YPSWK/hT0vycJ6TuxAQxi+U4tss5GCVaqErYpB7Rhj9bsA1rzmTW2hO6+d6K
	N+1WeUxxyaQ/CImb5PnpC8Yh8lYLXtoO4o6MOZiLeuVwejEmX73YgX3ase98t+68wcrU
	upi88KA0St32W15mY3kKW6AfArYSl5spUAO6zbv43L4mJYf8ILVhzFZR9jS40wuHzgR/
	sf8A==
X-Gm-Message-State: AElRT7HnPA1mlyrUY7EQmN07MJwQ+vLX25nXUlU5YuUWjhngglS1HMUh
	kKb+PggbgzplX7Eo0aD9a09DGYW5/+5qJKegPQkElQ==
X-Google-Smtp-Source: AG47ELvcp/i5WCgSPUIOVySYHOlelK3tNBRn59VMJfEP8qDS4dw0hyeyImwsNiOdtkiOFzpDz/m/rKBaMw7as83aPRs=
X-Received: by 10.31.74.1 with SMTP id x1mr8480390vka.44.1521740070788; Thu,
	22 Mar 2018 10:34:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Thu, 22 Mar 2018 10:34:30 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 22 Mar 2018 23:04:30 +0530
Message-ID: <CAPGMVzEZYNtpjPS3HWy9Q2vOo85X_y1Lb6ZvNpnJLCgvSiQ0bw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [meta-chicken]
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
X-List-Received-Date: Thu, 22 Mar 2018 17:34:30 -0000
Content-Type: multipart/alternative; boundary="001a114db1105c261a056803b8af"

--001a114db1105c261a056803b8af
Content-Type: text/plain; charset="UTF-8"

I was including a csv-editor and this error popped up, any solutions?

WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroot: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
WARNING: chicken-egg-matchable-cross-3.7-r0 do_fetch: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
WARNING: chicken-egg-typeclass-cross-1.3-r0 do_fetch: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
WARNING: chicken-egg-make-cross-1.8-r0 do_fetch: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
WARNING: chicken-egg-iset-cross-2.0-r0 do_fetch: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
WARNING: chicken-egg-matchable-cross-3.7-r0 do_patch: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
WARNING: chicken-egg-matchable-cross-3.7-r0 do_prepare_recipe_sysroot:
Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
WARNING: chicken-egg-utf8-cross-3.4.4-r0 do_fetch: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?
ERROR: chicken-egg-matchable-cross-3.7-r0 do_install: Function failed:
do_install (log file is located at
/home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
ERROR: Logfile of failure stored in:
/home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926
Log data follows:
| DEBUG: Executing shell function do_install
|
/home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
113:
/home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926:
i586-poky-linux-chicken-install: not found
| WARNING: exit code 127 from a shell command.
| ERROR: Function failed: do_install (log file is located at
/home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)
ERROR: Task
(virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chicken-egg/chicken-egg-matchable_3.7.bb:do_install)
failed with exit code '1'
WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest
/home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysroot
not found?



Thanks

--001a114db1105c261a056803b8af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I was including a csv-editor and this error popped up=
, any solutions?<br><br>WARNING: chicken-4.12.0-r0 do_prepare_recipe_sysroo=
t: Manifest /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chi=
cken-cross.populate_sysroot not found?<br>WARNING: chicken-egg-matchable-cr=
oss-3.7-r0 do_fetch: Manifest /home/jarvis/poky/build/tmp/sstate-control/ma=
nifest-allarch-chicken-cross.populate_sysroot not found?<br>WARNING: chicke=
n-egg-typeclass-cross-1.3-r0 do_fetch: Manifest /home/jarvis/poky/build/tmp=
/sstate-control/manifest-allarch-chicken-cross.populate_sysroot not found?<=
br>WARNING: chicken-egg-regex-cross-1.0-r0 do_fetch: Manifest /home/jarvis/=
poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate_sysro=
ot not found?<br>WARNING: chicken-egg-matchable-3.7-r0 do_fetch: Manifest /=
home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.po=
pulate_sysroot not found?<br>WARNING: chicken-egg-make-cross-1.8-r0 do_fetc=
h: Manifest /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chi=
cken-cross.populate_sysroot not found?<br>WARNING: chicken-egg-iset-cross-2=
.0-r0 do_fetch: Manifest /home/jarvis/poky/build/tmp/sstate-control/manifes=
t-allarch-chicken-cross.populate_sysroot not found?<br>WARNING: chicken-egg=
-matchable-cross-3.7-r0 do_patch: Manifest /home/jarvis/poky/build/tmp/ssta=
te-control/manifest-allarch-chicken-cross.populate_sysroot not found?<br>WA=
RNING: chicken-egg-matchable-cross-3.7-r0 do_prepare_recipe_sysroot: Manife=
st /home/jarvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cros=
s.populate_sysroot not found?<br>WARNING: chicken-egg-utf8-cross-3.4.4-r0 d=
o_fetch: Manifest /home/jarvis/poky/build/tmp/sstate-control/manifest-allar=
ch-chicken-cross.populate_sysroot not found?<br>ERROR: chicken-egg-matchabl=
e-cross-3.7-r0 do_install: Function failed: do_install (log file is located=
 at /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cro=
ss/3.7-r0/temp/log.do_install.17926)<br>ERROR: Logfile of failure stored in=
: /home/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross=
/3.7-r0/temp/log.do_install.17926<br>Log data follows:<br>| DEBUG: Executin=
g shell function do_install<br>| /home/jarvis/poky/build/tmp/work/x86_64-li=
nux/chicken-egg-matchable-cross/3.7-r0/temp/run.do_install.17926: 113: /hom=
e/jarvis/poky/build/tmp/work/x86_64-linux/chicken-egg-matchable-cross/3.7-r=
0/temp/run.do_install.17926: i586-poky-linux-chicken-install: not found<br>=
| WARNING: exit code 127 from a shell command.<br>| ERROR: Function failed:=
 do_install (log file is located at /home/jarvis/poky/build/tmp/work/x86_64=
-linux/chicken-egg-matchable-cross/3.7-r0/temp/log.do_install.17926)<br>ERR=
OR: Task (virtual:cross:/home/jarvis/poky/meta-chicken/recipes-chicken/chic=
ken-egg/chicken-egg-matchable_3.7.bb:do_install) failed with exit code &#39=
;1&#39;<br>WARNING: chicken-egg-typeclass-1.3-r0 do_fetch: Manifest /home/j=
arvis/poky/build/tmp/sstate-control/manifest-allarch-chicken-cross.populate=
_sysroot not found?<br><br><br><br></div>Thanks<br></div>

--001a114db1105c261a056803b8af--
