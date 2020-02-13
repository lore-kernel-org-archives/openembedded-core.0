Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 317DE603FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:01:33 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d9so3548921qte.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9aDV5rtjUyKKaVzCq9q3zjxqFWKksFO9r9hLR6JRANE=;
	b=Oq1g8926JZMrxpcM4nFmITK/8GVSd/3GK4UuKLi1ikA0QODW/NqS3aZaB4teBr1MhS
	j0YyKabDh3R7rHelHuaY1NYm6/d5hV2ejauLHzSq9cFUetdQarQuzA7qa/iLF5fwv9sz
	1hRRKSCM0QZ2GMRENrGG9KwNUsY34ThAzWJViJGSVBnsC/24+QdxBw6jitOGwofVJch9
	0Lizx02SPnagTQzabChQQhOfUrsJCHOJWbNs3SU+BmgLYpZQkd6lY0XdsoO4YoopTUDo
	hMxBdEXXQiWelZJu9vc760lULkfQZlU7tP4AJbhD0mmbzrWGHJr4NmoXtu6sHJqvpUyb
	5HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9aDV5rtjUyKKaVzCq9q3zjxqFWKksFO9r9hLR6JRANE=;
	b=hToUiERufSR9pkmcMN353uTXWW/ZbLBR7S4BfJUMu5P8sqXvUPXTa/YLi8YwwB4MH5
	s+fa5r1DttH3SCoK19iUxRNSfVTsifjNpZkQzMVwC7yeQddgaZ1/kni0GMKZ2HdiNzQG
	QrWbcEyxN3Gs1Ov0WMEtahZ4s4WdNTor53f21YDnYk2UyqdKsLItFi4CklAw8+NJAkkY
	EtyKQ8bejU7vNph7WfHlqmU82O47bV3OBbWetog8MvcY5c+jfdSGviQjC/iFjNQHdbfU
	8fx8SCV2omVrCxoXB1uxSesnWY3ZdTgHv49A67FsIE2lFUJVXtcmriDXNWMFeb8HrPUt
	yInQ==
X-Gm-Message-State: APjAAAWP3fhixrMYEsaY7BeivXEXBTuPQpo0e8JPO0cbjGzkRM6YDsD8
	/2OJcUmtV7ONARUNI5pbEDJXPo2vPn8UNTjrZHU=
X-Google-Smtp-Source: APXvYqys2oHEa95w+MdzQuVWn/3U8sB9FElCU+GkpS6cMu7ZmnLQJ4q5IcK7dlWlQUHFZcttyKtAnOw+ybxp9VxQzlA=
X-Received: by 2002:ac8:145:: with SMTP id f5mr10191494qtg.194.1581573693554; 
	Wed, 12 Feb 2020 22:01:33 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
	<CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
	<CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
In-Reply-To: <CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Feb 2020 22:01:07 -0800
Message-ID: <CAMKF1spSwxqzVW0r2wxQQqPg6PW3ZwZM+HcNh9L0zai7wz4HfQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 13 Feb 2020 06:01:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 8:49 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> But you do not need to fix or touch dnf at all. You only need to adjust r=
pm packaging and split it in two parts instead of bundling everything into =
a single package.
>

when we do world builds without package_rpm, dnf and related packages
get compiled which is unnecessary and moreover wrong and when we mark
libsolv to enable rpmdb only for package_rpm, this becomes even more eviden=
t.

Perhaps, I am missing what you intend to convey, in that case maybe you can=
 send
code changes to support what you are intending here.

> Alex
>
> On Wed 12. Feb 2020 at 23.16, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Feb 12, 2020 at 2:00 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > I would still prefer to just split rpm packaging into binaries and lib=
raries, and avoid the need to blacklist and tweak recipes based on what PAC=
KAGE_CLASSES is set to altogether. That setting should not leak into recipe=
s, and should only matter from do_package onwards. Can you look into the rp=
m recipe please?
>> >
>>
>>  dnf and dnf related packages expecting rpmdb support in libresolv. I
>> do not know dnf well enough to fix it and moreover it has no direct
>> use for my usecase either. I also don't see a point of entertaining
>> dnf for non-rpm backends. Its not intended for that either even if we
>> were to make dnf not want rpmdb what good will it do to build for
>> distros who do not use rpm. These changes do not change poky defaults
>> which use rpm as default. OE-core does not and I dont know of any
>> opkg user who also has rpmdb needed.
>>
>> > Alex
>> >
>> > On Wed, 12 Feb 2020 at 20:19, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> dnf does not work with opkg or dpkg/apt anyway
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >> v2: Use PNBLACKLIST instead of anon python
>> >>
>> >>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
>> >>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
>> >>  2 files changed, 3 insertions(+)
>> >>
>> >> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-de=
vtools/dnf/dnf_4.2.2.bb
>> >> index f38167f1ad..220f1aabbd 100644
>> >> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> >> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> >> @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service dn=
f-makecache.timer \
>> >>                           dnf-automatic-notifyonly.service dnf-automa=
tic-notifyonly.timer \
>> >>  "
>> >>  SYSTEMD_AUTO_ENABLE ?=3D "disable"
>> >> +
>> >> +PNBLACKLIST[dnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'pack=
age_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLAS=
SES', d)}"
>> >> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/rec=
ipes-devtools/libdnf/libdnf_0.28.1.bb
>> >> index 882c435b32..49afa04812 100644
>> >> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> >> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> >> @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native =3D " -DWITH_GIR=
=3DOFF"
>> >>  EXTRA_OECMAKE_append_class-nativesdk =3D " -DWITH_GIR=3DOFF"
>> >>
>> >>  BBCLASSEXTEND =3D "native nativesdk"
>> >> +PNBLACKLIST[libdnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'p=
ackage_rpm', '', 'does not build correctly without package_rpm in PACKAGE_C=
LASSES', d)}"
>> >>
>> >> --
>> >> 2.25.0
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

