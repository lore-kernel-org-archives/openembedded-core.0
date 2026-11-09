Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.501.1794240177119835324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 08:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PazQ2gJR;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67c00f291e1so681368d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 08:02:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240176; cv=none;
        d=google.com; s=arc-20260327;
        b=c8IGv+O/0fJjHxg+5ziskAHCoqz4snRPxjNJxALEkZKiCPFd/jKcFxbcH0vidjkUw7
         JHVdvn8IICR155GvbrEWcimWPNAY9M4x77dqWnqGMYGwC3O3qNZbvn7a9oIZDp67j/w7
         XrHSacW/Ab1vUFNxfRtJeRJvcrnKCYgf+8Pbbss9f1rVq1fSGDbfO9S9PWFcaCp9JLtR
         ohAGmhhi92TXvpDVcSc6JMvHyohrAiBdOwZqRIyJ22ijlx+FXKFM9dVFqvtyV00MuIyQ
         qqHP1jFIya4kpIT9ZQi76P5aPV1oUs3HAPjV4mudEQevPFgFRzDeqlofBrqhW5B3XZpJ
         fIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2Ren0Gh9lMu/hWtgc6BWlzTzqRHL5r71xNz2U+WztDE=;
        fh=QHJ4tMgQjfFJOJcC01cs2qUpmnDJcaBuL23KTipDd7k=;
        b=Qt9kQNczc/Ww8FAu9G2B0iAtNqsqU8DMbU9zanfUWGg67IBMnyVgopXE3TP0nfuWxf
         aaJgwLY9wkHXQq2kSYS5+2DM97kITpZs6bD5sb9ip0Rio2q/NLiGMrS6GAi318idB1+c
         u5goks1Y28UErLXS2kc4+yU46MjeyYyofTK2kCEglHXvaiE/Wj0jDAF5DwK7iCWpV1Eg
         sPX10UvynsfL+0rtc7NK3uNExlerqXXhBpyYjOZQTVkJyM9kePfvEZ32Zh+FCxCMoity
         PLmbvTDZ5PhGZap0fy76eYlza8am1oSGTjnBHLSOHExiyuLgeFBhV9/F4xf39fPhdeEU
         xDMw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240176; x=1794844976; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ren0Gh9lMu/hWtgc6BWlzTzqRHL5r71xNz2U+WztDE=;
        b=PazQ2gJRSjjh3LwQXI6VutL8/pQ51OczWZ5vgZNJfMTV10lDJSEHkMN0zFE/AnIScH
         sGLDrhe+V1BjaDtvzuhJsJnAhTNMOY7n2NyWhQMBKHzYGkfi7D7c3Ilv0TiznXVd1ACo
         ZNUUsQnFYNu5IMAmLVDHvQova5nnBx/1n3g/+eY8bSsUXlMMaXwmek/2FQ4vI9En5R33
         /dCi6q4BVk+8TgPhLM31v+bwRYPRz/IS/3vnBig82CK56tj4utramlTrDMx1CbQqku/M
         GYaabNag7sTP9gaUrhYHfI2OW0hsjWCl7ylmt1/y2BJgc9rX3g0gozaj37ckGDvZ2VAx
         t4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240176; x=1794844976;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2Ren0Gh9lMu/hWtgc6BWlzTzqRHL5r71xNz2U+WztDE=;
        b=QpUl5d24XiTb9t6s97cKaeBXScGLE5hBMb8MAuLP1kdNyLdcxXVp30rgVg/XZ8Iy/E
         BSQwmGM48pSztFO02FdNMGQ8KVwABA1mxN4WU93oaq1DTKcLSKtv6WLMh2piG9uMhcr6
         Pnc8N4yGI9sXP/txeT/6QG1RhpOUu75aNW5yx8zOLo1iF/MTwCKkVdEZiD8JqP90EJWi
         6wEU7w/d2KfRtBHj2X6q1Ze492WqOvNWb3Ep5iCKhKt96RbBIGY2Dr2QpTICN/cRCn56
         pXZqyI31QFnMwXA7QS1FSg7zLc+aJNzUrnP4a+rozFixQniwJAatAa4IzNbTjBQCfuxd
         6nlg==
X-Forwarded-Encrypted: i=1; AL+hErE4I0j5GcyPNKtGlI4d5dLuwvVR8m+mI30VkCTgICSaC6bu7Sv6xinsifwYqJFjWKxfDxhQgyFv/gxvmiOs6CvWsQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9IatVEyCvAJuZKnBusy8Ntel225VLu/APqRRnbkCDcHkmdlrsC
	UcrKleAzogaknGqu1SdN6mN81CDs31oLJWW9sqQnvHCHFSysudXfxUBNL0LOf7P8jAVLWRAqGpk
	xVHvnUA3mzQ7EIPuZfFPAn1PwLCx4Zp0=
X-Gm-Gg: AYBFou02TBAYMl9MYfnU/Ol+sm4vrcqNjCn5HY33AR5gXeDsoYKnGBkyDOqzP3r/O4T
	OIuZCFapZ1zLoFJf+X7V3i4ZiQZej2CsDIKjetFN85wJGaX+USFUeYghiujrUkUTEpvRv9kZ+Kv
	6eOHCn7IR4u0UOHAQPyjMbFXoBkTMi0eAng8EuQMkKU0ksHdqznpvaH4B8OQuj3ICiwi4rWfYhR
	0MenPAf3HJv3MeA5q4QC1FGcOFYn9kqMrX6cgFWoCG+rQfDJMZQLqbTRkns0vBKufvnJZsS9612
	4ZpequmVN1xPDKuUP3GIcq1YkzlBc40H/akQLMNjkow/6Cn64YhSb5yVETLOBUfWg/IP5EqecsR
	fBI1915+RJXT8hIMLC3B1GM7drCOzSrAn1pnUVJYol2RxoHvWBDlgP2EjYLLNCfDPbbunQoO4+W
	Nsn5//YmWFUcUsXF+Mor6Qz57G8CBc7nc9sEtZ0bp4wj73ZOfwR3r2qZoDSEv9mdJXhhlILInMp
	ifEEXl0TB+9rP8kygh8N+oUYy1s6rb9pGgQbei+s5Q/u7RJn/qpyx7Sf2Q5JMBP9+TjPc+DATrk
	vwx97WhmrtxaCR3d8OLhCgEEilLSHD4ub1mongUD38KDOXMBstGOWfloU+17csNw5vJQh8/U3hJ
	sKD90zTva/wEzETcnyLaLFg==
X-Received: by 2002:a05:690e:43da:b0:674:1fdd:6116 with SMTP id
 956f58d0204a3-67c567c2df5mr11617d50.100.1794240175917; Mon, 09 Nov 2026
 08:02:55 -0800 (PST)
MIME-Version: 1.0
References: <CAApg2=RBygWWkQi9HtLHAbzdyTJGb7SLo=RJn8tcFyve21LdRA@mail.gmail.com>
In-Reply-To: <CAApg2=RBygWWkQi9HtLHAbzdyTJGb7SLo=RJn8tcFyve21LdRA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Nov 2026 08:02:29 -0800
X-Gm-Features: AclHuK9hvS8UAAOCjUKVdghOrP88puj10j4s5d9MlPvgAO3tJclOxpb4rxPzQ5Q
Message-ID: <CAMKF1srwK1AFKj1dZWb4iHMaBOMdQPd+QiBswO=RY76vXYJRyg@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Security Advisory: CVE-2026-123158
 (openssh with musl)
To: rybczynska@gmail.com
Cc: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000053d082065fda18dd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 16:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249858

--00000000000053d082065fda18dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Marta, there is a long thread on it on musl ml -
https://www.openwall.com/lists/musl/2026/11/05/4
there are more packages that might need patching e.g. vsftp see -
https://github.com/InfrastructureServices/vsftpd/pull/9

On Mon, Nov 9, 2026 at 7:50=E2=80=AFAM Marta Rybczynska via openembedded-co=
re
<rybczynska=3Dgmail.com@lists.openembedded.org> wrote:

> Yocto Project Security Advisory:  CVE-2026-123158 (openssh with musl)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
> Published: 2026-11-09
> Version: 1.0
> CVE: CVE-2026-123158
> Severity: High
> Affected component: openembedded-core
>
> Description
> =3D=3D=3D=3D=3D=3D=3D=3D
> In OpenSSH before 10.6p2 with musl, in some specific configuration
> with pam disabled and password authentication enabled, password
> set as '*' (disabled), any password between 256 and 1024 characters
> succeeds.
>
> The issue affects systems running openssh with musl, and PAM disabled
> in the openssh configuration. Therefore, the issue does not affect the
> default OpenEmbedded configuration that
> uses glibc and not musl.
>
> The vulnerability of a system depends on the user configuration of
> system users. Accounts present by default have a configuration
> not allowing a remote login (except the root). The root account access
> is not affected if the default 'PermitRootLogin=3Dprohibit-password' stay=
s
> set. However, in the default configuration, PAM is disabled by default
> and password login is enabled by default.
>
> Affected releases
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - master, before commit 5247d0d8862c3402ac061fede5844da4d5c4be4c
> - blacksail, before commit 3bbd2a4f81f368ae7eac580949e4717f7aeb4f06
> (6.x up to 6.1 included)
> - wrynose, before commit 2285da08068a6d1b4a64c9a52d85a58be50e4679
> (6.0.x up to 6.0.4 included)
> - scarthgap (fix in progress)
>
> Mitigation
> =3D=3D=3D=3D=3D=3D=3D
> The recommended solution is to update (see the section above)
>
> If an update is not possible, and you are running a potentially affected
> system, follow one or more of those mitigations:
> - Make sure that for all accounts that have passwords disabled (* in
>   /etc/shadow), home directory and shell are set to values not allowing
>   system access even if a password were set, for example
>   :/nonexistent:/usr/sbin/nologin
> - Disable password authentication (key authentication is not affected)
> - Switch your ssh server temporarily to dropbear
> - Manually update openssh to v10.6p2 or later, or manually backport the
>    patch linked below.
>
> References:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> - CVE entry:
> https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/123xxx/CVE-20=
26-123158.json
> - Fix commit in openssh:
>
> https://github.com/openssh/openssh-portable/commit/4353fdc43ef646c43a8dda=
7025cc1a898caf1482
>
> Security contact: security@yoctoproject.org
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D
> 1.0 - initial advisory
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#249857):
> https://lists.openembedded.org/g/openembedded-core/message/249857
> Mute This Topic: https://lists.openembedded.org/mt/122176520/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000053d082065fda18dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Marta, there is a long thread on it on musl ml -=C2=
=A0<a href=3D"https://www.openwall.com/lists/musl/2026/11/05/4">https://www=
.openwall.com/lists/musl/2026/11/05/4</a><div>there are more packages that =
might need patching e.g. vsftp=C2=A0see -=C2=A0<a href=3D"https://github.co=
m/InfrastructureServices/vsftpd/pull/9">https://github.com/InfrastructureSe=
rvices/vsftpd/pull/9</a></div></div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 9, 2026 at =
7:50=E2=80=AFAM Marta Rybczynska via openembedded-core &lt;rybczynska=3D<a =
href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Yocto Project Security Advisory:=C2=A0 CVE-2026-123158 (openssh with =
musl)<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
<br>
Published: 2026-11-09<br>
Version: 1.0<br>
CVE: CVE-2026-123158<br>
Severity: High<br>
Affected component: openembedded-core<br>
<br>
Description<br>
=3D=3D=3D=3D=3D=3D=3D=3D<br>
In OpenSSH before 10.6p2 with musl, in some specific configuration<br>
with pam disabled and password authentication enabled, password<br>
set as &#39;*&#39; (disabled), any password between 256 and 1024 characters=
<br>
succeeds.<br>
<br>
The issue affects systems running openssh with musl, and PAM disabled<br>
in the openssh configuration. Therefore, the issue does not affect the<br>
default OpenEmbedded configuration that<br>
uses glibc and not musl.<br>
<br>
The vulnerability of a system depends on the user configuration of<br>
system users. Accounts present by default have a configuration<br>
not allowing a remote login (except the root). The root account access<br>
is not affected if the default &#39;PermitRootLogin=3Dprohibit-password&#39=
; stays<br>
set. However, in the default configuration, PAM is disabled by default<br>
and password login is enabled by default.<br>
<br>
Affected releases<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- master, before commit 5247d0d8862c3402ac061fede5844da4d5c4be4c<br>
- blacksail, before commit 3bbd2a4f81f368ae7eac580949e4717f7aeb4f06<br>
(6.x up to 6.1 included)<br>
- wrynose, before commit 2285da08068a6d1b4a64c9a52d85a58be50e4679<br>
(6.0.x up to 6.0.4 included)<br>
- scarthgap (fix in progress)<br>
<br>
Mitigation<br>
=3D=3D=3D=3D=3D=3D=3D<br>
The recommended solution is to update (see the section above)<br>
<br>
If an update is not possible, and you are running a potentially affected<br=
>
system, follow one or more of those mitigations:<br>
- Make sure that for all accounts that have passwords disabled (* in<br>
=C2=A0 /etc/shadow), home directory and shell are set to values not allowin=
g<br>
=C2=A0 system access even if a password were set, for example<br>
=C2=A0 :/nonexistent:/usr/sbin/nologin<br>
- Disable password authentication (key authentication is not affected)<br>
- Switch your ssh server temporarily to dropbear<br>
- Manually update openssh to v10.6p2 or later, or manually backport the<br>
=C2=A0 =C2=A0patch linked below.<br>
<br>
References:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- CVE entry: <a href=3D"https://github.com/CVEProject/cvelistV5/blob/main/c=
ves/2026/123xxx/CVE-2026-123158.json" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/123xxx/CVE-2026=
-123158.json</a><br>
- Fix commit in openssh:<br>
<a href=3D"https://github.com/openssh/openssh-portable/commit/4353fdc43ef64=
6c43a8dda7025cc1a898caf1482" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/openssh/openssh-portable/commit/4353fdc43ef646c43a8dda7025cc1a898=
caf1482</a><br>
<br>
Security contact: <a href=3D"mailto:security@yoctoproject.org" target=3D"_b=
lank">security@yoctoproject.org</a><br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D<br>
1.0 - initial advisory<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#249857): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/249857" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/249857</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122176520/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122176520/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000053d082065fda18dd--
