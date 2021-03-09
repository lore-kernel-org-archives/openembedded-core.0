Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.4713.1615266702771553766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 21:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tE1INO5B;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id v3so9428288qtw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 21:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tbyAqyL3+qiPlgAiX2XL3wBJGtLbkFXY9txvHg+prZM=;
        b=tE1INO5B1N8+Vk1ZPHdPZKAWVwtBNUu94zmt3yhQUnHpz2BbkAHr/OnGe5lPATseE+
         xb3tDqBEHSxXytlUIUZjlnYLXRpWyiNrZwbwtSapqlPeBFfxxel0CI6luBO+ki2Rr+al
         qwSmq56J6peS04uYeJ0SKkGjYOCvwzmB8B6Y2Watv099JlY0So/MUK5nH/QK5CL7uUuX
         KkP6R7Yv+8a3+zNTKdEBnOabZjBMhqMQ9fpPRDBokPn2CRFFgo9tWBMPtGzDM+Mrc3Yp
         uQCgw8qRrWuIS+Y2A7yXMwm05Ku5UM/a8/KpDIXIIe1JeiW+/0Vg/gCKvXLJpNtYwY9X
         J7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tbyAqyL3+qiPlgAiX2XL3wBJGtLbkFXY9txvHg+prZM=;
        b=Ja1Xep2SEkuTCoDnNnmHbQaAnluH55Dr9ovXhKwPCNngCBnvMwZdSJBb+nqLIOXOeS
         mPu04kCNmJn2hq18kE82QeJDcr9qZguyJPtvLn/Rk/lYgAMjsUIZIdNfV2N7pIkkZwHJ
         YOrhBmm7p+W+YpATlS/97Gi3LfJE+HFzuctt8GH5GzrWA7JxWA2eUh1/6nelmf1VoYR0
         FqZQRQdVvbQqFIlX76ASGZH1AJ2UmBeFYe0+jntTyimp+1n9DjGxBRFVdPz6Gwuo9A8X
         XFtkl1zIVRu5nE47dr2qbHWmZMP8rkg9PnfXJTcFBb5YBqk+rc/UAXR8ha/AliovDaKf
         lHEA==
X-Gm-Message-State: AOAM532fGczkdDf3nwuJhcSDmP91dHNcOAkL1nht/08H0Bwa+brbNBay
	L7+sqJm90kj7BKIz1WVymQ/KDxnDl9cUsXUGx8c=
X-Google-Smtp-Source: ABdhPJwkI6OEQewtySI022lEUN57GEiL5l334iNpeXrgJfBjAUPmR1r+0s2JkgctAbSXszIeNqlqygjoMLkUaH6iLZs=
X-Received: by 2002:ac8:a42:: with SMTP id f2mr8515218qti.214.1615266701772;
 Mon, 08 Mar 2021 21:11:41 -0800 (PST)
MIME-Version: 1.0
References: <20210309035410.757604-1-raj.khem@gmail.com> <CANNYZj_LvT0=HijEcDMQY=4aoKf26Z0nau=MBucRoFoYAog4pQ@mail.gmail.com>
In-Reply-To: <CANNYZj_LvT0=HijEcDMQY=4aoKf26Z0nau=MBucRoFoYAog4pQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 8 Mar 2021 21:11:15 -0800
Message-ID: <CAMKF1sp=bs6VfBQ=4yz11U32C3n55E41BdGnRePPY+0SVw70fQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Link libatomic on RISCV
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

upstream is informed about this via
https://bugs.webkit.org/show_bug.cgi?id=3D222959

On Mon, Mar 8, 2021 at 7:58 PM Alexander Kanavin <alex.kanavin@gmail.com> =
wrote:
>
> Please send the patches upstream first, I wouldn=E2=80=99t normally ask =
for it explicitly, but there=E2=80=99s a history of webkit patches that are=
 forever pending and cause pain on version updates.
>
> Alex
>
> On Tue 9. Mar 2021 at 4.54, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This fixes linking failures
>> Source/WTF/wtf/text/StringImpl.h:1115: undefined reference to `__atomic=
_compare_exchange_1'
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../webkitgtk/webdriver-libatomic.patch       | 23 +++++++++++++++++++
>>  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  3 +++
>>  2 files changed, 26 insertions(+)
>>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/webdriver-libato=
mic.patch
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.pat=
ch b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
>> new file mode 100644
>> index 0000000000..bd9ac9d1f5
>> --- /dev/null
>> +++ b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
>> @@ -0,0 +1,23 @@
>> +link with libatomic
>> +
>> +This fixes build with C11
>> +
>> +lib/../Source/WTF/wtf/CMakeFiles/WTF.dir/Assertions.cpp.o:/usr/include=
/c++/11.0.1/bits/atomic_base.h:520: more undefined references to `__atomic_=
compare_exchange_1' follow
>> +| collect2: error: ld returned 1 exit status
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +--- a/Source/WTF/wtf/CMakeLists.txt
>> ++++ b/Source/WTF/wtf/CMakeLists.txt
>> +@@ -529,6 +529,10 @@ list(APPEND WTF_LIBRARIES
>> +     ICU::uc
>> + )
>> +
>> ++list(APPEND WTF_LIBRARIES
>> ++     -Wl,--as-needed -Wl,-latomic -Wl,--no-as-needed
>> ++)
>> ++
>> + set(WTF_INTERFACE_LIBRARIES WTF)
>> + set(WTF_INTERFACE_INCLUDE_DIRECTORIES ${WTF_FRAMEWORK_HEADERS_DIR})
>> + set(WTF_INTERFACE_DEPENDENCIES WTF_CopyHeaders)
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipe=
s-sato/webkit/webkitgtk_2.30.5.bb
>> index a1dd76ce81..3daf31f7d3 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
>> @@ -20,6 +20,9 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN=
}-${PV}.tar.xz \
>>             file://include_xutil.patch \
>>             file://reduce-memory-overheads.patch \
>>             "
>> +SRC_URI_append_riscv64 =3D " file://webdriver-libatomic.patch"
>> +SRC_URI_append_riscv32 =3D " file://webdriver-libatomic.patch"
>> +
>>  SRC_URI[sha256sum] =3D "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac8=
6eb23999bfed5a7f1f"
>>
>>  inherit cmake pkgconfig gobject-introspection perlnative features_chec=
k upstream-version-is-even gtk-doc
>> --
>> 2.30.1
>>
>>
>>=20
>>
