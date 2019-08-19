Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
	[209.85.217.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF5C7F1BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 14:42:01 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id q188so1330379vsa.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SwY6UIATVZwa6dsW1wgHea72jQ8xlvvsQfuKgVIklTw=;
	b=WKMcqFHuYNmsmfUoC8KsRsQ7qMa9XO8I2EZE15lbCeTzyHC4LcAULShn9Uwym2XEJF
	SdLEzopTbj5IU1L4THglkVkpQpKmDR4Xl5QhFerYymqk6fHvDVhBKx6ug4hccGSw1Vyh
	Mbh0YfpHuU0plvM7UH5VOrd4Mw6CXuWmv6xp30qPGDf2cPhAYdI0wAYbBveyIbVJw0s1
	Muuig6fEQnBu0p9Wag6/6ijdIFt+gHEkPDPff80uKUd48BoVsZGp5kOmumBHoxeTJ7TO
	BmdTtZYJ26s2nZJHzBVDYBFWp6p2dIu6qD5q07s3NImgU/3uTy3e9laeVWZe1xTAtG8N
	q6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SwY6UIATVZwa6dsW1wgHea72jQ8xlvvsQfuKgVIklTw=;
	b=V/6PUU/dUHDIRVMw/9zwLKQuGqLS9QYLq883Lw1zVznfRIbAb770+7gzls3T9yRC8K
	P5hn0/te9RqaBDD8dFAvi7V+Tioq0LNd895JSZOkmspsjvMV3+futQ8SobvSzQKefG1+
	gqHfqmcWYMM12XuuJ6+adyo/V7BFN5G2Z25NdWOYZXT+zM8QNNGq3et1alK585MpJlfY
	E7g/Mfrc/NulcjCOyLKN/gTI8M9WempDVWUYMGhfj4ZApSxYM4m6DRXmbDm0aXoglCX0
	pwiDgZRPNRgToXc2ouAzkV8rInof1Q7yShdKwGUoZ0z5W3VP7VBEAzUKhLHzP2ZXy8W0
	2sow==
X-Gm-Message-State: APjAAAXwglcPAOlC5YhDkSUQvei9hs5VUuoFDBZMLpEOc7jHSPfiYi1P
	QAWe6o/D8wSgXeYayT7rVE6AiSyYvSsf4bqnZ6o=
X-Google-Smtp-Source: APXvYqzOMQc5f4IbfI52JtCmfDBRcRU88gDTuFwerxUVsNJLVZQvKaMsXi5Q8hypUg4Tz8F8xYj1Ymtphl+3Wu6fl40=
X-Received: by 2002:a67:1c87:: with SMTP id c129mr1064750vsc.23.1566225722256; 
	Mon, 19 Aug 2019 07:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
	<0ff6e267-1659-ea55-cfc9-ce07da934511@windriver.com>
In-Reply-To: <0ff6e267-1659-ea55-cfc9-ce07da934511@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2019 16:41:51 +0200
Message-ID: <CANNYZj_BxAjV=8OQ+95tk2+KnmJoXKVa71Agk4o5uKzYDraP0A@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: decreasing default RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Mon, 19 Aug 2019 14:42:01 -0000
Content-Type: multipart/alternative; boundary="000000000000d0392f059079579a"

--000000000000d0392f059079579a
Content-Type: text/plain; charset="UTF-8"

Probably in this case it is better to add a patch that allows
HIGH_RLIMIT_NOFILE to be configured from the systemd recipe via meson
switches, and offer that to systemd upstream.

Alex

On Mon, 19 Aug 2019 at 16:25, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> On 8/19/19 10:01 PM, Alexander Kanavin wrote:
>
> Should the limit be simply raised? The 256M setup is crumbling on several
> fronts (runtime tests, modernisation of X, various non-x86 qemu targets).
> Adding per-image/target exceptions, custom non-upstreamable patches, or
> sticking to deprecated configurations isn't the right thing to do, I think.
>
> The modification of set default RLIMIT_NOFILE(4k) just keeps sync with the
> one in sysvinit,
>
> if the fronts you mentioned are working fine on sysvinit, I think it
> should be OK on systemd
>
> but whether it has side effect or not still depends on the result of image
> test
>
>
> The fix is trying to fix the blocking issue while switching init manager
> from sysvinit to systemd for poky
>
>
> Hi RP,
>
> Should we make HIGH_RLIMIT_NOFILE configurable from local.conf?
>
> Then we could modify it according to the requirement, such as set it to 4k
> at image test
>
> //Hongxu
>
>
> Alex
>
> On Mon, 19 Aug 2019 at 15:34, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
>> Since do_testimage for core-image-sato-sdk has memory limitation (256Mib)
>> which caused rpc.statd failed with out of memory.
>> [  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or
>> sacrifice child
>>
>> The rpc.statd allocates memory according to RLIMIT_NOFILE,
>> so decrease it to 4k to keep sync with sysvinit
>>
>> After applying the patch, the memory cost is the same with sysvinit
>> rpcuser    340  0.0  1.0   3212  2588 ?        Ss   13:20   0:00
>> /usr/sbin/rpc.statd -F
>> root       473  0.0  0.2   3464   496 ?        Ss   13:23   0:00
>> /usr/sbin/rpc.mountd
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  ...0001-decreasing-the-default-RLIMIT_NOFILE.patch | 35
>> ++++++++++++++++++++++
>>  meta/recipes-core/systemd/systemd_242.bb           |  4 +++
>>  2 files changed, 39 insertions(+)
>>  create mode 100644
>> meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
>>
>> diff --git
>> a/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
>> b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
>> new file mode 100644
>> index 0000000..fb8e2c9
>> --- /dev/null
>> +++
>> b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
>> @@ -0,0 +1,35 @@
>> +From 55c7196163e481c508fa708b9b8f5e7bf2d2f007 Mon Sep 17 00:00:00 2001
>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>> +Date: Mon, 19 Aug 2019 07:16:47 -0400
>> +Subject: [PATCH] decreasing the default RLIMIT_NOFILE
>> +
>> +Since do_testimage for core-image-sato-sdk has memory limits (256Mib)
>> +which caused rpc.statd failed with out of memory.
>> +[  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or
>> sacrifice child
>> +
>> +The rpc.statd allocates memory according to RLIMIT_NOFILE,
>> +so decrease it to 4k which keep sync with sysvinit
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + meson.build | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index 18a7cc5..e30894b 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -79,7 +79,7 @@ conf.set10('HAVE_SYSV_COMPAT', sysvinit_path != '' and
>> sysvrcnd_path != '',
>> +
>> + conf.set10('BUMP_PROC_SYS_FS_FILE_MAX',
>> get_option('bump-proc-sys-fs-file-max'))
>> + conf.set10('BUMP_PROC_SYS_FS_NR_OPEN',
>> get_option('bump-proc-sys-fs-nr-open'))
>> +-conf.set('HIGH_RLIMIT_NOFILE',          512*1024)
>> ++conf.set('HIGH_RLIMIT_NOFILE',          4*1024)
>> +
>> + # join_paths ignores the preceding arguments if an absolute component is
>> + # encountered, so this should canonicalize various paths when they are
>> +--
>> +2.8.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd_242.bb
>> b/meta/recipes-core/systemd/systemd_242.bb
>> index 1953fef..ab15ad2 100644
>> --- a/meta/recipes-core/systemd/systemd_242.bb
>> +++ b/meta/recipes-core/systemd/systemd_242.bb
>> @@ -58,6 +58,10 @@ SRC_URI_MUSL = "
>> file://0001-Use-getenv-when-secure-versions-are-not-available.pa
>>                 file://0001-do-not-disable-buffer-in-writing-files.patch
>> \
>>                 "
>>
>> +SRC_URI_append_qemuall = " \
>> +               file://0001-decreasing-the-default-RLIMIT_NOFILE.patch \
>> +"
>> +
>>  PAM_PLUGINS = " \
>>      pam-plugin-unix \
>>      pam-plugin-loginuid \
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--000000000000d0392f059079579a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Probably in this case it is better to add a patch tha=
t allows HIGH_RLIMIT_NOFILE to be configured from the systemd recipe via me=
son switches, and offer that to systemd upstream.</div><div><br></div><div>=
Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 19 Aug 2019 at 16:25, Hongxu Jia &lt;<a href=3D"mai=
lto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <div class=3D"gmail-m_-7060366043772446825moz-cite-prefix">On 8/19/19 1=
0:01 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Should the limit be simply raised? The 256M setup is
          crumbling on several fronts (runtime tests, modernisation of
          X, various non-x86 qemu targets). Adding per-image/target
          exceptions, custom non-upstreamable patches, or sticking to
          deprecated configurations isn&#39;t the right thing to do, I
          think.<br>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <p>The modification of set default RLIMIT_NOFILE(4k) just keeps sync
      with the one in sysvinit,</p>
    <p>if the fronts you mentioned are working fine on sysvinit, I think
      it should be OK on systemd<br>
    </p>
    <p>but whether it has side effect or not still depends on the result
      of image test</p>
    <p><br>
    </p>
    <p>The fix is trying to fix the blocking issue while switching init
      manager from sysvinit to systemd for poky</p>
    <p><br>
    </p>
    <p>Hi RP,</p>
    <p>Should we make HIGH_RLIMIT_NOFILE configurable from local.conf?</p>
    <p>Then we could modify it according to the requirement, such as set
      it to 4k at image test <br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19 Aug 2019 at 15:34,
          Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=
=3D"_blank">hongxu.jia@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Since
          do_testimage for core-image-sato-sdk has memory limitation
          (256Mib)<br>
          which caused rpc.statd failed with out of memory.<br>
          [=C2=A0 531.306146] Out of memory: Kill process 193 (rpc.statd)
          score 200 or sacrifice child<br>
          <br>
          The rpc.statd allocates memory according to RLIMIT_NOFILE,<br>
          so decrease it to 4k to keep sync with sysvinit<br>
          <br>
          After applying the patch, the memory cost is the same with
          sysvinit<br>
          rpcuser=C2=A0 =C2=A0 340=C2=A0 0.0=C2=A0 1.0=C2=A0 =C2=A03212=C2=
=A0 2588 ?=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ss=C2=A0 =C2=A013:20=C2=A0
          =C2=A00:00 /usr/sbin/rpc.statd -F<br>
          root=C2=A0 =C2=A0 =C2=A0 =C2=A0473=C2=A0 0.0=C2=A0 0.2=C2=A0 =C2=
=A03464=C2=A0 =C2=A0496 ?=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ss=C2=A0 =C2=A013:23=
=C2=A0
          =C2=A00:00 /usr/sbin/rpc.mountd<br>
          <br>
          Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windri=
ver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
          ---<br>
          =C2=A0...0001-decreasing-the-default-RLIMIT_NOFILE.patch | 35
          ++++++++++++++++++++++<br>
          =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a>=C2=A0
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +++<br>
          =C2=A02 files changed, 39 insertions(+)<br>
          =C2=A0create mode 100644
meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE=
.patch<br>
          <br>
          diff --git
a/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFI=
LE.patch
b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFI=
LE.patch<br>
          new file mode 100644<br>
          index 0000000..fb8e2c9<br>
          --- /dev/null<br>
          +++
b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFI=
LE.patch<br>
          @@ -0,0 +1,35 @@<br>
          +From 55c7196163e481c508fa708b9b8f5e7bf2d2f007 Mon Sep 17
          00:00:00 2001<br>
          +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com"=
 target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
          +Date: Mon, 19 Aug 2019 07:16:47 -0400<br>
          +Subject: [PATCH] decreasing the default RLIMIT_NOFILE<br>
          +<br>
          +Since do_testimage for core-image-sato-sdk has memory limits
          (256Mib)<br>
          +which caused rpc.statd failed with out of memory.<br>
          +[=C2=A0 531.306146] Out of memory: Kill process 193 (rpc.statd)
          score 200 or sacrifice child<br>
          +<br>
          +The rpc.statd allocates memory according to RLIMIT_NOFILE,<br>
          +so decrease it to 4k which keep sync with sysvinit<br>
          +<br>
          +Upstream-Status: Inappropriate [oe specific]<br>
          +<br>
          +Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windr=
iver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
          +---<br>
          + meson.build | 2 +-<br>
          + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
          +<br>
          +diff --git a/meson.build b/meson.build<br>
          +index 18a7cc5..e30894b 100644<br>
          +--- a/meson.build<br>
          ++++ b/meson.build<br>
          +@@ -79,7 +79,7 @@ conf.set10(&#39;HAVE_SYSV_COMPAT&#39;,
          sysvinit_path !=3D &#39;&#39; and sysvrcnd_path !=3D &#39;&#39;,<=
br>
          + <br>
          + conf.set10(&#39;BUMP_PROC_SYS_FS_FILE_MAX&#39;,
          get_option(&#39;bump-proc-sys-fs-file-max&#39;))<br>
          + conf.set10(&#39;BUMP_PROC_SYS_FS_NR_OPEN&#39;,=C2=A0
          get_option(&#39;bump-proc-sys-fs-nr-open&#39;))<br>
          +-conf.set(&#39;HIGH_RLIMIT_NOFILE&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 512*1024)<br>
          ++conf.set(&#39;HIGH_RLIMIT_NOFILE&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 4*1024)<br>
          + <br>
          + # join_paths ignores the preceding arguments if an absolute
          component is<br>
          + # encountered, so this should canonicalize various paths
          when they are<br>
          +-- <br>
          +2.8.1<br>
          +<br>
          diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_=
242.bb" rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a>
          b/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_242.bb</a><br>
          index 1953fef..ab15ad2 100644<br>
          --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a><br>
          +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a><br>
          @@ -58,6 +58,10 @@ SRC_URI_MUSL =3D
          &quot;<a class=3D"gmail-m_-7060366043772446825moz-txt-link-freete=
xt">file://0001-Use-getenv-when-secure-versions-are-not</a>-<a href=3D"http=
://available.pa" target=3D"_blank">available.pa</a><br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          <a class=3D"gmail-m_-7060366043772446825moz-txt-link-freetext">fi=
le://0001-do-not-disable-buffer-in-writing-files.patch</a> \<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br=
>
          <br>
          +SRC_URI_append_qemuall =3D &quot; \<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          =C2=A0<a class=3D"gmail-m_-7060366043772446825moz-txt-link-freete=
xt">file://0001-decreasing-the-default-RLIMIT_NOFILE.patch</a> \<br>
          +&quot;<br>
          +<br>
          =C2=A0PAM_PLUGINS =3D &quot; \<br>
          =C2=A0 =C2=A0 =C2=A0pam-plugin-unix \<br>
          =C2=A0 =C2=A0 =C2=A0pam-plugin-loginuid \<br>
          -- <br>
          2.8.1<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
          <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div>

--000000000000d0392f059079579a--
