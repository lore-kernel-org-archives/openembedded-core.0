Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA8DC43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:32:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.181.1654101132599228392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MkQ4/yn4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id n185so1274545wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=CCWr9KrUwoEhdWOA/ZVjWAsCnPzZLfoGvT2szXlu/wg=;
        b=MkQ4/yn4DiOdJ815rTnU7fLtgq5YF5yVOM+3FoMn+i8GVTEw9SplUBxVGxXJIwXVnR
         R1RNMSQl2ZO9lXSQ9ONsi9Hl2/2eiv1m77oZQ/pHGKyCYc3+IqQ4jkCMaP5nLKQ6E0F8
         7H2Z5kKiX2I6wgQBJBsK1N/aAf4jrv1rgueu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=CCWr9KrUwoEhdWOA/ZVjWAsCnPzZLfoGvT2szXlu/wg=;
        b=NFBfjNWuaWNknPr66Hb3VodMVU9+TNF5Z02H5lLV4Hx8G1WoOCuXUWetNQCTUQtWa0
         DmYHCBYypPYPmS9O0JXIeSSmGcM7+1Lq9O5z1epEeul8aqiF4YfprJWXC+vc0+wZ9QXz
         Ksb1pkbfybkfHvRhXRvSz9WfJphQT1YN1PQUgxt/KnO3a8R6dgtJi2ed7rkV4suEIkKx
         QOQIf3pEbzkfzNfNwyMHPrO6QbTTuaHRN+Lys8DQUnhZAbr1U+Mp3quCdADyPr5wlCSv
         ag24GD/HcBHD1lbeq2a4IkJEAuVVu6uekr6xlMgzvUDXT7BC0IInDKoUUpngKLYCPAky
         glrg==
X-Gm-Message-State: AOAM5325YdTI3H+XNFvjbvOD0ATCeu5FYUFHisBu8X0DWS0rFK9lBiI7
	zWjIemHEvBvYuXZMuClLQxU1jw==
X-Google-Smtp-Source: 
 ABdhPJyUGFCL2eq7zkbFbPeoIjV8XnbSo2ygE7c45fI6yfUX00Jbv6UPoe6mPzWt0+8K58oGOCTMBA==
X-Received: by 2002:a05:600c:1f0a:b0:397:7161:d3bf with SMTP id
 bd10-20020a05600c1f0a00b003977161d3bfmr29869023wmb.27.1654101130821;
        Wed, 01 Jun 2022 09:32:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eab:cafb:b8d4:fe67?
 ([2001:8b0:aba:5f3c:eab:cafb:b8d4:fe67])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c510400b0039748be12dbsm6265283wms.47.2022.06.01.09.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 09:32:10 -0700 (PDT)
Message-ID: 
 <537cde730f1ed3450554e504141612d854ca4766.camel@linuxfoundation.org>
Subject: Re: [kirkstone][PATCH 1/2] gcc: Upgrade to 11.3 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 01 Jun 2022 17:32:04 +0100
In-Reply-To: 
 <CAOSpxdYO+QJV64ugouK+Yw8M3VNKv=War5MQRo3JfT6EY8uLjQ@mail.gmail.com>
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
	 <CAOSpxdY=WZZfZNAEYQRyVG_jmE0=0_6xAH9fDCALMDjm=K9k6g@mail.gmail.com>
	 <CA+chaQfSE-oiUxdSJxqCT-GjUP_KGA4dOvcD49xPqwez=ohhFg@mail.gmail.com>
	 <CAOSpxdYXrnJRdc_NghthSexaq_R10h0=JBTfqPTP3TR7PbwGLA@mail.gmail.com>
	 <3aea71febbe02c97dabec307ace0c4389d45d913.camel@linuxfoundation.org>
	 <CAOSpxdYO+QJV64ugouK+Yw8M3VNKv=War5MQRo3JfT6EY8uLjQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:32:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166435

On Wed, 2022-06-01 at 06:21 -1000, Steve Sakoman wrote:
> On Wed, Jun 1, 2022 at 6:10 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2022-06-01 at 05:29 -1000, Steve Sakoman wrote:
> >=20
> >=20
> > Keep in mind that the test uses sstate to compare against so even that
> > isn't a guarantee of identifying the issue.
> >=20
> > Did you try the strings comparison I suggested? Do you have the file
> > section tables comparison (diff) I could look at?
>=20
> Are you referring to the section header info from objdump -h ?
>=20
> If so I've attached the a/b info, they are quite compact.

Yes, I couldn't remember the option to objdump offhand. The diff looks
like:

--- /tmp/headersa.txt	2022-06-01 17:22:57.272277627 +0100
+++ /tmp/headersb.txt	2022-06-01 17:22:43.972218408 +0100
@@ -1,5 +1,5 @@
=20
-a/usr/lib/libwebkit2gtk-4.0.so.37.56.5:     file format elf64-x86-64
+b/usr/lib/libwebkit2gtk-4.0.so.37.56.5:     file format elf64-x86-64
=20
 Sections:
 Idx Name          Size      VMA               LMA               File off  =
Algn
@@ -63,15 +63,15 @@
                   CONTENTS, READONLY, DEBUGGING, OCTETS
  29 .debug_abbrev 00c6ce64  0000000000000000  0000000000000000  921c9968  =
2**0
                   CONTENTS, READONLY, DEBUGGING, OCTETS
- 30 .debug_line   09025ee1  0000000000000000  0000000000000000  92e367cc  =
2**0
+ 30 .debug_line   09025ede  0000000000000000  0000000000000000  92e367cc  =
2**0
                   CONTENTS, READONLY, DEBUGGING, OCTETS
- 31 .debug_str    1820ba50  0000000000000000  0000000000000000  9be5c6ad  =
2**0
+ 31 .debug_str    1820ba50  0000000000000000  0000000000000000  9be5c6aa  =
2**0
                   CONTENTS, READONLY, DEBUGGING, OCTETS
- 32 .debug_line_str 0005d9f4  0000000000000000  0000000000000000  b40680fd=
  2**0
+ 32 .debug_line_str 0005d9f4  0000000000000000  0000000000000000  b40680fa=
  2**0
                   CONTENTS, READONLY, DEBUGGING, OCTETS
- 33 .debug_loclists 13d74aa2  0000000000000000  0000000000000000  b40c5af1=
  2**0
+ 33 .debug_loclists 13d74aa0  0000000000000000  0000000000000000  b40c5aee=
  2**0
                   CONTENTS, READONLY, DEBUGGING, OCTETS
- 34 .debug_rnglists 034c6c08  0000000000000000  0000000000000000  c7e3a593=
  2**0
+ 34 .debug_rnglists 034c6bf6  0000000000000000  0000000000000000  c7e3a58e=
  2**0
                   CONTENTS, READONLY, DEBUGGING, OCTETS
- 35 .gnu_debuglink 00000024  0000000000000000  0000000000000000  cb30119c =
 2**2
+ 35 .gnu_debuglink 00000024  0000000000000000  0000000000000000  cb301184 =
 2**2
                   CONTENTS, READONLY

I'm a bit puzzled since usually the debug symbols are moved off to the
-dbg package and yet they seem combined here with the library. What the
above seems to say is that the debug_line, loclists and rnglists
sections changed size, the rest changed offset (and we ignore
gnu_debuglink since that is a checksum which would depend on the other
bits).

That would imply that some piece of code used to compile webkit has
different line numbering on one system compared to another but
generates identical code. You should be able to parse the debuginfo to
get a filename and linenumber out of it but I can't remember how, I
think I learnt to read dwarfish last time I did this :/.

Cheers,

Richard


