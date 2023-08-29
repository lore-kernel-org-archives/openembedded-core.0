Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80235C83F15
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 03:03:07 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.9697.1693278179908277869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 20:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CcesvD/+;
 spf=pass (domain: mvista.com, ip: 209.85.208.169, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bcc331f942so45853051fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 20:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693278178; x=1693882978; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ct1ok659Mz0xIqnc3aoNwYuXdMo8uHXKnFFeTbEwG0=;
        b=CcesvD/+bilqK6ut+lGtMVma3rHiQUbrpcrXXXIroWe+uSczHlj0nK0ItlfaaLJoFB
         li6qIYxGOAMRuv+0rxth6spYO4jm3gu9FI4HRXFy5n9+yWFnekLiA37YgAOYUCJTDMdL
         zsDo6J3mBMAprObo2JyshwN1Y9xQ18YfYOgo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693278178; x=1693882978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ct1ok659Mz0xIqnc3aoNwYuXdMo8uHXKnFFeTbEwG0=;
        b=PGScM+N3uVmmuVP5B/X2bSiYnO4Sn82UVPh4kFumSU6TSzbsvawBr3RaAeYlc4qogt
         ZV6yIVM8nE6Ff9qRj/m/ZDr2PLoBjfQZyeiOlnEKzZ5GIESHJAR48SYIayHfy+yFri9a
         v8pfB2OT72dxdn6OX99GjbAiQWQgoKy29GEFprFIqkYOgggzJ1GBtl9Az8egUriO7KWO
         MLOWMBCTw1iTH8MEWs5Y2BdItVy/jL9/sU8mowpq0LoQaBEQJg56OcKP1c2T4nN0QSsJ
         VmVsD83OVxkrde4wOVs9ElH14KKua4BSHZRKNthvC4G+hKdy7mqmkXH7797DCDke+aLZ
         3e0Q==
X-Gm-Message-State: AOJu0Yyjkz4IAk2HZwT0zuhkGkvWc7kENlxU2BtgZb3iG3CQkW/bmpFC
	24d+i4zFHhBw9eS5hU+VQpLulIl6X5JXPLALIPur1Q==
X-Google-Smtp-Source: AGHT+IGQyY0jGkZ7GqlFFsVJiU4o/4iQmHKjlnT7pu58N6brxGU9jbpCSkK8IUGEPKjjYB/tHrrugDYGNrdL69IG8wk=
X-Received: by 2002:a2e:b804:0:b0:2bc:c655:6f8f with SMTP id
 u4-20020a2eb804000000b002bcc6556f8fmr443312ljo.10.1693278177360; Mon, 28 Aug
 2023 20:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230828153920.3262399-1-vanusuri@mvista.com> <CAMKF1spm=4Ft_j03H9YNhHUtG1Pt=sTWaUWKLVdktmJe-S9FSQ@mail.gmail.com>
In-Reply-To: <CAMKF1spm=4Ft_j03H9YNhHUtG1Pt=sTWaUWKLVdktmJe-S9FSQ@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 29 Aug 2023 08:32:45 +0530
Message-ID: <CANQUz19N8O2Rikj8tT0_pmCpXNmpuN5Ma3CKx5p=81xQsMjSYQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] inetutils: Fix CVE-2023-40303
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004499b90604070cc4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 03:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186848

--0000000000004499b90604070cc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem Raj,

I have backported your patch for kirkstone and sent v2 patch for review.

https://lists.openembedded.org/g/openembedded-core/message/186847

Thanks & Regards,
Vijay

On Mon, Aug 28, 2023 at 10:42=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:

> I sent a patch for master already see
>
> https://lists.openembedded.org/g/openembedded-core/topic/patch_1_2_inetut=
ils_fix/100993486?p=3D,,,100,0,0,0::recentpostdate/sticky,,,100,2,0,1009934=
86,previd%3D1693242624210149855,nextid%3D1692981851065733310&previd=3D16932=
42624210149855&nextid=3D1692981851065733310
>
> you can send a direct backport of that for kirkstone.
>
> On Mon, Aug 28, 2023 at 8:39=E2=80=AFAM Vijay Anusuri via
> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Upstream-commit:
> https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=3De4e65c03f4c1=
1292a3e40ef72ca3f194c8bffdd6
> > &
> https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=3D9122999252c7=
e21eb7774de11d539748e7bdf46d
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  ...tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch | 282 ++++++++++++++++++
> >  ...03-Indent-changes-in-previous-commit.patch | 256 ++++++++++++++++
> >  .../inetutils/inetutils_2.2.bb                |   2 +
> >  3 files changed, 540 insertions(+)
> >  create mode 100644
> meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rc=
p-rlogin-rsh-rshd-uucpd-fix-ch.patch
> >  create mode 100644
> meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-=
changes-in-previous-commit.patch
> >
> > diff --git
> a/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-=
rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
> b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-=
rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
> > new file mode 100644
> > index 0000000000..0f388ec424
> > --- /dev/null
> > +++
> b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-=
rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
> > @@ -0,0 +1,282 @@
> > +From e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6 Mon Sep 17 00:00:00 2001
> > +From: Jeffrey Bencteux <jeffbencteux@gmail.com>
> > +Date: Fri, 30 Jun 2023 19:02:45 +0200
> > +Subject: [PATCH] CVE-2023-40303 ftpd,rcp,rlogin,rsh,rshd,uucpd: fix:
> check set*id() return values
> > +
> > +Several setuid(), setgid(), seteuid() and setguid() return values
> > +were not checked in ftpd/rcp/rlogin/rsh/rshd/uucpd code potentially
> > +leading to potential security issues.
> > +
> > +Signed-off-by: Jeffrey Bencteux <jeffbencteux@gmail.com>
> > +Signed-off-by: Simon Josefsson <simon@josefsson.org>
> > +
> > +Upstream-Status: Backport [
> https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=3De4e65c03f4c1=
1292a3e40ef72ca3f194c8bffdd6
> ]
> > +CVE: CVE-2023-40303
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + ftpd/ftpd.c  | 10 +++++++---
> > + src/rcp.c    | 39 +++++++++++++++++++++++++++++++++------
> > + src/rlogin.c | 11 +++++++++--
> > + src/rsh.c    | 25 +++++++++++++++++++++----
> > + src/rshd.c   | 20 +++++++++++++++++---
> > + src/uucpd.c  | 15 +++++++++++++--
> > + 6 files changed, 100 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/ftpd/ftpd.c b/ftpd/ftpd.c
> > +index 68d41fd..703fbbc 100644
> > +--- a/ftpd/ftpd.c
> > ++++ b/ftpd/ftpd.c
> > +@@ -865,7 +865,9 @@ end_login (struct credentials *pcred)
> > +   char *remotehost =3D pcred->remotehost;
> > +   int atype =3D pcred->auth_type;
> > +
> > +-  seteuid ((uid_t) 0);
> > ++  if (seteuid ((uid_t) 0) =3D=3D -1)
> > ++    _exit (EXIT_FAILURE);
> > ++
> > +   if (pcred->logged_in)
> > +     {
> > +       logwtmp_keep_open (ttyline, "", "");
> > +@@ -1154,7 +1156,8 @@ getdatasock (const char *mode)
> > +
> > +   if (data >=3D 0)
> > +     return fdopen (data, mode);
> > +-  seteuid ((uid_t) 0);
> > ++  if (seteuid ((uid_t) 0) =3D=3D -1)
> > ++    _exit (EXIT_FAILURE);
> > +   s =3D socket (ctrl_addr.ss_family, SOCK_STREAM, 0);
> > +   if (s < 0)
> > +     goto bad;
> > +@@ -1981,7 +1984,8 @@ passive (int epsv, int af)
> > +   else        /* !AF_INET6 */
> > +     ((struct sockaddr_in *) &pasv_addr)->sin_port =3D 0;
> > +
> > +-  seteuid ((uid_t) 0);
> > ++  if (seteuid ((uid_t) 0) =3D=3D -1)
> > ++    _exit (EXIT_FAILURE);
> > +   if (bind (pdata, (struct sockaddr *) &pasv_addr, pasv_addrlen) < 0)
> > +     {
> > +       if (seteuid ((uid_t) cred.uid))
> > +diff --git a/src/rcp.c b/src/rcp.c
> > +index 476cbaa..cd84570 100644
> > +--- a/src/rcp.c
> > ++++ b/src/rcp.c
> > +@@ -348,14 +348,23 @@ main (int argc, char *argv[])
> > +   if (from_option)
> > +     {                         /* Follow "protocol", send data. */
> > +       response ();
> > +-      setuid (userid);
> > ++
> > ++      if (setuid (userid) =3D=3D -1)
> > ++      {
> > ++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> > ++      }
> > ++
> > +       source (argc, argv);
> > +       exit (errs);
> > +     }
> > +
> > +   if (to_option)
> > +     {                         /* Receive data. */
> > +-      setuid (userid);
> > ++      if (setuid (userid) =3D=3D -1)
> > ++      {
> > ++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> > ++      }
> > ++
> > +       sink (argc, argv);
> > +       exit (errs);
> > +     }
> > +@@ -540,7 +549,11 @@ toremote (char *targ, int argc, char *argv[])
> > +             if (response () < 0)
> > +               exit (EXIT_FAILURE);
> > +             free (bp);
> > +-            setuid (userid);
> > ++
> > ++            if (setuid (userid) =3D=3D -1)
> > ++              {
> > ++                error (EXIT_FAILURE, 0, "Could not drop privileges
> (setuid() failed)");
> > ++              }
> > +           }
> > +         source (1, argv + i);
> > +         close (rem);
> > +@@ -633,7 +646,12 @@ tolocal (int argc, char *argv[])
> > +         ++errs;
> > +         continue;
> > +       }
> > +-      seteuid (userid);
> > ++
> > ++      if (seteuid (userid) =3D=3D -1)
> > ++      {
> > ++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> > ++      }
> > ++
> > + #if defined IP_TOS && defined IPPROTO_IP && defined IPTOS_THROUGHPUT
> > +       sslen =3D sizeof (ss);
> > +       (void) getpeername (rem, (struct sockaddr *) &ss, &sslen);
> > +@@ -646,7 +664,12 @@ tolocal (int argc, char *argv[])
> > + #endif
> > +       vect[0] =3D target;
> > +       sink (1, vect);
> > +-      seteuid (effuid);
> > ++
> > ++      if (seteuid (effuid) =3D=3D -1)
> > ++      {
> > ++        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> > ++      }
> > ++
> > +       close (rem);
> > +       rem =3D -1;
> > + #ifdef SHISHI
> > +@@ -1444,7 +1467,11 @@ susystem (char *s, int userid)
> > +       return (127);
> > +
> > +     case 0:
> > +-      setuid (userid);
> > ++      if (setuid (userid) =3D=3D -1)
> > ++      {
> > ++        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> > ++      }
> > ++
> > +       execl (PATH_BSHELL, "sh", "-c", s, NULL);
> > +       _exit (127);
> > +     }
> > +diff --git a/src/rlogin.c b/src/rlogin.c
> > +index bdfcfa6..2addf49 100644
> > +--- a/src/rlogin.c
> > ++++ b/src/rlogin.c
> > +@@ -650,8 +650,15 @@ try_connect:
> > +   /* Now change to the real user ID.  We have to be set-user-ID root
> > +      to get the privileged port that rcmd () uses.  We now want,
> however,
> > +      to run as the real user who invoked us.  */
> > +-  seteuid (uid);
> > +-  setuid (uid);
> > ++  if (seteuid (uid) =3D=3D -1)
> > ++  {
> > ++    error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> > ++  }
> > ++
> > ++  if (setuid (uid) =3D=3D -1)
> > ++  {
> > ++    error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> > ++  }
> > +
> > +   doit (&osmask);     /* The old mask will activate SIGURG and
> SIGUSR1!  */
> > +
> > +diff --git a/src/rsh.c b/src/rsh.c
> > +index fa97e2a..6137ba7 100644
> > +--- a/src/rsh.c
> > ++++ b/src/rsh.c
> > +@@ -279,8 +279,17 @@ main (int argc, char **argv)
> > +     {
> > +       if (asrsh)
> > +       *argv =3D (char *) "rlogin";
> > +-      seteuid (getuid ());
> > +-      setuid (getuid ());
> > ++
> > ++      if (seteuid (getuid ()) =3D=3D -1)
> > ++      {
> > ++        error (EXIT_FAILURE, errno, "seteuid() failed");
> > ++      }
> > ++
> > ++      if (setuid (getuid ()) =3D=3D -1)
> > ++      {
> > ++        error (EXIT_FAILURE, errno, "setuid() failed");
> > ++      }
> > ++
> > +       execv (PATH_RLOGIN, argv);
> > +       error (EXIT_FAILURE, errno, "cannot execute %s", PATH_RLOGIN);
> > +     }
> > +@@ -544,8 +553,16 @@ try_connect:
> > +       error (0, errno, "setsockopt DEBUG (ignored)");
> > +     }
> > +
> > +-  seteuid (uid);
> > +-  setuid (uid);
> > ++  if (seteuid (uid) =3D=3D -1)
> > ++  {
> > ++    error (EXIT_FAILURE, errno, "seteuid() failed");
> > ++  }
> > ++
> > ++  if (setuid (uid) =3D=3D -1)
> > ++  {
> > ++    error (EXIT_FAILURE, errno, "setuid() failed");
> > ++  }
> > ++
> > + #ifdef HAVE_SIGACTION
> > +   sigemptyset (&sigs);
> > +   sigaddset (&sigs, SIGINT);
> > +diff --git a/src/rshd.c b/src/rshd.c
> > +index fed6f39..f6e74b9 100644
> > +--- a/src/rshd.c
> > ++++ b/src/rshd.c
> > +@@ -1850,8 +1850,18 @@ doit (int sockfd, struct sockaddr *fromp,
> socklen_t fromlen)
> > +     pwd->pw_shell =3D PATH_BSHELL;
> > +
> > +   /* Set the gid, then uid to become the user specified by "locuser" =
*/
> > +-  setegid ((gid_t) pwd->pw_gid);
> > +-  setgid ((gid_t) pwd->pw_gid);
> > ++  if (setegid ((gid_t) pwd->pw_gid) =3D=3D -1)
> > ++  {
> > ++    rshd_error ("Cannot drop privileges (setegid() failed)\n");
> > ++    exit (EXIT_FAILURE);
> > ++  }
> > ++
> > ++  if (setgid ((gid_t) pwd->pw_gid) =3D=3D -1)
> > ++  {
> > ++    rshd_error ("Cannot drop privileges (setgid() failed)\n");
> > ++    exit (EXIT_FAILURE);
> > ++  }
> > ++
> > + #ifdef HAVE_INITGROUPS
> > +   initgroups (pwd->pw_name, pwd->pw_gid);     /* BSD groups */
> > + #endif
> > +@@ -1873,7 +1883,11 @@ doit (int sockfd, struct sockaddr *fromp,
> socklen_t fromlen)
> > +     }
> > + #endif /* WITH_PAM */
> > +
> > +-  setuid ((uid_t) pwd->pw_uid);
> > ++  if (setuid ((uid_t) pwd->pw_uid) =3D=3D -1)
> > ++  {
> > ++    rshd_error ("Cannot drop privileges (setuid() failed)\n");
> > ++    exit (EXIT_FAILURE);
> > ++  }
> > +
> > +   /* We'll execute the client's command in the home directory
> > +    * of locuser. Note, that the chdir must be executed after
> > +diff --git a/src/uucpd.c b/src/uucpd.c
> > +index c8bb460..5b76390 100644
> > +--- a/src/uucpd.c
> > ++++ b/src/uucpd.c
> > +@@ -255,7 +255,12 @@ doit (struct sockaddr *sap, socklen_t salen)
> > +   snprintf (Username, sizeof (Username), "USER=3D%s", user);
> > +   snprintf (Logname, sizeof (Logname), "LOGNAME=3D%s", user);
> > +   dologin (pw, sap, salen);
> > +-  setgid (pw->pw_gid);
> > ++
> > ++  if (setgid (pw->pw_gid) =3D=3D -1)
> > ++  {
> > ++    fprintf (stderr, "setgid() failed");
> > ++    return;
> > ++  }
> > + #ifdef HAVE_INITGROUPS
> > +   initgroups (pw->pw_name, pw->pw_gid);
> > + #endif
> > +@@ -264,7 +269,13 @@ doit (struct sockaddr *sap, socklen_t salen)
> > +       fprintf (stderr, "Login incorrect.");
> > +       return;
> > +     }
> > +-  setuid (pw->pw_uid);
> > ++
> > ++  if (setuid (pw->pw_uid) =3D=3D -1)
> > ++  {
> > ++    fprintf (stderr, "setuid() failed");
> > ++    return;
> > ++  }
> > ++
> > +   execl (uucico_location, "uucico", NULL);
> > +   perror ("uucico server: execl");
> > + }
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Inden=
t-changes-in-previous-commit.patch
> b/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Inden=
t-changes-in-previous-commit.patch
> > new file mode 100644
> > index 0000000000..2628487ff8
> > --- /dev/null
> > +++
> b/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Inden=
t-changes-in-previous-commit.patch
> > @@ -0,0 +1,256 @@
> > +From 70fe022f9dac760eaece0228cad17e3d29a57fb8 Mon Sep 17 00:00:00 2001
> > +From: Simon Josefsson <simon@josefsson.org>
> > +Date: Mon, 31 Jul 2023 13:59:05 +0200
> > +Subject: [PATCH] CVE-2023-40303: Indent changes in previous commit.
> > +
> > +Upstream-Status: Backport [
> https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=3D9122999252c7=
e21eb7774de11d539748e7bdf46d
> ]
> > +CVE: CVE-2023-40303
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + src/rcp.c    | 42 ++++++++++++++++++++++++------------------
> > + src/rlogin.c | 12 ++++++------
> > + src/rsh.c    | 24 ++++++++++++------------
> > + src/rshd.c   | 24 ++++++++++++------------
> > + src/uucpd.c  | 16 ++++++++--------
> > + 5 files changed, 62 insertions(+), 56 deletions(-)
> > +
> > +diff --git a/src/rcp.c b/src/rcp.c
> > +index cd84570..50196c6 100644
> > +--- a/src/rcp.c
> > ++++ b/src/rcp.c
> > +@@ -350,9 +350,10 @@ main (int argc, char *argv[])
> > +       response ();
> > +
> > +       if (setuid (userid) =3D=3D -1)
> > +-      {
> > +-        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> > +-      }
> > ++      {
> > ++        error (EXIT_FAILURE, 0,
> > ++               "Could not drop privileges (setuid() failed)");
> > ++      }
> > +
> > +       source (argc, argv);
> > +       exit (errs);
> > +@@ -361,9 +362,10 @@ main (int argc, char *argv[])
> > +   if (to_option)
> > +     {                         /* Receive data. */
> > +       if (setuid (userid) =3D=3D -1)
> > +-      {
> > +-        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> > +-      }
> > ++      {
> > ++        error (EXIT_FAILURE, 0,
> > ++               "Could not drop privileges (setuid() failed)");
> > ++      }
> > +
> > +       sink (argc, argv);
> > +       exit (errs);
> > +@@ -551,9 +553,10 @@ toremote (char *targ, int argc, char *argv[])
> > +             free (bp);
> > +
> > +             if (setuid (userid) =3D=3D -1)
> > +-              {
> > +-                error (EXIT_FAILURE, 0, "Could not drop privileges
> (setuid() failed)");
> > +-              }
> > ++              {
> > ++                error (EXIT_FAILURE, 0,
> > ++                       "Could not drop privileges (setuid() failed)")=
;
> > ++              }
> > +           }
> > +         source (1, argv + i);
> > +         close (rem);
> > +@@ -648,9 +651,10 @@ tolocal (int argc, char *argv[])
> > +       }
> > +
> > +       if (seteuid (userid) =3D=3D -1)
> > +-      {
> > +-        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> > +-      }
> > ++      {
> > ++        error (EXIT_FAILURE, 0,
> > ++               "Could not drop privileges (seteuid() failed)");
> > ++      }
> > +
> > + #if defined IP_TOS && defined IPPROTO_IP && defined IPTOS_THROUGHPUT
> > +       sslen =3D sizeof (ss);
> > +@@ -666,9 +670,10 @@ tolocal (int argc, char *argv[])
> > +       sink (1, vect);
> > +
> > +       if (seteuid (effuid) =3D=3D -1)
> > +-      {
> > +-        error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> > +-      }
> > ++      {
> > ++        error (EXIT_FAILURE, 0,
> > ++               "Could not drop privileges (seteuid() failed)");
> > ++      }
> > +
> > +       close (rem);
> > +       rem =3D -1;
> > +@@ -1468,9 +1473,10 @@ susystem (char *s, int userid)
> > +
> > +     case 0:
> > +       if (setuid (userid) =3D=3D -1)
> > +-      {
> > +-        error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> > +-      }
> > ++      {
> > ++        error (EXIT_FAILURE, 0,
> > ++               "Could not drop privileges (setuid() failed)");
> > ++      }
> > +
> > +       execl (PATH_BSHELL, "sh", "-c", s, NULL);
> > +       _exit (127);
> > +diff --git a/src/rlogin.c b/src/rlogin.c
> > +index 2addf49..15d6f14 100644
> > +--- a/src/rlogin.c
> > ++++ b/src/rlogin.c
> > +@@ -651,14 +651,14 @@ try_connect:
> > +      to get the privileged port that rcmd () uses.  We now want,
> however,
> > +      to run as the real user who invoked us.  */
> > +   if (seteuid (uid) =3D=3D -1)
> > +-  {
> > +-    error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> > +-  }
> > ++    {
> > ++      error (EXIT_FAILURE, 0, "Could not drop privileges (seteuid()
> failed)");
> > ++    }
> > +
> > +   if (setuid (uid) =3D=3D -1)
> > +-  {
> > +-    error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> > +-  }
> > ++    {
> > ++      error (EXIT_FAILURE, 0, "Could not drop privileges (setuid()
> failed)");
> > ++    }
> > +
> > +   doit (&osmask);     /* The old mask will activate SIGURG and
> SIGUSR1!  */
> > +
> > +diff --git a/src/rsh.c b/src/rsh.c
> > +index 6137ba7..138d98e 100644
> > +--- a/src/rsh.c
> > ++++ b/src/rsh.c
> > +@@ -281,14 +281,14 @@ main (int argc, char **argv)
> > +       *argv =3D (char *) "rlogin";
> > +
> > +       if (seteuid (getuid ()) =3D=3D -1)
> > +-      {
> > +-        error (EXIT_FAILURE, errno, "seteuid() failed");
> > +-      }
> > ++      {
> > ++        error (EXIT_FAILURE, errno, "seteuid() failed");
> > ++      }
> > +
> > +       if (setuid (getuid ()) =3D=3D -1)
> > +-      {
> > +-        error (EXIT_FAILURE, errno, "setuid() failed");
> > +-      }
> > ++      {
> > ++        error (EXIT_FAILURE, errno, "setuid() failed");
> > ++      }
> > +
> > +       execv (PATH_RLOGIN, argv);
> > +       error (EXIT_FAILURE, errno, "cannot execute %s", PATH_RLOGIN);
> > +@@ -554,14 +554,14 @@ try_connect:
> > +     }
> > +
> > +   if (seteuid (uid) =3D=3D -1)
> > +-  {
> > +-    error (EXIT_FAILURE, errno, "seteuid() failed");
> > +-  }
> > ++    {
> > ++      error (EXIT_FAILURE, errno, "seteuid() failed");
> > ++    }
> > +
> > +   if (setuid (uid) =3D=3D -1)
> > +-  {
> > +-    error (EXIT_FAILURE, errno, "setuid() failed");
> > +-  }
> > ++    {
> > ++      error (EXIT_FAILURE, errno, "setuid() failed");
> > ++    }
> > +
> > + #ifdef HAVE_SIGACTION
> > +   sigemptyset (&sigs);
> > +diff --git a/src/rshd.c b/src/rshd.c
> > +index f6e74b9..cf3ee79 100644
> > +--- a/src/rshd.c
> > ++++ b/src/rshd.c
> > +@@ -1851,16 +1851,16 @@ doit (int sockfd, struct sockaddr *fromp,
> socklen_t fromlen)
> > +
> > +   /* Set the gid, then uid to become the user specified by "locuser" =
*/
> > +   if (setegid ((gid_t) pwd->pw_gid) =3D=3D -1)
> > +-  {
> > +-    rshd_error ("Cannot drop privileges (setegid() failed)\n");
> > +-    exit (EXIT_FAILURE);
> > +-  }
> > ++    {
> > ++      rshd_error ("Cannot drop privileges (setegid() failed)\n");
> > ++      exit (EXIT_FAILURE);
> > ++    }
> > +
> > +   if (setgid ((gid_t) pwd->pw_gid) =3D=3D -1)
> > +-  {
> > +-    rshd_error ("Cannot drop privileges (setgid() failed)\n");
> > +-    exit (EXIT_FAILURE);
> > +-  }
> > ++    {
> > ++      rshd_error ("Cannot drop privileges (setgid() failed)\n");
> > ++      exit (EXIT_FAILURE);
> > ++    }
> > +
> > + #ifdef HAVE_INITGROUPS
> > +   initgroups (pwd->pw_name, pwd->pw_gid);     /* BSD groups */
> > +@@ -1884,10 +1884,10 @@ doit (int sockfd, struct sockaddr *fromp,
> socklen_t fromlen)
> > + #endif /* WITH_PAM */
> > +
> > +   if (setuid ((uid_t) pwd->pw_uid) =3D=3D -1)
> > +-  {
> > +-    rshd_error ("Cannot drop privileges (setuid() failed)\n");
> > +-    exit (EXIT_FAILURE);
> > +-  }
> > ++    {
> > ++      rshd_error ("Cannot drop privileges (setuid() failed)\n");
> > ++      exit (EXIT_FAILURE);
> > ++    }
> > +
> > +   /* We'll execute the client's command in the home directory
> > +    * of locuser. Note, that the chdir must be executed after
> > +diff --git a/src/uucpd.c b/src/uucpd.c
> > +index 5b76390..abbb02d 100644
> > +--- a/src/uucpd.c
> > ++++ b/src/uucpd.c
> > +@@ -257,10 +257,10 @@ doit (struct sockaddr *sap, socklen_t salen)
> > +   dologin (pw, sap, salen);
> > +
> > +   if (setgid (pw->pw_gid) =3D=3D -1)
> > +-  {
> > +-    fprintf (stderr, "setgid() failed");
> > +-    return;
> > +-  }
> > ++    {
> > ++      fprintf (stderr, "setgid() failed");
> > ++      return;
> > ++    }
> > + #ifdef HAVE_INITGROUPS
> > +   initgroups (pw->pw_name, pw->pw_gid);
> > + #endif
> > +@@ -271,10 +271,10 @@ doit (struct sockaddr *sap, socklen_t salen)
> > +     }
> > +
> > +   if (setuid (pw->pw_uid) =3D=3D -1)
> > +-  {
> > +-    fprintf (stderr, "setuid() failed");
> > +-    return;
> > +-  }
> > ++    {
> > ++      fprintf (stderr, "setuid() failed");
> > ++      return;
> > ++    }
> > +
> > +   execl (uucico_location, "uucico", NULL);
> > +   perror ("uucico server: execl");
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> > index d8062e2b21..6f9173dbc1 100644
> > --- a/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> > +++ b/meta/recipes-connectivity/inetutils/inetutils_2.2.bb
> > @@ -22,6 +22,8 @@ SRC_URI =3D
> "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
> >             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
> >
>  file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
> >             file://CVE-2022-39028.patch \
> > +
>  file://0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch \
> > +
>  file://0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch \
> >  "
> >
> >  inherit autotools gettext update-alternatives texinfo
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186834):
> https://lists.openembedded.org/g/openembedded-core/message/186834
> > Mute This Topic: https://lists.openembedded.org/mt/101012524/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000004499b90604070cc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Khem Raj,</div><div><br></div><div>I have backport=
ed your patch for kirkstone and sent v2 patch for review.</div><div><br></d=
iv><div><a href=3D"https://lists.openembedded.org/g/openembedded-core/messa=
ge/186847">https://lists.openembedded.org/g/openembedded-core/message/18684=
7</a></div><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Aug 28, 2023 at 10:42=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">I sent a patch for master already see=
<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/patch_1=
_2_inetutils_fix/100993486?p=3D,,,100,0,0,0::recentpostdate/sticky,,,100,2,=
0,100993486,previd%3D1693242624210149855,nextid%3D1692981851065733310&amp;p=
revid=3D1693242624210149855&amp;nextid=3D1692981851065733310" rel=3D"norefe=
rrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/=
topic/patch_1_2_inetutils_fix/100993486?p=3D,,,100,0,0,0::recentpostdate/st=
icky,,,100,2,0,100993486,previd%3D1693242624210149855,nextid%3D169298185106=
5733310&amp;previd=3D1693242624210149855&amp;nextid=3D1692981851065733310</=
a><br>
<br>
you can send a direct backport of that for kirkstone.<br>
<br>
On Mon, Aug 28, 2023 at 8:39=E2=80=AFAM Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Upstream-commit: <a href=3D"https://git.savannah.gnu.org/cgit/inetutil=
s.git/commit/?id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6" rel=3D"norefer=
rer" target=3D"_blank">https://git.savannah.gnu.org/cgit/inetutils.git/comm=
it/?id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6</a><br>
&gt; &amp; <a href=3D"https://git.savannah.gnu.org/cgit/inetutils.git/commi=
t/?id=3D9122999252c7e21eb7774de11d539748e7bdf46d" rel=3D"noreferrer" target=
=3D"_blank">https://git.savannah.gnu.org/cgit/inetutils.git/commit/?id=3D91=
22999252c7e21eb7774de11d539748e7bdf46d</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch | 282 ++++++++++++=
++++++<br>
&gt;=C2=A0 ...03-Indent-changes-in-previous-commit.patch | 256 ++++++++++++=
++++<br>
&gt;=C2=A0 .../inetutils/<a href=3D"http://inetutils_2.2.bb" rel=3D"norefer=
rer" target=3D"_blank">inetutils_2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 3 files changed, 540 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/inetutils/inetutils=
/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/inetutils/inetutils=
/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-20=
23-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch b/meta/recipes-connect=
ivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucp=
d-fix-ch.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0f388ec424<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-4030=
3-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch<br>
&gt; @@ -0,0 +1,282 @@<br>
&gt; +From e4e65c03f4c11292a3e40ef72ca3f194c8bffdd6 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jeffrey Bencteux &lt;<a href=3D"mailto:jeffbencteux@gmail.com" =
target=3D"_blank">jeffbencteux@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 30 Jun 2023 19:02:45 +0200<br>
&gt; +Subject: [PATCH] CVE-2023-40303 ftpd,rcp,rlogin,rsh,rshd,uucpd: fix: =
check set*id() return values<br>
&gt; +<br>
&gt; +Several setuid(), setgid(), seteuid() and setguid() return values<br>
&gt; +were not checked in ftpd/rcp/rlogin/rsh/rshd/uucpd code potentially<b=
r>
&gt; +leading to potential security issues.<br>
&gt; +<br>
&gt; +Signed-off-by: Jeffrey Bencteux &lt;<a href=3D"mailto:jeffbencteux@gm=
ail.com" target=3D"_blank">jeffbencteux@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Simon Josefsson &lt;<a href=3D"mailto:simon@josefsson.=
org" target=3D"_blank">simon@josefsson.org</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://git.savannah.gnu.org/cg=
it/inetutils.git/commit/?id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6" rel=
=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/inetuti=
ls.git/commit/?id=3De4e65c03f4c11292a3e40ef72ca3f194c8bffdd6</a>]<br>
&gt; +CVE: CVE-2023-40303<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + ftpd/ftpd.c=C2=A0 | 10 +++++++---<br>
&gt; + src/rcp.c=C2=A0 =C2=A0 | 39 +++++++++++++++++++++++++++++++++------<=
br>
&gt; + src/rlogin.c | 11 +++++++++--<br>
&gt; + src/rsh.c=C2=A0 =C2=A0 | 25 +++++++++++++++++++++----<br>
&gt; + src/rshd.c=C2=A0 =C2=A0| 20 +++++++++++++++++---<br>
&gt; + src/uucpd.c=C2=A0 | 15 +++++++++++++--<br>
&gt; + 6 files changed, 100 insertions(+), 20 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/ftpd/ftpd.c b/ftpd/ftpd.c<br>
&gt; +index 68d41fd..703fbbc 100644<br>
&gt; +--- a/ftpd/ftpd.c<br>
&gt; ++++ b/ftpd/ftpd.c<br>
&gt; +@@ -865,7 +865,9 @@ end_login (struct credentials *pcred)<br>
&gt; +=C2=A0 =C2=A0char *remotehost =3D pcred-&gt;remotehost;<br>
&gt; +=C2=A0 =C2=A0int atype =3D pcred-&gt;auth_type;<br>
&gt; +<br>
&gt; +-=C2=A0 seteuid ((uid_t) 0);<br>
&gt; ++=C2=A0 if (seteuid ((uid_t) 0) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 _exit (EXIT_FAILURE);<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0if (pcred-&gt;logged_in)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0logwtmp_keep_open (ttyline, &quot;&quot;, =
&quot;&quot;);<br>
&gt; +@@ -1154,7 +1156,8 @@ getdatasock (const char *mode)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (data &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return fdopen (data, mode);<br>
&gt; +-=C2=A0 seteuid ((uid_t) 0);<br>
&gt; ++=C2=A0 if (seteuid ((uid_t) 0) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 _exit (EXIT_FAILURE);<br>
&gt; +=C2=A0 =C2=A0s =3D socket (ctrl_addr.ss_family, SOCK_STREAM, 0);<br>
&gt; +=C2=A0 =C2=A0if (s &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0goto bad;<br>
&gt; +@@ -1981,7 +1984,8 @@ passive (int epsv, int af)<br>
&gt; +=C2=A0 =C2=A0else=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* !AF_INET6 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0((struct sockaddr_in *) &amp;pasv_addr)-&gt;sin_p=
ort =3D 0;<br>
&gt; +<br>
&gt; +-=C2=A0 seteuid ((uid_t) 0);<br>
&gt; ++=C2=A0 if (seteuid ((uid_t) 0) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 _exit (EXIT_FAILURE);<br>
&gt; +=C2=A0 =C2=A0if (bind (pdata, (struct sockaddr *) &amp;pasv_addr, pas=
v_addrlen) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seteuid ((uid_t) cred.uid))<br>
&gt; +diff --git a/src/rcp.c b/src/rcp.c<br>
&gt; +index 476cbaa..cd84570 100644<br>
&gt; +--- a/src/rcp.c<br>
&gt; ++++ b/src/rcp.c<br>
&gt; +@@ -348,14 +348,23 @@ main (int argc, char *argv[])<br>
&gt; +=C2=A0 =C2=A0if (from_option)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Follow &quot;protocol&quot;, s=
end data. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0response ();<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 setuid (userid);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (setuid (userid) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (setuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0source (argc, argv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0exit (errs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (to_option)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Receive data. */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 setuid (userid);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (setuid (userid) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (setuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sink (argc, argv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0exit (errs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -540,7 +549,11 @@ toremote (char *targ, int argc, char *argv[])<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (response () &lt; =
0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit (EXIT_FAI=
LURE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (bp);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setuid (userid);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (setuid (userid) =3D=3D=
 -1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_=
FAILURE, 0, &quot;Could not drop privileges (setuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source (1, argv + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close (rem);<br>
&gt; +@@ -633,7 +646,12 @@ tolocal (int argc, char *argv[])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++errs;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 seteuid (userid);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (seteuid (userid) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (seteuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; + #if defined IP_TOS &amp;&amp; defined IPPROTO_IP &amp;&amp; defined =
IPTOS_THROUGHPUT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sslen =3D sizeof (ss);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) getpeername (rem, (struct sockaddr =
*) &amp;ss, &amp;sslen);<br>
&gt; +@@ -646,7 +664,12 @@ tolocal (int argc, char *argv[])<br>
&gt; + #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vect[0] =3D target;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sink (1, vect);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 seteuid (effuid);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (seteuid (effuid) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (seteuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0close (rem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rem =3D -1;<br>
&gt; + #ifdef SHISHI<br>
&gt; +@@ -1444,7 +1467,11 @@ susystem (char *s, int userid)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (127);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 setuid (userid);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (setuid (userid) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (setuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0execl (PATH_BSHELL, &quot;sh&quot;, &quot;=
-c&quot;, s, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_exit (127);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +diff --git a/src/rlogin.c b/src/rlogin.c<br>
&gt; +index bdfcfa6..2addf49 100644<br>
&gt; +--- a/src/rlogin.c<br>
&gt; ++++ b/src/rlogin.c<br>
&gt; +@@ -650,8 +650,15 @@ try_connect:<br>
&gt; +=C2=A0 =C2=A0/* Now change to the real user ID.=C2=A0 We have to be s=
et-user-ID root<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 to get the privileged port that rcmd () uses.=C2=
=A0 We now want, however,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 to run as the real user who invoked us.=C2=A0 */=
<br>
&gt; +-=C2=A0 seteuid (uid);<br>
&gt; +-=C2=A0 setuid (uid);<br>
&gt; ++=C2=A0 if (seteuid (uid) =3D=3D -1)<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop privilege=
s (seteuid() failed)&quot;);<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 if (setuid (uid) =3D=3D -1)<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop privilege=
s (setuid() failed)&quot;);<br>
&gt; ++=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0doit (&amp;osmask);=C2=A0 =C2=A0 =C2=A0/* The old mask w=
ill activate SIGURG and SIGUSR1!=C2=A0 */<br>
&gt; +<br>
&gt; +diff --git a/src/rsh.c b/src/rsh.c<br>
&gt; +index fa97e2a..6137ba7 100644<br>
&gt; +--- a/src/rsh.c<br>
&gt; ++++ b/src/rsh.c<br>
&gt; +@@ -279,8 +279,17 @@ main (int argc, char **argv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (asrsh)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*argv =3D (char *) &quot;rlogin&quot;;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 seteuid (getuid ());<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 setuid (getuid ());<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (seteuid (getuid ()) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;seteui=
d() failed&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (setuid (getuid ()) =3D=3D -1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;setuid=
() failed&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0execv (PATH_RLOGIN, argv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0error (EXIT_FAILURE, errno, &quot;cannot e=
xecute %s&quot;, PATH_RLOGIN);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -544,8 +553,16 @@ try_connect:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0error (0, errno, &quot;setsockopt DEBUG (i=
gnored)&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 seteuid (uid);<br>
&gt; +-=C2=A0 setuid (uid);<br>
&gt; ++=C2=A0 if (seteuid (uid) =3D=3D -1)<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;seteuid() failed&quo=
t;);<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 if (setuid (uid) =3D=3D -1)<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;setuid() failed&quot=
;);<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; + #ifdef HAVE_SIGACTION<br>
&gt; +=C2=A0 =C2=A0sigemptyset (&amp;sigs);<br>
&gt; +=C2=A0 =C2=A0sigaddset (&amp;sigs, SIGINT);<br>
&gt; +diff --git a/src/rshd.c b/src/rshd.c<br>
&gt; +index fed6f39..f6e74b9 100644<br>
&gt; +--- a/src/rshd.c<br>
&gt; ++++ b/src/rshd.c<br>
&gt; +@@ -1850,8 +1850,18 @@ doit (int sockfd, struct sockaddr *fromp, sock=
len_t fromlen)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pwd-&gt;pw_shell =3D PATH_BSHELL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* Set the gid, then uid to become the user specified by=
 &quot;locuser&quot; */<br>
&gt; +-=C2=A0 setegid ((gid_t) pwd-&gt;pw_gid);<br>
&gt; +-=C2=A0 setgid ((gid_t) pwd-&gt;pw_gid);<br>
&gt; ++=C2=A0 if (setegid ((gid_t) pwd-&gt;pw_gid) =3D=3D -1)<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setegid() fa=
iled)\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 if (setgid ((gid_t) pwd-&gt;pw_gid) =3D=3D -1)<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setgid() fai=
led)\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; + #ifdef HAVE_INITGROUPS<br>
&gt; +=C2=A0 =C2=A0initgroups (pwd-&gt;pw_name, pwd-&gt;pw_gid);=C2=A0 =C2=
=A0 =C2=A0/* BSD groups */<br>
&gt; + #endif<br>
&gt; +@@ -1873,7 +1883,11 @@ doit (int sockfd, struct sockaddr *fromp, sock=
len_t fromlen)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; + #endif /* WITH_PAM */<br>
&gt; +<br>
&gt; +-=C2=A0 setuid ((uid_t) pwd-&gt;pw_uid);<br>
&gt; ++=C2=A0 if (setuid ((uid_t) pwd-&gt;pw_uid) =3D=3D -1)<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setuid() fai=
led)\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
&gt; ++=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* We&#39;ll execute the client&#39;s command in the hom=
e directory<br>
&gt; +=C2=A0 =C2=A0 * of locuser. Note, that the chdir must be executed aft=
er<br>
&gt; +diff --git a/src/uucpd.c b/src/uucpd.c<br>
&gt; +index c8bb460..5b76390 100644<br>
&gt; +--- a/src/uucpd.c<br>
&gt; ++++ b/src/uucpd.c<br>
&gt; +@@ -255,7 +255,12 @@ doit (struct sockaddr *sap, socklen_t salen)<br>
&gt; +=C2=A0 =C2=A0snprintf (Username, sizeof (Username), &quot;USER=3D%s&q=
uot;, user);<br>
&gt; +=C2=A0 =C2=A0snprintf (Logname, sizeof (Logname), &quot;LOGNAME=3D%s&=
quot;, user);<br>
&gt; +=C2=A0 =C2=A0dologin (pw, sap, salen);<br>
&gt; +-=C2=A0 setgid (pw-&gt;pw_gid);<br>
&gt; ++<br>
&gt; ++=C2=A0 if (setgid (pw-&gt;pw_gid) =3D=3D -1)<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 fprintf (stderr, &quot;setgid() failed&quot;);<br>
&gt; ++=C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 }<br>
&gt; + #ifdef HAVE_INITGROUPS<br>
&gt; +=C2=A0 =C2=A0initgroups (pw-&gt;pw_name, pw-&gt;pw_gid);<br>
&gt; + #endif<br>
&gt; +@@ -264,7 +269,13 @@ doit (struct sockaddr *sap, socklen_t salen)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf (stderr, &quot;Login incorrect.&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 setuid (pw-&gt;pw_uid);<br>
&gt; ++<br>
&gt; ++=C2=A0 if (setuid (pw-&gt;pw_uid) =3D=3D -1)<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 fprintf (stderr, &quot;setuid() failed&quot;);<br>
&gt; ++=C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0execl (uucico_location, &quot;uucico&quot;, NULL);<br>
&gt; +=C2=A0 =C2=A0perror (&quot;uucico server: execl&quot;);<br>
&gt; + }<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-20=
23-40303-Indent-changes-in-previous-commit.patch b/meta/recipes-connectivit=
y/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit=
.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2628487ff8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-4030=
3-Indent-changes-in-previous-commit.patch<br>
&gt; @@ -0,0 +1,256 @@<br>
&gt; +From 70fe022f9dac760eaece0228cad17e3d29a57fb8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Simon Josefsson &lt;<a href=3D"mailto:simon@josefsson.org" targ=
et=3D"_blank">simon@josefsson.org</a>&gt;<br>
&gt; +Date: Mon, 31 Jul 2023 13:59:05 +0200<br>
&gt; +Subject: [PATCH] CVE-2023-40303: Indent changes in previous commit.<b=
r>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://git.savannah.gnu.org/cg=
it/inetutils.git/commit/?id=3D9122999252c7e21eb7774de11d539748e7bdf46d" rel=
=3D"noreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/inetuti=
ls.git/commit/?id=3D9122999252c7e21eb7774de11d539748e7bdf46d</a>]<br>
&gt; +CVE: CVE-2023-40303<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/rcp.c=C2=A0 =C2=A0 | 42 ++++++++++++++++++++++++----------------=
--<br>
&gt; + src/rlogin.c | 12 ++++++------<br>
&gt; + src/rsh.c=C2=A0 =C2=A0 | 24 ++++++++++++------------<br>
&gt; + src/rshd.c=C2=A0 =C2=A0| 24 ++++++++++++------------<br>
&gt; + src/uucpd.c=C2=A0 | 16 ++++++++--------<br>
&gt; + 5 files changed, 62 insertions(+), 56 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/rcp.c b/src/rcp.c<br>
&gt; +index cd84570..50196c6 100644<br>
&gt; +--- a/src/rcp.c<br>
&gt; ++++ b/src/rcp.c<br>
&gt; +@@ -350,9 +350,10 @@ main (int argc, char *argv[])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0response ();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (setuid (userid) =3D=3D -1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (setuid() failed)&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Could n=
ot drop privileges (setuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0source (argc, argv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0exit (errs);<br>
&gt; +@@ -361,9 +362,10 @@ main (int argc, char *argv[])<br>
&gt; +=C2=A0 =C2=A0if (to_option)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Receive data. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (setuid (userid) =3D=3D -1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (setuid() failed)&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Could n=
ot drop privileges (setuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sink (argc, argv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0exit (errs);<br>
&gt; +@@ -551,9 +553,10 @@ toremote (char *targ, int argc, char *argv[])<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (bp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (setuid (userid) =
=3D=3D -1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_=
FAILURE, 0, &quot;Could not drop privileges (setuid() failed)&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_=
FAILURE, 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;Could not drop privileges (setuid() failed)&quot;);<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source (1, argv + i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close (rem);<br>
&gt; +@@ -648,9 +651,10 @@ tolocal (int argc, char *argv[])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seteuid (userid) =3D=3D -1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (seteuid() failed)&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Could n=
ot drop privileges (seteuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + #if defined IP_TOS &amp;&amp; defined IPPROTO_IP &amp;&amp; defined =
IPTOS_THROUGHPUT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sslen =3D sizeof (ss);<br>
&gt; +@@ -666,9 +670,10 @@ tolocal (int argc, char *argv[])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sink (1, vect);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seteuid (effuid) =3D=3D -1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (seteuid() failed)&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Could n=
ot drop privileges (seteuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0close (rem);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rem =3D -1;<br>
&gt; +@@ -1468,9 +1473,10 @@ susystem (char *s, int userid)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (setuid (userid) =3D=3D -1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not =
drop privileges (setuid() failed)&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Could n=
ot drop privileges (setuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0execl (PATH_BSHELL, &quot;sh&quot;, &quot;=
-c&quot;, s, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0_exit (127);<br>
&gt; +diff --git a/src/rlogin.c b/src/rlogin.c<br>
&gt; +index 2addf49..15d6f14 100644<br>
&gt; +--- a/src/rlogin.c<br>
&gt; ++++ b/src/rlogin.c<br>
&gt; +@@ -651,14 +651,14 @@ try_connect:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 to get the privileged port that rcmd () uses.=C2=
=A0 We now want, however,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 to run as the real user who invoked us.=C2=A0 */=
<br>
&gt; +=C2=A0 =C2=A0if (seteuid (uid) =3D=3D -1)<br>
&gt; +-=C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop privilege=
s (seteuid() failed)&quot;);<br>
&gt; +-=C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop pr=
ivileges (seteuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (setuid (uid) =3D=3D -1)<br>
&gt; +-=C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop privilege=
s (setuid() failed)&quot;);<br>
&gt; +-=C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, 0, &quot;Could not drop pr=
ivileges (setuid() failed)&quot;);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0doit (&amp;osmask);=C2=A0 =C2=A0 =C2=A0/* The old mask w=
ill activate SIGURG and SIGUSR1!=C2=A0 */<br>
&gt; +<br>
&gt; +diff --git a/src/rsh.c b/src/rsh.c<br>
&gt; +index 6137ba7..138d98e 100644<br>
&gt; +--- a/src/rsh.c<br>
&gt; ++++ b/src/rsh.c<br>
&gt; +@@ -281,14 +281,14 @@ main (int argc, char **argv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*argv =3D (char *) &quot;rlogin&quot;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seteuid (getuid ()) =3D=3D -1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;seteui=
d() failed&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;seteui=
d() failed&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (setuid (getuid ()) =3D=3D -1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;setuid=
() failed&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;setuid=
() failed&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0execv (PATH_RLOGIN, argv);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0error (EXIT_FAILURE, errno, &quot;cannot e=
xecute %s&quot;, PATH_RLOGIN);<br>
&gt; +@@ -554,14 +554,14 @@ try_connect:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (seteuid (uid) =3D=3D -1)<br>
&gt; +-=C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;seteuid() failed&quo=
t;);<br>
&gt; +-=C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;seteuid() fai=
led&quot;);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (setuid (uid) =3D=3D -1)<br>
&gt; +-=C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;setuid() failed&quot=
;);<br>
&gt; +-=C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 error (EXIT_FAILURE, errno, &quot;setuid() fail=
ed&quot;);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + #ifdef HAVE_SIGACTION<br>
&gt; +=C2=A0 =C2=A0sigemptyset (&amp;sigs);<br>
&gt; +diff --git a/src/rshd.c b/src/rshd.c<br>
&gt; +index f6e74b9..cf3ee79 100644<br>
&gt; +--- a/src/rshd.c<br>
&gt; ++++ b/src/rshd.c<br>
&gt; +@@ -1851,16 +1851,16 @@ doit (int sockfd, struct sockaddr *fromp, soc=
klen_t fromlen)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* Set the gid, then uid to become the user specified by=
 &quot;locuser&quot; */<br>
&gt; +=C2=A0 =C2=A0if (setegid ((gid_t) pwd-&gt;pw_gid) =3D=3D -1)<br>
&gt; +-=C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setegid() fa=
iled)\n&quot;);<br>
&gt; +-=C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
&gt; +-=C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (seteg=
id() failed)\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (setgid ((gid_t) pwd-&gt;pw_gid) =3D=3D -1)<br>
&gt; +-=C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setgid() fai=
led)\n&quot;);<br>
&gt; +-=C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
&gt; +-=C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setgi=
d() failed)\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; + #ifdef HAVE_INITGROUPS<br>
&gt; +=C2=A0 =C2=A0initgroups (pwd-&gt;pw_name, pwd-&gt;pw_gid);=C2=A0 =C2=
=A0 =C2=A0/* BSD groups */<br>
&gt; +@@ -1884,10 +1884,10 @@ doit (int sockfd, struct sockaddr *fromp, soc=
klen_t fromlen)<br>
&gt; + #endif /* WITH_PAM */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (setuid ((uid_t) pwd-&gt;pw_uid) =3D=3D -1)<br>
&gt; +-=C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setuid() fai=
led)\n&quot;);<br>
&gt; +-=C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
&gt; +-=C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 rshd_error (&quot;Cannot drop privileges (setui=
d() failed)\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 exit (EXIT_FAILURE);<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* We&#39;ll execute the client&#39;s command in the hom=
e directory<br>
&gt; +=C2=A0 =C2=A0 * of locuser. Note, that the chdir must be executed aft=
er<br>
&gt; +diff --git a/src/uucpd.c b/src/uucpd.c<br>
&gt; +index 5b76390..abbb02d 100644<br>
&gt; +--- a/src/uucpd.c<br>
&gt; ++++ b/src/uucpd.c<br>
&gt; +@@ -257,10 +257,10 @@ doit (struct sockaddr *sap, socklen_t salen)<br=
>
&gt; +=C2=A0 =C2=A0dologin (pw, sap, salen);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (setgid (pw-&gt;pw_gid) =3D=3D -1)<br>
&gt; +-=C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 fprintf (stderr, &quot;setgid() failed&quot;);<br>
&gt; +-=C2=A0 =C2=A0 return;<br>
&gt; +-=C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fprintf (stderr, &quot;setgid() failed&quot;);<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; + #ifdef HAVE_INITGROUPS<br>
&gt; +=C2=A0 =C2=A0initgroups (pw-&gt;pw_name, pw-&gt;pw_gid);<br>
&gt; + #endif<br>
&gt; +@@ -271,10 +271,10 @@ doit (struct sockaddr *sap, socklen_t salen)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (setuid (pw-&gt;pw_uid) =3D=3D -1)<br>
&gt; +-=C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 fprintf (stderr, &quot;setuid() failed&quot;);<br>
&gt; +-=C2=A0 =C2=A0 return;<br>
&gt; +-=C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fprintf (stderr, &quot;setuid() failed&quot;);<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0execl (uucico_location, &quot;uucico&quot;, NULL);<br>
&gt; +=C2=A0 =C2=A0perror (&quot;uucico server: execl&quot;);<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-connectivity/inetutils/<a href=3D"http://ine=
tutils_2.2.bb" rel=3D"noreferrer" target=3D"_blank">inetutils_2.2.bb</a> b/=
meta/recipes-connectivity/inetutils/<a href=3D"http://inetutils_2.2.bb" rel=
=3D"noreferrer" target=3D"_blank">inetutils_2.2.bb</a><br>
&gt; index d8062e2b21..6f9173dbc1 100644<br>
&gt; --- a/meta/recipes-connectivity/inetutils/<a href=3D"http://inetutils_=
2.2.bb" rel=3D"noreferrer" target=3D"_blank">inetutils_2.2.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/inetutils/<a href=3D"http://inetutils_=
2.2.bb" rel=3D"noreferrer" target=3D"_blank">inetutils_2.2.bb</a><br>
&gt; @@ -22,6 +22,8 @@ SRC_URI =3D &quot;${GNU_MIRROR}/inetutils/inetutils-=
${PV}.tar.xz \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://inetutils-1.9-PA=
TH_PROCNET_DEV.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://inetutils-only-c=
heck-pam_appl.h-when-pam-enabled.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-39028.p=
atch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-CVE-2023-40303-f=
tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-CVE-2023-40303-I=
ndent-changes-in-previous-commit.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools gettext update-alternatives texinfo<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#186834): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/186834" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/186834</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10101252=
4/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101012524/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000004499b90604070cc4--

