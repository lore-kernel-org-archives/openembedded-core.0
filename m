Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6A66AFC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 15:01:18 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so530180pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 08:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=xyHGDv4/Vdzi/koB6pUUDHM5yD22pBKrMnxc6mkKyOU=;
	b=B5OhU3xeiIXaBSUbxy/zSW6nLJV1XCpdcKp5OF0ANXVWk7n+UUriZf8yZ5MY9Qs2p2
	L5Kj01uP9RhLghc7Aq8j8JV0M0SnvvUGo6VDyi4PT0bYHr4S5wOpGafKRCr8thaFDkdr
	/GC4cpUrBKXTiij8M8VQGkrcHcH4FOgNPtBucjpmJkz+q1wPZWt1OViCNnacO0Eu/LyQ
	PvyBZivHP1q5G8CYHtUwKexqGoj7rNlWFf+RE6oZcS7fX4FnDKH0xqeMotavirICbGol
	/o2114/QG4RVKirzSjhb5E6Ot38GN3/gCjdf+iwM1RSVlIClrPkuzYhs3W6GHvA1uV4H
	+n3g==
X-Gm-Message-State: ALoCoQnE0DNzPiLs0OZPoVoBrgYKfXeTgrT86/UrahrzX4keQNfRF9Ps2qnzCd/CM1F17Lcd3ozR
MIME-Version: 1.0
X-Received: by 10.68.59.98 with SMTP id y2mr148172pbq.135.1377097278992; Wed,
	21 Aug 2013 08:01:18 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 21 Aug 2013 08:01:18 -0700 (PDT)
In-Reply-To: <1377097189.25999.118.camel@ted>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
	<CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
	<52147D02.10106@communistcode.co.uk>
	<CAJTo0Lap8PHE-=d_S7M7gEOzaXud3EqWgkbzU+5VQH7vUeVw7g@mail.gmail.com>
	<CAOMwXhOLPoK994vd7aNnPKhutKfzriLSsg4XCPP6oCGO98jD9g@mail.gmail.com>
	<CAJTo0LYraeUno84Hof7PPiJ3d9_eydwRTjB1D7VjojoZNPOZYQ@mail.gmail.com>
	<CAOMwXhMOQo3PiAT+3L2M894MDJvLg0eEwunqtQD3TGMwBReXHw@mail.gmail.com>
	<CAJTo0La2UVtZ9rM-HRGY9DGzD9=D4RTZzutHT8Aks4QJ9E=zPw@mail.gmail.com>
	<CAOMwXhP6awmXzW2Sm0OMKyrWBFtQRje1CkL3yWtvzdU6fvd1bw@mail.gmail.com>
	<20130821110401.GG522@jama>
	<CAOMwXhP+k2qnhPsAEYvppC3eTf7N0UUY7V0-KVNs+83u-XU2oA@mail.gmail.com>
	<1377097189.25999.118.camel@ted>
Date: Wed, 21 Aug 2013 16:01:18 +0100
X-Google-Sender-Auth: HQXhboUi3N04XRiRlS7gaFuZABs
Message-ID: <CAOMwXhMd1CwhhNWc7apZ5=iNFnZ2VsRY40HwSC2PjSZhPwWrEA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Wed, 21 Aug 2013 15:01:19 -0000
Content-Type: multipart/alternative; boundary=bcaec5304f8122ccca04e476724d

--bcaec5304f8122ccca04e476724d
Content-Type: text/plain; charset=ISO-8859-1

OK, so the bugreport has to be changed to a documentation issue about it.
At least, reading the short bits about it that exist whispered that to me,
it would not be useful without a mirror.


On Wed, Aug 21, 2013 at 3:59 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2013-08-21 at 12:10 +0100, Laszlo Papp wrote:
> > On Wed, Aug 21, 2013 at 12:04 PM, Martin Jansa
> > <martin.jansa@gmail.com> wrote:
> >         On Wed, Aug 21, 2013 at 11:31:53AM +0100, Laszlo Papp wrote:
> >         > That does not mean bitbake cannot generate tarball out of
> >         the git
> >         > repository. In fact, it is relatively simple. ;-)
> >
> >         It does, all you need to do is enable
> >         BB_GENERATE_MIRROR_TARBALLS
> >
> > I am not using mirrors. I am simply pushing the downloads folder, etc
> > to the git repository "git add". It is as simply as that without an
> > explicit mirror set up and its maintenance.
>
> Regardless of whether you use mirrors or not, if you set
> BB_GENERATE_MIRROR_TARBALLS it will create tarballs in DL_DIR of the git
> repositories. You can then stop trying to check in the /git/  and /git2/
> subdirectories of DL_DIR and some of your problems will likely go away.
>
> The reason this is not enabled by default is for performance reasons.
>
> Cheers,
>
> Richard
>
>

--bcaec5304f8122ccca04e476724d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, so the bugreport has to be changed to a documentation =
issue about it. At least, reading the short bits about it that exist whispe=
red that to me, it would not be useful without a mirror.</div><div class=3D=
"gmail_extra">
<br><br><div class=3D"gmail_quote">On Wed, Aug 21, 2013 at 3:59 PM, Richard=
 Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On W=
ed, 2013-08-21 at 12:10 +0100, Laszlo Papp wrote:<br>
&gt; On Wed, Aug 21, 2013 at 12:04 PM, Martin Jansa<br>
&gt; &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</=
a>&gt; wrote:<br>
&gt; =A0 =A0 =A0 =A0 On Wed, Aug 21, 2013 at 11:31:53AM +0100, Laszlo Papp =
wrote:<br>
&gt; =A0 =A0 =A0 =A0 &gt; That does not mean bitbake cannot generate tarbal=
l out of<br>
&gt; =A0 =A0 =A0 =A0 the git<br>
&gt; =A0 =A0 =A0 =A0 &gt; repository. In fact, it is relatively simple. ;-)=
<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 It does, all you need to do is enable<br>
&gt; =A0 =A0 =A0 =A0 BB_GENERATE_MIRROR_TARBALLS<br>
&gt;<br>
&gt; I am not using mirrors. I am simply pushing the downloads folder, etc<=
br>
&gt; to the git repository &quot;git add&quot;. It is as simply as that wit=
hout an<br>
&gt; explicit mirror set up and its maintenance.<br>
<br>
</div></div>Regardless of whether you use mirrors or not, if you set<br>
BB_GENERATE_MIRROR_TARBALLS it will create tarballs in DL_DIR of the git<br=
>
repositories. You can then stop trying to check in the /git/ =A0and /git2/<=
br>
subdirectories of DL_DIR and some of your problems will likely go away.<br>
<br>
The reason this is not enabled by default is for performance reasons.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div>

--bcaec5304f8122ccca04e476724d--
