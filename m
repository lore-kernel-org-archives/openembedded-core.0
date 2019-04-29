Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 473FB7DB48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:15:45 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id h5so8154396lfm.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nvmVMFNDgnCnl1iflRhEVGKwzvZJ9zBMJtpECtL1bVU=;
	b=Ljk5eBEMHR0fwfTMO4ggVUTDvlFyi/FWEpDcxFtLybh4ofNAKtQiRALe0Pj0dJWeWj
	BGTRI+PIhhIPYlqXxGy8pywJcvljhI8xl7YtCaW3VOb7kyImjUtCpHw2OZVxsQ+Ny8gH
	aoqlKmYl3EWkQrGy6wXu5xWobN8QiHTGYR4AZ10Zk6oczwbobtFghzEUTJETUicZHSLE
	KQOT2Y3nl19HH+eeN5tzDPJx/TKJ4Gt9diXhDxSTPSZMtlWlbmMaR8IoRA3dUFn7PGxp
	sNAcxPOguGgbyMV6yku41WA9y8nmT4seQRRx7cf9Hq15JMmydvWXHDs+aypQmUe5vwF+
	Byzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nvmVMFNDgnCnl1iflRhEVGKwzvZJ9zBMJtpECtL1bVU=;
	b=NENuTYQOLlYuxjegWvpV1pKYd8rL1aWMD/CMaj1l9prkXXT1abZaGDrhw2GUpoAewI
	+TYw2kSpqjNxaUqPJkfuIk6REE8eJVn9hFO8d3VbkLp0EHTYLCPk3YbvH6bpWG/tXQcP
	mZiIxSqRNKQ/Cx78tdb9Se2i5GaiJxZ7ZDaCXFKDQFyTjBxR7tE2/Pn4FFfN9FBAgNKf
	4SWmzz8RM8HeFIIJIUuoqLSxmRnYFuzamGdSOFwHxZmspy4Cpi9Q5pu6OeizOZYuEXeo
	s2JRSjwMSX+EEu9mYZL2vVnU809LBdP7gTCs9ja04Q/T0z8G4LqLjqh4/TtHY/MpMgvr
	3u4A==
X-Gm-Message-State: APjAAAVq9K9i7wsajxzxZ3vISPwi2MQqTgO5eC8lrlY0XU2SfI199Odb
	k6VOfbhtoZXZHA5Vb+mZOrmK1b1xNyVUbWMB2TY=
X-Google-Smtp-Source: APXvYqzZ/ey9R7M/hB4RATbjOb+Kwsl65YTE/bQT7XnBcXRoBRUcGvnjJFjZ7AyEKrtzo23QXtA/MkerqB1sdORN0J4=
X-Received: by 2002:a19:a94d:: with SMTP id s74mr18226690lfe.134.1556547345654;
	Mon, 29 Apr 2019 07:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <1556546164-28522-1-git-send-email-f.suligoi@asem.it>
	<1556546164-28522-2-git-send-email-f.suligoi@asem.it>
In-Reply-To: <1556546164-28522-2-git-send-email-f.suligoi@asem.it>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Apr 2019 10:15:34 -0400
Message-ID: <CADkTA4MjV8eMW5BZxze4midXnrhVmwMC9wA-gvfTGQFbNoNcVw@mail.gmail.com>
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: check for empty .config file after merge_config.sh
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
X-List-Received-Date: Mon, 29 Apr 2019 14:15:45 -0000
Content-Type: multipart/alternative; boundary="0000000000009d27030587abebc6"

--0000000000009d27030587abebc6
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 29, 2019 at 10:01 AM Flavio Suligoi <f.suligoi@asem.it> wrote:

> Sometimes, for example in case of missed dependecies, after the
> execution of:
>
> merge_config.sh
>
> the resulting file ".config" can be empty.
> This is the reason why is necessary test it and, in case, display
> the "Could not configure ..." error message.
>

This doesn't belong here. Auditing of the final .config is done in a
separate task, and we could pickup that issue there.

That being said, there are already checks for inputs that could result in
something like this. How were you triggering this issue ? I'd like to
reproduce it here, and perhaps come up with a different solution.

Bruce



>
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 243f8d6..895966b 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -331,7 +331,7 @@ do_kernel_configme() {
>         fi
>
>         CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}"
> ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>
> ${meta_dir}/cfg/merge_config_build-errors.log
> -       if [ $? -ne 0 ]; then
> +       if [ $? -ne 0 ] || [ ! -s ${B}/.config ]; then
>                 bbfatal_log "Could not configure
> ${KMACHINE}-${LINUX_KERNEL_TYPE}"
>         fi
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009d27030587abebc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 29, 2019 at 10:01 AM Flavio Suligoi &lt=
;<a href=3D"mailto:f.suligoi@asem.it">f.suligoi@asem.it</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Sometimes, for examp=
le in case of missed dependecies, after the<br>
execution of:<br>
<br>
merge_config.sh<br>
<br>
the resulting file &quot;.config&quot; can be empty.<br>
This is the reason why is necessary test it and, in case, display<br>
the &quot;Could not configure ...&quot; error message.<br></blockquote><div=
><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">This=
 doesn&#39;t belong here. Auditing of the final .config is done in a separa=
te task, and we could pickup that issue there.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">That being said, there are already checks for inputs =
that could result in something like this. How were you triggering this issu=
e ? I&#39;d like to reproduce it here, and perhaps come up with a different=
 solution.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Flavio Suligoi &lt;<a href=3D"mailto:f.suligoi@asem.it" targ=
et=3D"_blank">f.suligoi@asem.it</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass<br>
index 243f8d6..895966b 100644<br>
--- a/meta/classes/kernel-yocto.bbclass<br>
+++ b/meta/classes/kernel-yocto.bbclass<br>
@@ -331,7 +331,7 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_OPTIONS}&q=
uot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOST=
CPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; ARCH=3D${ARCH}=
 merge_config.sh -O ${B} ${config_flags} ${configs} &gt; ${meta_dir}/cfg/me=
rge_config_build.log 2&gt; ${meta_dir}/cfg/merge_config_build-errors.log<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ] || [ ! -s ${B}/.config ]; then<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;C=
ould not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000009d27030587abebc6--
