Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3D6C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 17:38:29 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.52447.1669397904611275293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 09:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BH9zK5mt;
 spf=pass (domain: mvista.com, ip: 209.85.160.44, mailfrom: vkumbhar@mvista.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-141ca09c2fbso5892392fac.6
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 09:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zu9Wd4+Af+PDzmrkXdgHM6AGWB+SH6yte2NPxAYh940=;
        b=BH9zK5mtDCTiHER72O7TgzsYUgESyIomTkOuF3Vip//PphGpCUTGBI1shlCjsIXCHL
         G+rVnTQxM7hXqwf9l3XrFrq4Zxnxz5XR9Svu2t6FUKu9To1Ni2H1kq7577OCvSRLpLDd
         u9VZoZInwgofPe9MPMW4I8l5cEZhIVCaECJtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zu9Wd4+Af+PDzmrkXdgHM6AGWB+SH6yte2NPxAYh940=;
        b=0XLb8tEZhnjAi7dYaaLOs1tJZXXCxQCS4Lp4m1v62VF7r/+jfqUKV+NtEmPI8Qv7c4
         mElZDKucrREm+mWFiUOqLRlO9Mfmvdynozlu7OJaMCZL+feSwpdNy9XfwEyzKcs/VNrw
         Ztrx+mh9VY1P31pzSl/hX+uFRfej9HpeqRoyZRDcGvLZu+AfwZl3zMzYxcIAsK3tKgS2
         0DTZ99ee7Kmv51rGudsUI8DpXaUZMkhj5/Qz/tAV1HgCWDl2Lm2+OfvQ7lVM8pgVUvaV
         hmcRr+B8SIk9ZOClyMx1FFykc0R5LUNH5buFK1BB48acW07paMWn87Ety7pIWa0bPHEg
         VRwg==
X-Gm-Message-State: ANoB5plsdUxQApNthtXhDWYZR4TgbxWDgs5KWrHhqnYhAi6lGOd/vX6F
	haoMIbxCiHJC9WWSV3UFUe4fHHrRAOhe3jpgQjNJyg==
X-Google-Smtp-Source: AA0mqf5RIdQx6ThNqXOzTz/JNnnl9smYBSeYNb5Axw6t9pmDCZSOyaL/YZtqTwVpuKGgGmnoTaI0iLyUdCNmLGIpcdo=
X-Received: by 2002:a05:6870:cb4c:b0:136:86d4:c5b2 with SMTP id
 oz12-20020a056870cb4c00b0013686d4c5b2mr24984298oab.163.1669397903644; Fri, 25
 Nov 2022 09:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20221124122522.38829-1-vkumbhar@mvista.com> <CAOSpxdY28yYkE6ZpRazr0khadNMyD02qFtWnzCK+3pU9h3ox=g@mail.gmail.com>
In-Reply-To: <CAOSpxdY28yYkE6ZpRazr0khadNMyD02qFtWnzCK+3pU9h3ox=g@mail.gmail.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Fri, 25 Nov 2022 23:08:12 +0530
Message-ID: <CAPun1rFSyVTEzJmhD+eK=-+LN9yf-h4dDZqJG4gP-_hZRoyuDQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] python3: fix CVE-2022-42919 local
 privilege escalation via the multiprocessing forkserver start method
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000934ad05ee4efde9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 17:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173780

--0000000000000934ad05ee4efde9
Content-Type: text/plain; charset="UTF-8"

Hi Steve,

This patch was sent in error to dunfell, Please consider the patch sent for
Kirkstone.

Kind regards,
Vivek

On Fri, 25 Nov 2022 at 10:26 PM, Steve Sakoman <steve@sakoman.com> wrote:

> On Thu, Nov 24, 2022 at 2:25 AM vkumbhar <vkumbhar@mvista.com> wrote:
> >
> > From: Vivek Kumbhar <vkumbhar@mvista.com>
> >
> > Upstream-Status: Backport from
> https://github.com/python/cpython/commit/eae692eed18892309bcc25a2c0f8980038305ea2
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >  .../python/python3/CVE-2022-42919.patch       | 70 +++++++++++++++++++
> >  .../recipes-devtools/python/python3_3.10.7.bb |  1 +
>
> Dunfell python version is 3.8.14, so this patch will not apply. This
> seems to be the same as the patch you sent for kirkstone.  Was this
> sent in error?
>
> Steve
>
> >  2 files changed, 71 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/python/python3/CVE-2022-42919.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
> b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
> > new file mode 100644
> > index 0000000000..6040724dae
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
> > @@ -0,0 +1,70 @@
> > +From 87ef80926ea0ec960a220af89d8ff4db99417b03 Mon Sep 17 00:00:00 2001
> > +From: Vivek Kumbhar <vkumbhar@mvista.com>
> > +Date: Thu, 24 Nov 2022 17:44:18 +0530
> > +Subject: [PATCH] CVE-2022-42919
> > +
> > +Upstream-Status: Backport [
> https://github.com/python/cpython/commit/eae692eed18892309bcc25a2c0f8980038305ea2
> ]
> > +CVE: CVE-2022-42919
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +
> > +[3.10] gh-97514: Don't use Linux abstract sockets for multiprocessing
> (GH-98501) (GH-98503)
> > +
> > +Linux abstract sockets are insecure as they lack any form of filesystem
> > +permissions so their use allows anyone on the system to inject code into
> > +the process.
> > +
> > +This removes the default preference for abstract sockets in
> > +multiprocessing introduced in Python 3.9+ via
> > +https://github.com/python/cpython/pull/18866 while fixing
> > +https://github.com/python/cpython/issues/84031.
> > +
> > +Explicit use of an abstract socket by a user now generates a
> > +RuntimeWarning.  If we choose to keep this warning, it should be
> > +backported to the 3.7 and 3.8 branches.
> > +(cherry picked from commit 49f61068f49747164988ffc5a442d2a63874fc17)
> > +---
> > + Lib/multiprocessing/connection.py                 |  5 -----
> > + .../2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst | 15 +++++++++++++++
> > + 2 files changed, 15 insertions(+), 5 deletions(-)
> > + create mode 100644
> Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
> > +
> > +diff --git a/Lib/multiprocessing/connection.py
> b/Lib/multiprocessing/connection.py
> > +index 510e4b5..8e2facf 100644
> > +--- a/Lib/multiprocessing/connection.py
> > ++++ b/Lib/multiprocessing/connection.py
> > +@@ -73,11 +73,6 @@ def arbitrary_address(family):
> > +     if family == 'AF_INET':
> > +         return ('localhost', 0)
> > +     elif family == 'AF_UNIX':
> > +-        # Prefer abstract sockets if possible to avoid problems with
> the address
> > +-        # size.  When coding portable applications, some
> implementations have
> > +-        # sun_path as short as 92 bytes in the sockaddr_un struct.
> > +-        if util.abstract_sockets_supported:
> > +-            return f"\0listener-{os.getpid()}-{next(_mmap_counter)}"
> > +         return tempfile.mktemp(prefix='listener-',
> dir=util.get_temp_dir())
> > +     elif family == 'AF_PIPE':
> > +         return tempfile.mktemp(prefix=r'\\.\pipe\pyc-%d-%d-' %
> > +diff --git
> a/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
> b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
> > +new file mode 100644
> > +index 0000000..02d95b5
> > +--- /dev/null
> > ++++
> b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
> > +@@ -0,0 +1,15 @@
> > ++On Linux the :mod:`multiprocessing` module returns to using filesystem
> backed
> > ++unix domain sockets for communication with the *forkserver* process
> instead of
> > ++the Linux abstract socket namespace.  Only code that chooses to use the
> > ++:ref:`"forkserver" start method <multiprocessing-start-methods>` is
> affected.
> > ++
> > ++Abstract sockets have no permissions and could allow any user on the
> system in
> > ++the same `network namespace
> > ++<https://man7.org/linux/man-pages/man7/network_namespaces.7.html>`_
> (often the
> > ++whole system) to inject code into the multiprocessing *forkserver*
> process.
> > ++This was a potential privilege escalation. Filesystem based socket
> permissions
> > ++restrict this to the *forkserver* process user as was the default in
> Python 3.8
> > ++and earlier.
> > ++
> > ++This prevents Linux `CVE-2022-42919
> > ++<https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-42919>`_.
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-devtools/python/python3_3.10.7.bb
> b/meta/recipes-devtools/python/python3_3.10.7.bb
> > index 404a582135..2d230793ef 100644
> > --- a/meta/recipes-devtools/python/python3_3.10.7.bb
> > +++ b/meta/recipes-devtools/python/python3_3.10.7.bb
> > @@ -35,6 +35,7 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> >
>  file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
> >             file://deterministic_imports.patch \
> >             file://0001-Avoid-shebang-overflow-on-python-config.py.patch
> \
> > +           file://CVE-2022-42919.patch \
> >             "
> >
> >  SRC_URI:append:class-native = " \
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#173744):
> https://lists.openembedded.org/g/openembedded-core/message/173744
> > Mute This Topic: https://lists.openembedded.org/mt/95236618/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000000934ad05ee4efde9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi=C2=A0Steve,</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">This patch was sent in error to dunfell, Please consider the patc=
h sent for Kirkstone.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Ki=
nd=C2=A0regards,</div><div dir=3D"auto">Vivek=C2=A0</div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 25 Nov 2022=
 at 10:26 PM, Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@=
sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">On Thu, Nov 24, 2022 a=
t 2:25 AM vkumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" target=3D"_bl=
ank">vkumbhar@mvista.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" target=
=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Upstream-Status: Backport from <a href=3D"https://github.com/python/cp=
ython/commit/eae692eed18892309bcc25a2c0f8980038305ea2" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/python/cpython/commit/eae692eed18892309=
bcc25a2c0f8980038305ea2</a><br>
&gt;<br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3/CVE-2022-42919.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 70 +++++++++++++++++++<br>
&gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3_3.10.7.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3_3.10.7.bb</a> |=C2=A0 1 +<br>
<br>
Dunfell python version is 3.8.14, so this patch will not apply. This<br>
seems to be the same as the patch you sent for kirkstone.=C2=A0 Was this<br=
>
sent in error?<br>
<br>
Steve<br>
<br>
&gt;=C2=A0 2 files changed, 71 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3/CVE-2022=
-42919.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/CVE-2022-42919.patch=
 b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6040724dae<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch<br>
&gt; @@ -0,0 +1,70 @@<br>
&gt; +From 87ef80926ea0ec960a220af89d8ff4db99417b03 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com" target=
=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +Date: Thu, 24 Nov 2022 17:44:18 +0530<br>
&gt; +Subject: [PATCH] CVE-2022-42919<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/commit/eae692eed18892309bcc25a2c0f8980038305ea2" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/python/cpython/commit/eae692eed18892309bcc=
25a2c0f8980038305ea2</a>]<br>
&gt; +CVE: CVE-2022-42919<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +<br>
&gt; +[3.10] gh-97514: Don&#39;t use Linux abstract sockets for multiproces=
sing (GH-98501) (GH-98503)<br>
&gt; +<br>
&gt; +Linux abstract sockets are insecure as they lack any form of filesyst=
em<br>
&gt; +permissions so their use allows anyone on the system to inject code i=
nto<br>
&gt; +the process.<br>
&gt; +<br>
&gt; +This removes the default preference for abstract sockets in<br>
&gt; +multiprocessing introduced in Python 3.9+ via<br>
&gt; +<a href=3D"https://github.com/python/cpython/pull/18866" rel=3D"noref=
errer" target=3D"_blank">https://github.com/python/cpython/pull/18866</a> w=
hile fixing<br>
&gt; +<a href=3D"https://github.com/python/cpython/issues/84031" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/python/cpython/issues/84031</=
a>.<br>
&gt; +<br>
&gt; +Explicit use of an abstract socket by a user now generates a<br>
&gt; +RuntimeWarning.=C2=A0 If we choose to keep this warning, it should be=
<br>
&gt; +backported to the 3.7 and 3.8 branches.<br>
&gt; +(cherry picked from commit 49f61068f49747164988ffc5a442d2a63874fc17)<=
br>
&gt; +---<br>
&gt; + Lib/multiprocessing/connection.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 -----<br>
&gt; + .../2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst | 15 +++++++++++++=
++<br>
&gt; + 2 files changed, 15 insertions(+), 5 deletions(-)<br>
&gt; + create mode 100644 Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-=
issue-97514.Yggdsl.rst<br>
&gt; +<br>
&gt; +diff --git a/Lib/multiprocessing/connection.py b/Lib/multiprocessing/=
connection.py<br>
&gt; +index 510e4b5..8e2facf 100644<br>
&gt; +--- a/Lib/multiprocessing/connection.py<br>
&gt; ++++ b/Lib/multiprocessing/connection.py<br>
&gt; +@@ -73,11 +73,6 @@ def arbitrary_address(family):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if family =3D=3D &#39;AF_INET&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (&#39;localhost&#39;, 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0elif family =3D=3D &#39;AF_UNIX&#39;:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Prefer abstract sockets if possible to=
 avoid problems with the address<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # size.=C2=A0 When coding portable appli=
cations, some implementations have<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sun_path as short as 92 bytes in the s=
ockaddr_un struct.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if util.abstract_sockets_supported:<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&quot;\0listener-{=
os.getpid()}-{next(_mmap_counter)}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tempfile.mktemp(prefix=3D&#3=
9;listener-&#39;, dir=3Dutil.get_temp_dir())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0elif family =3D=3D &#39;AF_PIPE&#39;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return tempfile.mktemp(prefix=3Dr&#=
39;\\.\pipe\pyc-%d-%d-&#39; %<br>
&gt; +diff --git a/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-9=
7514.Yggdsl.rst b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97=
514.Yggdsl.rst<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..02d95b5<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yg=
gdsl.rst<br>
&gt; +@@ -0,0 +1,15 @@<br>
&gt; ++On Linux the :mod:`multiprocessing` module returns to using filesyst=
em backed<br>
&gt; ++unix domain sockets for communication with the *forkserver* process =
instead of<br>
&gt; ++the Linux abstract socket namespace.=C2=A0 Only code that chooses to=
 use the<br>
&gt; ++:ref:`&quot;forkserver&quot; start method &lt;multiprocessing-start-=
methods&gt;` is affected.<br>
&gt; ++<br>
&gt; ++Abstract sockets have no permissions and could allow any user on the=
 system in<br>
&gt; ++the same `network namespace<br>
&gt; ++&lt;<a href=3D"https://man7.org/linux/man-pages/man7/network_namespa=
ces.7.html" rel=3D"noreferrer" target=3D"_blank">https://man7.org/linux/man=
-pages/man7/network_namespaces.7.html</a>&gt;`_ (often the<br>
&gt; ++whole system) to inject code into the multiprocessing *forkserver* p=
rocess.<br>
&gt; ++This was a potential privilege escalation. Filesystem based socket p=
ermissions<br>
&gt; ++restrict this to the *forkserver* process user as was the default in=
 Python 3.8<br>
&gt; ++and earlier.<br>
&gt; ++<br>
&gt; ++This prevents Linux `CVE-2022-42919<br>
&gt; ++&lt;<a href=3D"https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-=
2022-42919" rel=3D"noreferrer" target=3D"_blank">https://cve.mitre.org/cgi-=
bin/cvename.cgi?name=3DCVE-2022-42919</a>&gt;`_.<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
10.7.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.10.7.bb</a> b/meta/=
recipes-devtools/python/<a href=3D"http://python3_3.10.7.bb" rel=3D"norefer=
rer" target=3D"_blank">python3_3.10.7.bb</a><br>
&gt; index 404a582135..2d230793ef 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.7.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.10.7.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.10.7.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.10.7.bb</a><br>
&gt; @@ -35,6 +35,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/f=
tp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_=
blank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-setup.py-Do=
-not-detect-multiarch-paths-when-cross-co.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://deterministic_im=
ports.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Avoid-sheba=
ng-overflow-on-python-config.py.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-42919.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI:append:class-native =3D &quot; \<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#173744): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/173744" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/173744</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95236618=
/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/95236618/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000000934ad05ee4efde9--

