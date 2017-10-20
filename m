Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id DB7B87834D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 10:29:59 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id 72so13445978itl.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 03:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J1tNHMBrFV64FePfORvOMAoy2N3KPpgm/McTjfP/9Uo=;
	b=f+zHVgyd17cP+kKEFRIrM3PUqbEJhxyKgvOtIK+HpQd1QWhtdfp5bcgcTYJ2PHWLTi
	6Yqf0tVnvJI0aS4KgHLynGbK/8/56Kha0s+oIJosSD5nldZgdheIjU1+CGJ0aNiCXLry
	dFhNyyAAxOemHHE6BjIluW/KPn+cAGr11yxSIkSTVpNiRum3p+zBSKyVIyzOzlBbSVxN
	XpiEC6I0vx35pGScM6tAjw+g/OkrLO4xYt4HZhwKKUzlLyQKo/NSRKiJDB7iv0VGQSz3
	d+BI06AciNLRrxQ1NsmyVkYt/ZlhKufbLIh+Ns9qs6jh9qDMRQtl5GQ2Ak3/WyUQq/Fs
	9LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J1tNHMBrFV64FePfORvOMAoy2N3KPpgm/McTjfP/9Uo=;
	b=fqrYTk9pF1zQcxT15sEI6XsjJq6I47SfL9TzkeMU+mh/p8XfjFpmBN5D7+0qcoxxlK
	xa0ghgKknx1QeEfYMPrQR+/ssZ26YSZsVTVflI7hws7ssOSTmKHgeFrA4gDkB1YRvJyZ
	FBTEeIox7mSBuIk/7QSaDRstTRj1n+sHE/041oPFMtwUsRfOttEUbBqTuIGJMxpA4ewc
	pPZHctDT4D/AJi1aWOZFTt7ZeldbYiviWZr3DHuF17TA2ZYf3yWCJrw030Yx0Ak2eKrm
	EvxebaAVdL5EuQDy1pi5mVTtOnBQv7g5BfoeIlxFY/wBJJudtnKn7GA2LeV+HS0AQcm4
	ucsg==
X-Gm-Message-State: AMCzsaU8P1JK6s9qWckyxd26WW9Hm5w2vLj0B4P2o+dkucz8BwRgtfcN
	8EnU67a4SLWj5DSSyHuMNLb8IJHn6c4AMUdS9GoeNg==
X-Google-Smtp-Source: ABhQp+SaR6zacXYRzYBAmNq3uDTJZ8bncxIDITHD1BnPF+MI4hLIpgv53IG5GWFpVHUoPWsCMakqI5ILS0tCGrTfjEA=
X-Received: by 10.36.116.5 with SMTP id o5mr1929356itc.132.1508495401037; Fri,
	20 Oct 2017 03:30:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Fri, 20 Oct 2017 03:29:40 -0700 (PDT)
In-Reply-To: <20171018190550.23205-1-raj.khem@gmail.com>
References: <20171018190550.23205-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 20 Oct 2017 11:29:40 +0100
Message-ID: <CAJTo0LYr+7LutBunQ3hHz3oey87wJ+Tc6yM=GD6Xxp5DxroAkg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] libcheck: Upgrade to 0.11.0
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
X-List-Received-Date: Fri, 20 Oct 2017 10:30:00 -0000
Content-Type: multipart/alternative; boundary="001a114a9e5e864f22055bf7f4ac"

--001a114a9e5e864f22055bf7f4ac
Content-Type: text/plain; charset="UTF-8"

On 18 October 2017 at 20:05, Khem Raj <raj.khem@gmail.com> wrote:

>  .../libcheck/{libcheck_0.10.0.bb => libcheck_git.bb}          | 11
> ++++++-----
>

If it's a release then I much prefer the filename to be the release,
reserving _git filenames for actual snapshots.

Also
https://github.com/libcheck/check/releases/download/0.11.0/check-0.11.0.tar.gz
is a perfectly good tarball, no need to switch to git fetching.

Ross

--001a114a9e5e864f22055bf7f4ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 October 2017 at 20:05, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex">=C2=A0.../libcheck/{<a href=3D"http://libcheck_0.10.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libcheck_0.10.0.<wbr>bb</a> =3D&=
gt; <a href=3D"http://libcheck_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>libcheck_git.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++++++-----<br=
></blockquote><div><br></div><div>If it&#39;s a release then I much prefer =
the filename to be the release, reserving _git filenames for actual snapsho=
ts.</div><div><br></div><div>Also <a href=3D"https://github.com/libcheck/ch=
eck/releases/download/0.11.0/check-0.11.0.tar.gz">https://github.com/libche=
ck/check/releases/download/0.11.0/check-0.11.0.tar.gz</a> is a perfectly go=
od tarball, no need to switch to git fetching.</div><div><br></div><div>Ros=
s</div></div></div></div>

--001a114a9e5e864f22055bf7f4ac--
