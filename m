Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id 87A92753F1;
	Wed,  1 Aug 2018 14:35:47 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id y203-v6so7255889ywd.9;
	Wed, 01 Aug 2018 07:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ia82tCvvTv4EMcImOJtmiJ87fWrhi0jhCJMsYQZxWvs=;
	b=TnwaSxmxeIej3kazEUmSiDXeb9gyWwWmN9l8bClZFj3YaoJUPxCQb7GoEVM9acG6ZU
	yRn6gQWlcjJH1n7KRTmxKVHUExz2+o6BhJZrdCJ1EU7G1Sv6mmZ+uyDLIIDh4bAQbHNL
	53xkyvFktgAafhBnceyJAPgqn0dN1lHGRh2MJPJp12IhY6bCt0ldlNzXTVyB/xF4Z4tU
	QrzyphYXI0wk20tkfEfSEL17FNCPJthEQ6ksz/t2177b9FYaDWsX02uwaoE0PgXjL1fP
	E/j4wbnBuqxtk7xE6YW6JkTR3zhQaa3WN88K32Oh98jC2Nrz45nhMLMN0uUStavCT9FL
	Srww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ia82tCvvTv4EMcImOJtmiJ87fWrhi0jhCJMsYQZxWvs=;
	b=ZYxiV+pdBWc9jyFa1czP9ozTsbkFFTpLnq5UEqYxibihU4PZVZNvUkVOjUmV926RVS
	wBOxSF2wrqvD+rqtDeyrgPWp1fgHnh4qezUIWSO+FO49e994Vv2ffW8zd/sX6dalHfgs
	yh+4cd5PWuOUb8AgSTJPjTjl4Z2CfX7sfm3jKVk+L1Jm5FOWYjImly6BQW/OR6odnfZo
	Xt/GVwoWoYdDSLGt5TBmfUE2ndZJLW2DJDvB+ExWuGGC2GfWa9JuQhbnWJV8OY7R3kqO
	h9DW5NOUJdB2Z9doi5sRfs+CFEp40ZtLR+APke9K+XXT85uOd5M/key+g9EVBbiuq8HJ
	hYSQ==
X-Gm-Message-State: AOUpUlHD9PVWzEIvrg0vSaFL570/qs2EQdjhOIlCm0E3D595ZnWuwJg2
	EVaGj0ELtldpcCSWfmPvUhPwL7R9/R05RC6vVia9aA==
X-Google-Smtp-Source: AAOMgpeRet+v0iu/i8DejYVBWX4rfDVj54BY/rpjCO04iKk7XbrJXLze7MLrQcu+77hKAkeVVP4EoRYYkzjR9+s7biQ=
X-Received: by 2002:a0d:f7c3:: with SMTP id
	h186-v6mr13136260ywf.272.1533134147985; 
	Wed, 01 Aug 2018 07:35:47 -0700 (PDT)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Wed, 1 Aug 2018 10:35:36 -0400
Message-ID: <CAFeBWL7rT1Xiabn6Z9R=hUQkEat+4FW2Vm4aa7vKJQFYzSfF4Q@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: "make clean" on Weston
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
X-List-Received-Date: Wed, 01 Aug 2018 14:35:47 -0000
Content-Type: multipart/alternative; boundary="00000000000048a7a70572609c50"

--00000000000048a7a70572609c50
Content-Type: text/plain; charset="UTF-8"

Neither "bitbake -c clean weston" nor "bitbake -c cleanall weston" seems to
clean the build directory for me.
Is this how it is for autotool project? "make clean" doesn't work either
("no rule to make target clean").

I need my directory cleaned so I can commit only the necessary changes.

/build/workspace/sources/weston$ git status
On branch devtool
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   Makefile.am
        modified:   Makefile.in
        modified:   aclocal.m4
        modified:   build-aux/compile
        modified:   build-aux/config.guess
        modified:   build-aux/config.sub
        modified:   build-aux/depcomp
        modified:   build-aux/install-sh
        modified:   build-aux/ltmain.sh
        modified:   build-aux/missing
        modified:   build-aux/test-driver
        modified:   clients/ivi-shell-user-interface.c
        modified:   clients/simple-egl.c
        modified:   clients/simple-touch.c
        modified:   config.h.in
        modified:   configure
        modified:   ivi-shell/hmi-controller.c
        modified:   ivi-shell/ivi-layout.c
        modified:   ivi-shell/ivi-shell.c
        modified:   libweston/input.c
        modified:   libweston/libinput-device.c
        modified:   m4/libtool.m4
        modified:   m4/ltoptions.m4
        modified:   m4/ltsugar.m4
        modified:   m4/ltversion.m4
        modified:   m4/lt~obsolete.m4

Adam

--00000000000048a7a70572609c50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Neither &quot;bitbake -c clean weston&quot; nor &quot;bitb=
ake -c cleanall weston&quot; seems to clean the build directory for me.<div=
>Is this how it is for autotool project? &quot;make clean&quot; doesn&#39;t=
 work either (&quot;no rule to make target clean&quot;).</div><div><br></di=
v><div>I need my directory cleaned so I can commit only the necessary chang=
es.</div><div><br></div><div><div>/build/workspace/sources/weston$ git stat=
us</div><div>On branch devtool</div><div>Changes not staged for commit:</di=
v><div>=C2=A0 (use &quot;git add &lt;file&gt;...&quot; to update what will =
be committed)</div><div>=C2=A0 (use &quot;git checkout -- &lt;file&gt;...&q=
uot; to discard changes in working directory)</div><div><br></div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0Makefile.am</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0Makefile.in</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0aclocal.m4</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0build-aux/compile</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0build-aux/config.guess</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0build-aux/config.sub</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0build-aux/depcomp<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0build-aux/insta=
ll-sh</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0build-aux=
/ltmain.sh</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0buil=
d-aux/missing</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0b=
uild-aux/test-driver</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =
=C2=A0clients/ivi-shell-user-interface.c</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 modified:=C2=A0 =C2=A0clients/simple-egl.c</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 modified:=C2=A0 =C2=A0clients/simple-touch.c</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0<a href=3D"http://config.h.in">c=
onfig.h.in</a></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0=
configure</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0ivi-s=
hell/hmi-controller.c</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0=
 =C2=A0ivi-shell/ivi-layout.c</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 modifie=
d:=C2=A0 =C2=A0ivi-shell/ivi-shell.c</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
modified:=C2=A0 =C2=A0libweston/input.c</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 modified:=C2=A0 =C2=A0libweston/libinput-device.c</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0m4/libtool.m4</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0m4/ltoptions.m4</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0m4/ltsugar.m4</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0m4/ltversion.m4</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 modified:=C2=A0 =C2=A0m4/lt~obsolete.m4</div></div><d=
iv><br></div><div>Adam</div></div>

--00000000000048a7a70572609c50--
