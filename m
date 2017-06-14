Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id C47006067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 23:26:22 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id q97so20949911wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 16:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9te5ZUJCbnS2YL1tSmb5CY5ZDc+NZh6OJSl0jnpM8Nc=;
	b=NPj+LTgL9r9C3GsuxVrtbUsCUjmscCulcO2JU3WC13um42TvDhJjp8XCVDAluon1LV
	hEeE3KR2lNr/73L/DObaywrVjUlRGk9ih8KuAw42tinbB3ZvDBR3sG2h50rb+6ukTDJm
	YuqVJ38bMP5A2XJ0jzpKQ8fXMjq4KxXfKn3DAy3WkCJ7cc8vjGo0YOl7VqHY22Hz6WlS
	Ppr35UIqevwVBZO5z+IgS70cmvu9U1AC6JGGGtLG6RF5Ia4FdKee13oPOW0YEjYMtND+
	QHRo8ftmxpbGCz22ZQTUYH+S1SohKGm8gKuSBp1bv3w0CjGcRy//IZ044grPZzLAJbKm
	ZKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9te5ZUJCbnS2YL1tSmb5CY5ZDc+NZh6OJSl0jnpM8Nc=;
	b=jheCvpTTZuOWv1fFZKwx5g9Ra+04FrkSHebwdZhb6Emq4s5ymLUIw3Y6VVNShC9s7N
	IUVi4yxGPgxr1nlXgQHDhfSXBv+Pv/1yOb2rLgel/mA11RTLVZt+FS+Hwe3J04hCXI7s
	mkg5ROAqy6A2jO92vRGDhMPhqI2OiJv4QMgQC1GE4okzMvRUbGbTeC4pXIZahupBley3
	cQmcg8g3SlTNqMwUkylr0+W4H+pU8jNXd+xm3/QbmRCGB39wCXD2QEVnhH6N2gdE3745
	UAYHr3qtZS9AvQQOD9SsZvn3yyhiu0sPmM/ds/aXDzb2GY4XgEwZbczSBSSRRKq6TFsN
	mo+w==
X-Gm-Message-State: AKS2vOxNU9E1NbUfhkvor8/paMY4+/ksQbSFK/1VoxcT7RNscoZ/IBe+
	RVQWCTTbxToNEqLs1xAavtOZSUeCjw==
X-Received: by 10.80.154.129 with SMTP id p1mr1426333edb.131.1497482782939;
	Wed, 14 Jun 2017 16:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1497453168.git.raj.khem@gmail.com>
	<cd2b720104f722dc81bf356e30df08c21f0e1dd9.1497453168.git.raj.khem@gmail.com>
	<CAJTo0LZd6whxWZnKGDD5dSsfCjj-+apjw=coaMnb_HEjmSX8kA@mail.gmail.com>
In-Reply-To: <CAJTo0LZd6whxWZnKGDD5dSsfCjj-+apjw=coaMnb_HEjmSX8kA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Jun 2017 23:26:11 +0000
Message-ID: <CAMKF1soj-+9HFr+m75JH9hh76bhEUmDUMUGKXk8ecF=DDcKT9Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/10] gcc-sanitizer: Fix build with glibc 2.26
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
X-List-Received-Date: Wed, 14 Jun 2017 23:26:25 -0000
Content-Type: multipart/alternative; boundary="f403045c277455a1700551f3e1d0"

--f403045c277455a1700551f3e1d0
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 14, 2017 at 3:47 PM Burton, Ross <ross.burton@intel.com> wrote:

>
> On 14 June 2017 at 16:23, Khem Raj <raj.khem@gmail.com> wrote:
>
>> sigaltstack is no more exposed by glibc see (bug 21517)
>> therefore adjust to use stack_t instead
>>
>> Use res_state typedef instead of referring to __res_state struct
>>
>
> Doesn't work against master:
>

this patch is not needed until glibc 2.26 so drop it

>
> | In file included from
> ../../../../../../../../../work-shared/gcc-7.1.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc:23:0:
> |
> ../../../../../../../../../work-shared/gcc-7.1.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux.h:24:8:
> error: using typedef-name 'stack_t' after 'struct'
> |  struct stack_t;
> |         ^~~~~~~
> | In file included from
> /data/poky-tmp/master/work/corei7-64-poky-linux/gcc-sanitizers/7.1.0-r0/recipe-sysroot/usr/include/signal.h:322:0,
> |                  from
> ../../../../../../../../../work-shared/gcc-7.1.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc:17:
> |
> /data/poky-tmp/master/work/corei7-64-poky-linux/gcc-sanitizers/7.1.0-r0/recipe-sysroot/usr/include/bits/sigstack.h:42:5:
> note: 'stack_t' has a previous declaration here
> |    } stack_t;
> |      ^~~~~~~
>
> Ross
>

--f403045c277455a1700551f3e1d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Jun 14, 2017 =
at 3:47 PM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.b=
urton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 14 June 2017 =
at 16:23, Khem Raj <span>&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
<div id=3D"m_3658003258099508807gmail-:1t9" class=3D"m_3658003258099508807g=
mail-a3s m_3658003258099508807gmail-aXjCH m_3658003258099508807gmail-m15ca7=
34d780f075f">sigaltstack is no more exposed by glibc see (bug 21517)<br>
therefore adjust to use stack_t instead<br>
<br>
Use res_state typedef instead of referring to __res_state struct<br></div><=
/blockquote></div><br></div></div><div><div class=3D"gmail_extra">Doesn&#39=
;t work against master:</div></div></blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">this patch is not needed until glibc 2.26 so drop it</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div><div class=3D"gmail_extra"></div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"g=
mail_extra">| In file included from ../../../../../../../../../work-shared/=
gcc-7.1.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcde=
p.cc:23:0:</div><div class=3D"gmail_extra">| ../../../../../../../../../wor=
k-shared/gcc-7.1.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_lin=
ux.h:24:8: error: using typedef-name &#39;stack_t&#39; after &#39;struct&#3=
9;</div><div class=3D"gmail_extra">| =C2=A0struct stack_t;</div><div class=
=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~</div><div class=3D"g=
mail_extra">| In file included from /data/poky-tmp/master/work/corei7-64-po=
ky-linux/gcc-sanitizers/7.1.0-r0/recipe-sysroot/usr/include/signal.h:322:0,=
</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from ../../../../../../../../../work-shared/gcc-7.1=
.0-r0/gcc-7.1.0/libsanitizer/sanitizer_common/sanitizer_linux_libcdep.cc:17=
:</div><div class=3D"gmail_extra">| /data/poky-tmp/master/work/corei7-64-po=
ky-linux/gcc-sanitizers/7.1.0-r0/recipe-sysroot/usr/include/bits/sigstack.h=
:42:5: note: &#39;stack_t&#39; has a previous declaration here</div><div cl=
ass=3D"gmail_extra">| =C2=A0 =C2=A0} stack_t;</div><div class=3D"gmail_extr=
a">| =C2=A0 =C2=A0 =C2=A0^~~~~~~</div></div></div><div><div class=3D"gmail_=
extra"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div></div></blockquote></div></div>

--f403045c277455a1700551f3e1d0--
