Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 63C5D6BE2D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 16:13:38 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c15so7430316qkl.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 09:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ueZb66LA/v80wJNcUTUSxMXdu6xQlWQQu6/tDE3xt5U=;
	b=KL2K+EF39JMp2r2cKjHYjhOOsSAI+kH7z+r/WSB1J8Vta4PTMaRWsJW8zRdoHfQW7L
	Kq77X9nBoYRyp8iElZ4kLasMc8OgKyc3le3z+RSA90yXqmHOlRZt79/EE9yY1MwXq/LS
	bvYdl0owtuuT/bhkXV0n8TSkZ31VIyUdIBU2YYgajGiuHe7bF/VZEyOEGeJrdQg/Uk+3
	tecQI4ZGNcdBKtguwBOpnrnLjcQ+K8mp/jR/cTpW1p2Gitg1jOFyx/YZzX0rVESIpbX7
	+vOtYzJ5K562H2ykIaa5Iyr4+qbGpm43ipEcuOag1LNMoqewr+AYJylTsulYBbVbBu0k
	aK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ueZb66LA/v80wJNcUTUSxMXdu6xQlWQQu6/tDE3xt5U=;
	b=kL2bnL+5fyVBN3htcoiiG9Fgni5KzcFmJEqSV+9zxaYtCWlXlqa40G4LAyLhDkZjQm
	uxmbMtxNkv0lvTSLENCCh7YwmKdMbobHpBfVzNCn7pf9CTS9xNTSNkqDz0+fzSnW825c
	fYySrSsX7bLKHXsh+XXSAYCl9zlkbF2gV2vCDVPMCsBR7cLArTBAjiqQchyvf0r4VnG1
	7kEfvFdGgU2AL/UdyQOlHVwxr1TuQ7L60eXK7bo+I11BpSnQEbxZXg4i1l3Y5fo6y2u6
	54Lj75mD02KMBDQnYnS/FizN3RccwK3Jyx3D3dTx8RRAY+MuXJgVqRBn6c4CziSLws3G
	KDXA==
X-Gm-Message-State: APjAAAXD45rsOdDGyk8qqZodBAktxU3AUGuRTlm0f9WLVzmLoolN3mQm
	LjBdkNg7k8G6dk0UPCAfGe3s5KvS495dmBzVP6w=
X-Google-Smtp-Source: APXvYqyXxGxon1r2l/qXEGMWqVo2DTsx8HCHBHRKf9QQBUd6sXhVqw3SerD52E2FWIF3qV0BC1eu5cQjfBwSu/AqNGg=
X-Received: by 2002:a05:620a:14a1:: with SMTP id
	x1mr38504815qkj.312.1558282419109; 
	Sun, 19 May 2019 09:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-31-alex.kanavin@gmail.com>
	<07b946fc-bd26-fd7a-e4c4-1cbb782db4f1@gmail.com>
	<90586B6E-70A7-4F92-98F1-2D822116DE48@gmail.com>
In-Reply-To: <90586B6E-70A7-4F92-98F1-2D822116DE48@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 May 2019 09:13:28 -0700
Message-ID: <CAMKF1srea8B09zCaq1=sfLVQzSLSKgFs9xO27BHjEWLdWW6Mhw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 31/37] bash-completion: upgrade 2.8 -> 2.9
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
X-List-Received-Date: Sun, 19 May 2019 16:13:38 -0000
Content-Type: multipart/alternative; boundary="0000000000000d01db05893fe607"

--0000000000000d01db05893fe607
Content-Type: text/plain; charset="UTF-8"

On Sun, May 19, 2019 at 2:58 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Because the files are no longer included in bash-completion. They are
> provided only by util-linux now, previously they were provided by both.


Thanks for explaining it would be good to note in commit secondly the
comment and variable i seems to be redundant as well so please remove them
too

>
>
> Alex
>
> > On 19 May 2019, at 6.48, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> >> On 5/17/19 11:11 AM, Alexander Kanavin wrote:
> >> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> ---
> >>  .../{bash-completion_2.8.bb => bash-completion_2.9.bb}     | 7 ++-----
> >>  1 file changed, 2 insertions(+), 5 deletions(-)
> >>  rename meta/recipes-support/bash-completion/{bash-completion_2.8.bb
> => bash-completion_2.9.bb} (82%)
> >> diff --git a/meta/recipes-support/bash-completion/
> bash-completion_2.8.bb b/meta/recipes-support/bash-completion/
> bash-completion_2.9.bb
> >> similarity index 82%
> >> rename from meta/recipes-support/bash-completion/bash-completion_2.8.bb
> >> rename to meta/recipes-support/bash-completion/bash-completion_2.9.bb
> >> index 85064343e30..ce66ba5a2a8 100644
> >> --- a/meta/recipes-support/bash-completion/bash-completion_2.8.bb
> >> +++ b/meta/recipes-support/bash-completion/bash-completion_2.9.bb
> >> @@ -9,8 +9,8 @@ SECTION = "console/utils"
> >>    SRC_URI = "
> https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz
> "
> >>  -SRC_URI[md5sum] = "201b6ae62f7d5fb5b1b25e34427db919"
> >> -SRC_URI[sha256sum] =
> "c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d"
> >> +SRC_URI[md5sum] = "60139333b25c4d54ad40323b701be130"
> >> +SRC_URI[sha256sum] =
> "d48fe378e731062f479c5f8802ffa9d3c40a275a19e6e0f6f6cc4b90fa12b2f5"
> >>  UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
> >>  UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases
> "
> >>  @@ -25,9 +25,6 @@ do_install_append() {
> >>        # Delete files already provided by util-linux
> >>      local i
> >> -    for i in mount umount; do
> >> -        rm ${D}${datadir}/${BPN}/completions/$i
> >> -    done
> >
> > why is this deleted ?
> >
> >>  }
> >>    RDEPENDS_${PN} = "bash"
>

--0000000000000d01db05893fe607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 19, 2019 at 2:58 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Because the files are no longer inc=
luded in bash-completion. They are provided only by util-linux now, previou=
sly they were provided by both.</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Thanks for explaining it would be good to note in commit sec=
ondly the comment and variable i seems to be redundant as well so please re=
move them too=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Alex<br>
<br>
&gt; On 19 May 2019, at 6.48, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt; On 5/17/19 11:11 AM, Alexander Kanavin wrote:<br>
&gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../{<a href=3D"http://bash-completion_2.8.bb" rel=3D"norefe=
rrer" target=3D"_blank">bash-completion_2.8.bb</a> =3D&gt; <a href=3D"http:=
//bash-completion_2.9.bb" rel=3D"noreferrer" target=3D"_blank">bash-complet=
ion_2.9.bb</a>}=C2=A0 =C2=A0 =C2=A0| 7 ++-----<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 5 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta/recipes-support/bash-completion/{<a href=3D"http=
://bash-completion_2.8.bb" rel=3D"noreferrer" target=3D"_blank">bash-comple=
tion_2.8.bb</a> =3D&gt; <a href=3D"http://bash-completion_2.9.bb" rel=3D"no=
referrer" target=3D"_blank">bash-completion_2.9.bb</a>} (82%)<br>
&gt;&gt; diff --git a/meta/recipes-support/bash-completion/<a href=3D"http:=
//bash-completion_2.8.bb" rel=3D"noreferrer" target=3D"_blank">bash-complet=
ion_2.8.bb</a> b/meta/recipes-support/bash-completion/<a href=3D"http://bas=
h-completion_2.9.bb" rel=3D"noreferrer" target=3D"_blank">bash-completion_2=
.9.bb</a><br>
&gt;&gt; similarity index 82%<br>
&gt;&gt; rename from meta/recipes-support/bash-completion/<a href=3D"http:/=
/bash-completion_2.8.bb" rel=3D"noreferrer" target=3D"_blank">bash-completi=
on_2.8.bb</a><br>
&gt;&gt; rename to meta/recipes-support/bash-completion/<a href=3D"http://b=
ash-completion_2.9.bb" rel=3D"noreferrer" target=3D"_blank">bash-completion=
_2.9.bb</a><br>
&gt;&gt; index 85064343e30..ce66ba5a2a8 100644<br>
&gt;&gt; --- a/meta/recipes-support/bash-completion/<a href=3D"http://bash-=
completion_2.8.bb" rel=3D"noreferrer" target=3D"_blank">bash-completion_2.8=
.bb</a><br>
&gt;&gt; +++ b/meta/recipes-support/bash-completion/<a href=3D"http://bash-=
completion_2.9.bb" rel=3D"noreferrer" target=3D"_blank">bash-completion_2.9=
.bb</a><br>
&gt;&gt; @@ -9,8 +9,8 @@ SECTION =3D &quot;console/utils&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 SRC_URI =3D &quot;<a href=3D"https://github.com/scop/=
bash-completion/releases/download/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/scop/bash-completion/=
releases/download/${PV}/${BPN}-${PV}.tar.xz</a>&quot;<br>
&gt;&gt;=C2=A0 -SRC_URI[md5sum] =3D &quot;201b6ae62f7d5fb5b1b25e34427db919&=
quot;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;c01f5570f5698a0dda8dc9cfb2a83744daa1=
ec54758373a6e349bd903375f54d&quot;<br>
&gt;&gt; +SRC_URI[md5sum] =3D &quot;60139333b25c4d54ad40323b701be130&quot;<=
br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;d48fe378e731062f479c5f8802ffa9d3c40a=
275a19e6e0f6f6cc4b90fa12b2f5&quot;<br>
&gt;&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;bash-completion-(?P&lt;pver&g=
t;(?!2008).+)\.tar&quot;<br>
&gt;&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/s=
cop/bash-completion/releases" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/scop/bash-completion/releases</a>&quot;<br>
&gt;&gt;=C2=A0 @@ -25,9 +25,6 @@ do_install_append() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Delete files already provided by util=
-linux<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 local i<br>
&gt;&gt; -=C2=A0 =C2=A0 for i in mount umount; do<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${D}${datadir}/${BPN}/completions/=
$i<br>
&gt;&gt; -=C2=A0 =C2=A0 done<br>
&gt; <br>
&gt; why is this deleted ?<br>
&gt; <br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 RDEPENDS_${PN} =3D &quot;bash&quot;<br>
</blockquote></div></div>

--0000000000000d01db05893fe607--
