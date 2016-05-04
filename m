Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB78C7002B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 18:56:16 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id x35so7068496ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 11:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=L56DhLUoB/ILmxYIQMcPKGRybryS7n81Cjsg0HEOUK8=;
	b=lJfieOi/NNlIKv7OSLVMPueUdYBQsdoryon3DzRzJ3yxebxzjpyD0uxbJT7ocTrD4q
	z66Al8K9tcb1H2IFEUdtlLeSK9lbSWiV12eZbmNMI3VBFHbfQIUL9e1FtQ528afwxnH0
	KA6nZE0OipnPmP9ep8Vx2GbJ4LHHbpdJjxKP/fvZSa1ehgIUVieQHTqFrq1/ccsb6YKr
	DG/seHtRGbh5t0H3B/82cn8e2rCA3Gpgcew4SjS3v0y3szLp+EOMZdv5V5nrBBHKjPda
	zWnCH/YTih5ru6rVPX/pDyMJ2TepByJYYVJaGMsOwbAMWdQQU34J8T8kP7uIlb1Fv+Mm
	jAUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=L56DhLUoB/ILmxYIQMcPKGRybryS7n81Cjsg0HEOUK8=;
	b=mJ7ykZkrq5WACrvQOUBVyeqTej2HI2xIONByEjakXv7Jg369wO7FGVZIxl8GSZ5iS9
	IRO9L3U0Vh3vYln+bgoVFIEUNVtQ9rkUkwuyN72s10RZe8kwJM7J5eKHfw+4jkGtOXGJ
	w7vt1Y7E/6Eq+6hKFrzM5oxqU+f2ZajkyS5EUB1KP4O5pFjNtvv0S7XZb7DWshLUBqo7
	xPGNnTd3tHyAV6AIPlsocheXnhzUt8TZ3tTr6BaSxtONRXLqmkEGS28OcbKiV1FClcGt
	goTgu4QsKx4bZCuu9wpawGSpABsmsf6PU7VZx70ZSCzJs+nuhyOj9Eq9ArMvMLHduCEz
	rxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=L56DhLUoB/ILmxYIQMcPKGRybryS7n81Cjsg0HEOUK8=;
	b=PusNmKHwSkI7zWcndNIW++3FlDMAK32p6w7XUVUqvdaTuLfJtzt2RcqwLP0sVv+1am
	ItTREDg0f6Y0FLgyL2Dakx4doi4qCoGRw7bmgEYvhA3ppw60RuDcRGwnENjqXlYQm4MJ
	C8cpJDUkoY3I/zbmyyFM+drC7uae/EVbAJJy88swA8GyGKu+5/I628liKitE0LZpzkd/
	ehLZ+UB9eASLM43gDFETgaz/k2YYscAbvO30g91IrVgHMcLPdtT9pdQ6bWGyQVLY3L3i
	Xh2GdrF6l6HB+swMFLFjWhiJR8kxuV5KJjt6irQBZjhIVJd8ZtnTuFqkdEeF1J3J1OCp
	nzrA==
X-Gm-Message-State: AOPr4FUIra1DrJwZt6bUOGWInk9jhiNE5Shvf+NhGy93vOv2s1xeTdcSzl2085ADjDXCcrtxFc3E29UVYEYJoA==
X-Received: by 10.107.131.12 with SMTP id f12mr12838112iod.126.1462388177038; 
	Wed, 04 May 2016 11:56:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Wed, 4 May 2016 11:55:57 -0700 (PDT)
In-Reply-To: <20160504070139.GB10864@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
	<9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
	<CABcZANkwedfVVu2cxREq2Qp2UECdtAfrcgZ5V9LfVPtkR5sjaA@mail.gmail.com>
	<CABcZANnwMhYwjVZwGGqrGERPbZoTrEaJ3P1WhGriG_RT9kUbtg@mail.gmail.com>
	<20160504070139.GB10864@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 4 May 2016 18:55:57 +0000
X-Google-Sender-Auth: 3Hgj4LaTlZnAx8ybNaSrroHgxq8
Message-ID: <CABcZANnbS3xvxmrSX-L8m=4HBcD_yCkXKFyS9xT8ATA_Ziqfag@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 4/6] bmap-tools: generate standalone script
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
X-List-Received-Date: Wed, 04 May 2016 18:56:16 -0000
Content-Type: multipart/alternative; boundary=001a113f31c2d137ac053208c7e8

--001a113f31c2d137ac053208c7e8
Content-Type: text/plain; charset=UTF-8

On Wed, May 4, 2016 at 7:01 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> On Tue, May 03, 2016 at 07:33:58PM +0000, Christopher Larson wrote:
> > On Tue, May 3, 2016 at 7:31 PM, Christopher Larson <clarson@kergoth.com>
> > wrote:
> >
> > >
> > >
> > > On Mon, May 2, 2016 at 12:22 PM, Ed Bartosh <
> ed.bartosh@linux.intel.com>
> > > wrote:
> > >
> > >> Generated standalone bmaptool script that is more convenient
> > >> to use than native script. It can be run straight from
> > >> its location ./tmp/deploy/tools/bmaptool. The script doesn't
> > >> depend on anything except Python.
> > >>
> > >> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > >>
> > >
> > > You're right that this is very handy, but we hit a problem when
> building
> > > from shared state. This uses do_deploy to deploy bmaptool into
> > > DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only depends on
> do_populate_sysroot,
> > > not do_deploy, so an image build from sstate won't write this script
> out.
> > >
> > > I don't know the right way to fix this, but it's a problem. I just ran
> > > into it :)
> > >
> >
> > Also, the convention is to add do_deploy before do_build, not before
> > do_package, otherwise do_deploy's checksum is included int he checksums
> of
> > do_package and subsequent tasks, even though its output isn't used by any
> > subsequent tasks.
>
> I also found this a bit unusual to put the tool into deploy/tools.
> That's why I isolated this change. I think it requires some more
> testing, but the rest of patchset can be accepted without it.


Yeah, putting it there does require some discussion in general. Personally,
I'm in favor of such a thing, because we don't want to put generated
convenience tools in the sysroot, since we tell people explicitly to not
use sysroot contents directly.

Regarding getting it built for the image, I'd suggest adding something like
IMAGE_TASKDEPENDS to image_type.bbclass, which is basically like
IMAGE_DEPENDS, but with the task included. I.e. IMAGE_TASKDEPENDS_bmap =
"bmap-tools-native:do_deploy". Then you wouldn't need the 'before
do_package', and it'd fix the from-sstate usage.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113f31c2d137ac053208c7e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, May 4, 2016 at 7:01 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On Tue, May 03, 2016 at 07:33:58PM +0000, Christopher Larson wrote:<b=
r>
&gt; On Tue, May 3, 2016 at 7:31 PM, Christopher Larson &lt;<a href=3D"mail=
to:clarson@kergoth.com">clarson@kergoth.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, May 2, 2016 at 12:22 PM, Ed Bartosh &lt;<a href=3D"mailto=
:ed.bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; Generated standalone bmaptool script that is more convenient<=
br>
&gt; &gt;&gt; to use than native script. It can be run straight from<br>
&gt; &gt;&gt; its location ./tmp/deploy/tools/bmaptool. The script doesn&#3=
9;t<br>
&gt; &gt;&gt; depend on anything except Python.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@li=
nux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; You&#39;re right that this is very handy, but we hit a problem wh=
en building<br>
&gt; &gt; from shared state. This uses do_deploy to deploy bmaptool into<br=
>
&gt; &gt; DEPLOY_DIR_IMAGE, but IMAGE_DEPENDS only depends on do_populate_s=
ysroot,<br>
&gt; &gt; not do_deploy, so an image build from sstate won&#39;t write this=
 script out.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t know the right way to fix this, but it&#39;s a proble=
m. I just ran<br>
&gt; &gt; into it :)<br>
&gt; &gt;<br>
&gt;<br>
&gt; Also, the convention is to add do_deploy before do_build, not before<b=
r>
&gt; do_package, otherwise do_deploy&#39;s checksum is included int he chec=
ksums of<br>
&gt; do_package and subsequent tasks, even though its output isn&#39;t used=
 by any<br>
&gt; subsequent tasks.<br>
<br>
</span>I also found this a bit unusual to put the tool into deploy/tools.<b=
r>
That&#39;s why I isolated this change. I think it requires some more<br>
testing, but the rest of patchset can be accepted without it.</blockquote><=
/div><br>Yeah, putting it there does require some discussion in general. Pe=
rsonally, I&#39;m in favor of such a thing, because we don&#39;t want to pu=
t generated convenience tools in the sysroot, since we tell people explicit=
ly to not use sysroot contents directly.<br><br clear=3D"all"><div>Regardin=
g getting it built for the image, I&#39;d suggest adding something like IMA=
GE_TASKDEPENDS to image_type.bbclass, which is basically like IMAGE_DEPENDS=
, but with the task included. I.e. IMAGE_TASKDEPENDS_bmap =3D &quot;bmap-to=
ols-native:do_deploy&quot;. Then you wouldn&#39;t need the &#39;before do_p=
ackage&#39;, and it&#39;d fix the from-sstate usage.</div>-- <br><div class=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--001a113f31c2d137ac053208c7e8--
