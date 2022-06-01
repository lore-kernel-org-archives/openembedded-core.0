Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F43C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 20:16:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.3007.1654114578796860321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 13:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VkkTIARM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id q7so3812789wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 13:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=zRbZle9XVgsK1gh8mtu2KDVK82XNxyU0qSQkuEOeDLg=;
        b=VkkTIARMH3ZLZQ2hhCNMhybNoa6kpm329FXkkM+6F7fXbORi69TsG+j8WAtCwU9H2E
         B+iHQygzo3cp+/7VM4IcOJq9vCFRY5c2MbW5x8/d/bisFlFyw8FiiKn47LPR1/c/tKyc
         HjpE/HfdQo//HXCMCXdK9xAPW5rY0aUwOLk8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=zRbZle9XVgsK1gh8mtu2KDVK82XNxyU0qSQkuEOeDLg=;
        b=YSMeIL3cEkxZKU21flb/9WIgEwvDX9jL5dPrCziuHmwlrerKJIgAKtDNbEhvPkbvvK
         +eY5XW5wdaFPAKpXq4OFkhUMkJVQj2LZiZTZIXtXKoNXcMu2BdGdU/cDXFIyu2zD38De
         FGA1Qv3246/h4TAz22frBFtR8KxpkzghOvZVMRrbEuyXjMTFaw3Q1e1FAaF1IedDR1U9
         NCQtrVsxG73DwK39uzJfEYKMWowvu5BzGX4ZiBTLIVuPSrGK8S0DUbQuyInO5JC6q4Le
         J4grN2AzyOAK4ty1m2Pw2TQE1KJuNPITepZZA/boVOckoTMRIaNxUDGmKcVJ05s99tB9
         ztLQ==
X-Gm-Message-State: AOAM533ribfNOMHnXKe1MjfBSQSF2Yb9l28+FOfmy0NlmFU8V313PPA1
	Oos/8lM81rtw06y30dknolIiZw==
X-Google-Smtp-Source: 
 ABdhPJx9gOMX0J1AVgOv/aIZuxgNsxZnHVTC6w/hVyqIWF6apWuhuvu8rHyza2k3tzmH8ae4w9otqQ==
X-Received: by 2002:a05:6000:144e:b0:20e:6719:c376 with SMTP id
 v14-20020a056000144e00b0020e6719c376mr881174wrx.715.1654114577165;
        Wed, 01 Jun 2022 13:16:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eab:cafb:b8d4:fe67?
 ([2001:8b0:aba:5f3c:eab:cafb:b8d4:fe67])
        by smtp.gmail.com with ESMTPSA id
 w25-20020a1cf619000000b003976fbfbf00sm2982441wmc.30.2022.06.01.13.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:16:16 -0700 (PDT)
Message-ID: 
 <8c0a4c49572770c7164bc3822acef773e7b382f0.camel@linuxfoundation.org>
Subject: Re: [kirkstone][PATCH 1/2] gcc: Upgrade to 11.3 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 01 Jun 2022 21:16:10 +0100
In-Reply-To: 
 <CAOSpxdZByfRQ6OiWXWO2HQwmPUiRAihs06JVTGr-rJnzK21iuw@mail.gmail.com>
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
	 <CAOSpxdY=WZZfZNAEYQRyVG_jmE0=0_6xAH9fDCALMDjm=K9k6g@mail.gmail.com>
	 <CA+chaQfSE-oiUxdSJxqCT-GjUP_KGA4dOvcD49xPqwez=ohhFg@mail.gmail.com>
	 <CAOSpxdYXrnJRdc_NghthSexaq_R10h0=JBTfqPTP3TR7PbwGLA@mail.gmail.com>
	 <3aea71febbe02c97dabec307ace0c4389d45d913.camel@linuxfoundation.org>
	 <CAOSpxdYO+QJV64ugouK+Yw8M3VNKv=War5MQRo3JfT6EY8uLjQ@mail.gmail.com>
	 <537cde730f1ed3450554e504141612d854ca4766.camel@linuxfoundation.org>
	 <CAOSpxdZByfRQ6OiWXWO2HQwmPUiRAihs06JVTGr-rJnzK21iuw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 20:16:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166441

On Wed, 2022-06-01 at 07:01 -1000, Steve Sakoman wrote:
> On Wed, Jun 1, 2022 at 6:32 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2022-06-01 at 06:21 -1000, Steve Sakoman wrote:
> > > On Wed, Jun 1, 2022 at 6:10 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Wed, 2022-06-01 at 05:29 -1000, Steve Sakoman wrote:
> > > >=20
> > > >=20
> > > > Keep in mind that the test uses sstate to compare against so even t=
hat
> > > > isn't a guarantee of identifying the issue.
> > > >=20
> > > > Did you try the strings comparison I suggested? Do you have the fil=
e
> > > > section tables comparison (diff) I could look at?
> > >=20
> > > Are you referring to the section header info from objdump -h ?
> > >=20
> > > If so I've attached the a/b info, they are quite compact.
> >=20
> > Yes, I couldn't remember the option to objdump offhand. The diff looks
> > like:
> >=20
> > --- /tmp/headersa.txt   2022-06-01 17:22:57.272277627 +0100
> > +++ /tmp/headersb.txt   2022-06-01 17:22:43.972218408 +0100
> > @@ -1,5 +1,5 @@
> >=20
> > -a/usr/lib/libwebkit2gtk-4.0.so.37.56.5:     file format elf64-x86-64
> > +b/usr/lib/libwebkit2gtk-4.0.so.37.56.5:     file format elf64-x86-64
> >=20
> >  Sections:
> >  Idx Name          Size      VMA               LMA               File o=
ff  Algn
> > @@ -63,15 +63,15 @@
> >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> >   29 .debug_abbrev 00c6ce64  0000000000000000  0000000000000000  921c99=
68  2**0
> >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > - 30 .debug_line   09025ee1  0000000000000000  0000000000000000  92e367=
cc  2**0
> > + 30 .debug_line   09025ede  0000000000000000  0000000000000000  92e367=
cc  2**0
> >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > - 31 .debug_str    1820ba50  0000000000000000  0000000000000000  9be5c6=
ad  2**0
> > + 31 .debug_str    1820ba50  0000000000000000  0000000000000000  9be5c6=
aa  2**0
> >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > - 32 .debug_line_str 0005d9f4  0000000000000000  0000000000000000  b406=
80fd  2**0
> > + 32 .debug_line_str 0005d9f4  0000000000000000  0000000000000000  b406=
80fa  2**0
> >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > - 33 .debug_loclists 13d74aa2  0000000000000000  0000000000000000  b40c=
5af1  2**0
> > + 33 .debug_loclists 13d74aa0  0000000000000000  0000000000000000  b40c=
5aee  2**0
> >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > - 34 .debug_rnglists 034c6c08  0000000000000000  0000000000000000  c7e3=
a593  2**0
> > + 34 .debug_rnglists 034c6bf6  0000000000000000  0000000000000000  c7e3=
a58e  2**0
> >                    CONTENTS, READONLY, DEBUGGING, OCTETS
> > - 35 .gnu_debuglink 00000024  0000000000000000  0000000000000000  cb301=
19c  2**2
> > + 35 .gnu_debuglink 00000024  0000000000000000  0000000000000000  cb301=
184  2**2
> >                    CONTENTS, READONLY
> >=20
> > I'm a bit puzzled since usually the debug symbols are moved off to the
> > -dbg package and yet they seem combined here with the library. What the
> > above seems to say is that the debug_line, loclists and rnglists
> > sections changed size, the rest changed offset (and we ignore
> > gnu_debuglink since that is a checksum which would depend on the other
> > bits).
> >=20
> > That would imply that some piece of code used to compile webkit has
> > different line numbering on one system compared to another but
> > generates identical code. You should be able to parse the debuginfo to
> > get a filename and linenumber out of it but I can't remember how, I
> > think I learnt to read dwarfish last time I did this :/.
>=20
> I did a dump of the debug sections with objdump -g and got absolutely
> huge output files that crashed all of the diff programs I tried.
>=20
> I guess the next step is to split those files into smaller chunks and
> diff those :-(
>=20
> Have I mentioned how much I hate webkit-gtk?

Steve ran readelf against them and found there were some differences
with the _ZZN7WebCore11CSSProperty symbol. A grep on a build directory
shows:

tmp/work/core2-64-poky-linux/webkitgtk/2.36.1-r0$ grep WebCore11CSSProperty=
 build webkitgtk-2.36.1 -R
grep: build/lib/libWebCoreGTK.a: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-2f84417a-14.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-2f84417a-17.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-84c9f43f-5.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-26ec8d00-4.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-2f84417a-7.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-950a39b6-5.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-a6b8b600-2.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-26ec8d00-2.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-8feba646-7.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-26ec8d00-5.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-043dd90b-14.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-950a39b6-14.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-2f84417a-16.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-2f84417a-10.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-950a39b6-7.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-2f84417a-1.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-26ec8d00-3.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-043dd90b-22.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/unified-sources/UnifiedSource-f34946be-2.cpp.o: binary file matches
grep: build/Source/WebCore/CMakeFiles/WebCore.dir/__/__/WebCore/DerivedSour=
ces/CSSPropertyNames.cpp.o: binary file matches
grep: build/Source/WebKit/CMakeFiles/WebKit.dir/__/__/DerivedSources/WebKit=
/unified-sources/UnifiedSource-50d0d8dd-6.cpp.o.d: No such file or director=
y

which fills me with dread since I worry it may be changing the output
depending on the order it is linking these in. Just a guess but...

Cheers,

Richard


