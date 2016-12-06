Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B443C60269
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 02:38:10 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p66so18246132pga.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 18:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=FllX2v5aDsrxi1bKNKuvHyOH4RktnW8dEMJnOk28bac=;
	b=lgBpIWK/agsuSWGefNA1LZHFMqYyYGvdnzCzaRxuShl9KUSfbhq9XuqNao6G0uc2Pm
	HtCdYy6cLllny0IFpgFnJPzPl8ABTnghDiDXI3Uo8jlpcj2OIiTA0RbwvDUSy4YHoK55
	cI8QYrJ+AA/C8IdC4ExcBk/g0QKE1kVVdNsw/tW2rMEXTsAt5x+7LFqQdJWirvk37sXO
	4B7HGttffPKT+B4g/ZkWaZo9yatXxpJu7hUoJMxI3sc2DWF8MEZLEe/H74oP9Vb+lVaT
	LLHbfJ+j2+EHEz4uZTtahJ6RWMTaIV9HFtyd0mVsVzBV5MViqMfYpr/raRkLX/CbIOG2
	LZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=FllX2v5aDsrxi1bKNKuvHyOH4RktnW8dEMJnOk28bac=;
	b=cR1QGLbjpJdXmeq/6ZFedPTmdkD19diPkktiTMwgxCNArQmjNmRtVyj745LeRdj7Pe
	kBgy/mOW7MemGmRzQfmdauqQnQJUrOer3Ig1wEUa8jLy4Kx0414CjJV9kgLiDcgbtHeh
	kBy4YVw5ln7AgIgKmWHiHZSEMHHdVimCT+VZWHdJypg6q+02thsWOY6oN2yVneYwrPl4
	VwecyZ+Cg+Jkus/XV69Q4XgRm/xmBM/EDKe9pJW9GwOMN2qUmrf+oer69We4smHriWdk
	l+h1lauxFoSzFek6iY2JGtuUwrGpKeqbwvHB+x+Qi8gpgSaWgOa+VMRdOlJ7879jQlh6
	ijwg==
X-Gm-Message-State: AKaTC01mzcOabOrIUpjykKdunCYVc94BgeGBw777Gy/MwHUs2EnZNBHaWZSpZcN9zVfQyg==
X-Received: by 10.99.65.65 with SMTP id o62mr108221709pga.73.1480991892116;
	Mon, 05 Dec 2016 18:38:12 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:5415:7777:3f68:ee0e?
	([2601:646:8882:b8c:5415:7777:3f68:ee0e])
	by smtp.gmail.com with ESMTPSA id
	65sm30358382pfl.21.2016.12.05.18.38.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 18:38:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <a9bde40d-5322-c9e3-ac47-3801b520e80b@windriver.com>
Date: Mon, 5 Dec 2016 18:38:10 -0800
Message-Id: <C717E091-C197-4A1C-BD84-B2D84454C3D4@gmail.com>
References: <cover.1480949616.git.liezhi.yang@windriver.com>
	<981a3fcb8a50c6277be726177a5895c64296d2ac.1480949616.git.liezhi.yang@windriver.com>
	<CAMKF1so3kwUrinR7HWarC+CPd+1d1mby2_-H-5XE3XQb3PzZaw@mail.gmail.com>
	<a9bde40d-5322-c9e3-ac47-3801b520e80b@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.3251)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] diffutils: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Tue, 06 Dec 2016 02:38:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 5, 2016, at 6:11 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
>=20
> On 12/06/2016 02:23 AM, Khem Raj wrote:
>> On Mon, Dec 5, 2016 at 6:54 AM, Robert Yang =
<liezhi.yang@windriver.com> wrote:
>>> Fixed when len(TMPDIR) =3D  410:
>>> aclocal: error: cannot open echo [snip]: Argument list too long
>>>=20
>>> This is becuase it has a lot of m4 files, use relative path for them
>>> can fix the problem.
>>>=20
>>> It doesn't happen when MACHINE=3D"qemux86", I think it is because
>>> intel-x86-64 is longer than qemux86.
>>>=20
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>> meta/recipes-extended/diffutils/diffutils_3.4.bb | 3 +++
>>> 1 file changed, 3 insertions(+)
>>>=20
>>> diff --git a/meta/recipes-extended/diffutils/diffutils_3.4.bb =
b/meta/recipes-extended/diffutils/diffutils_3.4.bb
>>> index cb7092b..be280ec 100644
>>> --- a/meta/recipes-extended/diffutils/diffutils_3.4.bb
>>> +++ b/meta/recipes-extended/diffutils/diffutils_3.4.bb
>>> @@ -10,6 +10,9 @@ SRC_URI =3D =
"${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
>>>=20
>>> EXTRA_OECONF +=3D "--without-libsigsegv-prefix"
>>>=20
>>> +# Fix "Argument list too long" error when len(TMPDIR) =3D 410
>>> +acpaths =3D "-I ./m4"
>>=20
>> it looks ok if this work ok with externalsrc
>=20
> Hi Khem,
>=20
> What did mean about externalsrc, please ? Did you mean when B !=3D S?

yeah,=20

> If yes, it works well since it is for aclocal, which always runs in S.

seems to be the case. Then we should be fine.

> We have already such a fix in several recipes.
>=20
> meta/recipes-extended/tar/tar.inc:acpaths =3D "-I ./m4"
> meta/recipes-extended/wget/wget.inc:acpaths =3D "-I ./m4"
> meta/recipes-core/coreutils/coreutils_6.9.bb:acpaths =3D "-I ./m4"
> meta/recipes-core/coreutils/coreutils_8.25.bb:acpaths =3D "-I ./m4"
>=20
> // Robert
>=20
>>=20
>>> +
>>> do_configure_prepend () {
>>>        # Need to remove gettext macros with weird mix of versions
>>>        for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 =
inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 =
wchar_t.m4 wint_t.m4; do
>>> --
>>> 2.9.0
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


