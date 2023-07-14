Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97C4EB64DA
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 12:54:03 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.18195.1689339240574953626
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 05:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SXlTJWSt;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-98e39784a85so654267466b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689339239; x=1691931239;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afHjzeQ9rqIijA0qhvN/2q39Tn9KbVgGRaj6dPzTIbo=;
        b=SXlTJWStYmOdL8JH7OPSJfme8nQi+RyjbjwlAwey8JUri4mIo9Q1RuVvpKax9HHEP9
         aJX8zWmf1TXYkEKDw2XKcn2MQMigYohwJbxFRUoAsiYQxnt9twpYQG2LC86V1yol6pt3
         erM563MkQsYeAzuU52wKK+saxrxeNc9oK9TqzvAg6Vg2jZ2QOhDqa1YUGj3U9kQD4AsK
         GWDDa7I6Dd2HR8n1IJC/gA3R5YQb3oyE/cCitecmzwKyKrvAFuEC1+K/xyMRJSZ28WlA
         mem9jbgeBTSczeM/43KIOjAmuLlBPZ/hmqR3qdAZ8c7+vHKyMbKbCX0heEL6dlQHFHue
         h3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689339239; x=1691931239;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=afHjzeQ9rqIijA0qhvN/2q39Tn9KbVgGRaj6dPzTIbo=;
        b=D/X/VOwLynzitncrCY56H0MaHlnS+Lrkl+WvCgXMzjpJtHnFPSDzZWcajeFRkITsbA
         A6cEKZFEiuBdokjQ5uKCJdq+8UPmHSRgnYbVLWVWBAoU0gN93XBUxmUFHT9VIfye0ORp
         On/LS/TuthCAElVrW7K5oDod3El3d/8eiIgI973XBNAvDQjgJSTF8Sh5QsJou/Zvz1j9
         bJHelnMbOudicgYrrr7kkU5SG7OOzkXKCSMT6AUr+Kl6moOaEAYFALt42j4dSso+Jtk6
         vhR9Sa72OF/Ko52hEu/I03o+oiR1Tv2LSFxqFZSWmRH8S5XxPAqOWOnpgJ6Qx2Vz5tbQ
         q+rA==
X-Gm-Message-State: ABy/qLa1WBvkpEw0o463Y8uCBeCOYral4gP41zimTDDtH422IP7pXOcG
	Oc5wtHNfysslktN0SOiIAlp/cEpjGMY=
X-Google-Smtp-Source: APBJJlHW6F3eP00So7SL0fVugZJqGZHgV0bFDWYnMBkoN0U690mymA9dvsBHEvKCdhRyqla8XSMzDA==
X-Received: by 2002:a17:906:3f13:b0:993:f276:9696 with SMTP id c19-20020a1709063f1300b00993f2769696mr3025691ejj.35.1689339238397;
        Fri, 14 Jul 2023 05:53:58 -0700 (PDT)
Received: from [192.168.2.51] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i22-20020a1709063c5600b009875a6d28b0sm5439824ejg.51.2023.07.14.05.53.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 05:53:58 -0700 (PDT)
Message-ID: <d8337e11-0727-a5cb-d3db-1cd6b5ad9190@gmail.com>
Date: Fri, 14 Jul 2023 14:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: rpmbuild doesn't work on the target system out of the box with
 standard macros in the specfile
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 12:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184259

Hi,

I have to create a Yocto based system with a lot of developer
tools and SDK including rpmbuild. This is because a third party
developer is comfortable with building stuff on hardware but
not with cross-compiling and creating Bitbake recipes.

Anyway, with the image created and installed, I tried to build
an RPM from an autotools based project on the target system
The specfile used the standard %configure macro.

./configure stopped with an error saying the compiler doesn't
produce working binaries.

It turned out that %optflags was not defined correctly and
in this case rpm --eval "%optflags" returns the passed-in
string as is.

The OS was built using MACHINE=genericx86-64 and
I had to make this change manually in rpmrc to make it work:

--------------------------------------------------------------------
# diff -u /usr/lib/rpm/rpmrc.old /usr/lib/rpm/rpmrc
--- /usr/lib/rpm/rpmrc.old    2023-05-18 12:28:44.000000000 +0000
+++ /usr/lib/rpm/rpmrc    2023-07-14 12:34:59.840691763 +0000
@@ -380,6 +380,8 @@
  buildarchtranslate: x86_64: x86_64
  buildarchtranslate: amd64: x86_64
  buildarchtranslate: ia32e: x86_64
+buildarchtranslate: genericx86_64: x86_64
+buildarchtranslate: core2_64: x86_64

  buildarchtranslate: sh3: sh3
  buildarchtranslate: sh4: sh4
--------------------------------------------------------------------

I think a lot of other BSPs would have the same issue.
For one, meta-intel defines BSPs that produce builds for newer
archs than genericx86-64. They probably wouldn't work either.

It would be nice if Yocto's rpm recipe added the possible
buildarchtranslate lines for BSP target archs automatically.

Best regards,
Zoltán Böszörményi


