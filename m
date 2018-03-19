Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 312C57890E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 18:39:05 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id h23so21994100iob.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 11:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oWJUZ08m/RRRJuzqPNhP1zaDyDcRWGtYjmCGCK4dB7o=;
	b=gT1Mh0+sk0N7QlR0oD+rbt798rvvAPO3cBkIFxUX8WI6yKCOjlLyvEbzxG3Kb8IBjX
	PwE1LBQysMxRc6xRBdl930kGbwwZaj/JnnnRju4yRMP8hhzbELbCGRYFeMNbTtiaePDL
	VnW+4I65reo9wHoVYfBlOv864KTqzBSD+fcdQi0AAsUkhTd3aLLFTB0pmQqj2iKKNZB4
	Q7SMydvyke3x461yq0Ehof5e17WVJiBtyUzA1HBqTq0133gjzFJi18jwPw9tFTqO9Y38
	mcUFCv7QUQqAYtDhbdryj+j28OtJmcYAuItAbTcdV5QaR7NZiioNSQsAj4FOJLoAycFP
	rPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oWJUZ08m/RRRJuzqPNhP1zaDyDcRWGtYjmCGCK4dB7o=;
	b=kaG6MiXRR6cS2CgcW39Wptc0WqMdVC9+zXOG8emEoF+D1dN9DENLAuYPysMmoKmI/D
	vbaxxSBnoCfxpMb2yQTNwTiFzIafNU26mCkd46Oxe3z8245Dp/H139/wc7ZlOgTlqAiZ
	pYG4u3K598MRp7RvpBUrQUjlKUVpnESWM0otpopFHzEAr91MLaYIN1sLamaj2gWU/eiA
	G8Sy8p+S8y8dbjH8Ic5RRjs4mjmHfLXzTTRpDZCPa1UWDOiBVGiRwFH0UCGfs0P9hkH4
	g5CvoftFDKG7jdhUvgrEsQBOoeZAOXKXgRuEiyP98Pa99yYzaRIT4zYKN4XOwL6WSq8e
	XGDw==
X-Gm-Message-State: AElRT7GOH/0A9QAc81qzAKDG7yDW2a1p9hWOHXtHJ0HVYs96DVF3YOMV
	h+zIJZNDWQQN9fCv7XY8GKheK7zW3byn2lasdpZkMQ==
X-Google-Smtp-Source: AG47ELswWbZaAJyU7GKC2M1nXHKDTgpX2bZjm1vQgQcLUJ319Y0hhneUvLmrQGQ8KfyRHNHpBA22AlwlfQhB2QjZj7k=
X-Received: by 10.107.183.4 with SMTP id h4mr13127560iof.201.1521484746939;
	Mon, 19 Mar 2018 11:39:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 19 Mar 2018 11:38:46 -0700 (PDT)
In-Reply-To: <CAMKF1sr352BftmNV_svxN9PrMsTCOyz+zOXLggfEo6o=npboFw@mail.gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
	<19ff9542e08c7df5898cc811f65200050ecf02d5.1521257828.git.raj.khem@gmail.com>
	<CAJTo0LZ0Mqnpu+021rDroBnVWKB-zbdC+Q35XXwQpb12_FYHNQ@mail.gmail.com>
	<CAMKF1sq4eFjSXeKy2HYkXhNE5yWRWPF2vjji9sbYhXDJ0S_dyg@mail.gmail.com>
	<CAJTo0Lb5P916LL80z3vBk-mT-a0-orEqarLi4es__Soy3jt6sw@mail.gmail.com>
	<CAMKF1sr352BftmNV_svxN9PrMsTCOyz+zOXLggfEo6o=npboFw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Mar 2018 18:38:46 +0000
Message-ID: <CAJTo0LZMHauXEzOYE05q3K21JewXTqDGyrBF3B6p3WmnvCjASQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] x264: Use updated gnu-config artifacts
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
X-List-Received-Date: Mon, 19 Mar 2018 18:39:06 -0000
Content-Type: multipart/alternative; boundary="94eb2c0b8e08df7ed60567c8454a"

--94eb2c0b8e08df7ed60567c8454a
Content-Type: text/plain; charset="UTF-8"

Huh, I was hoping that passing a path would just force it.

Maybe we should stop the script being so "clever".

Ross

On 19 March 2018 at 17:48, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Mar 19, 2018 at 10:23 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 19 March 2018 at 16:54, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> this only works if the system uses autotools
> >> in full respect. x264 has a hand woven configure
> >> but rely on other parts of autotools. So we have to
> >> stay with proposed solution.
> >
> >
> > gnu-configize should be sufficiently dumb that it should work in
> > non-autotools trees, did it give you an error message?
> >
>
> its looking for configure.in or configure.ac
>
> > Ross
>

--94eb2c0b8e08df7ed60567c8454a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Huh, I was hoping that passing a path would just force it.=
<div><br></div><div>Maybe we should stop the script being so &quot;clever&q=
uot;.</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 19 March 2018 at 17:48, Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">On Mon, Mar 19, 2018 at 10:23 AM, Burton, Ross &lt;<a href=3D"ma=
ilto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 19 March 2018 at 16:54, Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; this only works if the system uses autotools<br>
&gt;&gt; in full respect. x264 has a hand woven configure<br>
&gt;&gt; but rely on other parts of autotools. So we have to<br>
&gt;&gt; stay with proposed solution.<br>
&gt;<br>
&gt;<br>
&gt; gnu-configize should be sufficiently dumb that it should work in<br>
&gt; non-autotools trees, did it give you an error message?<br>
&gt;<br>
<br>
</span>its looking for <a href=3D"http://configure.in" rel=3D"noreferrer" t=
arget=3D"_blank">configure.in</a> or <a href=3D"http://configure.ac" rel=3D=
"noreferrer" target=3D"_blank">configure.ac</a><br>
<br>
&gt; Ross<br>
</blockquote></div><br></div>

--94eb2c0b8e08df7ed60567c8454a--
