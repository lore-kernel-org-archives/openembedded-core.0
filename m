Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3A474ED2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Jun 2018 08:59:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 18-v6so6982401wml.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2018 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OacGcc9mqhMlBJyRMlYzDilxOvzhqIMpxMqAXTGF2qs=;
	b=Mjro/YxEEqQqboN5IcWXey+1d7bRBhjMvD8fhSs2YGNrqDHOWHIdkKoy1/AVRWioNQ
	SxjLeJjilsYahJ+6zQCm5QsDVK+gwzXfQ7G8GyMQEUWk/4OVgmJNG81diaplKhJVCwkJ
	cheiL5hERPapRHdQeKkf99RhQD5iaxUHaOnSGqF64iGUvYZdCDq9p8PSo8durps0H8uf
	GKYll3LY6P8RP5iLg+kFGxOlyYIR9iixLkb8XyBSM0+cxpiHzudpPSENpivkMH77dbMk
	CF6y3yD5esipygEuwjUjxEI1UGKnmpeymw9ieUUG7VTED2EuRpmDlIQIu1PmrPpvW0+v
	eDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OacGcc9mqhMlBJyRMlYzDilxOvzhqIMpxMqAXTGF2qs=;
	b=pz/TY4XiIx1Vu8bHvsS0o5YVvHg9+hlKOf2U7n0NQ7/r18CnFj61YRq8PWVptA+O0v
	HKyeKIegZuukf99K/VDLhCMWnAH5fovv7SgIDaKkhfmjvK4hABAnF02U4KyXmhbafpYT
	wsYHTmbYlBN3Du2683PnIAq2RsYC6ZrA4RmZ6vyqb51+QDWA25i0L8NeaKIM3MxnUfwQ
	2/ora7URU8OvtuwPZOIxtct4+ua2XUAs3Ff5wOazhOSX5YYXsekB4UZEKGcaXWlC35Y1
	RLX3D4U/Q9bEvurQCxu8ylbz5hKhuBzvRDfUV0ORmikNh62PjnLzY95UaAF6X/nbEtJ4
	UB6A==
X-Gm-Message-State: ALKqPwf2YpqsmSn4l5GO7lW/ndm8wiCG6XTrnxpHgCtTXtGMPmGVighO
	fYyV2l7BgePJ+8s+4yID0mzfdj9HTVg7wGjs1HA=
X-Google-Smtp-Source: ADUXVKITF/P+9LhW0ecE8MDi2BVmtIY8ViyvC1nvtPC6RQKSB6KpUHToydWJYeb4jGnbksixWjD1LJXM0tqZBrF3b3E=
X-Received: by 2002:a1c:988d:: with SMTP id
	a135-v6mr5017848wme.79.1527929942866; 
	Sat, 02 Jun 2018 01:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180601154209.673-1-Martin.Jansa@gmail.com>
	<3e0d91cb-4fd1-d563-be97-779ae5dfa2e1@gmail.com>
In-Reply-To: <3e0d91cb-4fd1-d563-be97-779ae5dfa2e1@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 2 Jun 2018 10:58:53 +0200
Message-ID: <CA+chaQf+8=Mtq0E62fSQHwnL=29o4bhAogbQwwV7eV0MY0A8UA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix build with gcc8
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
X-List-Received-Date: Sat, 02 Jun 2018 08:59:02 -0000
Content-Type: multipart/alternative; boundary="0000000000007c80a2056da4e966"

--0000000000007c80a2056da4e966
Content-Type: text/plain; charset="UTF-8"

I'm surprised that this is reproducible with gcc7 used in Sumo.

Khem suggested to use signed char instead, the pull-request in upstream was
updated with signed char as well:
https://github.com/systemd/systemd/pull/9156

I'll send v2.

On Sat, Jun 2, 2018 at 4:03 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 06/01/2018 08:42 AM, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  ...ild-with-gcc8-Werror-format-truncati.patch | 53 +++++++++++++++++++
> >  meta/recipes-core/systemd/systemd_237.bb      |  1 +
> >  2 files changed, 54 insertions(+)
>
> I am seeing this same issue in Sumo and I have applied this patch.  Its
> currently running a test build.
> - armin
> >  create mode 100644
> meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
> >
> > diff --git
> a/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
> b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
> > new file mode 100644
> > index 0000000000..e44f431073
> > --- /dev/null
> > +++
> b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
> > @@ -0,0 +1,53 @@
> > +From f9fd4546c25a15629544bc4642a74d7909cc0840 Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Fri, 1 Jun 2018 15:22:28 +0000
> > +Subject: [PATCH] time-util: fix build with gcc8
> -Werror=format-truncation=
> > +
> > +* it fails with gcc8 when -O1 or -Os is used (and -ftree-vrp which is
> added by -O2 and higher isn't used)
> > +
> > +../git/src/basic/time-util.c: In function 'format_timespan':
> > +../git/src/basic/time-util.c:508:46: error: '%0*llu' directive output
> between 1 and 2147483647 bytes may cause result to exceed 'INT_MAX'
> [-Werror=format-truncation=]
> > +
> "%s"USEC_FMT".%0*"PRI_USEC"%s",
> > +                                              ^~~~
> > +../git/src/basic/time-util.c:508:60: note: format string is defined here
> > +
> "%s"USEC_FMT".%0*"PRI_USEC"%s",
> > +../git/src/basic/time-util.c:508:46: note: directive argument in the
> range [0, 18446744073709551614]
> > +
> "%s"USEC_FMT".%0*"PRI_USEC"%s",
> > +                                              ^~~~
> > +../git/src/basic/time-util.c:507:37: note: 'snprintf' output 4 or more
> bytes (assuming 2147483651) into a destination of size 4294967295
> > +                                 k = snprintf(p, l,
> > +                                     ^~~~~~~~~~~~~~
> > +
> "%s"USEC_FMT".%0*"PRI_USEC"%s",
> > +
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +                                              p > buf ? " " : "",
> > +                                              ~~~~~~~~~~~~~~~~~~~
> > +                                              a,
> > +                                              ~~
> > +                                              j,
> > +                                              ~~
> > +                                              b,
> > +                                              ~~
> > +                                              table[i].suffix);
> > +                                              ~~~~~~~~~~~~~~~~
> > +cc1: some warnings being treated as errors
> > +
> > +Upstream-Status: Submitted https://github.com/systemd/systemd/pull/9156
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + src/basic/time-util.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/basic/time-util.c b/src/basic/time-util.c
> > +index 0601d4fa9..db5a9cd78 100644
> > +--- a/src/basic/time-util.c
> > ++++ b/src/basic/time-util.c
> > +@@ -484,7 +484,7 @@ char *format_timespan(char *buf, size_t l, usec_t
> t, usec_t accuracy) {
> > +                 /* Let's see if we should shows this in dot notation */
> > +                 if (t < USEC_PER_MINUTE && b > 0) {
> > +                         usec_t cc;
> > +-                        int j;
> > ++                        char j;
> > +
> > +                         j = 0;
> > +                         for (cc = table[i].usec; cc > 1; cc /= 10)
> > diff --git a/meta/recipes-core/systemd/systemd_237.bb
> b/meta/recipes-core/systemd/systemd_237.bb
> > index 2e6558ded1..0113c2dc72 100644
> > --- a/meta/recipes-core/systemd/systemd_237.bb
> > +++ b/meta/recipes-core/systemd/systemd_237.bb
> > @@ -54,6 +54,7 @@ SRC_URI += "file://touchscreen.rules \
> >             file://libmount.patch \
> >
>  file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
> >
>  file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
> > +
>  file://0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch \
> >             "
> >  SRC_URI_append_qemuall = "
> file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
> >
>
>

--0000000000007c80a2056da4e966
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m surprised that this is reproducible with gcc7 used=
 in Sumo.<div><br></div><div>Khem suggested to use signed char instead, the=
 pull-request in upstream was updated with signed char as well:</div><div><=
a href=3D"https://github.com/systemd/systemd/pull/9156">https://github.com/=
systemd/systemd/pull/9156</a><br></div><div><br></div><div>I&#39;ll send v2=
.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Jun 2,=
 2018 at 4:03 AM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">aku=
ster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><b=
r>
<br>
On 06/01/2018 08:42 AM, Martin Jansa wrote:<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...ild-with-gcc8-Werror-format-truncati.patch | 53 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_237.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 54 insertions(+)<br>
<br>
I am seeing this same issue in Sumo and I have applied this patch.=C2=A0 It=
s<br>
currently running a test build.<br>
- armin<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/systemd/systemd/0036-time-u=
til-fix-build-with-gcc8-Werror-format-truncati.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/systemd/systemd/0036-time-util-fix-buil=
d-with-gcc8-Werror-format-truncati.patch b/meta/recipes-core/systemd/system=
d/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e44f431073<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-=
gcc8-Werror-format-truncati.patch<br>
&gt; @@ -0,0 +1,53 @@<br>
&gt; +From f9fd4546c25a15629544bc4642a74d7909cc0840 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" targ=
et=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 1 Jun 2018 15:22:28 +0000<br>
&gt; +Subject: [PATCH] time-util: fix build with gcc8 -Werror=3Dformat-trun=
cation=3D<br>
&gt; +<br>
&gt; +* it fails with gcc8 when -O1 or -Os is used (and -ftree-vrp which is=
 added by -O2 and higher isn&#39;t used)<br>
&gt; +<br>
&gt; +../git/src/basic/time-util.c: In function &#39;format_timespan&#39;:<=
br>
&gt; +../git/src/basic/time-util.c:508:46: error: &#39;%0*llu&#39; directiv=
e output between 1 and 2147483647 bytes may cause result to exceed &#39;INT=
_MAX&#39; [-Werror=3Dformat-truncation=3D]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%s&quot;USEC_FMT&quot;.%0*&quot;PRI_USEC&quot;%s&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~<br>
&gt; +../git/src/basic/time-util.c:508:60: note: format string is defined h=
ere<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%s&quot;USEC_FMT&quot;.%0*&quot;PRI_USEC&quot;%s&qu=
ot;,<br>
&gt; +../git/src/basic/time-util.c:508:46: note: directive argument in the =
range [0, 18446744073709551614]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%s&quot;USEC_FMT&quot;.%0*&quot;PRI_USEC&quot;%s&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~<br>
&gt; +../git/src/basic/time-util.c:507:37: note: &#39;snprintf&#39; output =
4 or more bytes (assuming 2147483651) into a destination of size 4294967295=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k =3D snprintf(p, l,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~=
~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%s&quot;USEC_FMT&quot;.%0*&quot;PRI_USEC&quot;%s&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 p &gt; buf ? &quot; &quot; : &quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~~~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 a,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 j,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 b,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~~<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 table[i].suffix);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~~~~~~~~~~~~~~~~<br>
&gt; +cc1: some warnings being treated as errors<br>
&gt; +<br>
&gt; +Upstream-Status: Submitted <a href=3D"https://github.com/systemd/syst=
emd/pull/9156" rel=3D"noreferrer" target=3D"_blank">https://github.com/syst=
emd/systemd/pull/9156</a><br>
&gt; +<br>
&gt; +Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/basic/time-util.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/basic/time-util.c b/src/basic/time-util.c<br>
&gt; +index 0601d4fa9..db5a9cd78 100644<br>
&gt; +--- a/src/basic/time-util.c<br>
&gt; ++++ b/src/basic/time-util.c<br>
&gt; +@@ -484,7 +484,7 @@ char *format_timespan(char *buf, size_t l, usec_t=
 t, usec_t accuracy) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Let&=
#39;s see if we should shows this in dot notation */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (t &=
lt; USEC_PER_MINUTE &amp;&amp; b &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0usec_t cc;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int j;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 char j;<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0j =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0for (cc =3D table[i].usec; cc &gt; 1; cc /=3D 10)<br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_237.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_237.bb" rel=3D"noreferrer" target=3D"=
_blank">systemd_237.bb</a><br>
&gt; index 2e6558ded1..0113c2dc72 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_237.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_237.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_237.bb</a><br>
&gt; @@ -54,6 +54,7 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libmount.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0034-Fix-format-=
truncation-compile-failure-by-typecasting.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0035-Define-glib=
c-compatible-basename-for-non-glibc-syste.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0036-time-util-fix-bu=
ild-with-gcc8-Werror-format-truncati.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI_append_qemuall =3D &quot; file://0001-core-device.c-Chan=
ge-the-default-device-timeout-to-2.patch&quot;<br>
&gt;=C2=A0 <br>
<br>
</blockquote></div>

--0000000000007c80a2056da4e966--
