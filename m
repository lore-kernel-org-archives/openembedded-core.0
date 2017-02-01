Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id EDFAA731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 12:39:28 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id j82so139785012ybg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 04:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ADWd+ifoZAQP9xNy82bGw/YYPRlHKjeK1WFkkBkvBkU=;
	b=QOCnTziB7LsXC1m8BmoWAhrJSCP+PQ0n8qtjxzBgugwTDc/QadL3H1mk7Xsb1uTt2S
	/21g/d7HdvTKgn0dFwy6DDvHmiZ25Pc7sQs8DIB2ozdstw4MS52FSzemyCXXnasebr4P
	egLCCGwu242cBQAum2SekOxIh+Eu5AVMQWJaD3iBVOiifhkGankndFtS2N4GF+jAy7YT
	lSp2AClPnfh4GNV4POu5ii97t9BPvmC/c4PujepM/wj0cktMMejqjUDHnMPA+KEx3/vn
	ONr8jDujDSkVISnQYOnekWx0folSUWSTfs+zFvAbSrjFYNp31RCeAxH80fART0m9FPxV
	kBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ADWd+ifoZAQP9xNy82bGw/YYPRlHKjeK1WFkkBkvBkU=;
	b=QU8XrsrEu2ojFT8kFsFteTneoQ7nJHaZMzZdr7YOkzk0IvbC30wmIg/CO3XI7mPMFE
	rQBp+2Qy8LCTJK/G1C350Gt8khHDNx59gcUld1Od3E1WWD+WAgeDmWLfRINi1WSYMRvJ
	JjAaD6DI47f4yZ7Rg4CMsWUteX+pdCHiCShEjrQqa7C2bxtK1Zq5OFehECHYR+No8Dvu
	g83/kg459j/YQDB1FOG4spIwtkbLjHsZ638tqa3qU47zTOHHEUDITxlh5jaEnunqTTw8
	YDQDX7ICicSTgmeFdV4AMcxsdEvaimeMnw9C05ZJj6yRGEojTXIUFCbxKzerwpLzgLxx
	QP7Q==
X-Gm-Message-State: AIkVDXIfo2kHyyyNkgpxdLo98YqoNxxQnWhIr6NKP6bVGC/zSbsfCPX+nFUTW5DlvjX89NlrKGhbJU/EOVyS0sc1
X-Received: by 10.37.194.3 with SMTP id s3mr1453573ybf.51.1485952768888; Wed,
	01 Feb 2017 04:39:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Wed, 1 Feb 2017 04:38:58 -0800 (PST)
In-Reply-To: <1485950456.14144.25.camel@linuxfoundation.org>
References: <1485943415-8260-1-git-send-email-jussi.kukkonen@intel.com>
	<1485948194.14144.23.camel@linuxfoundation.org>
	<CAHiDW_GosUv9rS2c5yZXvWgReno1rorTk4cR5J00+XZPb9wytg@mail.gmail.com>
	<1485950456.14144.25.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 1 Feb 2017 14:38:58 +0200
Message-ID: <CAHiDW_FdD4ms=zYtdsXWvy8gqSWzTrazC3dCkn_vKxtEL4L2oQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 01 Feb 2017 12:39:30 -0000
Content-Type: multipart/alternative; boundary=001a114d7748f1c5d905477756d3

--001a114d7748f1c5d905477756d3
Content-Type: text/plain; charset=UTF-8

On 1 February 2017 at 14:00, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2017-02-01 at 13:44 +0200, Jussi Kukkonen wrote:
> > On 1 February 2017 at 13:23, Richard Purdie <richard.purdie@linuxfoun
> > dation.org> wrote:
> > > On Wed, 2017-02-01 at 12:03 +0200, Jussi Kukkonen wrote:
> > > > Recipe-specific sysroots broke make_relative_symlink(), which
> > > > turns absolute symlinks in sysroots into relative ones. Use the
> > > > difference between the (in-sysroot) paths to construct the
> > > relative
> > > > symlink.
> > > >
> > > > This fixes links in openssl-native, fontconfig-native and bzip2-
> > > > native.
> > > >
> > > > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > > > ---
> > > >
> > > > sstate is not an area I'm familiar with, please take a good look.
> > > >
> > > > As far as I could see outputpath (based on state[2]) was never
> > > really
> > > > needed so I did not use it in the new version.
> > >
> > > I don't think we can hardcode workdir into here as for tasks like
> > > do_deploy, this makes no sense. I think we removed most of the
> > > absolute
> > > links from the deploy tasks so we currently don't need this, at
> > > least
> > > in the common case but the sstate code is meant to be generic.
> > >
> > > I am wondering if we need to pass in anything at all, can't we just
> > > call relpath on the original path and turn it into a relative one
> > > directly without referencing it back to TMPDIR/WORKDIR?
> > >
> > The actual file path during do_populate_sysroot is something like
> >   /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-
> > r0/sysroot-destdir/mnt/extra-ssd/tmp/work/x86_64-linux/openssl-
> > native/1.0.2j-r0/recipe-sysroot-native/usr/lib/ssl/certs
> >
> > and the link before make_relative_symlink() points to
> >   /mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-
> > r0/recipe-sysroot-native/etc/ssl/certs
> >
> > Assuming those are correct, I don't see how to do this without
> > referencing WORKDIR or TMPDIR?
>
> Good point, I knew I was missing something. How about passing in
> walkroot/state[1] into the function, then you can subtract that from
> the actual file, then run relpath between the (srcpath - walkroot) and
> the link?
>

Figuring out a sysroot-based path for srcpath is indeed possible (and
nicer) using state[1] but then I have:
  path /usr/lib/ssl/certs
  link
/mnt/extra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/recipe-sysroot-native/etc/ssl/certs

Without knowledge of TMPDIR or WORKDIR, I don't see how I can turn link
into anything like
   ../../../etc/ssl/certs

Maybe I'm missing something?

Jussi

--001a114d7748f1c5d905477756d3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
 February 2017 at 14:00, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@l=
inuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">On W=
ed, 2017-02-01 at 13:44 +0200, Jussi Kukkonen wrote:<br>
&gt; On 1 February 2017 at 13:23, Richard Purdie &lt;richard.purdie@linuxfo=
un<br>
&gt; <a href=3D"http://dation.org" rel=3D"noreferrer" target=3D"_blank">dat=
ion.org</a>&gt; wrote:<br>
&gt; &gt; On Wed, 2017-02-01 at 12:03 +0200, Jussi Kukkonen wrote:<br>
&gt; &gt; &gt; Recipe-specific sysroots broke make_relative_symlink(), whic=
h<br>
&gt; &gt; &gt; turns absolute symlinks in sysroots into relative ones. Use =
the<br>
&gt; &gt; &gt; difference between the (in-sysroot) paths to construct the<b=
r>
&gt; &gt; relative<br>
&gt; &gt; &gt; symlink.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This fixes links in openssl-native, fontconfig-native and bz=
ip2-<br>
&gt; &gt; &gt; native.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.ku=
kkonen@intel.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; sstate is not an area I&#39;m familiar with, please take a g=
ood look.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; As far as I could see outputpath (based on state[2]) was nev=
er<br>
&gt; &gt; really<br>
&gt; &gt; &gt; needed so I did not use it in the new version.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think we can hardcode workdir into here as for tasks =
like<br>
&gt; &gt; do_deploy, this makes no sense. I think we removed most of the<br=
>
&gt; &gt; absolute<br>
&gt; &gt; links from the deploy tasks so we currently don&#39;t need this, =
at<br>
&gt; &gt; least<br>
&gt; &gt; in the common case but the sstate code is meant to be generic.<br=
>
&gt; &gt;<br>
&gt; &gt; I am wondering if we need to pass in anything at all, can&#39;t w=
e just<br>
&gt; &gt; call relpath on the original path and turn it into a relative one=
<br>
&gt; &gt; directly without referencing it back to TMPDIR/WORKDIR?<br>
&gt; &gt;<br>
&gt; The actual file path during do_populate_sysroot is something like<br>
&gt; =C2=A0 /mnt/extra-ssd/tmp/work/x86_<wbr>64-linux/openssl-native/1.0.<w=
br>2j-<br>
&gt; r0/sysroot-destdir/mnt/extra-<wbr>ssd/tmp/work/x86_64-linux/<wbr>opens=
sl-<br>
&gt; native/1.0.2j-r0/recipe-<wbr>sysroot-native/usr/lib/ssl/<wbr>certs<br>
&gt;<br>
&gt; and the link before make_relative_symlink() points to=C2=A0<br>
&gt; =C2=A0 /mnt/extra-ssd/tmp/work/x86_<wbr>64-linux/openssl-native/1.0.<w=
br>2j-<br>
&gt; r0/recipe-sysroot-native/etc/<wbr>ssl/certs<br>
&gt;<br>
&gt; Assuming those are correct, I don&#39;t see how to do this without<br>
&gt; referencing WORKDIR or TMPDIR?<br>
<br>
</div></div>Good point, I knew I was missing something. How about passing i=
n<br>
walkroot/state[1] into the function, then you can subtract that from<br>
the actual file, then run relpath between the (srcpath - walkroot) and<br>
the link?<br></blockquote><div><br></div><div>Figuring out a sysroot-based =
path for srcpath is indeed possible (and nicer) using state[1] but then I h=
ave:</div><div>=C2=A0 path /usr/lib/ssl/certs</div><div>=C2=A0 link /mnt/ex=
tra-ssd/tmp/work/x86_64-linux/openssl-native/1.0.2j-r0/recipe-sysroot-nativ=
e/etc/ssl/certs</div><div><br></div><div>Without knowledge of TMPDIR or WOR=
KDIR, I don&#39;t see how I can turn link into anything like</div><div>=C2=
=A0 =C2=A0../../../etc/ssl/certs</div><div><br></div><div>Maybe I&#39;m mis=
sing something?</div><div><br></div><div>Jussi</div></div></div></div>

--001a114d7748f1c5d905477756d3--
