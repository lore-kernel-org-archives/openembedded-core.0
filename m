Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D082C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 22:00:44 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.4131.1640901642923903197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 14:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K9fGOnw5;
 spf=pass (domain: gmail.com, ip: 209.85.166.171,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id y16so19826660ilq.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 14:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6pRoW5VCWaQ1El37r6bRC+L71pxaxVtCQAGynjjpwT0=;
        b=K9fGOnw5mnBhGwvyxR1poCqXILoCz0XQmVgslkPRFODqYvrF+hkhyOH0yoUuo/+sCQ
         Ld7+QC33QU+dSGpMdhYyhtDS7e+zy/H1U70YQXaLroW1c43GKZo9VkEWeAdo10GWlFXy
         pKEHSR9KNSgkVLeo4ACkifPQQsBGeCNHP3i0pNRbj25eY1uHvkw8I7xUQjM3cK8t8jkT
         dQ0wLzSeMyZHHCpvKpmWxUF+sSERFFART2YDjCV91Cu4lBLiSOdNHXKruaOrzmoW1SMG
         VTrRF4hpJG0mVPbk36dYXNWaQHAYZoAZ91KN40R8XpN3eW5YvBTxOVWp7/0L6IuzKYby
         Gnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6pRoW5VCWaQ1El37r6bRC+L71pxaxVtCQAGynjjpwT0=;
        b=JP7IqlBBSsWidYxe0DQeJWxCY1DS181vhbwOu/rlZgtz1SmMO0mD3PK1Bng6oOoizJ
         bEvQzrCiO5CgytDxlhJrgFy5Y5y511cfGqVReJBgkgUq5FJp5n3Gl6BGcs+jq83dW55X
         T/u2UTFhLf+ViFIHQBDcK35Lsf3ev0o68cxNwEda3iiBkVRlG6ql4dQ04b1SzdgmmuA7
         /DsO9hETuRJAZomvC9CjVCZYTPtZ2XK2c7mk4P42CKwC0OCxh0/SHnSDJAoXt9Te3XBZ
         Kna95y4rQltd94YzraW/YWdwqyPG9dB6VSBIcBWqd9MHoBzpL/WCb+qgQ3tqEJbmGIC4
         9QXQ==
X-Gm-Message-State: AOAM530GDyd4dnBSQ2hxXRFxRNNRCnn7Wxf3158QgOEaAeXVstoD5jeK
	8Ur4lmrExgJZfrWwRHAoPrQ29/96HnmNCZjg18M=
X-Google-Smtp-Source: 
 ABdhPJyH6l4Cui9hpgNulbxKtyRSAX1dQ15VHQ11+IHvHhH4BryvTALZ5h62wC+5gCNWP0KH6pERZvrumIr8BbMbrtI=
X-Received: by 2002:a05:6e02:1a86:: with SMTP id
 k6mr14485492ilv.166.1640901642154;
 Thu, 30 Dec 2021 14:00:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1640181998.git.steve@sakoman.com>
 <a4e272700e18ca7e86e24ce4e24031ce7745c87b.1640181998.git.steve@sakoman.com>
 <16C59D37B8124AF8.22808@lists.openembedded.org>
 <6cf463b6-6612-cac1-80ef-93ce21d9e211@gmail.com>
 <CAOSpxdYqjDgfUu6c7qCfMbX1GnHd6TyeCA+vV8geX-1p3xbdGw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYqjDgfUu6c7qCfMbX1GnHd6TyeCA+vV8geX-1p3xbdGw@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
Date: Thu, 30 Dec 2021 23:00:30 +0100
Message-ID: 
 <CAPbeDCm1Z0n9kuLSi4FsVPRsYwyzcpRv1cnXp5n0d-Pv9RxFmg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 02/14] openssh: Fix CVE-2021-41617
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007df94a05d4642fbb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 22:00:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160067

--0000000000007df94a05d4642fbb
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Dec 2021, 21:17 Steve Sakoman, <steve@sakoman.com> wrote:

On Thu, Dec 30, 2021 at 9:04 AM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 12/30/21 19:54, Jacob Kroon via lists.openembedded.org wrote:
> > On 12/22/21 15:12, Steve Sakoman wrote:
> >> From: sana kazi <sanakazisk19@gmail.com>
> >>
> >> Add patch to fix CVE-2021-41617
> >> Link: https://bugzilla.suse.com/attachment.cgi?id=854015
> >>
> >> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> >> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> ---
> >>  .../openssh/openssh/CVE-2021-41617.patch      | 52 +++++++++++++++++++
> >>  .../openssh/openssh_8.2p1.bb                  |  1 +
> >>  2 files changed, 53 insertions(+)
> >>  create mode 100644
meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
> >>
> >> diff --git
a/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
> >> new file mode 100644
> >> index 0000000000..bda896f581
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
> >> @@ -0,0 +1,52 @@
> >> +From a6414400ec94a17871081f7df24f910a6ee01b8b Mon Sep 17 00:00:00 2001
> >> +From: Ali Abdallah <aabdallah@suse.de>
> >> +Date: Wed, 24 Nov 2021 13:33:39 +0100
> >> +Subject: [PATCH] CVE-2021-41617 fix
> >> +
> >> +backport of the following two upstream commits
> >> +
> >> +f3cbe43e28fe71427d41cfe3a17125b972710455
> >> +bf944e3794eff5413f2df1ef37cddf96918c6bde
> >> +
> >> +CVE-2021-41617 failed to correctly initialise supplemental groups
> >> +when executing an AuthorizedKeysCommand or
AuthorizedPrincipalsCommand,
> >> +where a AuthorizedKeysCommandUser or AuthorizedPrincipalsCommandUser
> >> +directive has been set to run the command as a different user. Instead
> >> +these commands would inherit the groups that sshd(8) was started with.
> >> +---
> >> + auth.c | 8 ++++++++
> >> + 1 file changed, 8 insertions(+)
> >> +
> >> +CVE: CVE-2021-41617
> >> +Upstream-Status: Backport [
https://bugzilla.suse.com/attachment.cgi?id=854015]
> >> +Comment: No change in any hunk
> >> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> >> +
> >> +diff --git a/auth.c b/auth.c
> >> +index 163038f..a47b267 100644
> >> +--- a/auth.c
> >> ++++ b/auth.c
> >> +@@ -52,6 +52,7 @@
> >> + #include <limits.h>
> >> + #include <netdb.h>
> >> + #include <time.h>
> >> ++#include <grp.h>
> >> +
> >> + #include "xmalloc.h"
> >> + #include "match.h"
> >> +@@ -851,6 +852,13 @@ subprocess(const char *tag, struct passwd *pw,
const char *command,
> >> +            }
> >> +            closefrom(STDERR_FILENO + 1);
> >> +
> >> ++           if (geteuid() == 0 &&
> >> ++               initgroups(pw->pw_name, pw->pw_gid) == -1) {
> >> ++                   error("%s: initgroups(%s, %u): %s", tag,
> >> ++                       pw->pw_name, (u_int)pw->pw_gid,
strerror(errno));
> >> ++                   _exit(1);
> >> ++           }
> >> ++
> >> +            /* Don't use permanently_set_uid() here to avoid fatal()
*/
> >> +            if (setresgid(pw->pw_gid, pw->pw_gid, pw->pw_gid) == -1) {
> >> +                    error("%s: setresgid %u: %s", tag,
(u_int)pw->pw_gid,
> >> +--
> >> +2.26.2
> >> diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
 b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> >> index b60d1a6bd4..e903ec487d 100644
> >> --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> >> +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> >> @@ -26,6 +26,7 @@ SRC_URI = "
http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
> >>             file://add-test-support-for-busybox.patch \
> >>             file://CVE-2020-14145.patch \
> >>             file://CVE-2021-28041.patch \
> >> +           file://CVE-2021-41617.patch \
> >>             "
> >>  SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
> >>  SRC_URI[sha256sum] =
"43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
> >>
> >>
> >>
> >>
> >>
> >
> > I would have expected this patch to leave a mark in my buildhistory, but
> > nothing related to openssh(d) shows up.
> >
> > Size of /usr/sbin/sshd stays the same, which at least to me is a little
> > odd.. but I can see that the sha256sum output of sshd changes.
> >
> > (It would be nice to have sha256sum hashes of files in buildhistory)
> >
> > Am I the only one who thinks this is a little strange ?
> >
> > /Jacob
> >
>
> Let me rephrase, I do see changes related to debug information and the
> debug package, but no change in the resulting '/usr/sbin/sshd' size that
> goes in the final image.

Yes, it is unusual that the size of sshd is the same pre and post patch.

I checked the size of auth.o pre and post patch, and it is also the
same (not surprisingly!)

However I've verified that the patch modifies auth.c as desired, and
the md5sums for both auth.o and ssshd are different pre and post patch
(as expected)

So this is just one of those cases where different code results in the
same size!

Steve


Thanks for double checking.
/Jacob

--0000000000007df94a05d4642fbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><div class=3D"elided-text" dir=3D"auto"=
><div dir=3D"ltr">On Thu, 30 Dec 2021, 21:17 Steve Sakoman, &lt;<a href=3D"=
mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockq=
uote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu, Dec 30, 2021 at 9:04 AM Jacob Kroon &lt;<a hre=
f=3D"mailto:jacob.kroon@gmail.com">jacob.kroon@gmail.com</a>&gt; wrote:<br>=
&gt;<br>&gt; On 12/30/21 19:54, Jacob Kroon via=C2=A0<a href=3D"http://list=
s.openembedded.org/">lists.openembedded.org</a>=C2=A0wrote:<br>&gt; &gt; On=
 12/22/21 15:12, Steve Sakoman wrote:<br>&gt; &gt;&gt; From: sana kazi &lt;=
<a href=3D"mailto:sanakazisk19@gmail.com">sanakazisk19@gmail.com</a>&gt;<br=
>&gt; &gt;&gt;<br>&gt; &gt;&gt; Add patch to fix CVE-2021-41617<br>&gt; &gt=
;&gt; Link:=C2=A0<a href=3D"https://bugzilla.suse.com/attachment.cgi?id=3D8=
54015">https://bugzilla.suse.com/attachment.cgi?id=3D854015</a><br>&gt; &gt=
;&gt;<br>&gt; &gt;&gt; Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.=
Kazi@kpit.com">Sana.Kazi@kpit.com</a>&gt;<br>&gt; &gt;&gt; Signed-off-by: S=
ana Kazi &lt;<a href=3D"mailto:sanakazisk19@gmail.com">sanakazisk19@gmail.c=
om</a>&gt;<br>&gt; &gt;&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mai=
lto:steve@sakoman.com">steve@sakoman.com</a>&gt;<br>&gt; &gt;&gt; ---<br>&g=
t; &gt;&gt;=C2=A0 .../openssh/openssh/CVE-2021-41617.patch=C2=A0 =C2=A0 =C2=
=A0 | 52 +++++++++++++++++++<br>&gt; &gt;&gt;=C2=A0 .../openssh/<a href=3D"=
http://openssh_8.2p1.bb/">openssh_8.2p1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>&gt; &gt;&gt;=C2=A0 2 fil=
es changed, 53 insertions(+)<br>&gt; &gt;&gt;=C2=A0 create mode 100644 meta=
/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch<br>&gt; &gt;&gt;=
<br>&gt; &gt;&gt; diff --git a/meta/recipes-connectivity/openssh/openssh/CV=
E-2021-41617.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2021-416=
17.patch<br>&gt; &gt;&gt; new file mode 100644<br>&gt; &gt;&gt; index 00000=
00000..bda896f581<br>&gt; &gt;&gt; --- /dev/null<br>&gt; &gt;&gt; +++ b/met=
a/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch<br>&gt; &gt;&gt=
; @@ -0,0 +1,52 @@<br>&gt; &gt;&gt; +From a6414400ec94a17871081f7df24f910a6=
ee01b8b Mon Sep 17 00:00:00 2001<br>&gt; &gt;&gt; +From: Ali Abdallah &lt;<=
a href=3D"mailto:aabdallah@suse.de">aabdallah@suse.de</a>&gt;<br>&gt; &gt;&=
gt; +Date: Wed, 24 Nov 2021 13:33:39 +0100<br>&gt; &gt;&gt; +Subject: [PATC=
H] CVE-2021-41617 fix<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; +backport of the =
following two upstream commits<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; +f3cbe43=
e28fe71427d41cfe3a17125b972710455<br>&gt; &gt;&gt; +bf944e3794eff5413f2df1e=
f37cddf96918c6bde<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; +CVE-2021-41617 faile=
d to correctly initialise supplemental groups<br>&gt; &gt;&gt; +when execut=
ing an AuthorizedKeysCommand or AuthorizedPrincipalsCommand,<br>&gt; &gt;&g=
t; +where a AuthorizedKeysCommandUser or AuthorizedPrincipalsCommandUser<br=
>&gt; &gt;&gt; +directive has been set to run the command as a different us=
er. Instead<br>&gt; &gt;&gt; +these commands would inherit the groups that =
sshd(8) was started with.<br>&gt; &gt;&gt; +---<br>&gt; &gt;&gt; + auth.c |=
 8 ++++++++<br>&gt; &gt;&gt; + 1 file changed, 8 insertions(+)<br>&gt; &gt;=
&gt; +<br>&gt; &gt;&gt; +CVE: CVE-2021-41617<br>&gt; &gt;&gt; +Upstream-Sta=
tus: Backport [<a href=3D"https://bugzilla.suse.com/attachment.cgi?id=3D854=
015">https://bugzilla.suse.com/attachment.cgi?id=3D854015</a>]<br>&gt; &gt;=
&gt; +Comment: No change in any hunk<br>&gt; &gt;&gt; +Signed-off-by: Sana =
Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com">Sana.Kazi@kpit.com</a>&gt;<b=
r>&gt; &gt;&gt; +<br>&gt; &gt;&gt; +diff --git a/auth.c b/auth.c<br>&gt; &g=
t;&gt; +index 163038f..a47b267 100644<br>&gt; &gt;&gt; +--- a/auth.c<br>&gt=
; &gt;&gt; ++++ b/auth.c<br>&gt; &gt;&gt; +@@ -52,6 +52,7 @@<br>&gt; &gt;&g=
t; + #include &lt;limits.h&gt;<br>&gt; &gt;&gt; + #include &lt;netdb.h&gt;<=
br>&gt; &gt;&gt; + #include &lt;time.h&gt;<br>&gt; &gt;&gt; ++#include &lt;=
grp.h&gt;<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; + #include &quot;xmalloc.h&qu=
ot;<br>&gt; &gt;&gt; + #include &quot;match.h&quot;<br>&gt; &gt;&gt; +@@ -8=
51,6 +852,13 @@ subprocess(const char *tag, struct passwd *pw, const char *=
command,<br>&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&=
gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 closefrom(STDERR_FI=
LENO + 1);<br>&gt; &gt;&gt; +<br>&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0if (geteuid() =3D=3D 0 &amp;&amp;<br>&gt; &gt;&gt; ++=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initgroups(pw-&gt;pw_na=
me, pw-&gt;pw_gid) =3D=3D -1) {<br>&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error(&quot;%s: initgroups(%s,=
 %u): %s&quot;, tag,<br>&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pw-&gt;pw_name, (u_int)pw-&=
gt;pw_gid, strerror(errno));<br>&gt; &gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(1);<br>&gt; &gt;&gt; ++=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt; &gt;&gt; ++<br>&gt; &gt;&gt=
; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Don&#39;t use permanently_s=
et_uid() here to avoid fatal() */<br>&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if (setresgid(pw-&gt;pw_gid, pw-&gt;pw_gid, pw-&gt;pw_=
gid) =3D=3D -1) {<br>&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error(&quot;%s: setresgid %u: %s&quot;, tag=
, (u_int)pw-&gt;pw_gid,<br>&gt; &gt;&gt; +--<br>&gt; &gt;&gt; +2.26.2<br>&g=
t; &gt;&gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http:=
//openssh_8.2p1.bb/">openssh_8.2p1.bb</a>=C2=A0b/meta/recipes-connectivity/=
openssh/<a href=3D"http://openssh_8.2p1.bb/">openssh_8.2p1.bb</a><br>&gt; &=
gt;&gt; index b60d1a6bd4..e903ec487d 100644<br>&gt; &gt;&gt; --- a/meta/rec=
ipes-connectivity/openssh/<a href=3D"http://openssh_8.2p1.bb/">openssh_8.2p=
1.bb</a><br>&gt; &gt;&gt; +++ b/meta/recipes-connectivity/openssh/<a href=
=3D"http://openssh_8.2p1.bb/">openssh_8.2p1.bb</a><br>&gt; &gt;&gt; @@ -26,=
6 +26,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.openbsd.org/pub/OpenBSD/=
OpenSSH/portable/openssh-$%7BPV%7D.tar">http://ftp.openbsd.org/pub/OpenBSD/=
OpenSSH/portable/openssh-${PV}.tar</a><br>&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-test-support-for-busybox.patch \<br>=
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-202=
0-14145.patch \<br>&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://CVE-2021-28041.patch \<br>&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0file://CVE-2021-41617.patch \<br>&gt; &gt;&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>&gt; &gt;&gt;=C2=A0 SRC_=
URI[md5sum] =3D &quot;3076e6413e8dbe56d33848c1054ac091&quot;<br>&gt; &gt;&g=
t;=C2=A0 SRC_URI[sha256sum] =3D &quot;43925151e6cf6cee1450190c0e9af4dc36b41=
c12737619edff8bcebdff64e671&quot;<br>&gt; &gt;&gt;<br>&gt; &gt;&gt;<br>&gt;=
 &gt;&gt;<br>&gt; &gt;&gt;<br>&gt; &gt;&gt;<br>&gt; &gt;<br>&gt; &gt; I wou=
ld have expected this patch to leave a mark in my buildhistory, but<br>&gt;=
 &gt; nothing related to openssh(d) shows up.<br>&gt; &gt;<br>&gt; &gt; Siz=
e of /usr/sbin/sshd stays the same, which at least to me is a little<br>&gt=
; &gt; odd.. but I can see that the sha256sum output of sshd changes.<br>&g=
t; &gt;<br>&gt; &gt; (It would be nice to have sha256sum hashes of files in=
 buildhistory)<br>&gt; &gt;<br>&gt; &gt; Am I the only one who thinks this =
is a little strange ?<br>&gt; &gt;<br>&gt; &gt; /Jacob<br>&gt; &gt;<br>&gt;=
<br>&gt; Let me rephrase, I do see changes related to debug information and=
 the<br>&gt; debug package, but no change in the resulting &#39;/usr/sbin/s=
shd&#39; size that<br>&gt; goes in the final image.<br><br>Yes, it is unusu=
al that the size of sshd is the same pre and post patch.<br><br>I checked t=
he size of auth.o pre and post patch, and it is also the<br>same (not surpr=
isingly!)<br><br>However I&#39;ve verified that the patch modifies auth.c a=
s desired, and<br>the md5sums for both auth.o and ssshd are different pre a=
nd post patch<br>(as expected)<br><br>So this is just one of those cases wh=
ere different code results in the<br>same size!<br><br>Steve</blockquote></=
div></div><div dir=3D"auto"><br></div>Thanks for double checking.<div dir=
=3D"auto">/Jacob</div></div>

--0000000000007df94a05d4642fbb--

