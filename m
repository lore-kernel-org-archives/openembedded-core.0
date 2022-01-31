Return-Path: <qais.sunna@peptech.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992C3C433FE
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 09:24:45 +0000 (UTC)
Subject: ERROR: _exec_cmd: bitbake -e returned '-6' instead of 0
To: openembedded-core@lists.openembedded.org
From: qais.sunna@peptech.de
X-Originating-Location: =?utf-8?q?Waiblingen=2C_Baden-W=C3=BCrttemberg=2C_DE?=
 =?utf-8?q?_=2879=2E216=2E71=2E175=29?=
X-Originating-Platform: Windows Chrome 97
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 31 Jan 2022 01:24:40 -0800
Message-ID: <5wpo.1643621080017896221.cojU@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wZOjzn6vuWAkDhEG7s1B"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 09:24:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161119

--wZOjzn6vuWAkDhEG7s1B
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

this error gets thrown while building a petalinux image:
ERROR: _exec_cmd: bitbake -e returned '-6' instead of 0

Full terminal output:

>=20
> INFO: Sourcing build environment
> INFO: Extracting rootfs, This may take time!
> INFO: Creating wic image...
> INFO: wic create
> /home/peptech/petalinux_projects/test_board/build/rootfs.wks --rootfs-dir
> /home/peptech/petalinux_projects/test_board/build/wic/rootfs --bootimg-di=
r
> /home/peptech/petalinux_projects/test_board/images/linux/ --kernel-dir
> /home/peptech/petalinux_projects/test_board/images/linux/ --outdir
> /tmp/tmp.QgxurHEIGu -n
> /home/peptech/petalinux_projects/test_board/build/tmp/work/cortexa9t2hf-n=
eon-xilinx-linux-gnueabi/wic-tools/1.0-r0/recipe-sysroot-native
>=20
> INFO: Creating image(s)...
>=20
>=20
> ERROR: _exec_cmd: bitbake -e returned '-6' instead of 0
> output: abort()ing pseudo client by server request. See
> https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
> Check logfile:
> /home/peptech/petalinux_projects/test_board/build/wic/pseudo/pseudo.log
> ERROR: Failed to create wic image
>=20
>=20
>=20

Unfortunately, log file is automatically deleted after the error gets throw=
n and tracking it shows nothing beneficial
Any suggestion? Many thanks in advance!

--wZOjzn6vuWAkDhEG7s1B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

this error gets thrown while building a petalinux image:<br />ERROR: _exec_=
cmd: bitbake -e returned '-6' instead of 0<br /><br />Full terminal output:=
<br />
<blockquote>
<div>INFO: Sourcing build environment</div>
<div>INFO: Extracting rootfs, This may take time!</div>
<div>INFO: Creating wic image...</div>
<div>INFO: wic create /home/peptech/petalinux_projects/test_board/build/roo=
tfs.wks --rootfs-dir /home/peptech/petalinux_projects/test_board/build/wic/=
rootfs --bootimg-dir /home/peptech/petalinux_projects/test_board/images/lin=
ux/ --kernel-dir /home/peptech/petalinux_projects/test_board/images/linux/ =
--outdir /tmp/tmp.QgxurHEIGu -n /home/peptech/petalinux_projects/test_board=
/build/tmp/work/cortexa9t2hf-neon-xilinx-linux-gnueabi/wic-tools/1.0-r0/rec=
ipe-sysroot-native&nbsp;</div>
<div>INFO: Creating image(s)...</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>ERROR: _exec_cmd: bitbake -e returned '-6' instead of 0</div>
<div>output: abort()ing pseudo client by server request. See https://wiki.y=
octoproject.org/wiki/Pseudo_Abort for more details on this.</div>
<div>Check logfile: /home/peptech/petalinux_projects/test_board/build/wic/p=
seudo/pseudo.log</div>
<div>ERROR: Failed to create wic image<br /><br /></div>
</blockquote>
Unfortunately, log file is automatically deleted after the error gets throw=
n and tracking it shows nothing beneficial<br />
<div>Any suggestion? Many thanks in advance!<br /><br /></div>

--wZOjzn6vuWAkDhEG7s1B--

