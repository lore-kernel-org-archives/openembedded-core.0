Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9C37F2C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 14:05:57 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id b64so17355306vke.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fa7yLtfUkWX5iG/cbnZrJpsvzP0r47DtlnlSC+g6owk=;
	b=CGSt/ubvZ2DkEB9iE2TVqQIkJKMp9s9fDPx9wtm4pJxZVfT9rnBatqu9MaMeEZrXgH
	P+4ckXW0o0QNwPiKqEg5OHcCUDRmcJ38iK3siQElhs9hGYFLevXMFxWomPyHG+xBglQP
	mVOcvqQVVDkzHaWZpR4Qi83B0ovsJD3FLwnA0/dhu4vLXFIkY9Z6uIVopY7s685Z7bGK
	44U8jhE+FylJgs8oK1GM78w0tJUvDo4YqSeLXseAn4w3XJlFN8TRMAnkudU5ZkKapRyn
	+i2obV22BKxjiqtjMwwXdvezcBqdxt/QId0naYQeOEE+TeL64SXbBnVLOhFByTkiRm4W
	4/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fa7yLtfUkWX5iG/cbnZrJpsvzP0r47DtlnlSC+g6owk=;
	b=oekS1gLQH8F0bP8UIChsf0XNQuE2n7CEWT9vSXSmgkht2pD4P5FyXJ223jIa9D/+3p
	TpBO2APjwlW2cMA/RwKkIwRxRGr8xDRxoYs+lFApc8TymXB7Upc9Ogxta6wDS+6hi6ZX
	FYzM17e9iGQkNMwjmQUPJj5+OZMoPVxnJ+UYkuVLAhBwGeaEwYoIzVB4tvvW2BToJM1o
	HL/2X77OLhTRCvxWB06/U9OqCOwW+ajz0deZLrkfeUQwD/3L86y3A+AZl0x+CRA1uliM
	Sf7glzLQUEVewYEH8CTSiSf6HwtnvMPtgk3i6SSOxLO3c2m/R22AljH2BKoGii5Y/Mp9
	cd5w==
X-Gm-Message-State: APjAAAVeJVfHD5GmrQvTTWE4bBt/aS54bHT4j7mqc41GYzwvDj8pg++8
	liWdM9R8HpyNMnhyPvblyvzgqtqyMwLt7SG2vMM=
X-Google-Smtp-Source: APXvYqzFCxBc8e5H9E5jzpb+i2gcQisTfSibg1K0BR2+R4u4Hej9LWIc92iX4CXlzMlvGf3flNh75usCNZK4scHC+Cc=
X-Received: by 2002:a1f:1288:: with SMTP id 130mr1263638vks.12.1565100358117; 
	Tue, 06 Aug 2019 07:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
	<eba25cda-3ca0-039d-45ea-f9a86e80b4f6@intel.com>
	<CANNYZj-QUcKdw4BygFyfXLSm4L=89XC44u65LNFx2OiiqrQE0Q@mail.gmail.com>
	<CA+chaQfsQLEcxS9-XVQJT-7PR-JgtZ1cEFMdbJshmYMst6s2Lw@mail.gmail.com>
	<CANNYZj_YSBdctNSqewYy96qofF4A_XkVVWahU0wMw3nBV=q58Q@mail.gmail.com>
	<b25b0b717daa6dbeecd61255caf10bc49deb3509.camel@linuxfoundation.org>
	<CANNYZj9iLsF0fBRCYp+_CbRakizOyN=CJuDdRtZ9OdnZ84rFbA@mail.gmail.com>
In-Reply-To: <CANNYZj9iLsF0fBRCYp+_CbRakizOyN=CJuDdRtZ9OdnZ84rFbA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 16:05:46 +0200
Message-ID: <CANNYZj_4QNNfHr+9rke06rGDrfh-0C9PwqfnAYrT6urf5k62wA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 14:05:57 -0000
Content-Type: multipart/alternative; boundary="000000000000e235f3058f7352ed"

--000000000000e235f3058f7352ed
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 15:22, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I think the issue might be actually in the QA check where it looks beyond
> the recipe's immediate RDEPENDS (and then fails or not depending on whether
> those indirect dependencies have been packaged). I need to better
> understand what happens there so will add some printouts first. The problem
> does happen with latest master.
>

I can confirm that this bit in insane.bbclass is non-deterministic:

                # Find all the rdepends on the dependency chain
                while next:
                    new = []
                    for rdep in next:
                        rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
                        sub_rdeps = rdep_data.get("RDEPENDS_" + rdep)
                        if not sub_rdeps:
                            continue
                        for sub_rdep in bb.utils.explode_deps(sub_rdeps):
                            if sub_rdep in done:
                                continue
                            if oe.packagedata.has_subpkgdata(sub_rdep, d):
                                # It's a new rdep
                                done.append(sub_rdep)
                                new.append(sub_rdep)
                    next = new

It only fully expands the dependencies if all of them have been already
packaged. As there is no mechanism to ensure that package_qa runs after
packaging all of the recursive RDEPENDS, this is causing a race between
packaging them, and running the package qa check.

I think the right way to address this is to actually drop the recursive
RDEPENDS resolution, and only consider the immediate runtime dependencies.
Alternatively, we may introduce additional task dependencies to fix the
race. Thoughts?

Alex

--000000000000e235f3058f7352ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2019 at 15:22, Alexander Ka=
navin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com<=
/a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr">I think the issue might be actua=
lly in the QA check where it looks=20
beyond the recipe&#39;s immediate RDEPENDS (and then fails or not depending=
=20
on whether those indirect dependencies have been packaged). I need to bette=
r understand what happens there so will add some printouts first. The probl=
em does happen with latest master.<br></div></blockquote><div><br></div><di=
v>I can confirm that this bit in insane.bbclass is non-deterministic:</div>=
<div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 # Find all the rdepends on the dependency chain<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while next:<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new =3D []<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for rdep in next:<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rdep_data =3D oe.packagedata.read_subpkgdata(rdep, d)<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sub_rdeps =3D rdep_data.get(&quot;RDEPENDS_&quot; + rdep)<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f not sub_rdeps:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for sub_rde=
p in bb.utils.explode_deps(sub_rdeps):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sub_r=
dep in done:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if oe.packagedata.has_subpkgdata(sub_rdep, d):<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # It&#39;s a new rdep<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 done.append(sub_rdep)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 new.append(sub_rdep)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 next =3D new</div><div><br></div><div>It only f=
ully expands the dependencies if all of them have been already packaged. As=
 there is no mechanism to ensure that package_qa runs after packaging all o=
f the recursive RDEPENDS, this is causing a race between packaging them, an=
d running the package qa check.</div><div><br></div><div>I think the right =
way to address this is to actually drop the recursive RDEPENDS resolution, =
and only consider the immediate runtime dependencies. Alternatively, we may=
 introduce additional task dependencies to fix the race. Thoughts?</div><di=
v><br></div><div>Alex<br></div></div></div>

--000000000000e235f3058f7352ed--
