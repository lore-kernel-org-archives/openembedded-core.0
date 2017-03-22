Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9466377A54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:32:13 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id i34so153168716qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vfF9XUsyZ9xSq66x6SabLeUTPpb5EgOXcK2vMxBvfEs=;
	b=cElSpdKP9/xJtjK0BatkGMGjlrxGkg1Qaibr9s6XpTgGUvn/tSBNiwTMMTtdqmxuxQ
	/m6+di4XxDmTrZMl66ITqj027iDtVGWLHzEUDw42vRLleVSFuXeb2aMyM+7SIR4t0TCo
	h9kSPGJWthgO/+JSzuG0Du2zlcKFO5oB+JAITm2bioZuKlZjCsco9BPBWzlK3Nmrieyy
	3H578+Q1Ft1ZqVNcyZluhf8mhL2CiHQmgZ1F1jZi5wk46jq2XvZtV44pT+RBZIds01B9
	YimRHA5mUaky9wVg8PKU8xnJHNiL42VC2PZVaifIRf6hEYeluOTtZ7bZmrwat7d/WLgo
	TDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vfF9XUsyZ9xSq66x6SabLeUTPpb5EgOXcK2vMxBvfEs=;
	b=sO2CK+CdUbmvMBxFRKxhva3HaVAZVq1ff3wY5pPkpSYThont/YlCiIGmpdmajw4U8e
	LJkuCwgOJHZF6WqN3cgsDd2nmbs1fQ+9KVtfSa410p8nMJ2rSLasVqtDVVjPgqxAsEt1
	6oIQHT9qRodYGKAyVtbB2RtQRg1xzxAakbc/RgtwFNvK77MZ4mZ2JIgywqdgjlVB/U9/
	eI9zNLuPZ38RPClfF4wzbbZMl8I2kY+ZlkWtviEivUlhtG9h6jPPm/5v9xjck9zPiG/v
	CQpwoSbxz22BliT7JwCYDwSmJmRuGJvZ/jgScxlGKTgBwIklJfjlAYi/blsIbgqLm8yo
	sGfQ==
X-Gm-Message-State: AFeK/H3Pz10Amhxmj8lk/XodnZuUgXSbGaOsHBnCK/GRlZrf/Oxl2m76pVefBaOiDD3IzMAWQCwRZhcwcC1E12n+
X-Received: by 10.237.42.164 with SMTP id t33mr40783504qtd.105.1490189534335; 
	Wed, 22 Mar 2017 06:32:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 22 Mar 2017 06:31:53 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703220907350.17218@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703220907350.17218@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 13:31:53 +0000
Message-ID: <CAJTo0LZp=39Yt_0WCibe4Li9GWr75jZK_xqC5h=CxzhvVttq0w@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: another design question -- proper (meaningful) content of recipe patches?
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
X-List-Received-Date: Wed, 22 Mar 2017 13:32:13 -0000
Content-Type: multipart/alternative; boundary=94eb2c0cfe22d7cd00054b51c924

--94eb2c0cfe22d7cd00054b51c924
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 13:22, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   in any event, i can appreciate the value of sometimes adding
> numbering to patches to enforce a processing order, but when one has a
> numbered series of patches getting up to 20 or 25, that strikes me as
> time to collapse all that into larger and more modular and more
> meaningful patches.
>

Note that by the naming you can tell that the patches came from
git-format-patch, so the origin of them is a git branch.

Ross

--94eb2c0cfe22d7cd00054b51c924
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 13:22, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1bj" cla=
ss=3D"a3s aXjCH m15af62f75961bd40">=C2=A0 in any event, i can appreciate th=
e value of sometimes adding<br>
numbering to patches to enforce a processing order, but when one has a<br>
numbered series of patches getting up to 20 or 25, that strikes me as<br>
time to collapse all that into larger and more modular and more<br>
meaningful patches.</div></blockquote></div><br>Note that by the naming you=
 can tell that the patches came from git-format-patch, so the origin of the=
m is a git branch.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--94eb2c0cfe22d7cd00054b51c924--
