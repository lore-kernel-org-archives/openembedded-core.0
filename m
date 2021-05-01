Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.10464.1619892663485785752
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 May 2021 11:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pOM3I6Hr;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: jeanmarie.lemetayer@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 82so2171161yby.7
        for <openembedded-core@lists.openembedded.org>; Sat, 01 May 2021 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bAaupy8HQly8yCviqXS8t6kh8tv2Uo7yLw2EJiycudc=;
        b=pOM3I6HrMi9/v3xnORpa/CA3Mr5dT4nzZV3f0FCpWxRhf43MD6Y9EyWZjh69wvxX7y
         fe+vzxr7EqCIvsms5oAudeBDR83QNK+XXKSCpoP5a+G0tf+p9oLbyqtwPtnQIW4fJw20
         uKDCOL/BqhQxOvbaMbjb5J+fGsp0QP2kXMYdV+HZ7OwUaxJJzLjMXi530JaNp0HA/+WL
         wnng4encVy/YGV+tBZNxpu9YYNqRzOV/62HkbhodpMXYI+awKY9CgOhUXQlcaZqhuO7v
         784DpnqUdi4B5SY4zprjNGVfGxcZsz/1h0ZiBlvAzVbanmKXpAhBcV3p/NL/ee2kFVcm
         ZUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bAaupy8HQly8yCviqXS8t6kh8tv2Uo7yLw2EJiycudc=;
        b=d9gKncTUkyF2S03h4zFQ6aRbuT45GOL3nJ0RfrOOn9JqoVPgGR8i6cT6bLO2Zb2x6l
         JeXChKjggMpE5nmqZGEC+Ka2tFXX4rVs1nXHWKRMgxEirCFQCwGjU6TQltPVYr/rM2+T
         cjX5TtM9G8pTWCynB/CKPJQmgmeLVMgYKVx8/QDucZtaQOw9t3b+5C6GbqIEE/6/9ZVH
         j6JjQEqIuP9jWdAGFhN+ryojDnHoKvEeDWG/nlC7oPztU0FvbRPZvP7j7i85CDuqI2NC
         mvV4A1X/l9K+LptlAOJqAjbpHcngZIFPi5VRA3eIs60gyqtkC9ThKmW0GntSbL40ESMt
         A2Hg==
X-Gm-Message-State: AOAM532A2pAJ0UbYX9EyHjLDVTsyc/LJxkPW6JrG9kqDD7F5+JKHIJxE
	Fd78Ps7cH8IMsGOTuttd1iGrxp46VeROg8cutWI=
X-Google-Smtp-Source: ABdhPJw2lQ9WDBQqHQghWS2spMN4aTidFwkO7oUNbHP6H9VrnNDK3S8XfgcZsciMnrFeuC/i9Es7ccDVDlV0AgAvgp0=
X-Received: by 2002:a25:2702:: with SMTP id n2mr15491443ybn.179.1619892662625;
 Sat, 01 May 2021 11:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <eKyI.1619887499215737113.OOuc@lists.openembedded.org>
In-Reply-To: <eKyI.1619887499215737113.OOuc@lists.openembedded.org>
From: "Jean-Marie Lemetayer" <jeanmarie.lemetayer@gmail.com>
Date: Sat, 1 May 2021 11:10:51 -0700
Message-ID: <CAAdc0hwp+11o93K68jtqqW6yO=S2Gzj+5h1D7j6WrpSir=w7aA@mail.gmail.com>
Subject: Re: [OE-core] repo and bitbake
To: Mike <rabarberpie@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000baea1805c148a601"

--000000000000baea1805c148a601
Content-Type: text/plain; charset="UTF-8"

Hi Mike,

I have started a project to use yocto in a repo environment. This is called
openbar (https://github.com/openbar) but it is still a draft.

There is a wrapper makefile (the wizard) which starts bitbake in a docker
environment and allows you to use .config files to specify a build with
additional actions (use "make help" for the complete usage) .

It also exports the REPODIR variable (the root of the repo tree) to bitbake
using the BB_ENV_EXTRAWHITE variable (
https://www.yoctoproject.org/docs/latest/bitbake-user-manual/bitbake-user-manual.html#var-bb-BB_ENV_EXTRAWHITE
).

Finally I wanted to have the same use case as you, I was thinking of using
the externalsrc class (
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/externalsrc.bbclass)
the same way devtool do. I think mixing this class with something
equivalent to the REPODIR variable should work.

Let me know if you have succeeded.

Best regards,
Jean-Marie




On Sat, May 1, 2021 at 9:45 AM Mike <rabarberpie@gmail.com> wrote:

> Hi!
>
> I am a beginner to bitbake and openembedded, so please bear with me.
>
> In short, I have a custom system where I want to fetch all source code
> from a Gerrit server using the (Google) repo tool.
> So, after repo init and sync, all source code is populated in my workspace
> (thus, bitbake doesn't have to fetch or patch the sources).
> The SW modules themselves use regular CMake, make, or autotools for
> building.
> The workspace looks like:
> (workdir)/subsystem_A/SW_module_1
> (workdir)/subsystem_A/SW_module_2
> (workdir)/subsystem_B/...
> (workdir)/product_X/meta-...     (this is were all bitbake files are
> stored in order to build product X)
> (workdir)/product_Y/meta-...     (this is were all bitbake files are
> stored in order to build product Y; common configs/recipes will be a common
> product layer)
> In product_X folder, I also plan to have a script that sets up the build
> env (similar to oe-init-build-env), creating folder:
> (workdir/build/
> and populate it with bblayers.conf and local.conf. bblayers.conf will add
> the layers at (workdir)/product_X/meta-...
> From here, the building of the SW modules as well as the final image takes
> place using bitbake.
> The end result of the build is a ext4 file system image, which is flashed
> onto target device.
>
> First basic question:
> How do I properly set SRC_URI in the recipes to point to the SW_modules
> above, with no fetching/patching. Can I avoid that bitbake
> copy the source files to the build/tmp folder?
> I don't want to list the source files in the recipe really, I just want to
> refer to folder (workdir)/subsystem_A/SW_module_1
> as the CMakeLists.txt (for CMake) tells which files to build etc. Thus,
> "file:://" doesn't sound a good idea.
> I want to use inherit cmake and DEPENDS for managing deps.
>
> Thanks!
> Mike
>
>
> 
>
>

--000000000000baea1805c148a601
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mike,<div><br></div><div>I have started a project to us=
e yocto in a repo environment. This is called openbar=C2=A0(<a href=3D"http=
s://github.com/openbar">https://github.com/openbar</a>) but it is still a d=
raft.</div><div><br></div><div>There is a wrapper makefile (the wizard) whi=
ch starts bitbake in a docker environment and allows you to use .config fil=
es to specify a build with additional actions=20

 (use &quot;make help&quot; for the complete usage)

.</div><div><br></div><div>It also exports the REPODIR variable (the root =
of the repo tree) to bitbake using the=C2=A0BB_ENV_EXTRAWHITE variable (<a =
href=3D"https://www.yoctoproject.org/docs/latest/bitbake-user-manual/bitbak=
e-user-manual.html#var-bb-BB_ENV_EXTRAWHITE">https://www.yoctoproject.org/d=
ocs/latest/bitbake-user-manual/bitbake-user-manual.html#var-bb-BB_ENV_EXTRA=
WHITE</a>).</div><div></div><div><br></div><div>Finally I wanted to have th=
e same use case as you, I was thinking of using the externalsrc class (<a h=
ref=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/ext=
ernalsrc.bbclass">http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/=
classes/externalsrc.bbclass</a>) the same way devtool do. I think mixing th=
is class with something equivalent to the REPODIR=C2=A0variable should work=
.</div><div><br></div><div>Let me know if you have=C2=A0succeeded.</div><di=
v><br></div><div>Best regards,</div><div>Jean-Marie</div><div><br></div><di=
v><br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sat, May 1, 2021 at 9:45 AM Mike &lt;<a href=
=3D"mailto:rabarberpie@gmail.com">rabarberpie@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><p>Hi!<br><br>I am =
a beginner to bitbake and openembedded, so please bear with me.<br><br>In s=
hort, I have a custom system where I want to fetch all=C2=A0source code fro=
m a Gerrit server using the (Google) repo tool.<br>So, after repo init and =
sync, all source code is populated in my workspace (thus, bitbake doesn&#39=
;t have to fetch or patch the sources).<br>The SW modules themselves use re=
gular CMake, make, or autotools for building.<br>The workspace looks like:<=
br>(workdir)/subsystem_A/SW_module_1<br>(workdir)/subsystem_A/SW_module_2<b=
r>(workdir)/subsystem_B/...<br>(workdir)/product_X/meta-...=C2=A0 =C2=A0 =
=C2=A0(this is were all bitbake files are stored in order to build product=
 X)<br>(workdir)/product_Y/meta-...=C2=A0 =C2=A0 =C2=A0(this is were all bi=
tbake files are stored in order to build product Y; common configs/recipes =
will be a common product layer)<br>In product_X folder, I also plan to have=
 a script that sets up the build env (similar to oe-init-build-env), creati=
ng folder:<br>(workdir/build/<br>and populate it with bblayers.conf and loc=
al.conf. bblayers.conf will add the layers at (workdir)/product_X/meta-...<=
br>From here, the building of the SW modules as well as the final image tak=
es place using bitbake.<br>The end result of the build is a ext4 file syste=
m image, which is flashed onto target device.<br><br>First basic question:<=
br>How do I properly set SRC_URI in the recipes to point to the SW_modules =
above, with no fetching/patching. Can I avoid that bitbake<br>copy the sour=
ce files to the build/tmp folder?<br>I don&#39;t want to list the source fi=
les in the recipe really, I just want to refer to folder (workdir)/subsyste=
m_A/SW_module_1<br>as the CMakeLists.txt (for CMake) tells which files to b=
uild etc. Thus, &quot;file:://&quot; doesn&#39;t sound a good idea.<br>I wa=
nt to use inherit cmake and DEPENDS for managing deps.<br><br>Thanks!<br>Mi=
ke<br><br></p>
<br>
<br>
<br>
</blockquote></div>

--000000000000baea1805c148a601--
