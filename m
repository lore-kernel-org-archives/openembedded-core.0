Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 24B9F7198F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 20:23:57 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id o76so7676928wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Feb 2018 12:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hqJ7SUzv85uyYUkJDLHcxOg43UfbklcKHdKgTqOzmxk=;
	b=p0hQnqgvdcqYADwXiPH+xpV8/hj7LlLYnbbNNV3i3njpxaKzfAUWgsdyTUMEFjJlgq
	MyUH+gai2FE38eKQWh6QljkAUYxDqO+JB2UfrkmFBN9SqG8lIj9yf06kxVHIXkY5WOzC
	ZeZgRbT5JNXsol6sIvmrLwXL1QULly7PKbQs2iu/Tvkp8sxUbbPdTslXxZpit/XKxKeS
	d939x7O7ML9OFWm+hPFGpBkrT4umx75M4aMB9rOZwlBIzMN04BJIoaowXlMaGA6drkVS
	bM+5DoziHBPRUzlAB0q+EWHLd2+YvuSDKK0TEOV6VT4QIhEp8DeunAlzu0/BkAqOotZO
	XKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hqJ7SUzv85uyYUkJDLHcxOg43UfbklcKHdKgTqOzmxk=;
	b=WJu2lkNc5Sc1h/f1K1LqJQPXfvJGqoVyHuRGs37xisvtErUFUNy6l6QQMGsMa1cxdW
	TK8M8Q22WZZc0x+a4k8v36e4rVbFsxjgrcB4M5kp7z5k1Uga6JlqWkdXA8BzEDMa6aNj
	Ot0ZWhKixeEgt+u/c3oZtWWYuTWAt7NFhuRSJK7bBw1qoPgNZXcn9DmgJ63L9AP93fCa
	iwUWoZutLtb8E1IS74dHJ9032poPjy671+DTlpvyA78x0Hlfa+d+lE1z4LPlkoe6XUNv
	pbYnIqqqXFE0P13nwklJh7/dxMbxBwEpw7kkGhtUnIhrCZP+lmejbhA4d8xtTKx2S3H5
	f18Q==
X-Gm-Message-State: APf1xPCxCcenjags6qG91UlLPMzN56St0ff3VniGBNLQv6UddtLwCif+
	hCdTHUup++y3skWsKlt93Ra1G09BQBX7IQG6yKQ=
X-Google-Smtp-Source: AH8x225yTmujhh2eL8F/go1c/d6IZhgY+6E3GJyO4q5qtmeFWohPLzoU3e4DAjC6eisaUuDu9dr+qs/+n5NvhJ2eoQo=
X-Received: by 10.223.143.101 with SMTP id p92mr10848874wrb.241.1518985438414; 
	Sun, 18 Feb 2018 12:23:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 18 Feb 2018 12:23:57 -0800 (PST)
In-Reply-To: <CA+chaQcw7brjMVnfxf5uC=O80y1-uPsiuVCNfRV1xkWdOqqT-A@mail.gmail.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
	<20180216115147.2869fdf2@seebsdell>
	<CA+chaQf=OMV60V7S=C6zaJ3sd_FwQkiojKY5EqAb6gTxXAQmXw@mail.gmail.com>
	<20180216132531.3a1c2398@seebsdell>
	<60cc88e3-577e-de47-e5da-b3cf93c74a2c@linux.intel.com>
	<CA+chaQdGobLWVzZ_YSpdWozrF3ZrYzBNAVusUMFgGFbAX+w90w@mail.gmail.com>
	<CA+chaQeNhb=nPaYz3XZdh_ceQopFKJvEq5Ximu83PykTjoHJWA@mail.gmail.com>
	<bb8be581-a074-b05b-86c6-71e1ee19fdfa@linux.intel.com>
	<20180217141701.229759cf@seebsdell>
	<CA+chaQcw7brjMVnfxf5uC=O80y1-uPsiuVCNfRV1xkWdOqqT-A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 Feb 2018 21:23:57 +0100
Message-ID: <CA+chaQckqaibky3je+w8O1AUxC3xWF+uZhSgi=JVmDT2b=SfjA@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Sun, 18 Feb 2018 20:23:58 -0000
Content-Type: multipart/alternative; boundary="f403045f54d879cd980565825b6d"

--f403045f54d879cd980565825b6d
Content-Type: text/plain; charset="UTF-8"

I've tried again with the change from Alex (without additional SRCREV bump)
on ubuntu-14.04

To make it simple I've triggered the build of just to recipes (which caused
"tried to close client 0 (highest is 1)" before:

$ bitbake tzdata update-rc.d
and again I quickly got:
23G     tzdata/2018c-r0/pseudo/
24G     update-rc.d/0.7-r5/pseudo/

There is nothing special in the pseudo.log before this "tried to close
client 0 (highest is 1)"
==> tzdata/2018c-r0/pseudo/pseudo.log <==
debug_logfile: fd 2
pid 8489 [parent 8484], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 8484.
tried to close client 0 (highest is 1)
tried to close client 0 (highest is 1)

==> update-rc.d/0.7-r5/pseudo/pseudo.log <==
debug_logfile: fd 2
pid 8488 [parent 8481], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 8481.
tried to close client 0 (highest is 1)
tried to close client 0 (highest is 1)

And there is actually nothing else after those 3 lines at the beginning
until I've killed the bitbake build (which didn't kill pseudo itself) and
then killed both pseudo processes - which resulted with left-over
bitbake-worker starting 2 new pseudo processes which kept spamming "tried
to close client 0 (highest is 1)" after initial setup:

$grep -v "^tried to close client 0 (highest is 1)$" */*/pseudo/pseudo.log
tzdata/2018c-r0/pseudo/pseudo.log:debug_logfile: fd 2
tzdata/2018c-r0/pseudo/pseudo.log:pid 8489 [parent 8484], doing new pid
setup and server start
tzdata/2018c-r0/pseudo/pseudo.log:Setup complete, sending SIGUSR1 to pid
8484.
tzdata/2018c-r0/pseudo/pseudo.log:Received signal 15, quitting.
tzdata/2018c-r0/pseudo/pseudo.log:db cleanup for server shutdown,
19:10:01.424
tzdata/2018c-r0/pseudo/pseudo.log:memory-to-file backup complete,
19:10:01.436.
tzdata/2018c-r0/pseudo/pseudo.log:db cleanup finished, 19:10:01.436
tzdata/2018c-r0/pseudo/pseudo.log:debug_logfile: fd 2
tzdata/2018c-r0/pseudo/pseudo.log:pid 11205 [parent 11199], doing new pid
setup and server start
tzdata/2018c-r0/pseudo/pseudo.log:Setup complete, sending SIGUSR1 to pid
11199.
update-rc.d/0.7-r5/pseudo/pseudo.log:debug_logfile: fd 2
update-rc.d/0.7-r5/pseudo/pseudo.log:pid 8488 [parent 8481], doing new pid
setup and server start
update-rc.d/0.7-r5/pseudo/pseudo.log:Setup complete, sending SIGUSR1 to pid
8481.
update-rc.d/0.7-r5/pseudo/pseudo.log:Received signal 15, quitting.
update-rc.d/0.7-r5/pseudo/pseudo.log:db cleanup for server shutdown,
19:10:01.423
update-rc.d/0.7-r5/pseudo/pseudo.log:memory-to-file backup complete,
19:10:01.436.
update-rc.d/0.7-r5/pseudo/pseudo.log:db cleanup finished, 19:10:01.436
update-rc.d/0.7-r5/pseudo/pseudo.log:debug_logfile: fd 2
update-rc.d/0.7-r5/pseudo/pseudo.log:pid 11212 [parent 11200], doing new
pid setup and server start
update-rc.d/0.7-r5/pseudo/pseudo.log:Setup complete, sending SIGUSR1 to pid
11200.

$ du -hs */*/pseudo/
28G     tzdata/2018c-r0/pseudo/
28G     update-rc.d/0.7-r5/pseudo/

Without --enable-epoll in pseudo.inc tzdata built fine and pseudo.log is
very short:
debug_logfile: fd 2
pid 14630 [parent 14629], doing new pid setup and server start
14630: new pid: 14630 [pseudo]
14630: Setup complete, sending SIGUSR1 to pid 14629.
14630: path mismatch [2 links]: ino 282238092 db '/run/shm/sem.mp-yluz7s8j'
req '/run/shm/sem.5mP74h'.
14630: db cleanup for server shutdown, 20:19:27.475
14630: memory-to-file backup complete, 20:19:27.475.
14630: db cleanup finished, 20:19:27.475

Shouldn't PSEUDO_DEBUG=4 in the environment generate a bit more verbose log?

I've also tried to add it in FAKEROOTENV (because pseudo seems to lock up
before run.do_install is executed, so the export there probably didn't
happen soon enough, but then even when it worked without --enable-epoll the
log wasn't any bigger).

meta/conf/bitbake.conf:export PSEUDO_DEBUG = "4"
meta/conf/bitbake.conf:FAKEROOTBASEENV =
"PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native}
PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib
PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_DISABLED=1
PSEUDO_DEBUG=4"
meta/conf/bitbake.conf:FAKEROOTENV =
"PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native}
PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD}
PSEUDO_NOSYMLINKEXP=1 PSEUDO_DEBUG=4 PSEUDO_DISABLED=0"

Regards,

On Sun, Feb 18, 2018 at 12:43 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> The do_install tasks failing with exit code '134'/SIGABRT were caused by
> left over pseudo processes from previous builds still holding the
> pseudo.lock.
>
> Manually killing those (still spinning at around 90% CPU for last 2 days)
> resolved the do_install failures.
>
> It also explains the lack of log.do_install files, because do_install
> failed before it even properly started.
>
> Regards,
>
> On Sat, Feb 17, 2018 at 9:17 PM, Seebs <seebs@seebs.net> wrote:
>
>> On Sat, 17 Feb 2018 15:28:55 +0200
>> Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:
>>
>> > For me, with epoll enabled:
>> >
>> > b6a015a works
>> > 23f089f and 26e30fa both lock up
>>
>> Huh. It's possible that the initial "don't try to close fd 0" was
>> correct, and the real problem is that the attempt is getting made
>> mistakenly. I'll study that more; the epoll code was a contribution and
>> I may not have fully understood it.
>>
>> -s
>>
>
>

--f403045f54d879cd980565825b6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve tried again with the change from Alex (witho=
ut additional SRCREV bump) on ubuntu-14.04</div><div><br></div><div>To make=
 it simple I&#39;ve triggered the build of just to recipes (which caused &q=
uot;tried to close client 0 (highest is 1)&quot; before:</div><div><br></di=
v>$ bitbake tzdata update-rc.d<br><div>and again I quickly got:</div><div><=
div>23G=C2=A0 =C2=A0 =C2=A0tzdata/2018c-r0/pseudo/</div><div>24G=C2=A0 =C2=
=A0 =C2=A0update-rc.d/0.7-r5/pseudo/</div></div><div><br></div><div>There i=
s nothing special in the pseudo.log before this=C2=A0<span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&quot;tried to close client 0 (highest is 1)&quot;</span></div><div><di=
v>=3D=3D&gt; tzdata/2018c-r0/pseudo/pseudo.log &lt;=3D=3D</div><div>debug_l=
ogfile: fd 2</div><div>pid 8489 [parent 8484], doing new pid setup and serv=
er start</div><div>Setup complete, sending SIGUSR1 to pid 8484.</div><div>t=
ried to close client 0 (highest is 1)</div><div>tried to close client 0 (hi=
ghest is 1)</div><div><br></div><div>=3D=3D&gt; update-rc.d/0.7-r5/pseudo/p=
seudo.log &lt;=3D=3D</div><div>debug_logfile: fd 2</div><div>pid 8488 [pare=
nt 8481], doing new pid setup and server start</div><div>Setup complete, se=
nding SIGUSR1 to pid 8481.</div><div>tried to close client 0 (highest is 1)=
</div><div>tried to close client 0 (highest is 1)</div></div><div><br></div=
><div>And there is actually nothing else after those 3 lines at the beginni=
ng until I&#39;ve killed the bitbake build (which didn&#39;t kill pseudo it=
self) and then killed both pseudo processes - which resulted with left-over=
 bitbake-worker starting 2 new pseudo processes which kept spamming &quot;<=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sm=
all;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">tried to close client 0 (highest is 1)&quot; after=
 initial setup:</span></div><div><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline"><br></span></div=
><div>$grep -v &quot;^tried to close client 0 (highest is 1)$&quot; */*/pse=
udo/pseudo.log<br></div><div><div>tzdata/2018c-r0/pseudo/pseudo.log:debug_l=
ogfile: fd 2</div><div>tzdata/2018c-r0/pseudo/pseudo.log:pid 8489 [parent 8=
484], doing new pid setup and server start</div><div>tzdata/2018c-r0/pseudo=
/pseudo.log:Setup complete, sending SIGUSR1 to pid 8484.</div><div>tzdata/2=
018c-r0/pseudo/pseudo.log:Received signal 15, quitting.</div><div>tzdata/20=
18c-r0/pseudo/pseudo.log:db cleanup for server shutdown, 19:10:01.424</div>=
<div>tzdata/2018c-r0/pseudo/pseudo.log:memory-to-file backup complete, 19:1=
0:01.436.</div><div>tzdata/2018c-r0/pseudo/pseudo.log:db cleanup finished, =
19:10:01.436</div><div>tzdata/2018c-r0/pseudo/pseudo.log:debug_logfile: fd =
2</div><div>tzdata/2018c-r0/pseudo/pseudo.log:pid 11205 [parent 11199], doi=
ng new pid setup and server start</div><div>tzdata/2018c-r0/pseudo/pseudo.l=
og:Setup complete, sending SIGUSR1 to pid 11199.</div><div>update-rc.d/0.7-=
r5/pseudo/pseudo.log:debug_logfile: fd 2</div><div>update-rc.d/0.7-r5/pseud=
o/pseudo.log:pid 8488 [parent 8481], doing new pid setup and server start</=
div><div>update-rc.d/0.7-r5/pseudo/pseudo.log:Setup complete, sending SIGUS=
R1 to pid 8481.</div><div>update-rc.d/0.7-r5/pseudo/pseudo.log:Received sig=
nal 15, quitting.</div><div>update-rc.d/0.7-r5/pseudo/pseudo.log:db cleanup=
 for server shutdown, 19:10:01.423</div><div>update-rc.d/0.7-r5/pseudo/pseu=
do.log:memory-to-file backup complete, 19:10:01.436.</div><div>update-rc.d/=
0.7-r5/pseudo/pseudo.log:db cleanup finished, 19:10:01.436</div><div>update=
-rc.d/0.7-r5/pseudo/pseudo.log:debug_logfile: fd 2</div><div>update-rc.d/0.=
7-r5/pseudo/pseudo.log:pid 11212 [parent 11200], doing new pid setup and se=
rver start</div><div>update-rc.d/0.7-r5/pseudo/pseudo.log:Setup complete, s=
ending SIGUSR1 to pid 11200.</div></div><div><br></div><div><div>$ du -hs *=
/*/pseudo/</div><div>28G=C2=A0 =C2=A0 =C2=A0tzdata/2018c-r0/pseudo/</div><d=
iv>28G=C2=A0 =C2=A0 =C2=A0update-rc.d/0.7-r5/pseudo/</div></div><div><br></=
div><div>Without --enable-epoll in pseudo.inc tzdata built fine and pseudo.=
log is very short:</div><div><div>debug_logfile: fd 2</div><div>pid 14630 [=
parent 14629], doing new pid setup and server start</div><div>14630: new pi=
d: 14630 [pseudo]</div><div>14630: Setup complete, sending SIGUSR1 to pid 1=
4629.</div><div>14630: path mismatch [2 links]: ino 282238092 db &#39;/run/=
shm/sem.mp-yluz7s8j&#39; req &#39;/run/shm/sem.5mP74h&#39;.</div><div>14630=
: db cleanup for server shutdown, 20:19:27.475</div><div>14630: memory-to-f=
ile backup complete, 20:19:27.475.</div><div>14630: db cleanup finished, 20=
:19:27.475</div></div><div><br></div><div>Shouldn&#39;t PSEUDO_DEBUG=3D4 in=
 the environment generate a bit more verbose log?</div><div><br></div><div>=
I&#39;ve also tried to add it in=C2=A0<span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">FAKEROOTENV=
 (because pseudo seems to lock up before run.do_install is executed, so the=
 export there probably didn&#39;t happen soon enough, but then even when it=
 worked without --enable-epoll the log wasn&#39;t any bigger).</span></div>=
<div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-s=
ize:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline"><br></span></div><div><div>meta/conf/bitbake=
.conf:export PSEUDO_DEBUG =3D &quot;4&quot;</div><div>meta/conf/bitbake.con=
f:FAKEROOTBASEENV =3D &quot;PSEUDO_BINDIR=3D${PSEUDO_SYSROOT}${bindir_nativ=
e} PSEUDO_LIBDIR=3D${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_=
PREFIX=3D${PSEUDO_SYSROOT}${prefix_native} PSEUDO_DISABLED=3D1 PSEUDO_DEBUG=
=3D4&quot;</div><div>meta/conf/bitbake.conf:FAKEROOTENV =3D &quot;PSEUDO_PR=
EFIX=3D${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=3D${PSEUDO_LO=
CALSTATEDIR} PSEUDO_PASSWD=3D${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=3D1 PSEUD=
O_DEBUG=3D4 PSEUDO_DISABLED=3D0&quot;</div></div><div><br></div><div>Regard=
s,</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Sun, Feb 18, 2018 at 12:43 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">The do_install tasks failing=C2=A0with exit code =
&#39;134&#39;/SIGABRT were caused by left over pseudo processes from previo=
us builds still holding the pseudo.lock.</span><br><div><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text=
-decoration-style:initial;text-decoration-color:initial;float:none;display:=
inline"><br></span></div><div>Manually killing those (still spinning at aro=
und 90% CPU for last 2 days) resolved the do_install failures.</div><div><b=
r></div><div>It also explains the lack of log.do_install files, because do_=
install failed before it even properly started.</div><div><br></div><div>Re=
gards,</div></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Sat, Feb 17, 2018 at 9:17 PM, S=
eebs <span dir=3D"ltr">&lt;<a href=3D"mailto:seebs@seebs.net" target=3D"_bl=
ank">seebs@seebs.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><span>On Sat, 17 Feb 2018 15:28:55 +0200<br>
Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" =
target=3D"_blank">alexander.kanavin@linux.intel<wbr>.com</a>&gt; wrote:<br>
<br>
&gt; For me, with epoll enabled:<br>
&gt;<br>
&gt; b6a015a works<br>
&gt; 23f089f and 26e30fa both lock up<br>
<br>
</span>Huh. It&#39;s possible that the initial &quot;don&#39;t try to close=
 fd 0&quot; was<br>
correct, and the real problem is that the attempt is getting made<br>
mistakenly. I&#39;ll study that more; the epoll code was a contribution and=
<br>
I may not have fully understood it.<br>
<span class=3D"m_-3203429403165069772HOEnZb"><font color=3D"#888888"><br>
-s<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--f403045f54d879cd980565825b6d--
