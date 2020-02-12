Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4A77D60B15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 15:11:59 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id c5so1801867qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 07:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CC5rSkShXO4MxGVdwTecCxm5qt1SHJ8TrXgX4fk4/ng=;
	b=deE2HfuyeHeJ6el6aMNTfkXJ0/2EycsVtE0uCqXhJvudgHpvcnw7AjzkGbec7b05Bx
	JmQcKGj0HNoNFwXew/fDRR3+p2ECW2TIQPQ/6qFCRrvmeMZucCmdnP090d9esBhGJvfw
	41K7co1dpTpeAxK7SDCXw4C1SHWBf+8go4WRVNwOyKdQOA35yHPb2CUr4UcYNI06Z4fk
	+s5rb8GvEmKY0YQYliA/IDqeCCXFvaYyUjneZmL/hcJ4a1ebLA1Xbu6C3mea6YJiamIM
	uT/vU3DhUp3YuChyOHv3o666BDDGPh/tkUcwB6/doJh0ezhI0k1K9dOE6PdABBtptMmT
	wgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CC5rSkShXO4MxGVdwTecCxm5qt1SHJ8TrXgX4fk4/ng=;
	b=i0NqFKrkrOSFwUsTIqFxRPFyp5qUHGM4LejBY7SSc/rpQ5hKdwK/afxy3rHvtsooT2
	yrB3rjgpstlxBMkKFHdgxyhpoN+fJGeuu/lW++DQGvGaSWILzb4Vc6HPQ86tcGIFvEeL
	vor+Me1GHhmGVtkeLry6kxs8ncKIGrPZLb4/HBDY+DY7sfPgkgbtnL/fHaDM23+vXEWU
	DJsOyJnYRhS7e3XSYWYubqCQaMB03NaYKptmJUE6iTJlGskpZFRablT0Yp4dvy7V1dcm
	nrVO8l0+OjCTqSa57mGdltQFOR9+nW8Hls1g+2gOrPneDSe9Ena/sCTMErZJr7WzupFD
	BVOA==
X-Gm-Message-State: APjAAAWLYXmZMo48tYX9KIvMZ7A1MUYI2MdROFp1h+GvGijwboanzX0K
	wSMeuuwGd9m0sK8lz0aVOQ++jr9uAaj1UbntieU=
X-Google-Smtp-Source: APXvYqyNdb6q4P4O88zcmc6N3cLgiFG332KYWpXKjHK68/9RoT3tlHO9UhXF2z7t0l1zBXirr6w37GMME3QjNDi3bF4=
X-Received: by 2002:ac8:60c8:: with SMTP id i8mr7546807qtm.53.1581520319816;
	Wed, 12 Feb 2020 07:11:59 -0800 (PST)
MIME-Version: 1.0
References: <20200212051936.1610922-1-raj.khem@gmail.com>
	<CANNYZj9478oh1cNgK0U5oq8RX=q8VMYZpCnPZ8akgvUtQExFmg@mail.gmail.com>
In-Reply-To: <CANNYZj9478oh1cNgK0U5oq8RX=q8VMYZpCnPZ8akgvUtQExFmg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Feb 2020 07:11:32 -0800
Message-ID: <CAMKF1srv-UPO0OjHKqqwu0GPW-rcdcO+0NJSnR4B0s-V43i8pg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Wed, 12 Feb 2020 15:12:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 11:11 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Please let=E2=80=99s try to avoid anonymous python. What problem does thi=
s solve? If package_rpm is not enabled, then there should not be a dependen=
cy chain that builds these anyway.

for non rpm backend opkg, rpm is pulled in which is not desired
because opkg depends on libsolv
and libsolv by default depends on rpm which I sent another patch to
decouple, This caused opkg images to fail tests because testing infra
found rpm in the image and ran tests for it which obviously would
fail.

 libsolv does have rpm support as packageconfig but when that
is disabled then libdnf does not build anymore since it expects rpmdb
support in libsolv.

so when we do world builds with opkg as package management then dnf
and libdbf starts to fail
due to their RPM needs.

IF there was an override to identity packaging backends then we could
have used that

If you have better suggestions to avoid anon python here, I am all ears.

>
> Alex
>
> On Wed 12. Feb 2020 at 6.20, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> dnf does not work with opkg or dpkg/apt anyway
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 8 ++++++++
>>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 7 +++++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devto=
ols/dnf/dnf_4.2.2.bb
>> index f38167f1ad..9e6d5741af 100644
>> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> @@ -84,3 +84,11 @@ SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service dnf-=
makecache.timer \
>>                           dnf-automatic-notifyonly.service dnf-automatic=
-notifyonly.timer \
>>  "
>>  SYSTEMD_AUTO_ENABLE ?=3D "disable"
>> +
>> +python () {
>> +    pkgb =3D d.getVar("PACKAGE_CLASSES")
>> +    pkgn =3D d.getVar("PN")
>> +    pkgv =3D d.getVar("PV")
>> +    if "package_rpm" not in pkgb:
>> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in libsol=
v" % (pkgn, pkgv))
>> +}
>> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipe=
s-devtools/libdnf/libdnf_0.28.1.bb
>> index 882c435b32..5c9326ca64 100644
>> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> @@ -27,3 +27,10 @@ EXTRA_OECMAKE_append_class-nativesdk =3D " -DWITH_GIR=
=3DOFF"
>>
>>  BBCLASSEXTEND =3D "native nativesdk"
>>
>> +python () {
>> +    pkgb =3D d.getVar("PACKAGE_CLASSES")
>> +    pkgn =3D d.getVar("PN")
>> +    pkgv =3D d.getVar("PV")
>> +    if "package_rpm" not in pkgb:
>> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in libsol=
v" % (pkgn, pkgv))
>> +}
>> --
>> 2.25.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

