Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8959E6ADF7
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 11:29:22 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.45689.1732361356360817355
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 03:29:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout10.t-online.de (Postfix) with SMTP id CDEB5593;
	Sat, 23 Nov 2024 12:29:14 +0100 (CET)
Received: from [192.168.178.67] ([84.163.36.244]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tEoK9-0xd8Yi0; Sat, 23 Nov 2024 12:29:13 +0100
Date: Sat, 23 Nov 2024 12:29:08 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gcc: add a backport patch to fix an issue with
 tzdata 2024b
To: Steve Sakoman <steve@sakoman.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <KKIENS.YVVF7OKH6J7C2@t-online.de>
In-Reply-To: <R8HENS.P1NP684GLCTM2@t-online.de>
References: <20241122012941.3055-1-f_l_k@t-online.de>
	<CA+chaQcL_dGkNAgVXD3JWvKFObQ=73tfSbkJcdFHbkDH9HqD5w@mail.gmail.com>
	<CAOSpxdaeYv3DEcSXHs4j0c-+XZaR=PfokWF09TCuJ8QKpABEBg@mail.gmail.com>
	<R8HENS.P1NP684GLCTM2@t-online.de>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Pgkd80R0QeTIi8LPZjbX"
X-TOI-EXPURGATEID: 150726::1732361353-B5DA9864-D102BE75/0/0 CLEAN NORMAL
X-TOI-MSGID: cb195796-3c2c-4a8c-aa3d-f7de68fae634
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 11:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207680

--=-Pgkd80R0QeTIi8LPZjbX
Content-Type: text/plain; charset=us-ascii; format=flowed

It's not that I didnt't try, but it seams like I cant build gcc for 
scarthgap from my host system (which is based on master branch)

I'm lacking pipes due to python 3.13
ERROR: ninja-native-1.11.1-r0 do_compile: 
ExecutionError('/home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990', 
1, None, None)
ERROR: Logfile of failure stored in: 
/home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/log.do_compile.175990
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
| File 
"/home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/git/./configure.py", 
line 26, in <module>
| import pipes
| ModuleNotFoundError: No module named 'pipes'
| WARNING: 
/home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990:142 
exit 1 from 'python3 ./configure.py --bootstrap'
| WARNING: Backtrace (BB generated script):
| #1: do_compile, 
/home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990, 
line 142
| #2: main, 
/home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp/run.do_compile.175990, 
line 146
ERROR: Task 
(virtual:native:/home/flk/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_compile) 
failed with exit code '1'


On Sat, Nov 23 2024 at 12:00:27 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> On Fri, Nov 22 2024 at 05:33:29 AM -08:00:00, Steve Sakoman 
> <steve@sakoman.com> wrote:
>> Markus, could you send versions of this patch for stable branches 
>> too?
>> (styhead, scarthgap, kirkstone)
> 
> I have sent the patches, but only verified that they would apply. I 
> can't comile test them as I dont have buildsystems set up for any of 
> these branches


--=-Pgkd80R0QeTIi8LPZjbX
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>It's not that I didnt't try, but i=
t seams like I cant build gcc for scarthgap from my host system (which is b=
ased on master branch)</div><div><br></div><div>I'm lacking pipes due to py=
thon 3.13</div><div>ERROR: ninja-native-1.11.1-r0 do_compile: ExecutionErro=
r('/home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.11.1/temp=
/run.do_compile.175990', 1, None, None)</div><div>ERROR: Logfile of failure=
 stored in: /home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/1.=
11.1/temp/log.do_compile.175990</div><div>Log data follows:</div><div>| DEB=
UG: Executing shell function do_compile</div><div>| Traceback (most recent =
call last):</div><div>|   File "/home/flk/poky/build-test/tmp/work/x86_64-l=
inux/ninja-native/1.11.1/git/./configure.py", line 26, in &lt;module&gt;</d=
iv><div>|     import pipes</div><div>| ModuleNotFoundError: No module named=
 'pipes'</div><div>| WARNING: /home/flk/poky/build-test/tmp/work/x86_64-lin=
ux/ninja-native/1.11.1/temp/run.do_compile.175990:142 exit 1 from 'python3 =
./configure.py --bootstrap'</div><div>| WARNING: Backtrace (BB generated sc=
ript):</div><div>| 	#1: do_compile, /home/flk/poky/build-test/tmp/work/x86_=
64-linux/ninja-native/1.11.1/temp/run.do_compile.175990, line 142</div><div=
>| 	#2: main, /home/flk/poky/build-test/tmp/work/x86_64-linux/ninja-native/=
1.11.1/temp/run.do_compile.175990, line 146</div><div>ERROR: Task (virtual:=
native:/home/flk/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_compil=
e) failed with exit code '1'</div><div><br></div></div><div id=3D"geary-quo=
te" dir=3D"auto"><br>On Sat, Nov 23 2024 at 12:00:27 PM +01:00:00, Markus V=
olk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"cite"><div id=
=3D"geary-body" dir=3D"auto">On Fri, Nov 22 2024 at 05:33:29 AM -08:00:00, =
Steve Sakoman &lt;steve@sakoman.com&gt; wrote:<br><blockquote type=3D"cite"=
><div class=3D"plaintext" style=3D"white-space: break-spaces;">Markus, coul=
d you send versions of this patch for stable branches too?
(styhead, scarthgap, kirkstone)</div></blockquote><div><br></div><div>I hav=
e sent the patches, but only verified that they would apply. I can't comile=
 test them as I dont have buildsystems set up for any of these branches</di=
v></div></blockquote></div>
--=-Pgkd80R0QeTIi8LPZjbX--


