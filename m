Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7827231B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:31:20 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1YDbi4-0006Xd-J8 from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Jan 2015 08:31:20 -0800
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) with mapi id
	14.03.0224.002; Tue, 20 Jan 2015 08:31:20 -0800
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] init-install.sh: Switch to using static
	device paths.
Thread-Index: AQHQLgxNpsKdg5jNgUi5lv6szTzlFpy+qWyAgADXkICACkYRgA==
Date: Tue, 20 Jan 2015 16:31:20 +0000
Message-ID: <1F94FBC9-7643-4770-AFA6-DA7114D4A3C6@mentor.com>
References: <1420818765-28571-1-git-send-email-drew_moseley@mentor.com>
	<54B32BD4.3080209@windriver.com>
	<C367E4F3-C2F6-48E5-BEAF-E7D873D458BD@mentor.com>
	<54B5E495.7020104@windriver.com>
In-Reply-To: <54B5E495.7020104@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] init-install.sh: Switch to using static device paths.
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
X-List-Received-Date: Tue, 20 Jan 2015 16:31:26 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_1F94FBC976434770AFA6DA7114D4A3C6mentorcom_"

--_000_1F94FBC976434770AFA6DA7114D4A3C6mentorcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


On Jan 13, 2015, at 10:37 PM, ChenQi <Qi.Chen@windriver.com<mailto:Qi.Chen@=
windriver.com>> wrote:

-    linux /vmlinuz root=3D$rootfs $rootwait rw $5 $3 $4 quiet
+    linux /vmlinuz root=3DPARTUUID=3D$rootfs_uuid $rootwait rw $5 $3 $4 qu=
iet
I thought PARTUUID is for GPT only.

Perhaps so but it does seem to be there on my VirtualBox systems.  My Ubunt=
u host uses "root=3DUUID=3Dblah" but that was't working for me at some poin=
t.  I'll dig back into it and see what I can find.

Drew


root=3DUUID=3Dxxx has to be resolved by an initramfs because kernel itself =
cannot handle it.

There's a patchset I sent half a year ago trying to solve this problem.
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3DCh=
enQi/initramfs-uuid
This offers one solution, maybe an ugly one.

Best Regards,
Chen Qi

Hmm.  It seems that supporting static device paths with init-install.sh is =
a bit more tricky as PARTUUID is not supported and to use UUID requires a f=
airly heavyweight change to support initramfs.

For EFI though it seems that PARTUUID is usable.  Does it make sense to sub=
mit the patch to init-install-efi.sh separately?

Drew

--_000_1F94FBC976434770AFA6DA7114D4A3C6mentorcom_
Content-Type: text/html; charset="Windows-1252"
Content-ID: <F08867194408344E82DF241B1242960B@mentor.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-lin=
e-break: after-white-space;" class=3D"">
<br class=3D"">
<div>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On Jan 13, 2015, at 10:37 PM, ChenQi &lt;<a href=3D"mailto:=
Qi.Chen@windriver.com" class=3D"">Qi.Chen@windriver.com</a>&gt; wrote:</div=
>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Monaco; font-size: 12px; fo=
nt-style: normal; font-variant: normal; font-weight: normal; letter-spacing=
: normal; line-height: normal; orphans: auto; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; widows: auto; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<blockquote type=3D"cite" class=3D"">
<blockquote type=3D"cite" class=3D"">- &nbsp;&nbsp;&nbsp;linux /vmlinuz roo=
t=3D$rootfs $rootwait rw $5 $3 $4 quiet<br class=3D"">
&#43; &nbsp;&nbsp;&nbsp;linux /vmlinuz root=3DPARTUUID=3D$rootfs_uuid $root=
wait rw $5 $3 $4 quiet<br class=3D"">
</blockquote>
I thought PARTUUID is for GPT only.<br class=3D"">
<br class=3D"">
</blockquote>
Perhaps so but it does seem to be there on my VirtualBox systems. &nbsp;My =
Ubuntu host uses &quot;root=3DUUID=3Dblah&quot; but that was't working for =
me at some point. &nbsp;I'll dig back into it and see what I can find.<br c=
lass=3D"">
<br class=3D"">
Drew<br class=3D"">
</blockquote>
</div>
</blockquote>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Monaco; font-size: 12px; fo=
nt-style: normal; font-variant: normal; font-weight: normal; letter-spacing=
: normal; line-height: normal; orphans: auto; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; widows: auto; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px;" class=3D"">
<br class=3D"">
</blockquote>
<br style=3D"font-family: Monaco; font-size: 12px; font-style: normal; font=
-variant: normal; font-weight: normal; letter-spacing: normal; line-height:=
 normal; orphans: auto; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-=
stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Monaco; font-size: 12px; font-style: normal; fo=
nt-variant: normal; font-weight: normal; letter-spacing: normal; line-heigh=
t: normal; orphans: auto; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; float: none; display: inline !important;" class=3D"">r=
oot=3DUUID=3Dxxx
 has to be resolved by an initramfs because kernel itself cannot handle it.=
</span><br style=3D"font-family: Monaco; font-size: 12px; font-style: norma=
l; font-variant: normal; font-weight: normal; letter-spacing: normal; line-=
height: normal; orphans: auto; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; widows: auto; word-spacing: 0px; -webki=
t-text-stroke-width: 0px;" class=3D"">
<br style=3D"font-family: Monaco; font-size: 12px; font-style: normal; font=
-variant: normal; font-weight: normal; letter-spacing: normal; line-height:=
 normal; orphans: auto; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-=
stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Monaco; font-size: 12px; font-style: normal; fo=
nt-variant: normal; font-weight: normal; letter-spacing: normal; line-heigh=
t: normal; orphans: auto; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; float: none; display: inline !important;" class=3D"">T=
here's
 a patchset I sent half a year ago trying to solve this problem.</span><br =
style=3D"font-family: Monaco; font-size: 12px; font-style: normal; font-var=
iant: normal; font-weight: normal; letter-spacing: normal; line-height: nor=
mal; orphans: auto; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px;" class=3D"">
<a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/=
log/?h=3DChenQi/initramfs-uuid" style=3D"font-family: Monaco; font-size: 12=
px; font-style: normal; font-variant: normal; font-weight: normal; letter-s=
pacing: normal; line-height: normal; orphans: auto; text-align: start; text=
-indent: 0px; text-transform: none; white-space: normal; widows: auto; word=
-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D"">http://cgit.open=
embedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3DChenQi/initramfs-u=
uid</a><br style=3D"font-family: Monaco; font-size: 12px; font-style: norma=
l; font-variant: normal; font-weight: normal; letter-spacing: normal; line-=
height: normal; orphans: auto; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; widows: auto; word-spacing: 0px; -webki=
t-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Monaco; font-size: 12px; font-style: normal; fo=
nt-variant: normal; font-weight: normal; letter-spacing: normal; line-heigh=
t: normal; orphans: auto; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; float: none; display: inline !important;" class=3D"">T=
his
 offers one solution, maybe an ugly one.</span><br style=3D"font-family: Mo=
naco; font-size: 12px; font-style: normal; font-variant: normal; font-weigh=
t: normal; letter-spacing: normal; line-height: normal; orphans: auto; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D=
"">
<br style=3D"font-family: Monaco; font-size: 12px; font-style: normal; font=
-variant: normal; font-weight: normal; letter-spacing: normal; line-height:=
 normal; orphans: auto; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-=
stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Monaco; font-size: 12px; font-style: normal; fo=
nt-variant: normal; font-weight: normal; letter-spacing: normal; line-heigh=
t: normal; orphans: auto; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; float: none; display: inline !important;" class=3D"">B=
est
 Regards,</span><br style=3D"font-family: Monaco; font-size: 12px; font-sty=
le: normal; font-variant: normal; font-weight: normal; letter-spacing: norm=
al; line-height: normal; orphans: auto; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; widows: auto; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px;" class=3D"">
<span style=3D"font-family: Monaco; font-size: 12px; font-style: normal; fo=
nt-variant: normal; font-weight: normal; letter-spacing: normal; line-heigh=
t: normal; orphans: auto; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; float: none; display: inline !important;" class=3D"">C=
hen
 Qi</span></div>
</blockquote>
</div>
<br class=3D"">
<div class=3D"">Hmm. &nbsp;It seems that supporting static device paths wit=
h init-install.sh is a bit more tricky as PARTUUID is not supported and to =
use UUID requires a fairly heavyweight change to support initramfs.</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">For EFI though it seems that PARTUUID is usable. &nbsp;Does=
 it make sense to submit the patch to init-install-efi.sh separately?</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">Drew</div>
</body>
</html>

--_000_1F94FBC976434770AFA6DA7114D4A3C6mentorcom_--
