Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFA778253
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 22:49:07 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id k101so11735595iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 15:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H1EQ+nxBuFp+6mGKr5rL6m4umVEJzCwfBpZiZB9bfFk=;
	b=wtG+EHHUphUOlV/Gn6xk/LYF2H/r8fFjawPCIjFcUqgWVrtV+UsbPGDkw99xVxEiL1
	4zHy63QNSZBV9X4A8yUA3jye+mvanoh2b3SBImNNeSNU3mB0DoT9lPAD23yJH9SPP0KZ
	kpgHgpOB6PkPCNsAyPYMH1b70qs8SJGVdmRMy6jB/0pdA33mzwDEnTDdCLg/Nj6oe2To
	3CKC2v6rdTQkz6FsO/uVenW3lO1qfoDsIfNeOdt6dVJNfFnfjnKlAm/a1LP3tVPtKmVh
	aH452ZFH4uT76sgfngSrG6zwEcZ/iYmthF5fHz3sUIh3GtT1GsHF8hzVcyUEznoh7Fq3
	EZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H1EQ+nxBuFp+6mGKr5rL6m4umVEJzCwfBpZiZB9bfFk=;
	b=Qbh7ZFdHIcG/iH6U8bIdBIPhhiudiA1w/2j8sWSHceXRpoRUNaHlT7kF2HmaQJ404V
	jgrdahXtbAuJQsiFvJ4sp6hP/H52+43LdXq76gEi7218WjI130EyA540omaO7dYXs5Tf
	u26oV8NQu1vYIvBW2PLwd5u8sva3MvY6PW5sjwConhfwyWWEZoh75iDUFjR4H2gV5JsG
	CYVS7kvz1eJsAbr8yLO43B5OCItmvHhktcB2ymtwZG0X/OkUQuWIKCoLItz1gVXnFTvl
	M4z6VYahDVkkYxDXrS9jx4YrFzwqK2bjOYF6QgcbuPIO0z4XuUPkjFCZrQqKos2HA2so
	uRag==
X-Gm-Message-State: AHPjjUh0UDlD9/5cmZIZf//a5KN36UFFnj0oVtsov6NJTxeByvOcJ6Wg
	L9dcpDw8cmmH75BOlqMnXyJ/+dpW/UC2RzuKibKKUg==
X-Google-Smtp-Source: AOwi7QD6ZkR3hSvVM082j3WPWDoc09vf0nzn5qqq8F0PcU44V2IWeuD7T0doXSMIc7TltWMCPTjUUNsN86WaTKO9/0k=
X-Received: by 10.107.135.72 with SMTP id j69mr10873860iod.210.1505515749235; 
	Fri, 15 Sep 2017 15:49:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 15 Sep 2017 15:48:48 -0700 (PDT)
In-Reply-To: <20170915222700.GA15457@canismajor>
References: <20170915222700.GA15457@canismajor>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Sep 2017 23:48:48 +0100
Message-ID: <CAJTo0LbA_fr5bd8kAa-ma3zb4X8oEy3YUwrtqvSDjpAdNnxUow@mail.gmail.com>
To: Will Page <Will.Page@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pseudo][PATCH] Fix to fcntl guts to ignore flags that can be ORed into cmd
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
X-List-Received-Date: Fri, 15 Sep 2017 22:49:08 -0000
Content-Type: multipart/alternative; boundary="001a113f8e706ff8730559423350"

--001a113f8e706ff8730559423350
Content-Type: text/plain; charset="UTF-8"

Hi Will,

This should go to the yocto@yoctoproject.org list really.  I've CC'd the
maintainer to be sure he spots it.

Ross

On 15 September 2017 at 23:27, Will Page <Will.Page@ni.com> wrote:

> The fcntl guts switch on "cmd" parameter to identify the fcntl
> command being issued, but isn't aware of the file creation flags that
> can be ORed in.
>
> This change masks out the flags from the command only for the switch
> statement so that it can correctly determine whether it needs to pass
> "lock" or "arg".  When real_fcntl() is called, the original value is
> still passed on. This corrects an issue observed using pseudo on modern
> linux desktops resulting in "pseudo: unknown fcntl argument 1030,
> assuming long argument." diagnostics in the output.  Decimal 1030 is
> 0x0406, which translates to O_NOCTTY | F_SETLK, and should call
> "rc = real_fcntl(fd, cmd, lock);", but instead falls through to the
> default case instead calling "rc = real_fcntl(fd, cmd, arg);".
>
> Tested the change using perftest - without this patch, the issue is
> trivially reproducible on my Ubuntu Xenial system, and after patching it
> emitted no "unknown fcntl argument" diagnostics.
>
> Signed-off-by: Will Page <Will.Page@ni.com>
> ---
>  ports/linux/guts/fcntl.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
> index 639fd24..d278a8c 100644
> --- a/ports/linux/guts/fcntl.c
> +++ b/ports/linux/guts/fcntl.c
> @@ -8,6 +8,10 @@
>   */
>         long arg;
>         int save_errno;
> +       /* some bits can be ORed into the cmd should be explicitly ignored
> +        * see fcntl documentation on F_SETFL */
> +       int o_mode_mask = (O_RDONLY | O_WRONLY | O_RDWR) |
> +               (O_CREAT | O_EXCL | O_NOCTTY | O_TRUNC);
>
>         /* we don't know whether we need lock or arg; grab both, which
>          * should be safe enough on Linuxy systems. */
> @@ -15,7 +19,7 @@
>         arg = va_arg(ap, long);
>         va_end(ap);
>
> -       switch (cmd) {
> +       switch (cmd & ~(o_mode_mask)) {
>         case F_DUPFD:
>  #ifdef F_DUPFD_CLOEXEC
>         case F_DUPFD_CLOEXEC:
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f8e706ff8730559423350
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Will,<div><br></div><div>This should go to the <a href=
=3D"mailto:yocto@yoctoproject.org" target=3D"_blank">yocto@yoctoproject.org=
</a> list really.=C2=A0 I&#39;ve CC&#39;d the maintainer to be sure he spot=
s it.</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 15 September 2017 at 23:27, Will Page <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:Will.Page@ni.com" target=3D"_blank">Wil=
l.Page@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The f=
cntl guts switch on &quot;cmd&quot; parameter to identify the fcntl<br>
command being issued, but isn&#39;t aware of the file creation flags that<b=
r>
can be ORed in.<br>
<br>
This change masks out the flags from the command only for the switch<br>
statement so that it can correctly determine whether it needs to pass<br>
&quot;lock&quot; or &quot;arg&quot;.=C2=A0 When real_fcntl() is called, the=
 original value is<br>
still passed on. This corrects an issue observed using pseudo on modern<br>
linux desktops resulting in &quot;pseudo: unknown fcntl argument 1030,<br>
assuming long argument.&quot; diagnostics in the output.=C2=A0 Decimal 1030=
 is<br>
0x0406, which translates to O_NOCTTY | F_SETLK, and should call<br>
&quot;rc =3D real_fcntl(fd, cmd, lock);&quot;, but instead falls through to=
 the<br>
default case instead calling &quot;rc =3D real_fcntl(fd, cmd, arg);&quot;.<=
br>
<br>
Tested the change using perftest - without this patch, the issue is<br>
trivially reproducible on my Ubuntu Xenial system, and after patching it<br=
>
emitted no &quot;unknown fcntl argument&quot; diagnostics.<br>
<br>
Signed-off-by: Will Page &lt;<a href=3D"mailto:Will.Page@ni.com">Will.Page@=
ni.com</a>&gt;<br>
---<br>
=C2=A0ports/linux/guts/fcntl.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c<br>
index 639fd24..d278a8c 100644<br>
--- a/ports/linux/guts/fcntl.c<br>
+++ b/ports/linux/guts/fcntl.c<br>
@@ -8,6 +8,10 @@<br>
=C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 long arg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int save_errno;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* some bits can be ORed into the cmd should be=
 explicitly ignored<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * see fcntl documentation on F_SETFL */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int o_mode_mask =3D (O_RDONLY | O_WRONLY | O_RD=
WR) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(O_CREAT | O_EXCL |=
 O_NOCTTY | O_TRUNC);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* we don&#39;t know whether we need lock or ar=
g; grab both, which<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* should be safe enough on Linuxy systems=
. */<br>
@@ -15,7 +19,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg =3D va_arg(ap, long);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 va_end(ap);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (cmd &amp; ~(o_mode_mask)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case F_DUPFD:<br>
=C2=A0#ifdef F_DUPFD_CLOEXEC<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case F_DUPFD_CLOEXEC:<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a113f8e706ff8730559423350--
