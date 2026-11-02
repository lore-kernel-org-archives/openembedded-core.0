Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2662.1793655984252370591
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 13:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xXn03aVX;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so2087958e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 13:46:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793655982; cv=none;
        d=google.com; s=arc-20260327;
        b=ayAusB6yyW7k5lfPdZ/yzEAtByhvmDvPRno2WZk7JLWk/Z7l7/cUt78Ldn483TQ0gg
         AoJQtDpgIeDT4q9ram8aEKPiNR5DzP024OHOjrwDlGXsjVgmJR3eSo33QrWpwI33Neo7
         StybP2n3r2t4T+b0RyhSZdsD9FQtPUUrA7AugX/fjFFHoE95RpbPIrzYxIV5GRuwodqE
         DTQd0HPUlc3qID1VH037DqRoToXPHQ9doyDE1kyk9p/fYIlGZ7ngP8OQGzEgpUg8Eng7
         xiNHwgeXIEEBOE33YWedJ/KKGi6XcAm38ZouKjeig9m0YV4Px4KqLTLj9jpGkJGS2/UE
         JoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MR7/sW4/IeK/exQ4C57lAb9NtM+AgY5/w5GYQ02XX7M=;
        fh=MvCSRTAi0v5CsXDkNrBJHAFTWGfRJU/fHzmS8LYi+no=;
        b=qGcaqoCs+TR9ro16vSauIDpY48b/fUiNZq1q7H8Nj6dbTjBt+28WSTZnhkCvXqAgpG
         OgEYB6eq/U84O0V+SQDEFQtXxMWnPL6bObxKgUWngYPdkdciSqM6ObU1pnqPEaCIksLk
         H7yalUBp6tNM4FntVQEYi7nXtkAFfYLdwehlHiyoTy71dJREcNKIvKAK9NlO3O7WB8Uy
         2AVesr3H1314yVtrN5gV1NFiHZ6b3/BGGxPzQkL4EJdDWUxBozHNZFNnEOT9hVn9ysUx
         33nZ5HKJsQBtvLrXUx3w9gKckKGFRiy1Xn2zR+EhWU2MbiWbkZPCK7CBsD6FzpUINO0x
         7c/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793655982; x=1794260782; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MR7/sW4/IeK/exQ4C57lAb9NtM+AgY5/w5GYQ02XX7M=;
        b=xXn03aVXXdqm/2tIFbMrLMhkWhKJLdlTt6lz+tlSnQpmvMdw4ZCBIyX5j9t27YNhTb
         4E0jsPQfHn4Y3ybqEirjkK0il4N1jVSUcpY6bwGx+bFSz54bHDHUROxsb4yQDEa9dfHn
         BvIIzNwjbpf4C3mCs+euBtUS6xFz/eiri06a+dXjxvTyX0gOgwdSFyjzujhhP4Mruuyt
         U3f98hdgMt2MhV2t8HTR8vz9dfyavsRBNKoX+WRH64R85OVoIwr4VPHLONrfH5AfHXnK
         so+i9ysoXwYFjpTT/i7abr4oo2vRrt6leGrLlUCmmFt7Uc6o4PHjT5b2Ln1gAL+CIiU8
         s2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655982; x=1794260782;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MR7/sW4/IeK/exQ4C57lAb9NtM+AgY5/w5GYQ02XX7M=;
        b=oJLTpCR+88EpqVbSXtb+fkiIlOY51IcgDRER8y8Kwh6u8cmm2lAqwTXuV/6z1rD1yP
         EUOwgxiBovtCToTKyOhn613C8glmWT7gSj2rDpVg0dUePwtkl6rYQew/jXPysl8P8lQq
         fTRmLYeXlv6JbFo4B2YoVJvJ09jwqXkcT932fCfGGzG59wz0BHVzN61GbH/DGW/5r50+
         TC8vJFw3GqXcMF4CaNntXP9QUJPNRPsuU7eGfHHgkQqdvebgSx/iXoEVu7bDoJHTYgGA
         kEV8q50YM0tpjBfwCcVuufoNlSmfVZUllDLbsaNAa6NbpNniSv8qN7hlVqCO94TDnKy7
         c4MQ==
X-Forwarded-Encrypted: i=1; AKwUvBziQ2rJBAUgD8GIDk+h5LY/fwoRYmH2OVzJkummSnyf34TGiDYO86wMjIayXxTKj6JNOvBvYlH312A1cFTdfPY1iA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9xP4udlDO6E4gCFD2hx5dD3Ujj+PxzI5oq75WITsi+LlK+HTAT
	MaiNu7zwVPv9qRjwnRUPj06bt85i/cZRPsf234szXaQHCivj9vs0UDnE07rCISBhVbNtljFFtmu
	GMbzz0wvCeN4llaGZ/w064vkGkDAGuKDXmQ==
X-Gm-Gg: AYBFou1Oy7mmnxJ2DE9fgCkTrjKlp5c3NGdPlPwNeAROxymPjfXuOKcqJAzp/wMJ/WU
	RBBskQywojG9gDYYM19VX8MRti6CvjpSW5UPD6VwNofI0toacD1OQVjMuHeyDaELGDRISugqHhT
	sV3HfpfF1Yzi26hq7WrEWfO4Zju6kfdBfj/sbBVbwssRf+TA+VfYpmpYJ9eKlhYpfeSOb5XKC0w
	Ueonw5fktG8BDguQelzKpp1xj07GUfWc0UuKNVcaGaBFMm8Ze3CB0bTEqTFUcUOrP70iPFRdRP9
	jZ8NmL1/UytQkxNAATTUbgALaBVzHjBhYg/VRFXuPc7bfEd8/kYMj4sL1tKxO9EOJhjJoHueV24
	mTsLF1uTXrs63dzuAaGlcByhcLHgABcehXJS6KRhbm0FwgJ+MYnwg23RfJyH/lX4XFE9XPic=
X-Received: by 2002:a05:6512:1588:b0:5bf:ec95:41ed with SMTP id
 2adb3069b0e04-5bfec9545d3mr550351e87.24.1793655981764; Mon, 02 Nov 2026
 13:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20261102011816.3710992-1-tim.orling@konsulko.com>
 <20261102011816.3710992-2-tim.orling@konsulko.com> <DMKSA11YDYBP.33D4G9KGENZHA@bootlin.com>
In-Reply-To: <DMKSA11YDYBP.33D4G9KGENZHA@bootlin.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 2 Nov 2026 13:46:09 -0800
X-Gm-Features: AclHuK-14cP0iTCcXO83ZTDcu8LJnNxZ1OeU2SNZVSNVh6kc-3rjw0YVr_miXak
Message-ID: <CANx9H-CzaTzi4nu5LH_qHcA7ZqVPb5SB7JSc9k+wVggKtHFr1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] python3-uvloop: enable ptest
To: mathieu.dubois-briand@bootlin.com
Cc: tim.orling@konsulko.com, openembedded-core@lists.openembedded.org, 
	Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: multipart/alternative; boundary="000000000000a47589065f521330"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 21:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249226

--000000000000a47589065f521330
Content-Type: text/plain; charset="UTF-8"

I have a v2 in testing which drops 8 time sensitive tests on qemuriscv64.
I'll double check the skips against your list of failures before I send.

On Mon, Nov 2, 2026 at 06:10 Mathieu Dubois-Briand via openembedded-core
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:

> On Mon Nov 2, 2026 at 2:18 AM CET, Tim Orling via openembedded-core wrote:
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > The sdist ships the test suite. run-ptest deselects:
> > * tests that conflict with pytest's output capture;
> > * tests broken by libuv 1.53.0 spawning with posix_spawn() on Linux,
> >   which bypasses uvloop's preexec_fn fork hook;
> > * DNS tests that wait for resolver timeouts without network access,
> >   which took the suite from 1 to 10 minutes over tap without NAT.
> >
> > .flake8 and mypy.ini let test_sourcecode skip cleanly when flake8 and
> > mypy are missing.
> >
> > Tested with core-image-ptest-python3-uvloop on qemux86-64 (kvm, tap):
> > 455 passed, 35 skipped, 0 failed in 82s, so add it to PTESTS_SLOW.
> >
> > AI-Generated: Uses Claude Code (Claude Opus 5.5)
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
>
> Hi Tim,
>
> Thanks for your patch.
>
> I can see it tends to fail on riscv.
>
> First build:
> Failed ptests:
> {'python3-uvloop':
> ['tests/test_regr1.py:TestIssue39Regr.test_issue39_regression',
>
> 'tests/test_tcp.py:Test_UV_TCPSSL.test_create_connection_ssl_1',
>
> 'tests/test_tcp.py:Test_UV_TCPSSL.test_create_server_ssl_over_ssl',
>                     'tests/test_tcp.py:Test_UV_TCPSSL.test_renegotiation',
>
> 'tests/test_tcp.py:Test_AIO_TCPSSL.test_create_connection_ssl_1',
>
> 'tests/test_unix.py:Test_UV_UnixSSL.test_create_unix_connection_ssl_1',
>
> 'tests/test_unix.py:Test_AIO_UnixSSL.test_create_unix_connection_ssl_1',
>
> 'tests/test_unix.py:Test_AIO_UnixSSL.test_create_unix_server_ssl_1']}
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2713
>
> Second build:
> Failed ptests:
> {'python3-uvloop':
> ['tests/test_regr1.py:TestIssue39Regr.test_issue39_regression']}
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2714
>
> This is riscv, so emulation is slower than for other architectures.
> Maybe we need to relax a bit some timings.
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249211):
> https://lists.openembedded.org/g/openembedded-core/message/249211
> Mute This Topic: https://lists.openembedded.org/mt/122051652/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a47589065f521330
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have a v2 in testing which drops 8 time sensitive tests=
 on qemuriscv64. I&#39;ll double check the skips against your list of failu=
res before I send.</div><div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 2, 2026 at 06:10 M=
athieu Dubois-Briand via openembedded-core &lt;mathieu.dubois-briand=3D<a h=
ref=3D"mailto:bootlin.com@lists.openembedded.org">bootlin.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon Nov 2, 2026 at 2:18 AM CET, Tim Orling via openembedded-c=
ore wrote:<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;<br>
&gt; The sdist ships the test suite. run-ptest deselects:<br>
&gt; * tests that conflict with pytest&#39;s output capture;<br>
&gt; * tests broken by libuv 1.53.0 spawning with posix_spawn() on Linux,<b=
r>
&gt;=C2=A0 =C2=A0which bypasses uvloop&#39;s preexec_fn fork hook;<br>
&gt; * DNS tests that wait for resolver timeouts without network access,<br=
>
&gt;=C2=A0 =C2=A0which took the suite from 1 to 10 minutes over tap without=
 NAT.<br>
&gt;<br>
&gt; .flake8 and mypy.ini let test_sourcecode skip cleanly when flake8 and<=
br>
&gt; mypy are missing.<br>
&gt;<br>
&gt; Tested with core-image-ptest-python3-uvloop on qemux86-64 (kvm, tap):<=
br>
&gt; 455 passed, 35 skipped, 0 failed in 82s, so add it to PTESTS_SLOW.<br>
&gt;<br>
&gt; AI-Generated: Uses Claude Code (Claude Opus 5.5)<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Tim,<br>
<br>
Thanks for your patch.<br>
<br>
I can see it tends to fail on riscv.<br>
<br>
First build:<br>
Failed ptests:<br>
{&#39;python3-uvloop&#39;: [&#39;tests/test_regr1.py:TestIssue39Regr.test_i=
ssue39_regression&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
tests/test_tcp.py:Test_UV_TCPSSL.test_create_connection_ssl_1&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
tests/test_tcp.py:Test_UV_TCPSSL.test_create_server_ssl_over_ssl&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
tests/test_tcp.py:Test_UV_TCPSSL.test_renegotiation&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
tests/test_tcp.py:Test_AIO_TCPSSL.test_create_connection_ssl_1&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
tests/test_unix.py:Test_UV_UnixSSL.test_create_unix_connection_ssl_1&#39;,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
tests/test_unix.py:Test_AIO_UnixSSL.test_create_unix_connection_ssl_1&#39;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
tests/test_unix.py:Test_AIO_UnixSSL.test_create_unix_server_ssl_1&#39;]}<br=
>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/buil=
ds/2713" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/56/builds/2713</a><br>
<br>
Second build:<br>
Failed ptests:<br>
{&#39;python3-uvloop&#39;: [&#39;tests/test_regr1.py:TestIssue39Regr.test_i=
ssue39_regression&#39;]}<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/buil=
ds/2714" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/56/builds/2714</a><br>
<br>
This is riscv, so emulation is slower than for other architectures.<br>
Maybe we need to relax a bit some timings.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#249211): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/249211" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/249211</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122051652/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/122051652/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a47589065f521330--
