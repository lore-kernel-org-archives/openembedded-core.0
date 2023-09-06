Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7430EB8FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 08:23:50 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.3753.1693988623361896873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 01:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KWUww2r9;
 spf=pass (domain: mvista.com, ip: 209.85.208.182, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so52162541fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 01:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693988621; x=1694593421; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7HtZs8RorJ3CwGKYcToekWkJzea3eHsg58U5nbQj3c=;
        b=KWUww2r98Xbe2i6yTayj0hWKf3n+idmPJUGS7VojUo6pmWxzVf3ecRCOa4KvWdPrFn
         LgmEELJfH0Ixqt+olvAK9ECs+NnLwQwL/J2UkvcOJfU6L289tYWhCloYvq/CEiqlK/cv
         bY+vXFZelrlQ3Qc7PwavdbrDyzSRH30Dvcymk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693988621; x=1694593421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7HtZs8RorJ3CwGKYcToekWkJzea3eHsg58U5nbQj3c=;
        b=jB/PCO/dNUiHsieO0kA4+YvlQXX1V4rU0PGZ5v+fcCAIsKtr0extE7Gu+NhtE/LlaI
         duxqhwRg8EB23G2+GrHOYPiHJZLx6DyoV3oB5uLWF+RLy2etxZkiXeslzf9F/QUCWR5R
         mGmACrweCsGQCya6YlwM+OYJ8nK6DaVjBkUIuy5dUwIc8IS5khK/aZ7at6YXK4pAdbhu
         mDZzp7RGxeGkl0Jkh4uYRF9mkYRoy7rbAadDQCV1t0/XVsNQucavngl55lZnjTJPa2e8
         ELSmDKukFdqOFGySQVUvIM0eEQE6RbdSi6xk1+jKXZF5ly1ciwHE6I/cUvulKeeYnlFW
         jQDg==
X-Gm-Message-State: AOJu0Yy03Mja9JphBDbjqhqhCCQ6a0UMQovewmutguYghDQT6wZOevAW
	mWGMEsLE4QO+4yABYAGuwoiucpM4dgDYYtG+ZDrs7w==
X-Google-Smtp-Source: AGHT+IHQELedGV61mH4LhtjaTmb0M3A5e8D5pwgByxyl6AXHTcOsiSSqd5yjNvrDbfB/s9h5P1NF+ZZcd4WwbyHaLF4=
X-Received: by 2002:a2e:701a:0:b0:2b9:4413:864e with SMTP id
 l26-20020a2e701a000000b002b94413864emr1682056ljc.53.1693988620754; Wed, 06
 Sep 2023 01:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230906081530.176583-1-sdoshi@mvista.com>
In-Reply-To: <20230906081530.176583-1-sdoshi@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 6 Sep 2023 13:53:28 +0530
Message-ID: <CANQUz1_ncsyQ5dD-1XQsHt+QHFD2LY5=rLJUWn14kDjno=heJQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] inetutils: Security fix for CVE-2023-40303
To: sdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fe88930604ac7587"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 08:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187286

--000000000000fe88930604ac7587
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Siddharth,

CVE-2023-40303 patch for kirkstone already submitted and landed in
kirkstone-nut.

https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable/k=
irkstone-nut&id=3D2d2fc8e2b0eaa20f6bf8cfc0d1acd908f3dac2ec

Thanks & Regards,
Vjay

On Wed, Sep 6, 2023 at 1:45=E2=80=AFPM Siddharth via lists.openembedded.org=
 <sdoshi=3D
mvista.com@lists.openembedded.org> wrote:

> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Upstream-Status: Backport from [
> https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=3De4e65c03f4c1=
1292a3e40ef72ca3f194c8bffdd6
> ]
> CVE: CVE-2023-40303
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../inetutils/inetutils/CVE-2023-40303.patch  | 283 ++++++++++++++++++
>  .../inetutils/inetutils_2.2.bb                |   1 +
>  2 files changed, 284 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch
>
> diff --git
> a/meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch
> b/meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch
> new file mode 100644
> index 0000000000..06f7f2fc00
> --- /dev/null
> +++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch
> @@ -0,0 +1,283 @@
> +From e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6 Mon Sep 17 00:00:00 2001
> +From: Jeffrey Bencteux <jeffbencteux@gmail.com>
> +Date: Fri, 30 Jun 2023 19:02:45 +0200
> +Subject: ftpd,rcp,rlogin,rsh,rshd,uucpd: fix: check set*id() return valu=
es
> +
> +Several setuid(), setgid(), seteuid() and setguid() return values
> +were not checked in ftpd/rcp/rlogin/rsh/rshd/uucpd code potentially
> +leading to potential security issues.
> +
> +Signed-off-by: Jeffrey Bencteux <jeffbencteux@gmail.com>
> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
> +
> +Upstream-Status: Backport from [
> https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=3De4e65c03f4c1=
1292a3e40ef72ca3f194c8bffdd6
> ]
> +CVE: CVE-2023-40303
> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> +
> +---
> + ftpd/ftpd.c  | 10 +++++++---
> + src/rcp.c    | 39 +++++++++++++++++++++++++++++++++------
> + src/rlogin.c | 11 +++++++++--
> + src/rsh.c    | 25 +++++++++++++++++++++----
> + src/rshd.c   | 20 +++++++++++++++++---
> + src/uucpd.c  | 15 +++++++++++++--
> + 6 files changed, 100 insertions(+), 20 deletions(-)
> +
> +diff --git a/ftpd/ftpd.c b/ftpd/ftpd.c
> +index 68d41fd..703fbbc 100644
> +--- a/ftpd/ftpd.c
> ++++ b/ftpd/ftpd.c
> +@@ -865,7 +865,9 @@ end_login (struct credentials *pcred)
> +   char *remotehost =3D pcred->remotehost;
> +   int atype =3D pcred->auth_type;
> +
> +-  seteuid ((uid_t) 0);
> ++  if (seteuid ((uid_t) 0) =3D=3D -1)
> ++    _exit (EXIT_FAILURE);
> ++
> +   if (pcred->logged_in)
> +     {
> +       logwtmp_keep_open (ttyline, "", "");
> +@@ -1154,7 +1156,8 @@ getdatasock (const char *mode)
> +
> +   if (data >=3D 0)
> +     return fdopen (data, mode);
> +-  seteuid ((uid_t) 0);
> ++  if (seteuid ((uid_t) 0) =3D=3D -1)
> ++    _exit (EXIT_FAILURE);
> +   s =3D socket (ctrl_addr.ss_family, SOCK_STREAM, 0);
> +   if (s < 0)
> +     goto bad;
> +@@ -1981,7 +1984,8 @@ passive (int epsv, int af)
> +   else        /* !AF_INET6 */
> +     ((struct sockaddr_in *) &pasv_addr)->sin_port =3D 0;
> +
> +-  seteuid ((uid_t) 0);
> ++  if (seteuid ((uid_t) 0) =3D=3D -1)
> ++    _exit (EXIT_FAILURE);
> +   if (bind (pdata, (struct sockaddr *) &pasv_addr, pasv_addrlen) < 0)
> +     {
> +       if (seteuid ((uid_t) cred.uid))
> +diff --git a/src/rcp.c b/src/rcp.c
> +index 476cbaa..cd84570 100644
> +--- a/src/rcp.c
> ++++ b/src/rcp.c
> +@@ -348,14 +348,23 @@ main (int argc, char *argv[])
> +   if (from_option)
> +     {                         /* Follow "protocol", send data. */
> +       response ();
> +-      setuid (userid);
> ++
> ++      if (setuid (userid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> ++      }
> ++
> +       source (argc, argv);
> +       exit (errs);
> +     }
> +
> +   if (to_option)
> +     {                         /* Receive data. */
> +-      setuid (userid);
> ++      if (setuid (userid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> ++      }
> ++
> +       sink (argc, argv);
> +       exit (errs);
> +     }
> +@@ -540,7 +549,11 @@ toremote (char *targ, int argc, char *argv[])
> +             if (response () < 0)
> +               exit (EXIT_FAILURE);
> +             free (bp);
> +-            setuid (userid);
> ++
> ++            if (setuid (userid) =3D=3D -1)
> ++              {
> ++                error (EXIT_FAILURE, 0, "Could not drop privileges
> (setuid() failed)");
> ++              }
> +           }
> +         source (1, argv + i);
> +         close (rem);
> +@@ -633,7 +646,12 @@ tolocal (int argc, char *argv[])
> +         ++errs;
> +         continue;
> +       }
> +-      seteuid (userid);
> ++
> ++      if (seteuid (userid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> ++      }
> ++
> + #if defined IP_TOS && defined IPPROTO_IP && defined IPTOS_THROUGHPUT
> +       sslen =3D sizeof (ss);
> +       (void) getpeername (rem, (struct sockaddr *) &ss, &sslen);
> +@@ -646,7 +664,12 @@ tolocal (int argc, char *argv[])
> + #endif
> +       vect[0] =3D target;
> +       sink (1, vect);
> +-      seteuid (effuid);
> ++
> ++      if (seteuid (effuid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> ++      }
> ++
> +       close (rem);
> +       rem =3D -1;
> + #ifdef SHISHI
> +@@ -1444,7 +1467,11 @@ susystem (char *s, int userid)
> +       return (127);
> +
> +     case 0:
> +-      setuid (userid);
> ++      if (setuid (userid) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> ++      }
> ++
> +       execl (PATH_BSHELL, "sh", "-c", s, NULL);
> +       _exit (127);
> +     }
> +diff --git a/src/rlogin.c b/src/rlogin.c
> +index bdfcfa6..2addf49 100644
> +--- a/src/rlogin.c
> ++++ b/src/rlogin.c
> +@@ -650,8 +650,15 @@ try_connect:
> +   /* Now change to the real user ID.  We have to be set-user-ID root
> +      to get the privileged port that rcmd () uses.  We now want, howeve=
r,
> +      to run as the real user who invoked us.  */
> +-  seteuid (uid);
> +-  setuid (uid);
> ++  if (seteuid (uid) =3D=3D -1)
> ++  {
> ++    error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> ++  }
> ++
> ++  if (setuid (uid) =3D=3D -1)
> ++  {
> ++    error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> ++  }
> +
> +   doit (&osmask);     /* The old mask will activate SIGURG and SIGUSR1!
> */
> +
> +diff --git a/src/rsh.c b/src/rsh.c
> +index fa97e2a..6137ba7 100644
> +--- a/src/rsh.c
> ++++ b/src/rsh.c
> +@@ -279,8 +279,17 @@ main (int argc, char **argv)
> +     {
> +       if (asrsh)
> +       *argv =3D (char *) "rlogin";
> +-      seteuid (getuid ());
> +-      setuid (getuid ());
> ++
> ++      if (seteuid (getuid ()) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, errno, "seteuid() failed");
> ++      }
> ++
> ++      if (setuid (getuid ()) =3D=3D -1)
> ++      {
> ++        error (EXIT_FAILURE, errno, "setuid() failed");
> ++      }
> ++
> +       execv (PATH_RLOGIN, argv);
> +       error (EXIT_FAILURE, errno, "cannot execute %s", PATH_RLOGIN);
> +     }
> +@@ -544,8 +553,16 @@ try_connect:
> +       error (0, errno, "setsockopt DEBUG (ignored)");
> +     }
> +
> +-  seteuid (uid);
> +-  setuid (uid);
> ++  if (seteuid (uid) =3D=3D -1)
> ++  {
> ++    error (EXIT_FAILURE, errno, "seteuid() failed");
> ++  }
> ++
> ++  if (setuid (uid) =3D=3D -1)
> ++  {
> ++    error (EXIT_FAILURE, errno, "setuid() failed");
> ++  }
> ++
> + #ifdef HAVE_SIGACTION
> +   sigemptyset (&sigs);
> +   sigaddset (&sigs, SIGINT);
> +diff --git a/src/rshd.c b/src/rshd.c
> +index fed6f39..f6e74b9 100644
> +--- a/src/rshd.c
> ++++ b/src/rshd.c
> +@@ -1850,8 +1850,18 @@ doit (int sockfd, struct sockaddr *fromp,
> socklen_t fromlen)
> +     pwd->pw_shell =3D PATH_BSHELL;
> +
> +   /* Set the gid, then uid to become the user specified by "locuser" */
> +-  setegid ((gid_t) pwd->pw_gid);
> +-  setgid ((gid_t) pwd->pw_gid);
> ++  if (setegid ((gid_t) pwd->pw_gid) =3D=3D -1)
> ++  {
> ++    rshd_error ("Cannot drop privileges (setegid() failed)\n");
> ++    exit (EXIT_FAILURE);
> ++  }
> ++
> ++  if (setgid ((gid_t) pwd->pw_gid) =3D=3D -1)
> ++  {
> ++    rshd_error ("Cannot drop privileges (setgid() failed)\n");
> ++    exit (EXIT_FAILURE);
> ++  }
> ++
> + #ifdef HAVE_INITGROUPS
> +   initgroups (pwd->pw_name, pwd->pw_gid);     /* BSD groups */
> + #endif
> +@@ -1873,7 +1883,11 @@ doit (int sockfd, struct sockaddr *fromp,
> socklen_t fromlen)
> +     }
> + #endif /* WITH_PAM */
> +
> +-  setuid ((uid_t) pwd->pw_uid);
> ++  if (setuid ((uid_t) pwd->pw_uid) =3D=3D -1)
> ++  {
> ++    rshd_error ("Cannot drop privileges (setuid() failed)\n");
> ++    exit (EXIT_FAILURE);
> ++  }
> +
> +   /* We'll execute the client's command in the home directory
> +    * of locuser. Note, that the chdir must be executed after
> +diff --git a/src/uucpd.c b/src/uucpd.c
> +index c8bb460..5b76390 100644
> +--- a/src/uucpd.c
> ++++ b/src/uucpd.c
> +@@ -255,7 +255,12 @@ doit (struct sockaddr *sap, socklen_t salen)
> +   snprintf (Username, sizeof (Username), "USER=3D%s", user);
> +   snprintf (Logname, sizeof (Logname), "LOGNAME=3D%s", user);
> +   dologin (pw, sap, salen);
> +-  setgid (pw->pw_gid);
> ++
> ++  if (setgid (pw->pw_gid) =3D=3D -1)
> ++  {
> ++    fprintf (stderr, "setgid() failed");
> ++    return;
> ++  }
> + #ifdef HAVE_INITGROUPS
> +   initgroups (pw->pw_name, pw->pw_gid);
> + #endif
> +@@ -264,7 +269,13 @@ doit (struct sockaddr *sap, socklen_t salen)
> +       fprintf (stderr, "Login incorrect.");
> +       return;
> +     }
> +-  setuid (pw->pw_uid);
> ++
> ++  if (setuid (pw->pw_uid) =3D=3D -1)
> ++  {
> ++    fprintf (stderr, "setuid() failed");
> ++    return;
> ++  }
> ++
> +   execl (uucico_location, "uucico", NULL);
> +   perror ("uucico server: execl");
> + }
> +--
> +2.35.7
> +
> diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> index d8062e2b21..ee9def528b 100644
> --- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> +++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D
> "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
>             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
>             file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch=
 \
>             file://CVE-2022-39028.patch \
> +           file://CVE-2023-40303.patch \
>  "
>
>  inherit autotools gettext update-alternatives texinfo
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187285):
> https://lists.openembedded.org/g/openembedded-core/message/187285
> Mute This Topic: https://lists.openembedded.org/mt/101188627/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fe88930604ac7587
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Siddharth,</div><div><br></div><div>CVE-2023-40303=
 patch for kirkstone already submitted and landed in kirkstone-nut.</div><d=
iv><br></div><div><a href=3D"https://git.openembedded.org/openembedded-core=
-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3D2d2fc8e2b0eaa20f6bf8cfc0=
d1acd908f3dac2ec">https://git.openembedded.org/openembedded-core-contrib/co=
mmit/?h=3Dstable/kirkstone-nut&amp;id=3D2d2fc8e2b0eaa20f6bf8cfc0d1acd908f3d=
ac2ec</a></div><div><br></div><div>Thanks &amp; Regards,</div><div>Vjay<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Sep 6, 2023 at 1:45=E2=80=AFPM Siddharth via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;sdoshi=3D<a href=
=3D"mailto:mvista.com@lists.openembedded.org">mvista.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" target=
=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport from [<a href=3D"https://git.savannah.gnu.org/cgi=
t/inetutils.git/commit/?id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6" rel=
=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/inetuti=
ls.git/commit/?id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6</a>]<br>
CVE: CVE-2023-40303<br>
Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" tar=
get=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../inetutils/inetutils/CVE-2023-40303.patch=C2=A0 | 283 ++++++++++++=
++++++<br>
=C2=A0.../inetutils/<a href=3D"http://inetutils_2.2.bb" rel=3D"noreferrer" =
target=3D"_blank">inetutils_2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 284 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-=
2023-40303.patch<br>
<br>
diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.p=
atch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch<b=
r>
new file mode 100644<br>
index 0000000000..06f7f2fc00<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2023-40303.patch<br=
>
@@ -0,0 +1,283 @@<br>
+From e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6 Mon Sep 17 00:00:00 2001<br>
+From: Jeffrey Bencteux &lt;<a href=3D"mailto:jeffbencteux@gmail.com" targe=
t=3D"_blank">jeffbencteux@gmail.com</a>&gt;<br>
+Date: Fri, 30 Jun 2023 19:02:45 +0200<br>
+Subject: ftpd,rcp,rlogin,rsh,rshd,uucpd: fix: check set*id() return values=
<br>
+<br>
+Several setuid(), setgid(), seteuid() and setguid() return values<br>
+were not checked in ftpd/rcp/rlogin/rsh/rshd/uucpd code potentially<br>
+leading to potential security issues.<br>
+<br>
+Signed-off-by: Jeffrey Bencteux &lt;<a href=3D"mailto:jeffbencteux@gmail.c=
om" target=3D"_blank">jeffbencteux@gmail.com</a>&gt;<br>
+Signed-off-by: Simon Josefsson &lt;<a href=3D"mailto:simon@josefsson.org" =
target=3D"_blank">simon@josefsson.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport from [<a href=3D"https://git.savannah.gnu.org/cg=
it/inetutils.git/commit/?id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6" rel=
=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/inetuti=
ls.git/commit/?id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6</a>]<br>
+CVE: CVE-2023-40303<br>
+Signed-off-by: Siddharth Doshi &lt;<a href=3D"mailto:sdoshi@mvista.com" ta=
rget=3D"_blank">sdoshi@mvista.com</a>&gt;<br>
+<br>
+---<br>
+ ftpd/ftpd.c=C2=A0 | 10 +++++++---<br>
+ src/rcp.c=C2=A0 =C2=A0 | 39 +++++++++++++++++++++++++++++++++------<br>
+ src/rlogin.c | 11 +++++++++--<br>
+ src/rsh.c=C2=A0 =C2=A0 | 25 +++++++++++++++++++++----<br>
+ src/rshd.c=C2=A0 =C2=A0| 20 +++++++++++++++++---<br>
+ src/uucpd.c=C2=A0 | 15 +++++++++++++--<br>
+ 6 files changed, 100 insertions(+), 20 deletions(-)<br>
+<br>
+diff --git a/ftpd/ftpd.c b/ftpd/ftpd.c<br>
+index 68d41fd..703fbbc 100644<br>
+--- a/ftpd/ftpd.c<br>
++++ b/ftpd/ftpd.c<br>
+@@ -865,7 +865,9 @@ end_login (struct credentials *pcred)<br>
+=C2=A0 =C2=A0char *remotehost =3D pcred-&gt;remotehost;<br>
+=C2=A0 =C2=A0int atype =3D pcred-&gt;auth_type;<br>
+ <br>
+-=C2=A0 seteuid ((uid_t) 0);<br>
++=C2=A0 if (seteuid ((uid_t) 0) =3D=3D -1)<br>
++=C2=A0 =C2=A0 _exit (EXIT_FAILURE);<br>
++<br>
+=C2=A0 =C2=A0if (pcred-&gt;logged_in)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0logwtmp_keep_open (ttyline, &quot;&quot;, &quot=
;&quot;);<br>
+@@ -1154,7 +1156,8 @@ getdatasock (const char *mode)<br>
+ <br>
+=C2=A0 =C2=A0if (data &gt;=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0return fdopen (data, mode);<br>
+-=C2=A0 seteuid ((uid_t) 0);<br>
++=C2=A0 if (seteuid ((uid_t) 0) =3D=3D -1)<br>
++=C2=A0 =C2=A0 _exit (EXIT_FAILURE);<br>
+=C2=A0 =C2=A0s =3D socket (ctrl_addr.ss_family, SOCK_STREAM, 0);<br>
+=C2=A0 =C2=A0if (s &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0goto bad;<br>
+@@ -1981,7 +1984,8 @@ passive (int epsv, int af)<br>
+=C2=A0 =C2=A0else=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* !AF_INET6 */<br>
+=C2=A0 =C2=A0 =C2=A0((struct sockaddr_in *) &amp;pasv_addr)-&gt;sin_port =
=3D 0;<br>
+ <br>
+-=C2=A0 seteuid ((uid_t) 0);<br>
++=C2=A0 if (seteuid ((uid_t) 0) =3D=3D -1)<br>
++=C2=A0 =C2=A0 _exit (EXIT_FAILURE);<br>
+=C2=A0 =C2=A0if (bind (pdata, (struct sockaddr *) &amp;pasv_addr, pasv_add=
rlen) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seteuid ((uid_t) cred.uid))<br>
+diff --git a/src/rcp.c b/src/rcp.c<br>
+index 476cbaa..cd84570 100644<br>
+--- a/src/rcp.c<br>
++++ b/src/rcp.c<br>
+@@ -348,14 +348,23 @@ main (int argc, char *argv[])<br>
+=C2=A0 =C2=A0if (from_option)<br>
+=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Follow &quot;protocol&quot;, send =
data. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0response ();<br>
+-=C2=A0 =C2=A0 =C2=A0 setuid (userid);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (setuid (userid) =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop =
privileges (setuid() failed)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0source (argc, argv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit (errs);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0if (to_option)<br>
+=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Receive data. */<br>
+-=C2=A0 =C2=A0 =C2=A0 setuid (userid);<br>
++=C2=A0 =C2=A0 =C2=A0 if (setuid (userid) =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop =
privileges (setuid() failed)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sink (argc, argv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit (errs);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -540,7 +549,11 @@ toremote (char *targ, int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (response () &lt; 0)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit (EXIT_FAILURE)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (bp);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setuid (userid);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (setuid (userid) =3D=3D -1)<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILU=
RE, 0, &quot;Could not drop privileges (setuid() failed)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source (1, argv + i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close (rem);<br>
+@@ -633,7 +646,12 @@ tolocal (int argc, char *argv[])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++errs;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 seteuid (userid);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (seteuid (userid) =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop =
privileges (seteuid() failed)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+ #if defined IP_TOS &amp;&amp; defined IPPROTO_IP &amp;&amp; defined IPTOS=
_THROUGHPUT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sslen =3D sizeof (ss);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) getpeername (rem, (struct sockaddr *) &a=
mp;ss, &amp;sslen);<br>
+@@ -646,7 +664,12 @@ tolocal (int argc, char *argv[])<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vect[0] =3D target;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sink (1, vect);<br>
+-=C2=A0 =C2=A0 =C2=A0 seteuid (effuid);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (seteuid (effuid) =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop =
privileges (seteuid() failed)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0close (rem);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rem =3D -1;<br>
+ #ifdef SHISHI<br>
+@@ -1444,7 +1467,11 @@ susystem (char *s, int userid)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return (127);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0case 0:<br>
+-=C2=A0 =C2=A0 =C2=A0 setuid (userid);<br>
++=C2=A0 =C2=A0 =C2=A0 if (setuid (userid) =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop =
privileges (setuid() failed)&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0execl (PATH_BSHELL, &quot;sh&quot;, &quot;-c&qu=
ot;, s, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_exit (127);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/src/rlogin.c b/src/rlogin.c<br>
+index bdfcfa6..2addf49 100644<br>
+--- a/src/rlogin.c<br>
++++ b/src/rlogin.c<br>
+@@ -650,8 +650,15 @@ try_connect:<br>
+=C2=A0 =C2=A0/* Now change to the real user ID.=C2=A0 We have to be set-us=
er-ID root<br>
+=C2=A0 =C2=A0 =C2=A0 to get the privileged port that rcmd () uses.=C2=A0 W=
e now want, however,<br>
+=C2=A0 =C2=A0 =C2=A0 to run as the real user who invoked us.=C2=A0 */<br>
+-=C2=A0 seteuid (uid);<br>
+-=C2=A0 setuid (uid);<br>
++=C2=A0 if (seteuid (uid) =3D=3D -1)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop privileges (se=
teuid() failed)&quot;);<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 if (setuid (uid) =3D=3D -1)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop privileges (se=
tuid() failed)&quot;);<br>
++=C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0doit (&amp;osmask);=C2=A0 =C2=A0 =C2=A0/* The old mask will a=
ctivate SIGURG and SIGUSR1!=C2=A0 */<br>
+ <br>
+diff --git a/src/rsh.c b/src/rsh.c<br>
+index fa97e2a..6137ba7 100644<br>
+--- a/src/rsh.c<br>
++++ b/src/rsh.c<br>
+@@ -279,8 +279,17 @@ main (int argc, char **argv)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (asrsh)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*argv =3D (char *) &quot;rlogin&quot;;<br>
+-=C2=A0 =C2=A0 =C2=A0 seteuid (getuid ());<br>
+-=C2=A0 =C2=A0 =C2=A0 setuid (getuid ());<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (seteuid (getuid ()) =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;seteuid() f=
ailed&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (setuid (getuid ()) =3D=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;setuid() fa=
iled&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0execv (PATH_RLOGIN, argv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0error (EXIT_FAILURE, errno, &quot;cannot execut=
e %s&quot;, PATH_RLOGIN);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -544,8 +553,16 @@ try_connect:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0error (0, errno, &quot;setsockopt DEBUG (ignore=
d)&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 seteuid (uid);<br>
+-=C2=A0 setuid (uid);<br>
++=C2=A0 if (seteuid (uid) =3D=3D -1)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;seteuid() failed&quot;);<=
br>
++=C2=A0 }<br>
++<br>
++=C2=A0 if (setuid (uid) =3D=3D -1)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;setuid() failed&quot;);<b=
r>
++=C2=A0 }<br>
++<br>
+ #ifdef HAVE_SIGACTION<br>
+=C2=A0 =C2=A0sigemptyset (&amp;sigs);<br>
+=C2=A0 =C2=A0sigaddset (&amp;sigs, SIGINT);<br>
+diff --git a/src/rshd.c b/src/rshd.c<br>
+index fed6f39..f6e74b9 100644<br>
+--- a/src/rshd.c<br>
++++ b/src/rshd.c<br>
+@@ -1850,8 +1850,18 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t=
 fromlen)<br>
+=C2=A0 =C2=A0 =C2=A0pwd-&gt;pw_shell =3D PATH_BSHELL;<br>
+ <br>
+=C2=A0 =C2=A0/* Set the gid, then uid to become the user specified by &quo=
t;locuser&quot; */<br>
+-=C2=A0 setegid ((gid_t) pwd-&gt;pw_gid);<br>
+-=C2=A0 setgid ((gid_t) pwd-&gt;pw_gid);<br>
++=C2=A0 if (setegid ((gid_t) pwd-&gt;pw_gid) =3D=3D -1)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setegid() failed)=
\n&quot;);<br>
++=C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
++=C2=A0 }<br>
++<br>
++=C2=A0 if (setgid ((gid_t) pwd-&gt;pw_gid) =3D=3D -1)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setgid() failed)\=
n&quot;);<br>
++=C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
++=C2=A0 }<br>
++<br>
+ #ifdef HAVE_INITGROUPS<br>
+=C2=A0 =C2=A0initgroups (pwd-&gt;pw_name, pwd-&gt;pw_gid);=C2=A0 =C2=A0 =
=C2=A0/* BSD groups */<br>
+ #endif<br>
+@@ -1873,7 +1883,11 @@ doit (int sockfd, struct sockaddr *fromp, socklen_t=
 fromlen)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ #endif /* WITH_PAM */<br>
+ <br>
+-=C2=A0 setuid ((uid_t) pwd-&gt;pw_uid);<br>
++=C2=A0 if (setuid ((uid_t) pwd-&gt;pw_uid) =3D=3D -1)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setuid() failed)\=
n&quot;);<br>
++=C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
++=C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0/* We&#39;ll execute the client&#39;s command in the home dir=
ectory<br>
+=C2=A0 =C2=A0 * of locuser. Note, that the chdir must be executed after<br=
>
+diff --git a/src/uucpd.c b/src/uucpd.c<br>
+index c8bb460..5b76390 100644<br>
+--- a/src/uucpd.c<br>
++++ b/src/uucpd.c<br>
+@@ -255,7 +255,12 @@ doit (struct sockaddr *sap, socklen_t salen)<br>
+=C2=A0 =C2=A0snprintf (Username, sizeof (Username), &quot;USER=3D%s&quot;,=
 user);<br>
+=C2=A0 =C2=A0snprintf (Logname, sizeof (Logname), &quot;LOGNAME=3D%s&quot;=
, user);<br>
+=C2=A0 =C2=A0dologin (pw, sap, salen);<br>
+-=C2=A0 setgid (pw-&gt;pw_gid);<br>
++<br>
++=C2=A0 if (setgid (pw-&gt;pw_gid) =3D=3D -1)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 fprintf (stderr, &quot;setgid() failed&quot;);<br>
++=C2=A0 =C2=A0 return;<br>
++=C2=A0 }<br>
+ #ifdef HAVE_INITGROUPS<br>
+=C2=A0 =C2=A0initgroups (pw-&gt;pw_name, pw-&gt;pw_gid);<br>
+ #endif<br>
+@@ -264,7 +269,13 @@ doit (struct sockaddr *sap, socklen_t salen)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf (stderr, &quot;Login incorrect.&quot;);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 setuid (pw-&gt;pw_uid);<br>
++<br>
++=C2=A0 if (setuid (pw-&gt;pw_uid) =3D=3D -1)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 fprintf (stderr, &quot;setuid() failed&quot;);<br>
++=C2=A0 =C2=A0 return;<br>
++=C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0execl (uucico_location, &quot;uucico&quot;, NULL);<br>
+=C2=A0 =C2=A0perror (&quot;uucico server: execl&quot;);<br>
+ }<br>
+-- <br>
+2.35.7<br>
+<br>
diff --git a/meta/recipes-connectivity/inetutils/<a href=3D"http://inetutil=
s_2.2.bb" rel=3D"noreferrer" target=3D"_blank">inetutils_2.2.bb</a> b/meta/=
recipes-connectivity/inetutils/<a href=3D"http://inetutils_2.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">inetutils_2.2.bb</a><br>
index d8062e2b21..ee9def528b 100644<br>
--- a/meta/recipes-connectivity/inetutils/<a href=3D"http://inetutils_2.2.b=
b" rel=3D"noreferrer" target=3D"_blank">inetutils_2.2.bb</a><br>
+++ b/meta/recipes-connectivity/inetutils/<a href=3D"http://inetutils_2.2.b=
b" rel=3D"noreferrer" target=3D"_blank">inetutils_2.2.bb</a><br>
@@ -22,6 +22,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/inetutils/inetutils-${PV}=
.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://inetutils-1.9-PATH_PROCNET=
_DEV.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://inetutils-only-check-pam_a=
ppl.h-when-pam-enabled.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-39028.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-40303.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0inherit autotools gettext update-alternatives texinfo<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#187285): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/187285" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/187285</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101188627/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101188627/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000fe88930604ac7587--

