Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f176.google.com (mail-yb0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7254F71DEC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 13:27:44 +0000 (UTC)
Received: by mail-yb0-f176.google.com with SMTP id 123so140428080ybe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 05:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YTO2/aXZC68YjSt/0592quPV+oxyEgNvpRk2YxYLpOQ=;
	b=PXte1JHKJF0e8NkJADjkss8UxbUfQklNkbT3JhS3JyLFTZd/11w0aTwoGBLH6eXhsx
	rjUK87BR1tZbQvVSiDhg3AhXK+sMOhTwXiTDaT/P69CWek/fRWvFxBLorRRh9hFg3C9p
	BxphmLmdJi3nepcDDLnMqd7MuD5maG2NxFrfJW0p7WWHFnPCgsD5q5cv8zfiNeGVxD8H
	+6e23/jrjHZBsg7kWOj58utf9REMrZRjAhixHNQnCApln0xWL70aHYPVig7lQJxnNapY
	fRdghZut0CAMHmRNpXE4h/TqnHgfc0udarJ+G4yJExAwVu2ISADbf+KfRn8Vl02lH4nE
	8LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YTO2/aXZC68YjSt/0592quPV+oxyEgNvpRk2YxYLpOQ=;
	b=l7Vx53wwaECbqGdOdNlAeDAtIZwgA08vVWsqcnMZahABm1nFQBN9pDH2ZMMtcCt2HX
	rSJz8RkB55lazzzAI+0GB6ckfbi34csHJkTlbsBsu3LI6/dbvz3hCTRm4OOE/fnB6/Me
	0JOdqMF7KJvUwPs3zmxKTC2IqW0RqH93tfPfZJLfkN+kbVyOKepU9cAZW8n7GLpqDK6g
	OVqzhLkD7yWrUJJTDy3Yk9dTgiFHbDzfxanzUZvuVJwuPqCBNx2HXHvvMHNOid+UKVen
	oiYiMTm+wZX7AvqbjhOBBhE0ut0zJKffY4i6aPEVGuOhOoUJKxYuqUas7OS/FKI9uuS8
	HJog==
X-Gm-Message-State: AIkVDXL94o8c5Xs2F3zfr+YZUHIQIYcoXEsQOhuds63g95OTMNIZHO5PGEWM+HSHP06fcYgcYePFkP9JdGkjxwru
X-Received: by 10.37.21.195 with SMTP id 186mr1824551ybv.103.1485955665126;
	Wed, 01 Feb 2017 05:27:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Wed, 1 Feb 2017 05:27:14 -0800 (PST)
In-Reply-To: <1485953637.14144.27.camel@linuxfoundation.org>
References: <1485943415-8260-1-git-send-email-jussi.kukkonen@intel.com>
	<1485948194.14144.23.camel@linuxfoundation.org>
	<CAHiDW_GosUv9rS2c5yZXvWgReno1rorTk4cR5J00+XZPb9wytg@mail.gmail.com>
	<1485950456.14144.25.camel@linuxfoundation.org>
	<CAHiDW_FdD4ms=zYtdsXWvy8gqSWzTrazC3dCkn_vKxtEL4L2oQ@mail.gmail.com>
	<1485953637.14144.27.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 1 Feb 2017 15:27:14 +0200
Message-ID: <CAHiDW_GGPa1e-ukKPiFdQNhOWWX4C7EDFmugBeKBUviZWDJFwA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Fix make_relative_symlink() for RSS
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
X-List-Received-Date: Wed, 01 Feb 2017 13:27:47 -0000
Content-Type: multipart/alternative; boundary=001a113e43da92bf7605477803d7

--001a113e43da92bf7605477803d7
Content-Type: text/plain; charset=UTF-8

On 1 February 2017 at 14:53, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2017-02-01 at 14:38 +0200, Jussi Kukkonen wrote:
> > On 1 February 2017 at 14:00, Richard Purdie <richard.purdie@linuxfoun
> > dation.org> wrote:
> > > On Wed, 2017-02-01 at 13:44 +0200, Jussi Kukkonen wrote:
> > > > On 1 February 2017 at 13:23, Richard Purdie <richard.purdie@linux
> > > foun
> > > > dation.org> wrote:
> > > > > On Wed, 2017-02-01 at 12:03 +0200, Jussi Kukkonen wrote:
> > > > > > Recipe-specific sysroots broke make_relative_symlink(), which
> > > > > > turns absolute symlinks in sysroots into relative ones. Use
> > > the
> > > > > > difference between the (in-sysroot) paths to construct the
> > > > > relative
> > > > > > symlink.
> > > > > >
> > > > > > This fixes links in openssl-native, fontconfig-native and
> > > bzip2-
> > > > > > native.
> > > > > >
> > > > > > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > > > > > ---
> > > > > >
> > > > > > sstate is not an area I'm familiar with, please take a good
> > > look.
> > > > > >
> > > > > > As far as I could see outputpath (based on state[2]) was
> > > never
> > > > > really
> > > > > > needed so I did not use it in the new version.
> > > > >
> > > > > I don't think we can hardcode workdir into here as for tasks
> > > like
> > > > > do_deploy, this makes no sense. I think we removed most of the
> > > > > absolute
> > > > > links from the deploy tasks so we currently don't need this, at
> > > > > least
> > > > > in the common case but the sstate code is meant to be generic.
> > > > >
> > > > > I am wondering if we need to pass in anything at all, can't we
> > > just
> > > > > call relpath on the original path and turn it into a relative
> > > one
> > > > > directly without referencing it back to TMPDIR/WORKDIR?
> > > > >
> > > > The actual file path during do_populate_sysroot is something like
> > > >   /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-
> > > > r0/sysroot-destdir/mnt/extra-ssd/tmp/work/x86_64-linux/openssl-
> > > > native/1.0.2j-r0/recipe-sysroot-native/usr/lib/ssl/certs
> > > >
> > > > and the link before make_relative_symlink() points to
> > > >   /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-
> > > > r0/recipe-sysroot-native/etc/ssl/certs
> > > >
> > > > Assuming those are correct, I don't see how to do this without
> > > > referencing WORKDIR or TMPDIR?
> > >
> > > Good point, I knew I was missing something. How about passing in
> > > walkroot/state[1] into the function, then you can subtract that
> > > from
> > > the actual file, then run relpath between the (srcpath - walkroot)
> > > and
> > > the link?
> >
> > Figuring out a sysroot-based path for srcpath is indeed possible (and
> > nicer) using state[1] but then I have:
> >   path /usr/lib/ssl/certs
>
> Are you sure path isn't /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-
> native/1.0.2j-r0/recipe-sysroot-native/usr/lib/ssl/certs ?
>

state[1] really is the whole thing until and including
"recipe-sysroot-native":

/mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/sysroot-destdir/mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/recipe-sysroot-native
removing that prefix from path leaves me with
  /usr/lib/ssl/certs

--001a113e43da92bf7605477803d7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
 February 2017 at 14:53, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@l=
inuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Wed, 2017-02-01 at 14:38 +0200, Jussi Kukkonen wrote:=
<br>
&gt; On 1 February 2017 at 14:00, Richard Purdie &lt;richard.purdie@linuxfo=
un<br>
<div><div class=3D"gmail-h5">&gt; <a href=3D"http://dation.org" rel=3D"nore=
ferrer" target=3D"_blank">dation.org</a>&gt; wrote:<br>
&gt; &gt; On Wed, 2017-02-01 at 13:44 +0200, Jussi Kukkonen wrote:<br>
&gt; &gt; &gt; On 1 February 2017 at 13:23, Richard Purdie &lt;richard.purd=
ie@linux<br>
&gt; &gt; foun<br>
&gt; &gt; &gt; <a href=3D"http://dation.org" rel=3D"noreferrer" target=3D"_=
blank">dation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; On Wed, 2017-02-01 at 12:03 +0200, Jussi Kukkonen wrote=
:<br>
&gt; &gt; &gt; &gt; &gt; Recipe-specific sysroots broke make_relative_symli=
nk(), which<br>
&gt; &gt; &gt; &gt; &gt; turns absolute symlinks in sysroots into relative =
ones. Use<br>
&gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; difference between the (in-sysroot) paths to const=
ruct the<br>
&gt; &gt; &gt; &gt; relative<br>
&gt; &gt; &gt; &gt; &gt; symlink.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; This fixes links in openssl-native, fontconfig-nat=
ive and<br>
&gt; &gt; bzip2-<br>
&gt; &gt; &gt; &gt; &gt; native.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailt=
o:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; sstate is not an area I&#39;m familiar with, pleas=
e take a good<br>
&gt; &gt; look.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; As far as I could see outputpath (based on state[2=
]) was<br>
&gt; &gt; never<br>
&gt; &gt; &gt; &gt; really<br>
&gt; &gt; &gt; &gt; &gt; needed so I did not use it in the new version.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I don&#39;t think we can hardcode workdir into here as =
for tasks<br>
&gt; &gt; like<br>
&gt; &gt; &gt; &gt; do_deploy, this makes no sense. I think we removed most=
 of the<br>
&gt; &gt; &gt; &gt; absolute<br>
&gt; &gt; &gt; &gt; links from the deploy tasks so we currently don&#39;t n=
eed this, at<br>
&gt; &gt; &gt; &gt; least<br>
&gt; &gt; &gt; &gt; in the common case but the sstate code is meant to be g=
eneric.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I am wondering if we need to pass in anything at all, c=
an&#39;t we<br>
&gt; &gt; just<br>
&gt; &gt; &gt; &gt; call relpath on the original path and turn it into a re=
lative<br>
&gt; &gt; one<br>
&gt; &gt; &gt; &gt; directly without referencing it back to TMPDIR/WORKDIR?=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; The actual file path during do_populate_sysroot is something=
 like<br>
&gt; &gt; &gt; =C2=A0 /mnt/extra-ssd/tmp/work/x86_<wbr>64-linux/openssl-nat=
ive/1.0.<wbr>2j-<br>
&gt; &gt; &gt; r0/sysroot-destdir/mnt/extra-<wbr>ssd/tmp/work/x86_64-linux/=
<wbr>openssl-<br>
&gt; &gt; &gt; native/1.0.2j-r0/recipe-<wbr>sysroot-native/usr/lib/ssl/<wbr=
>certs<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; and the link before make_relative_symlink() points to=C2=A0<=
br>
&gt; &gt; &gt; =C2=A0 /mnt/extra-ssd/tmp/work/x86_<wbr>64-linux/openssl-nat=
ive/1.0.<wbr>2j-<br>
&gt; &gt; &gt; r0/recipe-sysroot-native/etc/<wbr>ssl/certs<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Assuming those are correct, I don&#39;t see how to do this w=
ithout<br>
&gt; &gt; &gt; referencing WORKDIR or TMPDIR?<br>
&gt; &gt;<br>
&gt; &gt; Good point, I knew I was missing something. How about passing in<=
br>
&gt; &gt; walkroot/state[1] into the function, then you can subtract that<b=
r>
&gt; &gt; from<br>
&gt; &gt; the actual file, then run relpath between the (srcpath - walkroot=
)<br>
&gt; &gt; and<br>
&gt; &gt; the link?<br>
&gt;<br>
&gt; Figuring out a sysroot-based path for srcpath is indeed possible (and<=
br>
&gt; nicer) using state[1] but then I have:<br>
&gt; =C2=A0 path /usr/lib/ssl/certs<br>
<br>
</div></div>Are you sure path isn&#39;t /mnt/extra-ssd/tmp/work/x86_<wbr>64=
-linux/openssl-<br>
native/1.0.2j-r0/recipe-<wbr>sysroot-native/usr/lib/ssl/<wbr>certs ?<br></b=
lockquote><div><br></div><div>state[1] really is the whole thing until and =
including &quot;recipe-sysroot-native&quot;:</div><div>=C2=A0 /mnt/extra-ss=
d/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/sysroot-destdir/mnt/extra-=
ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/recipe-sysroot-native<br=
></div><div>removing that prefix from path leaves me with</div><div>=C2=A0=
=C2=A0/usr/lib/ssl/certs</div><div><br></div><div><br></div></div></div></d=
iv>

--001a113e43da92bf7605477803d7--
