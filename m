Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id D62E2606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 09:26:57 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id j140so5165547itj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 02:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E/NYhGaqlAmR8QvyI6RBIxAGMi4oboqO6ab9uH262xg=;
	b=GSrc3Cj9sYXRtxe/YbJOyXZRDMzXEvtDgWL7vudfFdLt/ayNlMZAEkLmG5JiRHaE+Q
	/tYMWKykb40pjV6XrzLr8Mf8u+16iarldHl/zY43Z6hlhPY27r1PyUe6ja024MntS38g
	TKhjBbbfOtG40MmfAJU1I1PblQJ57NcryVQx3JYfTLTtJCS3nfc2flVUWDyxuYrT388u
	rVy4s5k+kuISS1CxjlKiOr7QYrdtXVjYH4gCrxJlJ3Gv11oJgTLn9Eja5F8XaOc+MF8x
	ZX8CHBHP8xjjJewz15rpAxfayEOti3d9aSvvH6vC3ceswf9eAdM5NxIUHrq+BMGn+DXH
	UjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E/NYhGaqlAmR8QvyI6RBIxAGMi4oboqO6ab9uH262xg=;
	b=AvmZnBaOPkDLCn2laHtKGJbcmyznInwiKSolnkiCip0LmviNagCiHXKzpP5vq0Rj8H
	0beh6YpNkRVfi+kOwew4OgPbMa1YTn58PxoYxIES3/ENCpNDv03QuHIUzJPMwjhWysIB
	bKlumvcuBdnQ2mBwcC185Tmp1az28NplAQrwq1rpmzaaDHJe/zYL//adyhZrc6NdDRGe
	RNS+JxLHd7ZsOZZn47WeJFwxjf/EdMsgKUp81GLRMzHcHfCfIpevHogXBZf0TiIOsHhc
	9NV/hPu5WUYOnak6iGo69bUuHcLJrEs0BJnJJKr42+agNwmrDeV9DKYqPDam0t4ItQ7d
	UTFA==
X-Gm-Message-State: AMCzsaUC3M/ot6KcneUe1ecyrSOxeyja4Mp5ShA25HBLiR9Ck40ZOfdh
	rznplua0wip3VIkdlmnJ1ATj4TaCo74y1oVTSz+Dxg==
X-Google-Smtp-Source: ABhQp+TF1dpNgGzw7RRkWh6d1nIS4whc5L5/VvcOFAOGzTHUOY6Fm1QdkmD121QwEm3aCpOR4lQJ1z71cHZFoKszua4=
X-Received: by 10.36.116.5 with SMTP id o5mr8566944itc.132.1508750819010; Mon,
	23 Oct 2017 02:26:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 23 Oct 2017 02:26:38 -0700 (PDT)
In-Reply-To: <CAMKF1srGH8tNmFMvqRmV0jXQz+HAVwrXYw1v6EoZQZrb_poDrg@mail.gmail.com>
References: <CAMKF1srGH8tNmFMvqRmV0jXQz+HAVwrXYw1v6EoZQZrb_poDrg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Oct 2017 10:26:38 +0100
Message-ID: <CAJTo0LaHVjE+C9mv7h8c1LQ-Sx-u5PsbxQEeDjp-2e9itvqYkQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: devtool modify errors on second recipe
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
X-List-Received-Date: Mon, 23 Oct 2017 09:26:58 -0000
Content-Type: multipart/alternative; boundary="001a114a9e5e9f40dc055c336c93"

--001a114a9e5e9f40dc055c336c93
Content-Type: text/plain; charset="UTF-8"

On 23 October 2017 at 06:03, Khem Raj <raj.khem@gmail.com> wrote:

> I am seeing this errors message consistently since few weeks on master
> when using
> devtool modify
>

<waves hand like a psychic>You're running Python 3.6.

There's a patch on the bitbake list for this, and I believe it will be in
rocko before it releases.

Ross

--001a114a9e5e9f40dc055c336c93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 October 2017 at 06:03, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">I am seeing this errors message consis=
tently since few weeks on master<br>
when using<br>
devtool modify<br></blockquote><div><br></div><div>&lt;waves hand like a ps=
ychic&gt;You&#39;re running Python 3.6.</div><div><br></div><div>There&#39;=
s a patch on the bitbake list for this, and I believe it will be in rocko b=
efore it releases.</div><div><br></div><div>Ross</div></div></div></div>

--001a114a9e5e9f40dc055c336c93--
