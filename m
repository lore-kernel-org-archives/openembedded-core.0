Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 966B66E88D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 10:58:27 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id vb8so216893obc.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2014 02:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jagIjn0y9ATr5IPseJigSHceAqbrKd5ZBffCkiGBFY8=;
	b=MfXm9OAY9ewLHfj5mqxotvMzWA9Ja2IFvOlF7ColnvltYNzCZx45T72/MlhOyZSQ7z
	kWKEKORhG1Q2lT1VqcyHINnnzYRooAEf9QxkttQqEwgwqboO65SNscvRUUUFrcwGvc31
	sNoLVt8+SBmFPmRZ5Ksq3C6NZv4Eg3cP0EQtV5+Ie2B2zXwFi1NfxtjpiK3kOEs8hQnK
	5TZYXlLOg9AE422ttr0qDqfLUtH7UJ6lJv0W9+YZ6+ziUbOWP8EWBb9EQ+Uo8QKuHF95
	QoTlwtCF/k+mJtBAqiWWWsy/xqJz3WHDLzyJOjxkIMJcmzCuk9lylvrnzEiPJJYz916c
	aQhg==
MIME-Version: 1.0
X-Received: by 10.60.52.14 with SMTP id p14mr709339oeo.28.1391597908158; Wed,
	05 Feb 2014 02:58:28 -0800 (PST)
Received: by 10.60.40.200 with HTTP; Wed, 5 Feb 2014 02:58:28 -0800 (PST)
In-Reply-To: <cover.1391594312.git.laurentiu.palcu@intel.com>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>
	<cover.1391594312.git.laurentiu.palcu@intel.com>
Date: Wed, 5 Feb 2014 11:58:28 +0100
Message-ID: <CAAKB1h3PL6oyL0VG70SVXSMEROxrwX0sJDc82WO+0e=QvSKiaw@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/50] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Wed, 05 Feb 2014 10:58:28 -0000
Content-Type: multipart/alternative; boundary=001a11330964fc6ec304f1a6a28f

--001a11330964fc6ec304f1a6a28f
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 5, 2014 at 11:07 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> V2:
>  * fix building from feeds for opkg;
>  * rebase;
>

| NOTE: ###### Generate rootfs #######
| NOTE: Installing the following packages: run-postinsts
packagegroup-core-boot
| sed: -e expression #1, char 41: unterminated address regex
| sed: -e expression #1, char 42: unterminated address regex
| sed: -e expression #1, char 41: unterminated address regex
| sed: -e expression #1, char 42: unterminated address regex

[david] Why are these seds failing ?, I've seen this in master aswell
though.

| NOTE: Installing complementary packages ...
| NOTE: Installing the following packages:
| /media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl: the
``install'' command requires at least one argument
| NOTE: Unable to install packages. Command
/media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f
/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/opkg.conf
-o
/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/rootfs
--force_postinstall --prefer-arch-to-version   install  returned 1
| NOTE: Running intercept scripts:
| NOTE: Executing write_package_manifest ...
| DEBUG: Executing python function write_package_manifest
| NOTE: Building from feeds activated!
| NOTE: Add all feed with URL
file:///media/sdb5/oel/build/tmp/deploy/ipk/all
| NOTE: Add qemuppc feed with URL
file:///media/sdb5/oel/build/tmp/deploy/ipk/qemuppc
| NOTE: Add ppc7400 feed with URL
file:///media/sdb5/oel/build/tmp/deploy/ipk/ppc7400
| DEBUG: Python function write_package_manifest finished
| NOTE: Executing license_create_manifest ...
| DEBUG: Executing shell function license_create_manifest
| ls: cannot access
/media/sdb5/bld/tmp/sysroots/qemuppc/pkgdata/runtime-reverse/base-files: No
such file or directory
| readlink: missing operand
| Try 'readlink --help' for more information.
| basename: missing operand
| Try 'basename --help' for more information.
| WARNING: exit code 1 from a shell command.
| DEBUG: Python function do_rootfs finished
| ERROR: Function failed: license_create_manifest (log file is located at
/media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.29007)
ERROR: Task 6 (/media/sdb5/poky-contrib/meta/recipes-core/images/
core-image-minimal.bb, do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 504 tasks of which 503 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  /media/sdb5/poky-contrib/meta/recipes-core/images/core-image-minimal.bb,
do_rootfs
Summary: There was 1 ERROR message shown, returning a non-zero exit code

Br,
David

--001a11330964fc6ec304f1a6a28f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div class=3D"gmail_extra"><br><br><div cla=
ss=3D"gmail_quote">On Wed, Feb 5, 2014 at 11:07 AM, Laurentiu Palcu <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:laurentiu.palcu@intel.com" target=3D"_blan=
k">laurentiu.palcu@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">V2:<br>
=A0* fix building from feeds for opkg;<br>
=A0* rebase;<br></blockquote><div><br></div><div><div>| NOTE: ###### Genera=
te rootfs #######</div><div>| NOTE: Installing the following packages: run-=
postinsts packagegroup-core-boot</div><div>| sed: -e expression #1, char 41=
: unterminated address regex</div>
<div>| sed: -e expression #1, char 42: unterminated address regex</div><div=
>| sed: -e expression #1, char 41: unterminated address regex</div><div>| s=
ed: -e expression #1, char 42: unterminated address regex</div><div><br>
</div><div>[david] Why are these seds failing ?, I&#39;ve seen this in mast=
er aswell though.</div><div><br></div><div>| NOTE: Installing complementary=
 packages ...</div><div>| NOTE: Installing the following packages:</div>
<div>| /media/sdb5/bld/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl: the ``ins=
tall&#39;&#39; command requires at least one argument</div><div>| NOTE: Una=
ble to install packages. Command /media/sdb5/bld/tmp/sysroots/x86_64-linux/=
usr/bin/opkg-cl -f /media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-m=
inimal/1.0-r0/opkg.conf -o /media/sdb5/bld/tmp/work/qemuppc-poky-linux/core=
-image-minimal/1.0-r0/rootfs --force_postinstall --prefer-arch-to-version =
=A0 install =A0returned 1</div>
<div>| NOTE: Running intercept scripts:</div><div>| NOTE: Executing write_p=
ackage_manifest ...</div><div>| DEBUG: Executing python function write_pack=
age_manifest</div><div>| NOTE: Building from feeds activated!</div><div>
| NOTE: Add all feed with URL file:///media/sdb5/oel/build/tmp/deploy/ipk/a=
ll</div><div>| NOTE: Add qemuppc feed with URL file:///media/sdb5/oel/build=
/tmp/deploy/ipk/qemuppc</div><div>| NOTE: Add ppc7400 feed with URL file://=
/media/sdb5/oel/build/tmp/deploy/ipk/ppc7400</div>
<div>| DEBUG: Python function write_package_manifest finished</div><div>| N=
OTE: Executing license_create_manifest ...</div><div>| DEBUG: Executing she=
ll function license_create_manifest</div><div>| ls: cannot access /media/sd=
b5/bld/tmp/sysroots/qemuppc/pkgdata/runtime-reverse/base-files: No such fil=
e or directory</div>
<div>| readlink: missing operand</div><div>| Try &#39;readlink --help&#39; =
for more information.</div><div>| basename: missing operand</div><div>| Try=
 &#39;basename --help&#39; for more information.</div><div>| WARNING: exit =
code 1 from a shell command.</div>
<div>| DEBUG: Python function do_rootfs finished</div><div>| ERROR: Functio=
n failed: license_create_manifest (log file is located at /media/sdb5/bld/t=
mp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.290=
07)</div>
<div>ERROR: Task 6 (/media/sdb5/poky-contrib/meta/recipes-core/images/<a hr=
ef=3D"http://core-image-minimal.bb">core-image-minimal.bb</a>, do_rootfs) f=
ailed with exit code &#39;1&#39;</div><div>NOTE: Tasks Summary: Attempted 5=
04 tasks of which 503 didn&#39;t need to be rerun and 1 failed.</div>
<div><br></div><div>Summary: 1 task failed:</div><div>=A0 /media/sdb5/poky-=
contrib/meta/recipes-core/images/<a href=3D"http://core-image-minimal.bb">c=
ore-image-minimal.bb</a>, do_rootfs</div><div>Summary: There was 1 ERROR me=
ssage shown, returning a non-zero exit code</div>
</div><div><br></div><div>Br,</div><div>David</div><div><br></div></div><br=
></div></div>

--001a11330964fc6ec304f1a6a28f--
