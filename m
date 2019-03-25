Return-Path: <hardik.padhariya@encore-research.co>
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
	by mail.openembedded.org (Postfix) with ESMTP id E2A186B89A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 06:07:54 +0000 (UTC)
Received: from HARDIKPPC ([123.201.9.241]) by mrelay.perfora.net (mreueus003
	[74.208.5.2]) with ESMTPA (Nemesis) id 0MC2Zq-1hH4CQ2QiW-008ogJ for
	<openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 07:07:55 +0100
From: "Hardik Padhariya" <hardik.padhariya@encore-research.co>
To: <openembedded-core@lists.openembedded.org>
References: 
In-Reply-To: 
Date: Mon, 25 Mar 2019 11:37:51 +0530
Message-ID: <000e01d4e2d1$15d3c7b0$417b5710$@encore-research.co>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdTiyV6HTS/cMUpQRZGQ4thP8TP4TgAB6bkw
X-Provags-ID: V03:K1:8rsd2iCB0RfSmPPAW8/hYvPMKn1ZPQTUM2Hgg6VqlGqypF5piLp
	Jhqjb5nacm0dD0vkB/pVXDolHs8b2s/FGgig2bnWejbWGVwzlS6AUiOTLQccyy/7Zk9+a9J
	y3KKQKu+rwLVDFRdg5FZnYjWkWvphhd0blUrs6Wly5klgTJKPQOaD12fEko2xanXJt58j56
	4n+wzWwOHa72ij/n0c7SA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9gOBv2PpbKw=:ddkwihGQjvY5P2j46SVi3y
	3L8KpGWSXM9t1hNYDXO/xYzd0k+u22lB78wuAWsOniMi5sSEJ/blCF5ww8M6YFmDBGXkZ06jp
	f8l0LXNjqizbFqQ5e5cvnN6tCxv+LYv2441SJWalyd0OmmObr77SqAsI3iDcOR4lS239Wfih5
	8hr0nyzd9Q7628OXYv5fmAXqOE6HYQLB2jLATkii62fGIqk/hm3ZB22BLqhZzW6OAr/YghckX
	mBBm5C/UytN6a7F2oefV2ic0y6ASa8wxcjuXWqpg3Iofm5DBh4gT5WMlB3G066+lV6qrmpINI
	vP7MOWOebvfmNs2BdyBYBhJSJJVPEj2kpS1P1E4OwW+HVAw9fMk1cGthx8EubD0lFPqa98Q20
	8betqF7u/VTQ8eJ94/olKaINgIUsLwrRn0nTAhBP4sOM0SZLxeRF6DG+ICRyRmgdBbHkwVfn4
	mDEE8njjSfDcA1hg/uBgpEqPLKLDeZLSTfkKy+F7dEz5na482w3on+u26n4S0EI0SsvtbYYII
	Ur1iQRpeEg7Wx1gHPoe+Fn/zHYhWEXo7EXQPa3L+7xSL9AvVZ92GGIJ7fgoe6qG0GnYzfhzGT
	NfO6nHoUGcMMuljmHpWcEjA/PDkbzgW6qLchk/xkxRa6w57PXrmmdNOnEoQwdlSvhxNkUET9c
	emq8T63/0Fsq213Q7KI5M606y9yrqBe0e3QBbGWayqeVhvp3UGJppINyuw0fbTiI+G6OCkRb2
	YdTmSz9YDhIEyHNKpbnGSbzoKJw3lYp/VE5q3tGLJejnng/gXFxUezHOiYI=
Subject: Unknown host error while building abiword
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
X-List-Received-Date: Mon, 25 Mar 2019 06:07:55 -0000
X-Groupsio-MsgNum: 122568
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_000F_01D4E2FF.2F8C03B0"
Content-Language: en-in

------=_NextPart_000_000F_01D4E2FF.2F8C03B0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0010_01D4E2FF.2F8C03B0"

------=_NextPart_001_0010_01D4E2FF.2F8C03B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

Hello all,

 

We are using Yocto krogoth 2.1.1 for imx6ul evaluation kit
"mx6ul_14x14_evk".

 

While building the abiword tool using "bitbake abiword" command we are
facing the following issue.

 

"

ERROR: Fetcher failure: Fetch command failed with exit code 128, output:

fatal: unable to connect to git.gnome.org:

git.gnome.org[0: 209.132.180.168]: errno=No route to host

git.gnome.org[1: 209.132.180.180]: errno=No route to host

 

"

 

The log file for the same is attached here.

Will you please guide us fixing the issue?

 

Regards,

Hardik

 


------=_NextPart_001_0010_01D4E2FF.2F8C03B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-IN =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Hello =
all,<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'>We are using Yocto <span lang=3DEN-US =
style=3D'font-family:Consolas'>krogoth 2.1.1 for</span>&nbsp;imx6ul =
evaluation kit &quot;mx6ul_14x14_evk&quot;.<o:p></o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'>While building the abiword tool using &#8220;bitbake =
abiword&#8221; command we are facing the following =
issue.<o:p></o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'>&#8220;<o:p></o:p></p><p =
style=3D'background:white;vertical-align:baseline'>ERROR: Fetcher =
failure: Fetch command failed with exit code 128, =
output:<o:p></o:p></p><p =
style=3D'background:white;vertical-align:baseline'>fatal: unable to =
connect to git.gnome.org:<o:p></o:p></p><p =
style=3D'background:white;vertical-align:baseline'>git.gnome.org[0: =
209.132.180.168]: errno=3DNo route to host<o:p></o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'>git.gnome.org[1: 209.132.180.180]: errno=3DNo route to =
host<o:p></o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'>&#8220;<o:p></o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'>The log file for the same is attached here.<o:p></o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'>Will you please guide us fixing the issue?<o:p></o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'><o:p>&nbsp;</o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'>Regards,<o:p></o:p></p><p =
style=3D'margin:0cm;margin-bottom:.0001pt;background:white;vertical-align=
:baseline'>Hardik<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_001_0010_01D4E2FF.2F8C03B0--

------=_NextPart_000_000F_01D4E2FF.2F8C03B0
Content-Type: application/octet-stream;
	name="log.do_fetch.1219"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="log.do_fetch.1219"

DEBUG: Executing python function do_fetch
DEBUG: Executing python function base_do_fetch
DEBUG: Trying Upstream
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 branch --contains a9e4e74ec4473a4fd09e56b=
690bd4fa72f686687 --list gnome-3-2 2> /dev/null | wc -l
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 remote rm origin
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 remote add --mirror=3Dfetch origin git://=
git.gnome.org/evolution-data-server
DEBUG: Fetcher accessed the network with the command git -c core.fsyncobjec=
tfiles=3D0 fetch -f --prune git://git.gnome.org/evolution-data-server refs/=
*:refs/*
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 fetch -f --prune git://git.gnome.org/evol=
ution-data-server refs/*:refs/*
WARNING: Failed to fetch URL git://git.gnome.org/evolution-data-server;bran=
ch=3Dgnome-3-2, attempting MIRRORS if available
DEBUG: Fetcher failure: Fetch command failed with exit code 128, output:
fatal: unable to connect to git.gnome.org:
git.gnome.org[0: 209.132.180.168]: errno=3DNo route to host
git.gnome.org[1: 209.132.180.180]: errno=3DNo route to host


DEBUG: Trying MIRRORS
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', '.*', '/.*', '', '', {}] to ['htt=
p', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', '.*', '/.*', '', '', {}] to ['ht=
tp', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['https', '.*', '/.*', '', '', {}] to ['h=
ttp', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'www.freescale.com', '/lgfiles/N=
MG/MAD/YOCTO/', '', '', {}] to ['http', 'download.ossystems.com.br', '/bsp/=
freescale/source/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['http', 'snapshot.debian.org', '/archive/debian-archive/20=
120328T092752Z/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['http', 'snapshot.debian.org', '/archive/debian-archive/20=
110127T084257Z/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['http', 'snapshot.debian.org', '/archive/debian-archive/20=
090802T004153Z/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.de.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.au.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.cl.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.hr.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.fi.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.hk.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.hu.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.ie.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.it.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.jp.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.no.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.pl.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.ro.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.si.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.es.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.se.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.debian.org', '/debian/pool',=
 '', '', {}] to ['ftp', 'ftp.tr.debian.org', '/debian/pool', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'ftp.gnu.org', '/gnu', '', '', {=
}] to ['ftp', 'mirrors.kernel.org', '/gnu', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'kernel.org', '/pub', '', '', {}=
] to ['http', 'www.kernel.org', '/pub', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.gnupg.org', '/gcrypt/', '', =
'', {}] to ['ftp', 'ftp.franken.de', '/pub/crypt/mirror/ftp.gnupg.org/gcryp=
t/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.gnupg.org', '/gcrypt/', '', =
'', {}] to ['ftp', 'ftp.surfnet.nl', '/pub/security/gnupg/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.gnupg.org', '/gcrypt/', '', =
'', {}] to ['http', 'gulus.USherbrooke.ca', '/pub/appl/GnuPG/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'dante.ctan.org', '/tex-archive',=
 '', '', {}] to ['ftp', 'ftp.fu-berlin.de', '/tex/CTAN', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'dante.ctan.org', '/tex-archive',=
 '', '', {}] to ['http', 'sunsite.sut.ac.jp', '/pub/archives/ctan/', '', ''=
, {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'dante.ctan.org', '/tex-archive',=
 '', '', {}] to ['http', 'ctan.unsw.edu.au', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'ftp.gnutls.org', '/gcrypt/gnutls=
', '', '', {}] to ['ftp', 'ftp.gnupg.org', '/gcrypt/gnutls/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'ftp.info-zip.org', '/pub/infozi=
p/src/', '', '', {}] to ['http', 'mirror.switch.ch', '/ftp/mirror/infozip/s=
rc/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'ftp.info-zip.org', '/pub/infozi=
p/src/', '', '', {}] to ['ftp', 'sunsite.icm.edu.pl', '/pub/unix/archiving/=
info-zip/src/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'ftp.cerias.purdue.edu', '/pub/tools=
/unix/sysutils/lsof/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'ftp.tau.ac.il', '/pub/unix/admin/',=
 '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'ftp.cert.dfn.de', '/pub/tools/admin=
/lsof/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'ftp.fu-berlin.de', '/pub/unix/tools=
/lsof/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'ftp.kaizo.org', '/pub/lsof/', '', '=
', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'ftp.tu-darmstadt.de', '/pub/sysadmi=
n/lsof/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'ftp.tux.org', '/pub/sites/vic.cc.pu=
rdue.edu/tools/unix/lsof/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'gd.tuwien.ac.at', '/utils/admin-too=
ls/lsof/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'sunsite.ualberta.ca', '/pub/Mirror/=
lsof/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', 'lsof.itap.purdue.edu', '/pub/too=
ls/unix/lsof/', '', '', {}] to ['ftp', 'the.wiretapped.net', '/pub/security=
/host-security/lsof/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'www.apache.org', '/dist', '', '=
', {}] to ['http', 'archive.apache.org', '/dist', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'downloads.sourceforge.net', '/w=
atchdog/', '', '', {}] to ['http', 'fossies.org', '/linux/misc/', '', '', {=
}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'download.savannah.gnu.org', '/r=
eleases', '', '', {}] to ['http', 'download-mirror.savannah.gnu.org', '/rel=
eases', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'download.savannah.nongnu.org', =
'/releases', '', '', {}] to ['http', 'download-mirror.savannah.nongnu.org',=
 '/releases', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['cvs', '.*', '/.*', '', '', {}] to ['htt=
p', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['svn', '.*', '/.*', '', '', {}] to ['htt=
p', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['git', '.*', '/.*', '', '', {}] to ['htt=
p', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url git://git.gnome.org/evolution-data-server;branch=3Dgnome-3-2=
 returning http://downloads.yoctoproject.org/mirror/sources/git2_git.gnome.=
org.evolution-data-server.tar.gz
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirro=
r/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirr=
or/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['https=
', '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mir=
ror/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'www.freescale.com', '/lgfiles/NMG/MAD/YOCTO/', '', '', {}] to ['http', '=
download.ossystems.com.br', '/bsp/freescale/source/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['http', 'snapshot.debian=
.org', '/archive/debian-archive/20120328T092752Z/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['http', 'snapshot.debian=
.org', '/archive/debian-archive/20110127T084257Z/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['http', 'snapshot.debian=
.org', '/archive/debian-archive/20090802T004153Z/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.de.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.au.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.cl.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.hr.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.fi.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.hk.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.hu.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.ie.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.it.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.jp.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.no.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.pl.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.ro.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.si.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.es.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.se.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.debian.org', '/debian/pool', '', '', {}] to ['ftp', 'ftp.tr.debian.or=
g', '/debian/pool', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'ftp.gnu.org', '/gnu', '', '', {}] to ['ftp', 'mirrors.kernel.org', '/gnu=
', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'kernel.org', '/pub', '', '', {}] to ['http', 'www.kernel.org', '/pub', '=
', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.gnupg.org', '/gcrypt/', '', '', {}] to ['ftp', 'ftp.franken.de', '/pu=
b/crypt/mirror/ftp.gnupg.org/gcrypt/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.gnupg.org', '/gcrypt/', '', '', {}] to ['ftp', 'ftp.surfnet.nl', '/pu=
b/security/gnupg/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.gnupg.org', '/gcrypt/', '', '', {}] to ['http', 'gulus.USherbrooke.ca=
', '/pub/appl/GnuPG/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'dante.ctan.org', '/tex-archive', '', '', {}] to ['ftp', 'ftp.fu-berlin.de=
', '/tex/CTAN', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'dante.ctan.org', '/tex-archive', '', '', {}] to ['http', 'sunsite.sut.ac.=
jp', '/pub/archives/ctan/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'dante.ctan.org', '/tex-archive', '', '', {}] to ['http', 'ctan.unsw.edu.a=
u', '/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'ftp.gnutls.org', '/gcrypt/gnutls', '', '', {}] to ['ftp', 'ftp.gnupg.org'=
, '/gcrypt/gnutls/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'ftp.info-zip.org', '/pub/infozip/src/', '', '', {}] to ['http', 'mirror.=
switch.ch', '/ftp/mirror/infozip/src/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'ftp.info-zip.org', '/pub/infozip/src/', '', '', {}] to ['ftp', 'sunsite.=
icm.edu.pl', '/pub/unix/archiving/info-zip/src/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'f=
tp.cerias.purdue.edu', '/pub/tools/unix/sysutils/lsof/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'f=
tp.tau.ac.il', '/pub/unix/admin/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'f=
tp.cert.dfn.de', '/pub/tools/admin/lsof/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'f=
tp.fu-berlin.de', '/pub/unix/tools/lsof/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'f=
tp.kaizo.org', '/pub/lsof/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'f=
tp.tu-darmstadt.de', '/pub/sysadmin/lsof/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'f=
tp.tux.org', '/pub/sites/vic.cc.purdue.edu/tools/unix/lsof/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'g=
d.tuwien.ac.at', '/utils/admin-tools/lsof/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 's=
unsite.ualberta.ca', '/pub/Mirror/lsof/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 'lsof.itap.purdue.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 't=
he.wiretapped.net', '/pub/security/host-security/lsof/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'www.apache.org', '/dist', '', '', {}] to ['http', 'archive.apache.org', =
'/dist', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'downloads.sourceforge.net', '/watchdog/', '', '', {}] to ['http', 'fossi=
es.org', '/linux/misc/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'download.savannah.gnu.org', '/releases', '', '', {}] to ['http', 'downlo=
ad-mirror.savannah.gnu.org', '/releases', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'download.savannah.nongnu.org', '/releases', '', '', {}] to ['http', 'dow=
nload-mirror.savannah.nongnu.org', '/releases', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['cvs',=
 '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirro=
r/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['svn',=
 '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirro=
r/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['hg', =
'.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror=
/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['bzr',=
 '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirro=
r/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['p4', =
'.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror=
/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['osc',=
 '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirro=
r/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['https=
?$', '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/m=
irror/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 '.*', '/.*', '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirro=
r/sources/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['cvs',=
 '.*', '/.*', '', '', {}] to ['http', 'sources.openembedded.org', '/', '', =
'', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['svn',=
 '.*', '/.*', '', '', {}] to ['http', 'sources.openembedded.org', '/', '', =
'', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['git',=
 '.*', '/.*', '', '', {}] to ['http', 'sources.openembedded.org', '/', '', =
'', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['hg', =
'.*', '/.*', '', '', {}] to ['http', 'sources.openembedded.org', '/', '', '=
', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['bzr',=
 '.*', '/.*', '', '', {}] to ['http', 'sources.openembedded.org', '/', '', =
'', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['p4', =
'.*', '/.*', '', '', {}] to ['http', 'sources.openembedded.org', '/', '', '=
', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['osc',=
 '.*', '/.*', '', '', {}] to ['http', 'sources.openembedded.org', '/', '', =
'', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['https=
?$', '.*', '/.*', '', '', {}] to ['http', 'sources.openembedded.org', '/', =
'', '', {}]
DEBUG: For url http://downloads.yoctoproject.org/mirror/sources/git2_git.gn=
ome.org.evolution-data-server.tar.gz returning http://sources.openembedded.=
org/git2_git.gnome.org.evolution-data-server.tar.gz
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', '.*', '/.*', '',=
 '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', '', =
'', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', '.*', '/.*', ''=
, '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', '',=
 '', {}]
DEBUG: For url http://sources.openembedded.org/git2_git.gnome.org.evolution=
-data-server.tar.gz returning http://downloads.yoctoproject.org/mirror/sour=
ces/git2_git.gnome.org.evolution-data-server.tar.gz
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['https', '.*', '/.*', '=
', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', ''=
, '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'www.freescale.=
com', '/lgfiles/NMG/MAD/YOCTO/', '', '', {}] to ['http', 'download.ossystem=
s.com.br', '/bsp/freescale/source/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['http', 'snapshot.debian.org', '/archive/=
debian-archive/20120328T092752Z/debian/pool', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['http', 'snapshot.debian.org', '/archive/=
debian-archive/20110127T084257Z/debian/pool', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['http', 'snapshot.debian.org', '/archive/=
debian-archive/20090802T004153Z/debian/pool', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.de.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.au.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.cl.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.hr.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.fi.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.hk.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.hu.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.ie.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.it.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.jp.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.no.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.pl.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.ro.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.si.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.es.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.se.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.debian.org'=
, '/debian/pool', '', '', {}] to ['ftp', 'ftp.tr.debian.org', '/debian/pool=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'ftp.gnu.org', =
'/gnu', '', '', {}] to ['ftp', 'mirrors.kernel.org', '/gnu', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'kernel.org', '=
/pub', '', '', {}] to ['http', 'www.kernel.org', '/pub', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.gnupg.org',=
 '/gcrypt/', '', '', {}] to ['ftp', 'ftp.franken.de', '/pub/crypt/mirror/ft=
p.gnupg.org/gcrypt/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.gnupg.org',=
 '/gcrypt/', '', '', {}] to ['ftp', 'ftp.surfnet.nl', '/pub/security/gnupg/=
', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.gnupg.org',=
 '/gcrypt/', '', '', {}] to ['http', 'gulus.USherbrooke.ca', '/pub/appl/Gnu=
PG/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'dante.ctan.org'=
, '/tex-archive', '', '', {}] to ['ftp', 'ftp.fu-berlin.de', '/tex/CTAN', '=
', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'dante.ctan.org'=
, '/tex-archive', '', '', {}] to ['http', 'sunsite.sut.ac.jp', '/pub/archiv=
es/ctan/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'dante.ctan.org'=
, '/tex-archive', '', '', {}] to ['http', 'ctan.unsw.edu.au', '/', '', '', =
{}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'ftp.gnutls.org'=
, '/gcrypt/gnutls', '', '', {}] to ['ftp', 'ftp.gnupg.org', '/gcrypt/gnutls=
/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'ftp.info-zip.o=
rg', '/pub/infozip/src/', '', '', {}] to ['http', 'mirror.switch.ch', '/ftp=
/mirror/infozip/src/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'ftp.info-zip.o=
rg', '/pub/infozip/src/', '', '', {}] to ['ftp', 'sunsite.icm.edu.pl', '/pu=
b/unix/archiving/info-zip/src/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.cerias.purdue.=
edu', '/pub/tools/unix/sysutils/lsof/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.tau.ac.il', '/=
pub/unix/admin/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.cert.dfn.de', =
'/pub/tools/admin/lsof/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.fu-berlin.de',=
 '/pub/unix/tools/lsof/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.kaizo.org', '/=
pub/lsof/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.tu-darmstadt.d=
e', '/pub/sysadmin/lsof/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'ftp.tux.org', '/pu=
b/sites/vic.cc.purdue.edu/tools/unix/lsof/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'gd.tuwien.ac.at', =
'/utils/admin-tools/lsof/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'sunsite.ualberta.c=
a', '/pub/Mirror/lsof/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', 'lsof.itap.purdu=
e.edu', '/pub/tools/unix/lsof/', '', '', {}] to ['ftp', 'the.wiretapped.net=
', '/pub/security/host-security/lsof/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'www.apache.org=
', '/dist', '', '', {}] to ['http', 'archive.apache.org', '/dist', '', '', =
{}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'downloads.sour=
ceforge.net', '/watchdog/', '', '', {}] to ['http', 'fossies.org', '/linux/=
misc/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'download.savan=
nah.gnu.org', '/releases', '', '', {}] to ['http', 'download-mirror.savanna=
h.gnu.org', '/releases', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'download.savan=
nah.nongnu.org', '/releases', '', '', {}] to ['http', 'download-mirror.sava=
nnah.nongnu.org', '/releases', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['cvs', '.*', '/.*', '',=
 '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', '', =
'', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['svn', '.*', '/.*', '',=
 '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', '', =
'', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['hg', '.*', '/.*', '', =
'', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', '', '=
', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['bzr', '.*', '/.*', '',=
 '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', '', =
'', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['p4', '.*', '/.*', '', =
'', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', '', '=
', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['osc', '.*', '/.*', '',=
 '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', '', =
'', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['https?$', '.*', '/.*',=
 '', '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', =
'', '', {}]
DEBUG: For url http://sources.openembedded.org/git2_git.gnome.org.evolution=
-data-server.tar.gz returning http://downloads.yoctoproject.org/mirror/sour=
ces/git2_git.gnome.org.evolution-data-server.tar.gz
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', '.*', '/.*', '',=
 '', {}] to ['http', 'downloads.yoctoproject.org', '/mirror/sources/', '', =
'', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['cvs', '.*', '/.*', '',=
 '', {}] to ['http', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['svn', '.*', '/.*', '',=
 '', {}] to ['http', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['git', '.*', '/.*', '',=
 '', {}] to ['http', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['hg', '.*', '/.*', '', =
'', {}] to ['http', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['bzr', '.*', '/.*', '',=
 '', {}] to ['http', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['p4', '.*', '/.*', '', =
'', {}] to ['http', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['osc', '.*', '/.*', '',=
 '', {}] to ['http', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['ftp', '.*', '/.*', '',=
 '', {}] to ['http', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'search.cpan.or=
g', '/CPAN', '', '', {}] to ['http', 'cpan.metacpan.org', '/', '', '', {}]
DEBUG: For url ['http', 'sources.openembedded.org', '/git2_git.gnome.org.ev=
olution-data-server.tar.gz', '', '', {}] comparing ['http', 'search.cpan.or=
g', '/CPAN', '', '', {}] to ['http', 'search.cpan.org', '/CPAN/', '', '', {=
}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['ftp',=
 '.*', '/.*', '', '', {}] to ['http', 'sources.openembedded.org', '/', '', =
'', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'search.cpan.org', '/CPAN', '', '', {}] to ['http', 'cpan.metacpan.org', =
'/', '', '', {}]
DEBUG: For url ['http', 'downloads.yoctoproject.org', '/mirror/sources/git2=
_git.gnome.org.evolution-data-server.tar.gz', '', '', {}] comparing ['http'=
, 'search.cpan.org', '/CPAN', '', '', {}] to ['http', 'search.cpan.org', '/=
CPAN/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['hg', '.*', '/.*', '', '', {}] to ['http=
', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['bzr', '.*', '/.*', '', '', {}] to ['htt=
p', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['p4', '.*', '/.*', '', '', {}] to ['http=
', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['osc', '.*', '/.*', '', '', {}] to ['htt=
p', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['https?$', '.*', '/.*', '', '', {}] to [=
'http', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', '.*', '/.*', '', '', {}] to ['htt=
p', 'downloads.yoctoproject.org', '/mirror/sources/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['cvs', '.*', '/.*', '', '', {}] to ['htt=
p', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['svn', '.*', '/.*', '', '', {}] to ['htt=
p', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['git', '.*', '/.*', '', '', {}] to ['htt=
p', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url git://git.gnome.org/evolution-data-server;branch=3Dgnome-3-2=
 returning http://sources.openembedded.org/git2_git.gnome.org.evolution-dat=
a-server.tar.gz
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['hg', '.*', '/.*', '', '', {}] to ['http=
', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['bzr', '.*', '/.*', '', '', {}] to ['htt=
p', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['p4', '.*', '/.*', '', '', {}] to ['http=
', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['osc', '.*', '/.*', '', '', {}] to ['htt=
p', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['https?$', '.*', '/.*', '', '', {}] to [=
'http', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['ftp', '.*', '/.*', '', '', {}] to ['htt=
p', 'sources.openembedded.org', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'search.cpan.org', '/CPAN', '', =
'', {}] to ['http', 'cpan.metacpan.org', '/', '', '', {}]
DEBUG: For url ['git', 'git.gnome.org', '/evolution-data-server', '', '', {=
'branch': 'gnome-3-2'}] comparing ['http', 'search.cpan.org', '/CPAN', '', =
'', {}] to ['http', 'search.cpan.org', '/CPAN/', '', '', {}]
DEBUG: Fetching http://downloads.yoctoproject.org/mirror/sources/git2_git.g=
nome.org.evolution-data-server.tar.gz using command '/usr/bin/env wget -t 2=
 -T 30 -nv --passive-ftp --no-check-certificate -P /home/cpu49/argon/fsl-re=
lease-bsp1/downloads/ 'http://downloads.yoctoproject.org/mirror/sources/git=
2_git.gnome.org.evolution-data-server.tar.gz''
DEBUG: Fetcher accessed the network with the command /usr/bin/env wget -t 2=
 -T 30 -nv --passive-ftp --no-check-certificate -P /home/cpu49/argon/fsl-re=
lease-bsp1/downloads/ 'http://downloads.yoctoproject.org/mirror/sources/git=
2_git.gnome.org.evolution-data-server.tar.gz'
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 /usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P /=
home/cpu49/argon/fsl-release-bsp1/downloads/ 'http://downloads.yoctoproject=
.org/mirror/sources/git2_git.gnome.org.evolution-data-server.tar.gz'
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 tar -xzf /home/cpu49/argon/fsl-release-bsp1/downloads/git2_git.gnome.org.e=
volution-data-server.tar.gz
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 branch --contains a9e4e74ec4473a4fd09e56b=
690bd4fa72f686687 --list gnome-3-2 2> /dev/null | wc -l
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 remote rm origin
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 remote add --mirror=3Dfetch origin git://=
git.gnome.org/evolution-data-server
DEBUG: Fetcher accessed the network with the command git -c core.fsyncobjec=
tfiles=3D0 fetch -f --prune git://git.gnome.org/evolution-data-server refs/=
*:refs/*
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 fetch -f --prune git://git.gnome.org/evol=
ution-data-server refs/*:refs/*
DEBUG: Mirror fetch failure for url http://downloads.yoctoproject.org/mirro=
r/sources/git2_git.gnome.org.evolution-data-server.tar.gz (original url: gi=
t://git.gnome.org/evolution-data-server;branch=3Dgnome-3-2)
DEBUG: Fetcher failure: Fetch command failed with exit code 128, output:
fatal: unable to connect to git.gnome.org:
git.gnome.org[0: 209.132.180.180]: errno=3DNo route to host
git.gnome.org[1: 209.132.180.168]: errno=3DNo route to host


DEBUG: Fetching http://sources.openembedded.org/git2_git.gnome.org.evolutio=
n-data-server.tar.gz using command '/usr/bin/env wget -t 2 -T 30 -nv --pass=
ive-ftp --no-check-certificate -P /home/cpu49/argon/fsl-release-bsp1/downlo=
ads/ 'http://sources.openembedded.org/git2_git.gnome.org.evolution-data-ser=
ver.tar.gz''
DEBUG: Fetcher accessed the network with the command /usr/bin/env wget -t 2=
 -T 30 -nv --passive-ftp --no-check-certificate -P /home/cpu49/argon/fsl-re=
lease-bsp1/downloads/ 'http://sources.openembedded.org/git2_git.gnome.org.e=
volution-data-server.tar.gz'
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 /usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate -P /=
home/cpu49/argon/fsl-release-bsp1/downloads/ 'http://sources.openembedded.o=
rg/git2_git.gnome.org.evolution-data-server.tar.gz'
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 branch --contains a9e4e74ec4473a4fd09e56b=
690bd4fa72f686687 --list gnome-3-2 2> /dev/null | wc -l
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 remote rm origin
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 remote add --mirror=3Dfetch origin git://=
git.gnome.org/evolution-data-server
DEBUG: Fetcher accessed the network with the command git -c core.fsyncobjec=
tfiles=3D0 fetch -f --prune git://git.gnome.org/evolution-data-server refs/=
*:refs/*
DEBUG: Running export PATH=3D"/home/cpu49/argon/fsl-release-bsp1/sources/po=
ky/scripts:/home/cpu49/argon/fsl-release-bsp1/build/tmp/sysroots/i686-linux=
/usr/bin/arm-poky-linux-gnueabi:/home/cpu49/argon/fsl-release-bsp1/build/tm=
p/sysroots/imx6ulnxpuiopb/usr/bin/crossscripts:/home/cpu49/argon/fsl-releas=
e-bsp1/build/tmp/sysroots/i686-linux/usr/sbin:/home/cpu49/argon/fsl-release=
-bsp1/build/tmp/sysroots/i686-linux/usr/bin:/home/cpu49/argon/fsl-release-b=
sp1/build/tmp/sysroots/i686-linux/sbin:/home/cpu49/argon/fsl-release-bsp1/b=
uild/tmp/sysroots/i686-linux/bin:/home/cpu49/argon/fsl-release-bsp1/sources=
/poky/scripts:/home/cpu49/argon/fsl-release-bsp1/sources/poky/bitbake/bin:/=
home/cpu49/bin:/home/cpu49/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin:/usr/games:/usr/local/games"; export HOME=3D"/home/cpu49";=
 git -c core.fsyncobjectfiles=3D0 fetch -f --prune git://git.gnome.org/evol=
ution-data-server refs/*:refs/*
DEBUG: Mirror fetch failure for url http://sources.openembedded.org/git2_gi=
t.gnome.org.evolution-data-server.tar.gz (original url: git://git.gnome.org=
/evolution-data-server;branch=3Dgnome-3-2)
DEBUG: Fetcher failure: Fetch command failed with exit code 128, output:
fatal: unable to connect to git.gnome.org:
git.gnome.org[0: 209.132.180.168]: errno=3DNo route to host
git.gnome.org[1: 209.132.180.180]: errno=3DNo route to host


ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
fatal: unable to connect to git.gnome.org:
git.gnome.org[0: 209.132.180.168]: errno=3DNo route to host
git.gnome.org[1: 209.132.180.180]: errno=3DNo route to host


DEBUG: Python function base_do_fetch finished
DEBUG: Python function do_fetch finished
ERROR: Function failed: Fetcher failure for URL: 'git://git.gnome.org/evolu=
tion-data-server;branch=3Dgnome-3-2'. Unable to fetch URL from any source.

------=_NextPart_000_000F_01D4E2FF.2F8C03B0--
