Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.11420.1628093849652994513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 09:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sPqiTdKt;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id u2so3512413plg.10;
        Wed, 04 Aug 2021 09:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vQ4yHCxJybZM1VOs2VzHrY5ZHCwG4a1ZXMyasJFhKVk=;
        b=sPqiTdKtFS3hcZO1Kv6Z7fJ+THTl3tvkEq7SWbBCOSAbQcmpmK2Rkm0YBOGrbg3Nm0
         A1oLZADGv9WMMFLtr8+SoSyDIhJTrO6GnNQVNIVVkhuA1vcKIy345amMLlhbIT7W3ygG
         SpYGE9AMNUC0rG8VtSgJXmBgC/x0LVzbdE4MDxnh5IDRpVTdwgABhxiBBTQREzBhibdx
         2qUOG3mwgpzyuy6ZsjZNfH4R6fjCoMSWP+CGeYimnaTXL3YKV1cmnD6iVtLINTbJAKKz
         rA17xUpzajMYWOF+k498HkBO4a7ggJopZfWO0wdD1pB9C1v9FwjAcUp5sm0EoyxO0c2I
         +y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vQ4yHCxJybZM1VOs2VzHrY5ZHCwG4a1ZXMyasJFhKVk=;
        b=LeLqGiR49CfoKXjIV7yasmWN4EZfjB983yjc0zhGfkRzUV222ELrYBW7n/7x1WCcz3
         XSqbtrtRXdTpUhvQNJDUV/iv+l0OwUojyHmdg96jRg1ME6gxjg3h9S/jbzMrkOe76CAF
         Wi1aZePt5/RKYyfcVYhw52vy+cesoqLrNfmz+MADv3ytBTel3BIqGqUJ7T6+dhxMtXjF
         TN+5FtE1Lz7qzy2HEFpwdjcgEeJuMFK6vahvQFNsNLg15/AiquF3LzHafkPI0mgeaRap
         RyTHJlTSUOhMEGlOGGawtK5My2BpG6tgkPqbKFSCFgWL3IyzSxRzV02pEw757jzLIhb6
         ctyw==
X-Gm-Message-State: AOAM530chxyrNNmnuWm+EVtbGX8/Br4R7/9FZbZkFPgQFbiPECAgsjFu
	5eaXyjs0KuiTI2UWqYlmOwzOjbRMzdAg5g==
X-Google-Smtp-Source: ABdhPJzY2qZxywp0HXd/mc/diLK1ywrgu4rR2w1zjhllfhzmz4QTwdQA4yaXH/E1SB1x98TXy2ge2g==
X-Received: by 2002:a65:63cf:: with SMTP id n15mr74344pgv.392.1628093848835;
        Wed, 04 Aug 2021 09:17:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:61bd:9658:157a:c74c? ([2601:646:9200:a0f0:61bd:9658:157a:c74c])
        by smtp.gmail.com with ESMTPSA id d22sm3627443pfo.142.2021.08.04.09.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 09:17:28 -0700 (PDT)
Subject: Re: [oe] [OE-core] [PATCH] systemd-boot: use ld.bfd as efi-ld when gold is being used by default with ld-is-gold
To: Randy Li <ayaka@soulik.info>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <1696468844291952.7588@lists.openembedded.org>
 <20210803190435.332065-1-Martin.Jansa@gmail.com>
 <CAJ86T=Ut+dDkAnFUNJec=4b9v0BbSz_u+3PVkmXmGpxuOxXLeA@mail.gmail.com>
 <CA+chaQd3Mf14rf1Ai-00yNTQjF_83Qzqyc8D47y-UvqmvY4H4Q@mail.gmail.com>
 <9D74C891-7B8D-42E1-8A01-5F8258C38D4F@soulik.info>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ae398bae-5bd4-12ab-8176-b2cc9c38f475@gmail.com>
Date: Wed, 4 Aug 2021 09:17:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <9D74C891-7B8D-42E1-8A01-5F8258C38D4F@soulik.info>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 8/4/21 8:54 AM, Randy Li wrote:
> I found I sent this email to wrong list, let me CC to it.
> 
> On Aug 4, 2021, at 3:28 AM, Martin Jansa <Martin.Jansa@gmail.com 
> <mailto:Martin.Jansa@gmail.com>> wrote:
> 
>> Probably as lld isn't supported as well:
>> https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9bf86a764e31 
>> <https://github.com/systemd/systemd/commit/e39288193fcdf3a36dbc49b78e6c9bf86a764e31>
>>
> You can’t use systemd in Android of course, I decide to ignore those 
> packages won’t be used for Android vendor partition.
>> On Tue, Aug 3, 2021 at 9:19 PM Andre McCurdy <armccurdy@gmail.com 
>> <mailto:armccurdy@gmail.com>> wrote:
>>
>>     On Tue, Aug 3, 2021 at 12:04 PM Martin Jansa
>>     <Martin.Jansa@gmail.com <mailto:Martin.Jansa@gmail.com>> wrote:
>>     >
>>     > * since the upgrade to 249.1 in:
>>     >
>>     https://git.openembedded.org/openembedded-core/commit/?id=323ec445dfe22860cd450c303db5ed8fcb4e791c
>>     <https://git.openembedded.org/openembedded-core/commit/?id=323ec445dfe22860cd450c303db5ed8fcb4e791c>
>>     >   the builds with ld-is-gold are failing with:
>>     >
>>     >   [17/21] Generating linuxx64.elf.stub with a custom command
>>     >   FAILED: src/boot/efi/linuxx64.elf.stub
>>     > 
>>      /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld
>>     -o src/boot/efi/linuxx64.elf.stub -T
>>     /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds
>>     -shared -Bsymbolic -nostdlib -znocombreloc --build-id=sha1 -L
>>     /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib
>>     /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o
>>     src/boot/efi/string-util-fundamental.c.o src/boot/efi/disk.c.o
>>     src/boot/efi/graphics.c.o src/boot/efi/measure.c.o
>>     src/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o
>>     src/boot/efi/util.c.o src/boot/efi/linux.c.o
>>     src/boot/efi/splash.c.o src/boot/efi/stub.c.o -lefi -lgnuefi
>>     /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.2.0/libgcc.a
>>     > 
>>      /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld:
>>     internal error in segment_precedes, at ../../gold/layout.cc:3721
>>     <http://layout.cc:3721>

Yes I am seeing it too on OE jenkins
this is a gold bug ofcourse, but someone has to reduce this to a 
testcase and report in binutils bugzilla

>>     >   [18/21] Generating boot.c.o with a custom command
>>     >   ninja: build stopped: subcommand failed.
>>     >   WARNING: exit code 1 from a shell command.
>>     >
>>     >   as reported in:
>>     >
>>     https://lists.openembedded.org/g/openembedded-core/message/154246
>>     <https://lists.openembedded.org/g/openembedded-core/message/154246>
>>     >
>>     >   work around this by using ld.bfd when ld-is-gold is in
>>     DISTRO_FEATURES
>>     >
>>     > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
>>     <mailto:Martin.Jansa@gmail.com>>
>>     > ---
>>     >  meta/recipes-core/systemd/systemd-boot_249.1.bb
>>     <http://systemd-boot_249.1.bb> | 4 +++-
>>     >  1 file changed, 3 insertions(+), 1 deletion(-)
>>     >
>>     > diff --git a/meta/recipes-core/systemd/systemd-boot_249.1.bb
>>     <http://systemd-boot_249.1.bb>
>>     b/meta/recipes-core/systemd/systemd-boot_249.1.bb
>>     <http://systemd-boot_249.1.bb>
>>     > index d767b5bf8d..18f4fe55ce 100644
>>     > --- a/meta/recipes-core/systemd/systemd-boot_249.1.bb
>>     <http://systemd-boot_249.1.bb>
>>     > +++ b/meta/recipes-core/systemd/systemd-boot_249.1.bb
>>     <http://systemd-boot_249.1.bb>
>>     > @@ -19,11 +19,13 @@ objcopy = ${@meson_array('OBJCOPY', d)}
>>     >  EOF
>>     >  }
>>     >
>>     > +EFI_LD = "${@d.getVar('LD').split()[0]}"
>>     > +
>>     >  EXTRA_OEMESON += "-Defi=true \
>>     >                    -Dgnu-efi=true \
>>     >                    -Defi-includedir=${STAGING_INCDIR}/efi \
>>     >                    -Defi-libdir=${STAGING_LIBDIR} \
>>     > -                  -Defi-ld=${@ d.getVar('LD').split()[0]} \
>>     > +                  -Defi-ld=${@bb.utils.contains
>>     <mailto:Defi-ld=${@bb.utils.contains>('DISTRO_FEATURES',
>>     'ld-is-gold', 'ld.bfd', '${EFI_LD}', d)} \
>>
>>     Could this just be set to ld.bfd in all cases?
>>
> https://github.com/android/ndk/issues/1288 
> <https://github.com/android/ndk/issues/1288>
> Android has dropped the support for gold linker and it has been marked 
> as deprecated for a long time.
> I just heard that Gstreamer doesn’t support lld linker but I prefer to 
> solve it in Gstreamer.
>>
>>
>>
> 
> 
> 
> 
