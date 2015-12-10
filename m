Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0E3D06FF86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 23:55:52 +0000 (UTC)
Received: by igcto18 with SMTP id to18so27319874igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 15:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8SjEhM/X+TBOGupBz7McXtdHvdY6u89YnySIFdoKj9E=;
	b=ihtAjcwX20VuN81KE8ddtTu4FVHFCPTj9Csav/Yp5u0eKdF1xIti7KlGjXtRTfLDo9
	lPuYFdN+OAcPWHrU9GS4M4OLIuuGQ3sxi7NGzD30cucLUfn823iJk8FmHAMRlkVncTyu
	OtxZpiKdp5w54KucESGtmSifiiN4dDTut+4nJAZwA8PzZydKavisnTVtPqa7gO55thyG
	p1K/3iYR2AFKVokPQCXsWVbg00dT2bWhtCFQCdIl09IVNEgEoVWh6G/ZEDOi/gOuRjXu
	6+Lsg/aVMTZcfH9MpqlMyrJ5v0/oL556SY3UhEQ5Xp6UpFUq9lgVz+4ZUkx6cysQJBJc
	xb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8SjEhM/X+TBOGupBz7McXtdHvdY6u89YnySIFdoKj9E=;
	b=cOZ+VGNxphVyGkWTK2O9Bc0tDXQr3M9hJ7luYWPlr8jYAFSi4tIqVDwGTqMxONTOlD
	0z16uUYOcLhqis6gqzMsTG5YFyTaJeEO4vE/jUjg4aTOzQ8q3UNeFjOOlM2wl9sIpJQH
	uy7GgbPoWjXaUzaIUY9fYBJibgNK6PSgXhBvTDosdsy1m/E2EtQ3BMtJYKZFyvXmHvUM
	dVXP93oQW8k00IooS+IriQpIo3Bws0S4Z4nvE8/jCr8Y+GodKJIDDE+2oZp8LHIWvcIz
	1vz9s8iB0wI7BvGY55801/POKoBIFrOesjaZdLmnchsdEAExmBY5kflyltj1EYHHExdC
	38FA==
X-Gm-Message-State: ALoCoQkVnfchfDLdGCvWIssUYRlgMbrFC5YQzc3VoXHgsxJpDGZ7ZNXOiPhBAEfoIkAlGruvF2lQOm6V8lmCsBrzwoQs7bC8o2Vh4gMzBpGG18go29FAFcY=
X-Received: by 10.50.126.8 with SMTP id mu8mr1780396igb.52.1449791753264; Thu,
	10 Dec 2015 15:55:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 10 Dec 2015 15:55:33 -0800 (PST)
In-Reply-To: <CAJ86T=WinR1iEU-7QwQ1j75174dM8S+oY6H3WZgudXUyoOaX7A@mail.gmail.com>
References: <1449702069-11889-1-git-send-email-alejandro.delcastillo@ni.com>
	<1449782540-4416-1-git-send-email-alejandro.delcastillo@ni.com>
	<CAJ86T=WinR1iEU-7QwQ1j75174dM8S+oY6H3WZgudXUyoOaX7A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Dec 2015 23:55:33 +0000
Message-ID: <CAJTo0LaabSzVjvsSsQ7Gudunb7YOiuX8Zc=b27J+6_LNFwAT5w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsolv: add new recipe
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
X-List-Received-Date: Thu, 10 Dec 2015 23:55:53 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf73bf3c052693f293

--047d7b1635bf73bf3c052693f293
Content-Type: text/plain; charset=UTF-8

On 10 December 2015 at 23:16, Andre McCurdy <armccurdy@gmail.com> wrote:

> > +SRC_URI = "https://github.com/openSUSE/libsolv/archive/${PV}.zip"
>
> GitHub tar file archives sometimes get regenerated and the hashes
> change. I'm not sure if the same can happen for zip files, but it's
> probably safer to checkout a git release tag rather than trust the zip
> file.


For what it's worth this was true in the past but I'm now reliably informed
that the archive tarballs are generated with literally git archive, which
goes to great pains to be reproducible.  I would pick the tarball over the
zip though.

Ross

--047d7b1635bf73bf3c052693f293
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 December 2015 at 23:16, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; +S=
RC_URI =3D &quot;<a href=3D"https://github.com/openSUSE/libsolv/archive/${P=
V}.zip" rel=3D"noreferrer" target=3D"_blank">https://github.com/openSUSE/li=
bsolv/archive/${PV}.zip</a>&quot;<br>
<br>
</span>GitHub tar file archives sometimes get regenerated and the hashes<br=
>
change. I&#39;m not sure if the same can happen for zip files, but it&#39;s=
<br>
probably safer to checkout a git release tag rather than trust the zip<br>
file.</blockquote></div><br>For what it&#39;s worth this was true in the pa=
st but I&#39;m now reliably informed that the archive tarballs are generate=
d with literally git archive, which goes to great pains to be reproducible.=
=C2=A0 I would pick the tarball over the zip though.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b1635bf73bf3c052693f293--
