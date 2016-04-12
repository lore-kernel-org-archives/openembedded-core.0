Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id E622365CB5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:19:13 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id g8so16423219igr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 03:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1gg7+KLkZelzciaxBaJVp8Yu4B0wTntOz18UY6B2zro=;
	b=U8slIGbs/RimJsIpwPWslU96JfdcuffUwE2O00z4SPy3D66CcpxQhLKLnY9MYfTwIq
	bsIGRPAh395fLVGAIF+BItGAfpToN3WNg1Q1dRRupwwJ8Ar9wGTYDLFnzq9/ffBBwdvz
	p12FpDRbPlGJ7+kK2m5QoI3ktWkr6nhBLRog36Q46G4wkMCxJcx2C+Ay7tqbBQHYR/uo
	J8EYuCt2K1WVb/ECyAEUCAsabFuqX1BctOneABWKhSy/FAmS8w7jLq6jYFjFvo4rvGOs
	sCnGlLvN3/LzW+tF1FzSboIAHf6iv7eBG0dTcBz8zHNm2luGK/g7xKr1wt4jpETyAvbI
	McTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1gg7+KLkZelzciaxBaJVp8Yu4B0wTntOz18UY6B2zro=;
	b=c3m8MUM2XNlDkKQlA7XDfmDzGx+W0Ey0R5p7gq7tq/CqcW0HPDZTFsdGgyTcYE+7yX
	h0Iq1k1MGLLBFLZ7gLoIRvZDw6SuEAiKj91nyR8vb3W0hNv8j+wp1s9enN5v2uI71Mub
	jx2bac+D9xey6RkXKQQuTnlCIewJq6Miw/OHhsU8V0f0/CVinvTb6YhZPbRqw9jLoyby
	DoZ/nCpWLhD2f6ycPk0Wwv+GCf6Cd9g65cBR1thKQMIQz2vi8EYL2+T8+J8nHuud1WCY
	+vEUle2yXOQ+ZjUKUtJTaN+1oAayAwaWKHobmxq4VYYj08beDKrV6FRSdL83R65wMmmW
	p1yw==
X-Gm-Message-State: AD7BkJIByc/ZiQfx+fU5vhD4hOl3hTRFFYpuNGXFFp66jtnditHEamfrdPsndmsfUd291wxeTML+y89Isw69Ic4n
X-Received: by 10.50.232.47 with SMTP id tl15mr22206062igc.64.1460456354597;
	Tue, 12 Apr 2016 03:19:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Tue, 12 Apr 2016 03:18:55 -0700 (PDT)
In-Reply-To: <1460456025-30856-1-git-send-email-sona.sarmadi@enea.com>
References: <1460456025-30856-1-git-send-email-sona.sarmadi@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Apr 2016 11:18:55 +0100
Message-ID: <CAJTo0Lao8YWTovmO5VeXQJaxSmzP-f76PPzk-tkEWuqf=uvQiA@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: Upgrade 9.10.3-P3 -> 9.10.3-P4
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
X-List-Received-Date: Tue, 12 Apr 2016 10:19:16 -0000
Content-Type: multipart/alternative; boundary=f46d04289bc939e9f4053046fe67

--f46d04289bc939e9f4053046fe67
Content-Type: text/plain; charset=UTF-8

On 12 April 2016 at 11:13, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> The upgrade addresses following vulnerabilities:
>    CVE-2016-1285
>    CVE-2016-1286
>    CVE-2016-2088
>
> Fixes [YOCTO #9400 and #9438].
>
> References:
> https://kb.isc.org/article/AA-01352
> https://kb.isc.org/article/AA-01353
> https://kb.isc.org/article/AA-01351
>

Far too late for upgrades in master, can you fix the CVEs as patches please?

Ross

--f46d04289bc939e9f4053046fe67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 April 2016 at 11:13, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":xj0" class=3D"=
a3s" style=3D"overflow:hidden">The upgrade addresses following vulnerabilit=
ies:<br>
=C2=A0 =C2=A0CVE-2016-1285<br>
=C2=A0 =C2=A0CVE-2016-1286<br>
=C2=A0 =C2=A0CVE-2016-2088<br>
<br>
Fixes [YOCTO #9400 and #9438].<br>
<br>
References:<br>
<a href=3D"https://kb.isc.org/article/AA-01352" rel=3D"noreferrer" target=
=3D"_blank">https://kb.isc.org/article/AA-01352</a><br>
<a href=3D"https://kb.isc.org/article/AA-01353" rel=3D"noreferrer" target=
=3D"_blank">https://kb.isc.org/article/AA-01353</a><br>
<a href=3D"https://kb.isc.org/article/AA-01351" rel=3D"noreferrer" target=
=3D"_blank">https://kb.isc.org/article/AA-01351</a></div></blockquote></div=
><br>Far too late for upgrades in master, can you fix the CVEs as patches p=
lease?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--f46d04289bc939e9f4053046fe67--
