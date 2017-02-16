Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id B082871A9D;
	Thu, 16 Feb 2017 22:08:26 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id l19so15229660ywc.2;
	Thu, 16 Feb 2017 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=gAOc40eqiDx251WrOZ5AhyqA99o2CAycUsCEoqTYf8s=;
	b=dpA7nkk/+FqkCjWa28sD7p8F1mxPhP3zaqp7Jepo7YOm4MTBD5m3RZBKS1WPwlVWWJ
	fVELqrUfgy3nAqBV+gdf/K4FJXXh/hECIBhbhh6h8fg/HIzfqeDGG5kPGvu8rwVgYJi6
	EH6J3MHgiqIjNUNLXij9E0DcsdwDpLqwL3w4JOYeeb2VrSfhbEbz/eeU94UYzPqP/Myu
	E0tFhaLQMuy8kB9OkPIwczHjiIoB/FSY50BSxmYz2PV5ERUTVvDSdT5Hzos77zblZmSG
	a0/W6T0+CAZC55JjAHS/B4+OMxRI/F2IN8uQTPi6s7UiQ/g7fUzLZq2zWrl7JnUalnV+
	awcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=gAOc40eqiDx251WrOZ5AhyqA99o2CAycUsCEoqTYf8s=;
	b=KM4ETaxv+WCKDqisZw4JVXWi5RdZBx2hJ8TEh2AeQoNLL7FxJYUCun/qISxGZLzCRo
	+l72D7qcgp5Hh5Vt6praAXehxMei/H2gieFgTdTUlcd3g2mPaqNMUfR35wMM6I8bBan8
	/UQDuJXlxazKd13C9zNhoAqsIcpPa+IXNN8IhdwQOINngbuZv5WEZi2ZCofR/pd4c5nk
	E85e13DDpUpHZNpE5lC23JTXG4LxGAyw3JqtNvVCr+SBFHL88F7WN3YispHQUIhKfPCJ
	x/GPBzjn3hge7CyRAPTbAkOWNI60VyI7cIC3mADuwjb0eRRl8wNRoT+qNkCucl4DdfLj
	+/2w==
X-Gm-Message-State: AMke39nprN8iGL5CDG6fEmuPdaQRlyTsqDQyHnJ0seL4/hXsWb/xOstk9CHX4WoldE1ucTn6kGn7NwXSDPEJXQ==
X-Received: by 10.129.158.78 with SMTP id v75mr3419748ywg.5.1487282906320;
	Thu, 16 Feb 2017 14:08:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.83.68.39 with HTTP; Thu, 16 Feb 2017 14:08:25 -0800 (PST)
In-Reply-To: <20170216124415.GC3621@jama>
References: <20170216124415.GC3621@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Feb 2017 23:08:25 +0100
Message-ID: <CA+chaQe=BDKT49-jnDzsTObntQ-wte4J4cmBcdjmBxUq2_XZYA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-02-14
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
X-List-Received-Date: Thu, 16 Feb 2017 22:08:27 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b8a7a4ff24f0548ad0977

--94eb2c0b8a7a4ff24f0548ad0977
Content-Type: text/plain; charset=UTF-8

There are 2 more issues in oe-core once I enable ptest (together with
already enabled gold):

oe-core/meta/recipes-support/apr/apr_1.5.2.bb:do_compile_ptest_base

| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_init'
| ../.libs/libapr-1.so: error: undefined reference to
'pthread_mutexattr_settype'
| ../.libs/libapr-1.so: error: undefined reference to
'pthread_mutexattr_destroy'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutex_trylock'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_sigmask'
| ../.libs/libapr-1.so: error: undefined reference to
'pthread_attr_setstacksize'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_create'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_join'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_detach'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_once'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_create'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_getspecific'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_setspecific'
| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_delete'
| collect2: error: ld returned 1 exit status
| make[1]: *** [globalmutexchild] Error 1


oe-core/meta/recipes-extended/parted/parted_3.2.bb:do_compile_ptest_base

| ../libparted/fs/.libs/libparted-fs-resize.so: error: undefined
reference to 'uuid_generate'
| collect2: error: ld returned 1 exit status
| make: *** [fs-resize] Error 1


Once my morty builds are finished I'll try to reproduce this in
master, but I think I've seen this failure with ptest before yesterday
for master as well.


On Thu, Feb 16, 2017 at 1:44 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Another run with couple unblacklists
>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!colspan='6'|Failed depencencies                    !!|Signatures
>     !!colspan='12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64
> ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-stripped
>     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> ||version-going-backwards       ||host-user-contaminated
> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||
> |-
> ||2017-02-14    ||0     ||1     ||0     ||N/A   ||N/A   ||N/A   ||N/A
>  ||N/A   ||N/A   ||0     ||0             ||0             ||0
>  ||0             ||0             ||198           ||0             ||0
>      ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2017-02-14 ==
>
> INFO: jenkins-job.sh-1.8.17 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> report.20170214_164708.log
>
> === common () ===
>
> === common-x86 (0) ===
>
> === qemuarm (0) ===
>
> === qemux86 (1) ===
>     * meta-browser/recipes-browser/chromium/chromium-wayland_53.
> 0.2785.143.bb:do_compile
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (1) ===
> {| class=wikitable
> |-
> || qemuarm      || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemuarm.20170214_135645.log/ ||
> |-
> || qemux86      || 1     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86.20170214_135710.log/ ||
> http://errors.yoctoproject.org/Errors/Build/32480/
> |-
> || qemux86_64   || 0     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86-64.20170214_151408.log/ ||
> |}
>
> === PNBLACKLISTs (445) ===
>
> === QA issues (198) ===
> {| class=wikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||host-user-contaminated
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||textrel
> |-
> ||0     ||unknown-configure-option
> |-
> ||198   ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> signatures.20170214_151247.log/
>
> No issues detected
>

--94eb2c0b8a7a4ff24f0548ad0977
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There are 2 more issues in oe-core once I enable ptest (to=
gether with already enabled gold):<div><br></div><div><pre style=3D"color:r=
gb(0,0,0);word-wrap:break-word;white-space:pre-wrap">oe-core/meta/recipes-s=
upport/apr/apr_1.5.2.bb:do_compile_ptest_base</pre><pre style=3D"color:rgb(=
0,0,0);word-wrap:break-word;white-space:pre-wrap"><pre style=3D"word-wrap:b=
reak-word;white-space:pre-wrap">| ../.libs/libapr-1.so: error: undefined re=
ference to &#39;pthread_mutexattr_init&#39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_mutexatt=
r_settype&#39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_mutexatt=
r_destroy&#39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_mutex_tr=
ylock&#39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_sigmask&=
#39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_attr_set=
stacksize&#39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_create&#=
39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_join&#39=
;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_detach&#=
39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_once&#39=
;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_key_crea=
te&#39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_getspeci=
fic&#39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_setspeci=
fic&#39;
| ../.libs/libapr-1.so: error: undefined reference to &#39;pthread_key_dele=
te&#39;
| collect2: error: ld returned 1 exit status
| make[1]: *** [globalmutexchild] Error 1</pre><pre style=3D"word-wrap:brea=
k-word;white-space:pre-wrap"><br></pre><pre style=3D"word-wrap:break-word;w=
hite-space:pre-wrap">oe-core/meta/recipes-extended/parted/parted_3.2.bb:do_=
compile_ptest_base</pre><pre style=3D"word-wrap:break-word;white-space:pre-=
wrap">| ../libparted/fs/.libs/libparted-fs-resize.so: error: undefined refe=
rence to &#39;uuid_generate&#39;
| collect2: error: ld returned 1 exit status
| make: *** [fs-resize] Error 1</pre><pre style=3D"word-wrap:break-word;whi=
te-space:pre-wrap"><br></pre><pre style=3D"word-wrap:break-word;white-space=
:pre-wrap">Once my morty builds are finished I&#39;ll try to reproduce this=
 in master, but I think I&#39;ve seen this failure with ptest before yester=
day for master as well.</pre></pre></div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On Thu, Feb 16, 2017 at 1:44 PM, Martin Jansa=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"=
_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Another run with couple unblacklists<br>
<br>
=3D=3D Number of issues - stats =3D=3D<br>
{| class=3D&#39;wikitable&#39;<br>
!|Date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#=
39;3&#39;|Failed tasks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;6&#39;|Failed depencencies=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!|Signature=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!colspan=3D&#39;12&#39;|QA !!Co=
mment<br>
|-<br>
||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||qemuarm=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||qemux86=C2=A0 =C2=A0 =C2=A0 =C2=A0||qemux86_64=C2=A0 =C2=A0 =
||qemuarm||max||min=C2=A0 =C2=A0 =C2=A0||qemux86||max||min=C2=A0 =C2=A0 =C2=
=A0||all=C2=A0 =C2=A0||already-stripped=C2=A0 =C2=A0 =C2=A0 ||libdir=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ||textrel=C2=A0 =C2=A0 =C2=A0 =C2=A0||build-deps=C2=A0=
 =C2=A0 ||file-rdeps=C2=A0 =C2=A0 ||version-going-backwards=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||host-user-contaminated=C2=A0 =C2=A0 =C2=A0 =C2=A0 ||installe=
d-vs-shipped=C2=A0 ||unknown-configure-option=C2=A0 =C2=A0 =C2=A0 ||symlink=
-to-sysroot=C2=A0 =C2=A0 ||invalid-pkgconfig=C2=A0 =C2=A0 =C2=A0||pkgname=
=C2=A0 =C2=A0 =C2=A0 =C2=A0||<br>
|-<br>
||2017-02-14=C2=A0 =C2=A0 ||0=C2=A0 =C2=A0 =C2=A0||1=C2=A0 =C2=A0 =C2=A0||0=
=C2=A0 =C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0|=
|N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=
=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||198=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0||<br>
|}<br>
<br>
<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" rel=3D"no=
referrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/Bitbake_W=
orld_Status</a><br>
<br>
=3D=3D Failed tasks 2017-02-14 =3D=3D<br>
<br>
INFO: jenkins-job.sh-1.8.17 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170214_164708.log" r=
el=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildl=
ogs/oe/world/pyro/log.<wbr>report.20170214_164708.log</a><br>
<br>
=3D=3D=3D common () =3D=3D=3D<br>
<br>
=3D=3D=3D common-x86 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemuarm (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemux86 (1) =3D=3D=3D<br>
=C2=A0 =C2=A0 * meta-browser/recipes-browser/<wbr>chromium/chromium-wayland=
_53.<wbr>0.2785.143.bb:do_compile<br>
<br>
=3D=3D=3D qemux86_64 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D Number of failed tasks (1) =3D=3D=3D<br>
{| class=3Dwikitable<br>
|-<br>
|| qemuarm=C2=A0 =C2=A0 =C2=A0 || 0=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170214_13=
5645.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org=
/<wbr>buildlogs/oe/world/pyro/log.<wbr>world.qemuarm.20170214_135645.<wbr>l=
og/</a> ||<br>
|-<br>
|| qemux86=C2=A0 =C2=A0 =C2=A0 || 1=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170214_13=
5710.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org=
/<wbr>buildlogs/oe/world/pyro/log.<wbr>world.qemux86.20170214_135710.<wbr>l=
og/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/32480/" r=
el=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Err=
ors/Build/32480/</a><br>
|-<br>
|| qemux86_64=C2=A0 =C2=A0|| 0=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170214_1514=
08.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/<=
wbr>buildlogs/oe/world/pyro/log.<wbr>world.qemux86-64.20170214_<wbr>151408.=
log/</a> ||<br>
|}<br>
<br>
=3D=3D=3D PNBLACKLISTs (445) =3D=3D=3D<br>
<br>
=3D=3D=3D QA issues (198) =3D=3D=3D<br>
{| class=3Dwikitable<br>
!| Count=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||Issue<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||already-stripped<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||build-deps<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||file-rdeps<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||host-user-contaminated<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||installed-vs-shipped<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||invalid-pkgconfig<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||libdir<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||pkgname<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||symlink-to-sysroot<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||textrel<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||unknown-configure-option<br>
|-<br>
||198=C2=A0 =C2=A0||version-going-backwards<br>
|}<br>
<br>
<br>
<br>
=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D<br>
<br>
Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.signatures.20170214_151247.log/" rel=3D"noreferrer" target=3D"_blank"=
>http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/pyro/log.<wbr>signatur=
es.20170214_151247.<wbr>log/</a><br>
<br>
No issues detected<br>
</blockquote></div><br></div>

--94eb2c0b8a7a4ff24f0548ad0977--
