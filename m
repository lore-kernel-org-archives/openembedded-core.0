Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id AAB9072F8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 13:17:20 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id t52so24942836qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 06:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gqZUv2gn1erPWrROe6aqNlqQHzR04AfuRiQnJzaig7I=;
	b=BawtZjG55aSd8hKx7zo+hnH3U8bA/TeSy92/l2XE/XvZpAifuD4MTGSC0NrtCFrIsz
	dGhVJXknZnCRT34WUqJMEgBdpjC54En6z5UMMoZ9WF9y2OzLf3aNTz3lqirDJx+XdmnR
	cylRCPBtbZuYGedEnNiMyHtexjWdPWWlDJGBo60AtBqegWKGCXnn7hIb6Njmvlv/Z0On
	u/37YUaZYwniTgl2joG8RvE6wSrAz0EIhHe5qWo6vwGVXHDSqpmCv0pUuh1i/L50i1n8
	ws87V7O/ZXALTZ8opfpOvZY3IFLKFB9tC1jXipBTrvv4Ly3nzhG7RCM4121g8dg5ANle
	ZrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gqZUv2gn1erPWrROe6aqNlqQHzR04AfuRiQnJzaig7I=;
	b=ozI2xOh37j0FuS9TFOrB8eZ6zg2m61vDJUW03TwhtDdPuKnUdPHPVUM1v0OH6X0p0L
	Y9x9rMakLrXmDCHAgfGOoylGe0hMG01MAvu1rJhv/uKiZv6Iu+AVI47GNrqUVFAbDPfh
	qPK5nc7lR4YnKITGrOHCwD+4Q/0+eqKgQldUNnLFiKSbfn5YDYLACQ3wLAkosMoQErA5
	CqeG6hzEjhuxCQBtEmIwkx/6UO69ypPQsBgECiq76LMySqOcJd8IFykdswgBL3ULJAta
	jvcOUpFUxOPNKcuUn4qPtjSz5G5euAY+P0cNU55kRC06QRdFMIQ5ZjTvdgoDKyphz7OB
	WxWg==
X-Gm-Message-State: AN3rC/4Cmcnd+lYUoSIuNeU9xE833OLxhvD36zTWUjGCBN7XAjhxz7mY
	2iNwXDdAX52YYlRyXr04TvGS0pVWNw==
X-Received: by 10.200.54.136 with SMTP id a8mr34742417qtc.87.1493126241505;
	Tue, 25 Apr 2017 06:17:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Tue, 25 Apr 2017 06:17:20 -0700 (PDT)
In-Reply-To: <1493125780.19076.132.camel@linuxfoundation.org>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
	<bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
	<CADkTA4MQ0CToP1h_s5muJt8v-bNuCr9wtD4t+sfq9ThsZZ-AWg@mail.gmail.com>
	<CADkTA4M6OS+sxsueSzdokxuo+AaTTjYrir0uPPazWsMP5dpxFg@mail.gmail.com>
	<CADkTA4P43BsLYpdDR0r7eAGkEc97hB-pQyf431-Nrtb8YUOUeg@mail.gmail.com>
	<CA+chaQeT4kDPVi4TvUaUuHzfVdDAuEtOqOMByi=vb6Onri=nqA@mail.gmail.com>
	<CADkTA4Nm71DESZodfrGKH1bqLT0o2MSn7nmgcFtkLJu57kk_=A@mail.gmail.com>
	<CADkTA4PGVyJ+b2S_77yJS6f0f3osM-yYonE55Khjk-k0oF-j-Q@mail.gmail.com>
	<1493069228.19076.121.camel@linuxfoundation.org>
	<CADkTA4M1m5RLNXyRjyyybD+jNzZbQqkrW+SDtjHu3dP28rb-aA@mail.gmail.com>
	<1493125780.19076.132.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Apr 2017 09:17:20 -0400
Message-ID: <CADkTA4P88ijjCGQ_GEU=4k==zsVQWpLoYW4U6h6YzQ1iYB_i4Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Tue, 25 Apr 2017 13:17:21 -0000
Content-Type: multipart/alternative; boundary=001a1142833c3ad690054dfd8b50

--001a1142833c3ad690054dfd8b50
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2017 at 9:09 AM, Richard Purdie <richard.purdie@
linuxfoundation.org> wrote:

> On Mon, 2017-04-24 at 21:06 -0400, Bruce Ashfield wrote:
> > On Mon, Apr 24, 2017 at 5:27 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Mon, 2017-04-24 at 15:56 -0400, Bruce Ashfield wrote:
> > > >
> > > >
> > > > On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield <bruce.ashfield@g
> > > mail
> > > > .com> wrote:
> > > > >
> > > > >
> > > > > On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa <martin.jansa@gma
> > > il.c
> > > > > om> wrote:
> > >
> > > >
> > > > Richard/Ross: are you seeing this same thing on the autobuilder ?
> > > >
> > > > There's some incantation or config that I'm missing, I assume
> > > this is
> > > > a straight qemux86 config
> > > > with a bitbake of something like core-image-minimal ?
> > >
> > > We're not seeing this on the autobuilders. I do suspect something
> > > in
> > > the handling of extra patches or cfg fragments from SRC_URI if I
> > > had to
> > > guess. That certainly was the trigger last time I saw this.
> > Yah, that's the kicker, I'm still carrying your patch for binfmt_elf,
> > and I added two of my own
> > + config fragments, and I can't trigger anything.
>
> I managed to reproduce breakage. With master and my separate patch in
> SRC_URI:
>
>
This particular issue should be fixed with with patch I sent, late Friday
night:

[OE-core] [PATCH] kernel-yocto/kern-tools: fix do_validate_branches clean
stage

Martin applied it to his builds and is still seeing an issue in the actual
patching phase.
I'm currently not able to reproduce it.

If you do have that patch applied, I'm definitely interested. If you don't,
and have two
minutes to re-run with that applied .. I'd be interested to hear if the
build works after
that.

Cheers,

Bruce

$ bitbake linux-yocto
> $ bitbake linux-yocto -c kernel_checkout -f
> $ bitbake linux-yocto
>
> ERROR: linux-yocto-4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0
> do_validate_branches: Function failed: do_validate_branches (log file is
> located at /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/linu
> x-yocto/4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.
> do_validate_branches.116726)
> ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/w
> ork/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e
> 885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726
> Log data follows:
> | DEBUG: Executing shell function do_validate_branches
> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
> | 1493125671.284715: mkdir: cannot create directory =E2=80=98.=E2=80=99: =
File exists
> | 1493125671.370592:
> | 1493125671.3742917: [ERROR] Can't find patch dir at
> ./patches/standard/base
> | 1493125671.3742917: usage: kgit s2q
> | 1493125671.3743172: WARNING: exit code 1 from a shell command.
> | 1493125671.3745801: ERROR: Function failed: do_validate_branches (log
> file is located at /media/build1/poky/build/tmp/w
> ork/qemux86_64-poky-linux/linux-yocto/4.10.9+gitAUTOINC+ad2e
> 885015_fe0fb8da3d-r0/temp/log.do_validate_branches.116726)
>
> Cheers,
>
> Richard
>
>
>
>


--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1142833c3ad690054dfd8b50
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 25, 2017 at 9:09 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@<wbr>linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><span>On Mon, 2017-04-24 at 21:06 -0400=
, Bruce Ashfield wrote:<br>
&gt; On Mon, Apr 24, 2017 at 5:27 PM, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundatio<wbr>n.org</a>&gt; wrote:<br>
&gt; &gt; On Mon, 2017-04-24 at 15:56 -0400, Bruce Ashfield wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, Apr 24, 2017 at 9:54 AM, Bruce Ashfield &lt;bruce.as=
hfield@g<br>
&gt; &gt; mail<br>
&gt; &gt; &gt; .com&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, Apr 24, 2017 at 9:39 AM, Martin Jansa &lt;marti=
n.jansa@gma<br>
&gt; &gt; il.c<br>
&gt; &gt; &gt; &gt; om&gt; wrote:<br>
&gt; &gt;=C2=A0<br>
&gt; &gt; &gt;<br>
</span><span>&gt; &gt; &gt; Richard/Ross: are you seeing this same thing on=
 the autobuilder ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; There&#39;s some incantation or config that I&#39;m missing,=
 I assume<br>
&gt; &gt; this is<br>
&gt; &gt; &gt; a straight qemux86 config<br>
&gt; &gt; &gt; with a bitbake of something like core-image-minimal ?<br>
&gt; &gt;<br>
&gt; &gt; We&#39;re not seeing this on the autobuilders. I do suspect somet=
hing<br>
&gt; &gt; in<br>
&gt; &gt; the handling of extra patches or cfg fragments from SRC_URI if I<=
br>
&gt; &gt; had to<br>
&gt; &gt; guess. That certainly was the trigger last time I saw this.<br>
&gt; Yah, that&#39;s the kicker, I&#39;m still carrying your patch for binf=
mt_elf,<br>
&gt; and I added two of my own<br>
&gt; + config fragments, and I can&#39;t trigger anything.<br>
<br>
</span>I managed to reproduce breakage. With master and my separate patch i=
n<br>
SRC_URI:<br>
<br></blockquote><div><br></div><div>This particular issue should be fixed =
with with patch I sent, late Friday night:</div><div><br></div><div>[OE-cor=
e] [PATCH] kernel-yocto/kern-tools: fix do_validate_branches clean stage<br=
></div><div><br></div><div>Martin applied it to his builds and is still see=
ing an issue in the actual patching phase.</div><div>I&#39;m currently not =
able to reproduce it.</div><div><br></div><div>If you do have that patch ap=
plied, I&#39;m definitely interested. If you don&#39;t, and have two</div><=
div>minutes to re-run with that applied .. I&#39;d be interested to hear if=
 the build works after</div><div>that.</div><div><br></div><div>Cheers,</di=
v><div><br></div><div>Bruce</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
$ bitbake linux-yocto<br>
$ bitbake linux-yocto -c kernel_checkout -f<br>
$ bitbake linux-yocto<br>
<br>
ERROR: linux-yocto-4.10.9+gitAUTOINC+<wbr>ad2e885015_fe0fb8da3d-r0 do_valid=
ate_branches: Function failed: do_validate_branches (log file is located at=
 /media/build1/poky/build/tmp/w<wbr>ork/qemux86_64-poky-linux/linu<wbr>x-yo=
cto/4.10.9+gitAUTOINC+ad2e<wbr>885015_fe0fb8da3d-r0/temp/log.<wbr>do_valida=
te_branches.116726)<br>
ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/w<wbr>ork=
/qemux86_64-poky-linux/linu<wbr>x-yocto/4.10.9+gitAUTOINC+ad2e<wbr>885015_f=
e0fb8da3d-r0/temp/log.<wbr>do_validate_branches.116726<br>
<span>Log data follows:<br>
| DEBUG: Executing shell function do_validate_branches<br>
| HEAD is now at fe0fb8d Merge tag &#39;v4.10.9&#39; into standard/base<br>
</span>| 1493125671.284715: mkdir: cannot create directory =E2=80=98.=E2=80=
=99: File exists<br>
| 1493125671.370592:<br>
| 1493125671.3742917: [ERROR] Can&#39;t find patch dir at ./patches/standar=
d/base<br>
| 1493125671.3742917: usage: kgit s2q<br>
| 1493125671.3743172: WARNING: exit code 1 from a shell command.<br>
| 1493125671.3745801: ERROR: Function failed: do_validate_branches (log fil=
e is located at /media/build1/poky/build/tmp/w<wbr>ork/qemux86_64-poky-linu=
x/linu<wbr>x-yocto/4.10.9+gitAUTOINC+ad2e<wbr>885015_fe0fb8da3d-r0/temp/log=
.<wbr>do_validate_branches.116726)<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail-m_1060650381739365254gmail_signature">&quot;Thou shalt not follow=
 the NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1142833c3ad690054dfd8b50--
