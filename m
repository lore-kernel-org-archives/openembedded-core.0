Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66B1EE4993
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 16:45:19 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.31798.1692549909334081130
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 09:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout05.t-online.de (Postfix) with SMTP id 22AC123669;
	Sun, 20 Aug 2023 18:45:07 +0200 (CEST)
Received: from [192.168.178.58] ([84.163.41.50]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qXlY2-3thiIy0; Sun, 20 Aug 2023 18:45:06 +0200
Date: Sun, 20 Aug 2023 18:45:00 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <0V7PZR.5VQ856JRS2JP@t-online.de>
In-Reply-To: <CAMKF1sqJz9y7BT+QbnrrFZVGUwh_17UKYfJ4+6_+7iXPR3hB+Q@mail.gmail.com>
References: <20230815145218.1561896-1-f_l_k@t-online.de>
	<CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
	<IHIJZR.16XNVQ6SKCIP1@t-online.de>
	<CAMKF1srb01=gFUx8CFh7seoNuN7yDP4m9DQfu2GsCLtCMMw66Q@mail.gmail.com>
	<CAMKF1sqJz9y7BT+QbnrrFZVGUwh_17UKYfJ4+6_+7iXPR3hB+Q@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-QlvVdgcBfWgFvWydOkDM"
X-TOI-EXPURGATEID: 150726::1692549906-1201D931-32556FB1/0/0 CLEAN NORMAL
X-TOI-MSGID: eef66451-a8c9-4f7a-98be-3a6c5b3c364d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 16:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186413

--=-QlvVdgcBfWgFvWydOkDM
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 20 2023 at 07:54:19 AM -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> Ok the cmdline looks normal what=FFs the install location of these=20
> files above

flk@intel-corei7-64:~/poky/build$ ll /usr/lib/libgcc*
lrwxrwxrwx 1 root root   17 Mar  9  2018 /usr/lib/libgccpp.so.1 ->=20
libgccpp.so.1.5.0
-rwxr-xr-x 1 root root  14K Mar  9  2018 /usr/lib/libgccpp.so.1.5.0
-rw-r--r-- 1 root root  132 Mar  9  2018 /usr/lib/libgcc_s.so
-rw-r--r-- 1 root root 143K Mar  9  2018 /usr/lib/libgcc_s.so.1
flk@intel-corei7-64:~/poky/build$ ll /usr/lib/x86_64-poky-linux/13.2.0/
total 6.3M
drwxr-xr-x 1 root root  260 Mar  9  2018 .
drwxr-xr-x 1 root root   12 Mar  9  2018 ..
-rw-r--r-- 1 root root 2.5K Mar  9  2018 crtbegin.o
-rw-r--r-- 1 root root 2.8K Mar  9  2018 crtbeginS.o
-rw-r--r-- 1 root root 3.0K Mar  9  2018 crtbeginT.o
-rw-r--r-- 1 root root 1.2K Mar  9  2018 crtend.o
-rw-r--r-- 1 root root 1.2K Mar  9  2018 crtendS.o
-rw-r--r-- 1 root root 3.8K Mar  9  2018 crtfastmath.o
-rw-r--r-- 1 root root 3.5K Mar  9  2018 crtprec32.o
-rw-r--r-- 1 root root 3.5K Mar  9  2018 crtprec64.o
-rw-r--r-- 1 root root 3.5K Mar  9  2018 crtprec80.o
drwxr-xr-x 1 root root   66 Mar  9  2018 include
-rw-r--r-- 1 root root 5.7M Mar  9  2018 libgcc.a
-rw-r--r-- 1 root root 322K Mar  9  2018 libgcc_eh.a
-rw-r--r-- 1 root root 292K Mar  9  2018 libgcov.a



--=-QlvVdgcBfWgFvWydOkDM
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Sun, Aug 20 2023 at 07:54:19 AM -07:=
00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D"ci=
te">Ok the cmdline looks normal what=FFs the install location of these file=
s above&nbsp;</blockquote><div><br></div><div><div>flk@intel-corei7-64:~/po=
ky/build$ ll /usr/lib/libgcc*</div><div>lrwxrwxrwx 1 root root &nbsp; 17 Ma=
r &nbsp;9 &nbsp;2018 /usr/lib/libgccpp.so.1 -&gt; libgccpp.so.1.5.0</div><d=
iv>-rwxr-xr-x 1 root root &nbsp;14K Mar &nbsp;9 &nbsp;2018 /usr/lib/libgccp=
p.so.1.5.0</div><div>-rw-r--r-- 1 root root &nbsp;132 Mar &nbsp;9 &nbsp;201=
8 /usr/lib/libgcc_s.so</div><div>-rw-r--r-- 1 root root 143K Mar &nbsp;9 &n=
bsp;2018 /usr/lib/libgcc_s.so.1</div><div>flk@intel-corei7-64:~/poky/build$=
 ll /usr/lib/x86_64-poky-linux/13.2.0/</div><div>total 6.3M</div><div>drwxr=
-xr-x 1 root root &nbsp;260 Mar &nbsp;9 &nbsp;2018 .</div><div>drwxr-xr-x 1=
 root root &nbsp; 12 Mar &nbsp;9 &nbsp;2018 ..</div><div>-rw-r--r-- 1 root =
root 2.5K Mar &nbsp;9 &nbsp;2018 crtbegin.o</div><div>-rw-r--r-- 1 root roo=
t 2.8K Mar &nbsp;9 &nbsp;2018 crtbeginS.o</div><div>-rw-r--r-- 1 root root =
3.0K Mar &nbsp;9 &nbsp;2018 crtbeginT.o</div><div>-rw-r--r-- 1 root root 1.=
2K Mar &nbsp;9 &nbsp;2018 crtend.o</div><div>-rw-r--r-- 1 root root 1.2K Ma=
r &nbsp;9 &nbsp;2018 crtendS.o</div><div>-rw-r--r-- 1 root root 3.8K Mar &n=
bsp;9 &nbsp;2018 crtfastmath.o</div><div>-rw-r--r-- 1 root root 3.5K Mar &n=
bsp;9 &nbsp;2018 crtprec32.o</div><div>-rw-r--r-- 1 root root 3.5K Mar &nbs=
p;9 &nbsp;2018 crtprec64.o</div><div>-rw-r--r-- 1 root root 3.5K Mar &nbsp;=
9 &nbsp;2018 crtprec80.o</div><div>drwxr-xr-x 1 root root &nbsp; 66 Mar &nb=
sp;9 &nbsp;2018 include</div><div>-rw-r--r-- 1 root root 5.7M Mar &nbsp;9 &=
nbsp;2018 libgcc.a</div><div>-rw-r--r-- 1 root root 322K Mar &nbsp;9 &nbsp;=
2018 libgcc_eh.a</div><div>-rw-r--r-- 1 root root 292K Mar &nbsp;9 &nbsp;20=
18 libgcov.a</div></div><div><br></div></div>
--=-QlvVdgcBfWgFvWydOkDM--


