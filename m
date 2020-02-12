Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0CED860811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:16:34 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c188so3742516qkg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 14:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CtqpPwjtNAXXcm4qmhgpMPndU+oLMQ8rrFYzIWsYkqI=;
	b=PkCBF9xuZ1TPcF2jU47CBalf9XSeMPlljz+0P4i4rTnLeot054UHHMGsuk6QMRXWVO
	QKZcIOl48KTlNxrmNim03saoBnXFIiHW9MTHIpLpGXZzgbJdD/470/IMp9jMzfJe+b8P
	QDmZUcm7+AHnGTpqPprcd1yRvQjz1bzOMFV7G8k7REsI6ol0sv9W8nf9+cqv6DbWN/Xt
	/sjN6YxESXFnbMAeR0vwq+CP8tBRQd0ZhxQc2PuPEvwSWOQigRCmjAlsSlbLAsb3JoG5
	WdGVbVYtYRDYMULUlc7QtcQN21sdF1hnPywvrhvh1VOE1NJYpCQAreGN63s3RWf92MIG
	snOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CtqpPwjtNAXXcm4qmhgpMPndU+oLMQ8rrFYzIWsYkqI=;
	b=QmyTJhI3YCB/zBFztxzEzG7qmtN2X/DBPoxAl7Fud6YzSdvOil8cBRhAwNWBSmuSJw
	um0nXgQJl4PyKNn08AupFqGHZPdZePb4JYhqb9jFCnZevR7r6NND8R0GXR3KR9DgHqDZ
	R1lAmgEG2VW337prHssKeIkAD5icWd1jvqAiDp85db6K29p9kMGJNqjfPDw06JcLnZtI
	Tl77Q+HzmP+TMCXx1Gc2GAZgHHzwGMsSLWplhFR694ubUkRYZXiWkhvB6e2lh4IVq/Gb
	wE0b+WNuHFoUdEhAjzwGWpXSi9h+PtwrZb19z1tIkXbwovBiJ14I9n8Wy0cahVFElgcy
	Dsjw==
X-Gm-Message-State: APjAAAWDRgyi+KY5YCZdWaoOAMTLrp4RoKvXAXNn3AnnN3YPAakWEyHq
	p8Cl9wyHjKZqXi7E067ER5M+n5FEuiMyLQ48n/yXhlXp
X-Google-Smtp-Source: APXvYqwTKtrIuwvNaHR2ESX08o58OQDdO/ILNHhPLr3bFhidn4P+zbxW9ae6kF8wCkrWqriomOx1YVVOA3b10Y96F4o=
X-Received: by 2002:ae9:ef96:: with SMTP id d144mr8252135qkg.337.1581545794705;
	Wed, 12 Feb 2020 14:16:34 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
In-Reply-To: <CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Feb 2020 14:16:08 -0800
Message-ID: <CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Feb 2020 22:16:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 2:00 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I would still prefer to just split rpm packaging into binaries and librar=
ies, and avoid the need to blacklist and tweak recipes based on what PACKAG=
E_CLASSES is set to altogether. That setting should not leak into recipes, =
and should only matter from do_package onwards. Can you look into the rpm r=
ecipe please?
>

 dnf and dnf related packages expecting rpmdb support in libresolv. I
do not know dnf well enough to fix it and moreover it has no direct
use for my usecase either. I also don't see a point of entertaining
dnf for non-rpm backends. Its not intended for that either even if we
were to make dnf not want rpmdb what good will it do to build for
distros who do not use rpm. These changes do not change poky defaults
which use rpm as default. OE-core does not and I dont know of any
opkg user who also has rpmdb needed.

> Alex
>
> On Wed, 12 Feb 2020 at 20:19, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> dnf does not work with opkg or dpkg/apt anyway
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> v2: Use PNBLACKLIST instead of anon python
>>
>>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
>>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
>>  2 files changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devto=
ols/dnf/dnf_4.2.2.bb
>> index f38167f1ad..220f1aabbd 100644
>> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service dnf-m=
akecache.timer \
>>                           dnf-automatic-notifyonly.service dnf-automatic=
-notifyonly.timer \
>>  "
>>  SYSTEMD_AUTO_ENABLE ?=3D "disable"
>> +
>> +PNBLACKLIST[dnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'package=
_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES=
', d)}"
>> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipe=
s-devtools/libdnf/libdnf_0.28.1.bb
>> index 882c435b32..49afa04812 100644
>> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native =3D " -DWITH_GIR=3DO=
FF"
>>  EXTRA_OECMAKE_append_class-nativesdk =3D " -DWITH_GIR=3DOFF"
>>
>>  BBCLASSEXTEND =3D "native nativesdk"
>> +PNBLACKLIST[libdnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES', 'pack=
age_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLAS=
SES', d)}"
>>
>> --
>> 2.25.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

