Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB52C77B7E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 14:53:48 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.30258.1685285623492330901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 07:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout02.t-online.de (Postfix) with SMTP id 4D7AC21A39;
	Sun, 28 May 2023 16:53:25 +0200 (CEST)
Received: from [192.168.178.156] ([79.219.225.43]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q3Hlm-38Q7u40; Sun, 28 May 2023 16:53:18 +0200
Date: Sun, 28 May 2023 16:53:13 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <POIDVR.URDIMNIKV0SE3@t-online.de>
In-Reply-To: 
	<CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
References: <20230527133252.284132-1-f_l_k@t-online.de>
	<20230527133252.284132-2-f_l_k@t-online.de>
	<17635252DFD4EDDE.6918@lists.openembedded.org>
	<CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
	<VDGDVR.YBUKQ953M2TP3@t-online.de>
	<CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BlhnPeLgC7070WWV9GUC"
X-TOI-EXPURGATEID: 150726::1685285598-18DBAE62-20BCBF11/0/0 CLEAN NORMAL
X-TOI-MSGID: fcefd7cd-4b97-4f42-b750-bd7bd6d986a6
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 14:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181831

--=-BlhnPeLgC7070WWV9GUC
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

Am So, 28. Mai 2023 um 16:23:36 +0200 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> But can you show the actual error please?

python3-native for example fails like this:
ERROR: python3-native-3.11.2-r0 do_install:=20
ExecutionError('/home/flk/poky/build/tmp/work/x86_64-linux/python3-native/3=
.11.2-r0/temp/run.do_install.4082972',=20
1, None, None)
ERROR: Logfile of failure stored in:=20
/home/flk/poky/build/tmp/work/x86_64-linux/python3-native/3.11.2-r0/temp/lo=
g.do_install.4082972
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',=20
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_install
| The necessary bits to build these optional modules were not found:
| _crypt
|
| WARNING: exit code 1 from a shell command.
ERROR: Task=20
(virtual:native:/home/flk/poky/meta/recipes-devtools/python/python3_3.11.2.=
bb:do_install)=20
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1089 tasks of which 1078 didn't need to=20
be rerun and 1 failed.

Summary: 1 task failed:
 =20
virtual:native:/home/flk/poky/meta/recipes-devtools/python/python3_3.11.2.b=
b:do_install
Summary: There was 1 ERROR message, returning a non-zero exit code.


ruby-native fails like this:

compiling ../ruby-3.2.2/vm_trace.c
| In file included from ../ruby-3.2.2/include/ruby/ruby.h:42,
|                  from ../ruby-3.2.2/debug_counter.h:362,
|                  from ../ruby-3.2.2/string.c:24:
| ../ruby-3.2.2/string.c: In function =91rb_str_crypt=92:
| ../ruby-3.2.2/string.c:10169:35: error: invalid application of=20
=91sizeof=92 to incomplete type =91struct crypt_data=92
| 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
|       |                                   ^~~~~~
| ../ruby-3.2.2/include/ruby/internal/memory.h:299:7: note: in=20
definition of macro =91RB_ALLOCV=92
|   299 |     ((n) < RUBY_ALLOCV_LIMIT ? \
|       |       ^
| ../ruby-3.2.2/string.c:10169:12: note: in expansion of macro=20
=91ALLOCV=92
| 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
|       |            ^~~~~~
| compiling ../ruby-3.2.2/missing/setproctitle.c
| compiling ../ruby-3.2.2/missing/strlcpy.c
| compiling ../ruby-3.2.2/missing/strlcat.c
| In file included from /usr/include/stdlib.h:574,
|                  from ../ruby-3.2.2/include/ruby/defines.h:27,
|                  from ../ruby-3.2.2/include/ruby/ruby.h:25,
|                  from ../ruby-3.2.2/debug_counter.h:362,
|                  from ../ruby-3.2.2/string.c:24:
| ../ruby-3.2.2/string.c:10169:35: error: invalid application of=20
=91sizeof=92 to incomplete type =91struct crypt_data=92
| 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
|       |                                   ^~~~~~
| ../ruby-3.2.2/include/ruby/internal/memory.h:398:20: note: in=20
expansion of macro =91RB_ALLOCV=92
|   398 | #define ALLOCV     RB_ALLOCV     /**< @old{RB_ALLOCV} */
|       |                    ^~~~~~~~~
| ../ruby-3.2.2/string.c:10169:12: note: in expansion of macro=20
=91ALLOCV=92
| 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
|       |            ^~~~~~
| In file included from ../ruby-3.2.2/include/ruby/ruby.h:42,
|                  from ../ruby-3.2.2/debug_counter.h:362,
|                  from ../ruby-3.2.2/string.c:24:
| ../ruby-3.2.2/string.c:10169:35: error: invalid application of=20
=91sizeof=92 to incomplete type =91struct crypt_data=92
| 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
|       |                                   ^~~~~~
| ../ruby-3.2.2/include/ruby/internal/memory.h:301:33: note: in=20
definition of macro =91RB_ALLOCV=92
|   301 |      rb_alloc_tmp_buffer(&(v), (n)))
|       |                                 ^
| ../ruby-3.2.2/string.c:10169:12: note: in expansion of macro=20
=91ALLOCV=92
| 10169 |     data =3D ALLOCV(databuf, sizeof(struct crypt_data));
|       |            ^~~~~~
| ../ruby-3.2.2/string.c:10173:11: warning: implicit declaration of=20
function =91crypt_r=92; did you mean =91crypt=92?=20
[-Wimplicit-function-declaration]
| 10173 |     res =3D crypt_r(s, saltp, data);
|       |           ^~~~~~~
|       |           crypt
| ../ruby-3.2.2/string.c:10173:9: warning: assignment to =91char *=92=20
from =91int=92 makes pointer from integer without a cast=20
[-Wint-conversion]
| 10173 |     res =3D crypt_r(s, saltp, data);
|       |         ^




--=-BlhnPeLgC7070WWV9GUC
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am So, 28. Mai 2023 um 16:23:36 +0200 s=
chrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote typ=
e=3D"cite">But can you show the actual error please? </blockquote><div><br>=
</div><div>python3-native for example fails like this:</div><div>ERROR: pyt=
hon3-native-3.11.2-r0 do_install: ExecutionError('/home/flk/poky/build/tmp/=
work/x86_64-linux/python3-native/3.11.2-r0/temp/run.do_install.4082972', 1,=
 None, None)</div><div>ERROR: Logfile of failure stored in: /home/flk/poky/=
build/tmp/work/x86_64-linux/python3-native/3.11.2-r0/temp/log.do_install.40=
82972</div><div>Log data follows:</div><div>| DEBUG: Executing python funct=
ion autotools_aclocals</div><div>| DEBUG: SITE files ['endian-little', 'com=
mon-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']</div><div>|=
 DEBUG: Python function autotools_aclocals finished</div><div>| DEBUG: Exec=
uting shell function do_install</div><div>| The necessary bits to build the=
se optional modules were not found:</div><div>| _crypt</div><div>|&nbsp;</d=
iv><div>| WARNING: exit code 1 from a shell command.</div><div>ERROR: Task =
(virtual:native:/home/flk/poky/meta/recipes-devtools/python/python3_3.11.2.=
bb:do_install) failed with exit code '1'</div><div>NOTE: Tasks Summary: Att=
empted 1089 tasks of which 1078 didn't need to be rerun and 1 failed.</div>=
<div><br></div><div>Summary: 1 task failed:</div><div>&nbsp; virtual:native=
:/home/flk/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_install</=
div><div>Summary: There was 1 ERROR message, returning a non-zero exit code=
.</div><div><br></div><div><br></div><div>ruby-native fails like this:</div=
><div><br></div><div><div>compiling ../ruby-3.2.2/vm_trace.c</div><div>| In=
 file included from ../ruby-3.2.2/include/ruby/ruby.h:42,</div><div>| &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../ruby-3.2.2=
/debug_counter.h:362,</div><div>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;from ../ruby-3.2.2/string.c:24:</div><div>| ../ruby-3.=
2.2/string.c: In function =91rb_str_crypt=92:</div><div>| ../ruby-3.2.2/str=
ing.c:10169:35: error: invalid application of =91sizeof=92 to incomplete ty=
pe =91struct crypt_data=92</div><div>| 10169 | &nbsp; &nbsp; data =3D ALLOC=
V(databuf, sizeof(struct crypt_data));</div><div>| &nbsp; &nbsp; &nbsp; | &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~~~~</div><div>| ../ruby-3.2.2=
/include/ruby/internal/memory.h:299:7: note: in definition of macro =91RB_A=
LLOCV=92</div><div>| &nbsp; 299 | &nbsp; &nbsp; ((n) &lt; RUBY_ALLOCV_LIMIT=
 ? \</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; ^</div><div>| =
../ruby-3.2.2/string.c:10169:12: note: in expansion of macro =91ALLOCV=92</=
div><div>| 10169 | &nbsp; &nbsp; data =3D ALLOCV(databuf, sizeof(struct cry=
pt_data));</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;^~~~~~</div><div>| compiling ../ruby-3.2.2/missing/setproctitle=
.c</div><div>| compiling ../ruby-3.2.2/missing/strlcpy.c</div><div>| compil=
ing ../ruby-3.2.2/missing/strlcat.c</div><div>| In file included from /usr/=
include/stdlib.h:574,</div><div>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;from ../ruby-3.2.2/include/ruby/defines.h:27,</div><di=
v>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../r=
uby-3.2.2/include/ruby/ruby.h:25,</div><div>| &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../ruby-3.2.2/debug_counter.h:362,</d=
iv><div>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fro=
m ../ruby-3.2.2/string.c:24:</div><div>| ../ruby-3.2.2/string.c:10169:35: e=
rror: invalid application of =91sizeof=92 to incomplete type =91struct cryp=
t_data=92</div><div>| 10169 | &nbsp; &nbsp; data =3D ALLOCV(databuf, sizeof=
(struct crypt_data));</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; ^~~~~~</div><div>| ../ruby-3.2.2/include/ruby/int=
ernal/memory.h:398:20: note: in expansion of macro =91RB_ALLOCV=92</div><di=
v>| &nbsp; 398 | #define ALLOCV &nbsp; &nbsp; RB_ALLOCV &nbsp; &nbsp; /**&l=
t; @old{RB_ALLOCV} */</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~</div><div>| ..=
/ruby-3.2.2/string.c:10169:12: note: in expansion of macro =91ALLOCV=92</di=
v><div>| 10169 | &nbsp; &nbsp; data =3D ALLOCV(databuf, sizeof(struct crypt=
_data));</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;^~~~~~</div><div>| In file included from ../ruby-3.2.2/include/ru=
by/ruby.h:42,</div><div>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;from ../ruby-3.2.2/debug_counter.h:362,</div><div>| &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from ../ruby-3.2.2/stri=
ng.c:24:</div><div>| ../ruby-3.2.2/string.c:10169:35: error: invalid applic=
ation of =91sizeof=92 to incomplete type =91struct crypt_data=92</div><div>=
| 10169 | &nbsp; &nbsp; data =3D ALLOCV(databuf, sizeof(struct crypt_data))=
;</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; ^~~~~~</div><div>| ../ruby-3.2.2/include/ruby/internal/memory.h:301:3=
3: note: in definition of macro =91RB_ALLOCV=92</div><div>| &nbsp; 301 | &n=
bsp; &nbsp; &nbsp;rb_alloc_tmp_buffer(&amp;(v), (n)))</div><div>| &nbsp; &n=
bsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^</div><div>| ../ruby-3.=
2.2/string.c:10169:12: note: in expansion of macro =91ALLOCV=92</div><div>|=
 10169 | &nbsp; &nbsp; data =3D ALLOCV(databuf, sizeof(struct crypt_data));=
</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;^~~~~~</div><div>| ../ruby-3.2.2/string.c:10173:11: warning: implicit dec=
laration of function =91crypt_r=92; did you mean =91crypt=92? [-Wimplicit-f=
unction-declaration]</div><div>| 10173 | &nbsp; &nbsp; res =3D crypt_r(s, s=
altp, data);</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; ^~~~~~~</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; crypt</div><div>| ../ruby-3.2.2/string.c:10173:9: warning: assig=
nment to =91char *=92 from =91int=92 makes pointer from integer without a c=
ast [-Wint-conversion]</div><div>| 10173 | &nbsp; &nbsp; res =3D crypt_r(s,=
 saltp, data);</div><div>| &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbs=
p; ^</div></div><div><br></div><div><br></div></div>
--=-BlhnPeLgC7070WWV9GUC--


