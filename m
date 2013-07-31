Return-Path: <djszapi@archlinux.us>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6EABA6AFB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 11:13:51 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so631036pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 04:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=4PmSgMwHObEda77NnTDHc1TRVObmqbMYuR3M3sxjOWQ=;
	b=ddSiVyVtDqozrt42FI5qQe6zZB01JjXFfNkXp7XUb1IgkjFdYJUY05+U8wg70aW+QJ
	ZSr8x3ZU67UlD/CNa91RTP+Zl8amGl6JF9NRoIp2BfXxHAJ1+Vhl6SHuBmGVZ5QIHFXa
	7odt79qDuXAoLemAf+jAkxbr2veiQuQHrS8m8TyRvFJIW2LQA82kAF1wJdFE4TsPMmPk
	lZs5atSVZWtCK7xewFhBIEyzLmzUAZPaz02Eq4skP8vRnEbNvdKO21L7fAUaaDFpp+Y9
	fqBeQzdyyCnHHkk3P/FJlSh9cAOXVeo/jlae7TL1NkPfCrtNz/2Ub5SRBycPhb9yfpsM
	Xqeg==
MIME-Version: 1.0
X-Received: by 10.66.155.102 with SMTP id vv6mr45014123pab.89.1375269232243;
	Wed, 31 Jul 2013 04:13:52 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Wed, 31 Jul 2013 04:13:52 -0700 (PDT)
In-Reply-To: <CAJTo0LaS5xnYAuDLU0PpSeW7uCWmVcOZ3p=eMJETahActVALiQ@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<1375094111.13247.9.camel@phil-desktop.brightsign>
	<CAOMwXhMZ1w5j=aP_yPXb=k0=UOuinMS5ENAsXAdzcb42WxC0Og@mail.gmail.com>
	<CAOMwXhO2A75jPxM4FdU=XBgVRjsxW24hDVLOf8eub2Wp4CmGDA@mail.gmail.com>
	<1402aa377f6.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<CAOMwXhOjyAtjsRbiHT3ufeApZVvkEE47pgBhXDsE0wxeHOZJiQ@mail.gmail.com>
	<1402b178308.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
	<CAOMwXhPw4K+T82qs21UzFFT+-eCYz9vBRVfUNGs5smmHCTP=VQ@mail.gmail.com>
	<1375200633.8017.29.camel@phil-desktop.brightsign>
	<CAJTo0LaS5xnYAuDLU0PpSeW7uCWmVcOZ3p=eMJETahActVALiQ@mail.gmail.com>
Date: Wed, 31 Jul 2013 12:13:52 +0100
X-Google-Sender-Auth: efpUhjpHgVEoN7tKdCTLE9BZZNk
Message-ID: <CAOMwXhOZvK0g01p2FpPyVfy8Sa-cBKKwo+0vgNsyg4TM9WNVqA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlSnLfQaSOUSj7mkShX7IKfRvnZx5PWmioOTeNHNQkgTpgL8Ou6hTdeT7m/C9g2UL73cxHX
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Wed, 31 Jul 2013 11:13:51 -0000
Content-Type: multipart/alternative; boundary=047d7b86e3a80f06d204e2ccd2fa

--047d7b86e3a80f06d204e2ccd2fa
Content-Type: text/plain; charset=ISO-8859-1

As you may have already realized, it is not a simple change to make
PACKAGECONFIG for this case to work. Here is the feature request, but it is
just a future stuff. I do not know any simple solution at hand how to
unbreak my still broken busybox in dylan and master ahead without a LOT of
work.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4964


On Tue, Jul 30, 2013 at 5:21 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 30 July 2013 17:10, Phil Blundell <pb@pbcl.net> wrote:
> > On Tue, 2013-07-30 at 16:55 +0100, Laszlo Papp wrote:
> >
> >> At any rate, can someone provide a helper change from the past for
> >> PACKAGEGROUP like changes?
> >
> > Do you mean PACKAGECONFIG?  If so, just run "git log" in your oe-core
> > tree and search for PACKAGECONFIG.
>
> From experience I know that learning by example isn't always obvious
> for PACKAGECONFIG, but the manual does explain it quite well:
>
>
> http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-PACKAGECONFIG
>
> Ross
>

--047d7b86e3a80f06d204e2ccd2fa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As you may have already realized, it is not a simple chang=
e to make PACKAGECONFIG for this case to work. Here is the feature request,=
 but it is just a future stuff. I do not know any simple solution at hand h=
ow to unbreak my still broken busybox in dylan and master ahead without a L=
OT of work.<div>
<br></div><div><div><a href=3D"https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D4964">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4964</a><=
/div></div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">On Tue, Jul 30, 2013 at 5:21 PM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 3=
0 July 2013 17:10, Phil Blundell &lt;<a href=3D"mailto:pb@pbcl.net">pb@pbcl=
.net</a>&gt; wrote:<br>

&gt; On Tue, 2013-07-30 at 16:55 +0100, Laszlo Papp wrote:<br>
&gt;<br>
&gt;&gt; At any rate, can someone provide a helper change from the past for=
<br>
&gt;&gt; PACKAGEGROUP like changes?<br>
&gt;<br>
&gt; Do you mean PACKAGECONFIG? =A0If so, just run &quot;git log&quot; in y=
our oe-core<br>
&gt; tree and search for PACKAGECONFIG.<br>
<br>
</div></div>From experience I know that learning by example isn&#39;t alway=
s obvious<br>
for PACKAGECONFIG, but the manual does explain it quite well:<br>
<br>
<a href=3D"http://www.yoctoproject.org/docs/current/mega-manual/mega-manual=
.html#var-PACKAGECONFIG" target=3D"_blank">http://www.yoctoproject.org/docs=
/current/mega-manual/mega-manual.html#var-PACKAGECONFIG</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--047d7b86e3a80f06d204e2ccd2fa--
