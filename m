Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60862C98310
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 06:57:00 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2116.1790233010046431900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 23:56:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mshXMwVA;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso7505305e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 23:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790233008; x=1790837808; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1J5mzKy0a9Y5j7cEsANX2c213S1zGlUsiU5RiQO5LMI=;
        b=mshXMwVAmfQRJ9NvtrZmbdmaNnXhtjKC9zTYT75ed15UBQRf+Ntt3Svg2FbVYZsxaf
         5QIumJzsmow3K2c9WGQ/2y+J22hDEUvon/8we3iNjHHEeTx/yOMMRUY2gDZ/Rs4Ws2cI
         XputTC+MJjSNiZyJRdE9GndkLQJTeplGeqQ1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790233008; x=1790837808;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1J5mzKy0a9Y5j7cEsANX2c213S1zGlUsiU5RiQO5LMI=;
        b=CE4f3BJPWwPfvLcuTU996Tc3MdWHmPlRPrH5bmxRAR2Be+o82HpkjoRJJompDaoaql
         FuKb3KzSzPpcDp5cxrMrIUc1yN7KA5wxEn4DMbEgCyxaOxEQ2bFIVZl8njfvEgDMQ9rD
         vPVMWVHcHz4CFV7iPjl2w08Prar5epHNXhwNh9lyn4aOa+SPmRifffHJbqusHX10pJbR
         afJP5zMAojSQp8Q9tLTpEGHFts3sVO04pc+oUdIAeZMALHgzfkMb/6EAEVNoexIVShIV
         yhGXWa/z8gPuUa2gSCqvrfldcm188ix/30ulkBSKYm30FewPGICm0PDJq2bD6FxbLZgo
         axgA==
X-Gm-Message-State: AFuF++nHrGpCqmNWcyXNi6kUuGaKU5SEdF+qLhwXouUL3k/2CTt6StvW
	BtFrC3JLjrWati2IdpWJ8vyBajVNRiFDnq2/oJGTOtXe/ufiObaUSYHDug01Eo4P4xQ=
X-Gm-Gg: AYBFou1mXzgoBQYbUviuc+6ESbcKviCpCSCfPlgUkXaiTkYhrUwUSc/QJb6ZzRUDgQm
	0efrXS8iyn+2YBbTgb6vGjOP8iSGWUOh4kQo5kOFnOMMd4283MvIiVYBZXsRl6kyRon9nrNfc6v
	ODTuMbuSkhqZZ+4is+/PBZYnHGw9kSBAITWTmAj2vPakLIY6CLchB22uapbkGxZFbmMl1f9N4e1
	QezqeSRCKlDzn18L0ueOhCrtNexrmJ65oqMubkLdBHoUK9Igu9XsAZxrL9+Pz/GY9DT8yeqKjGs
	kifs8t8aQ4/qDmH9Zzqpnf3FRdlryrzWoTsHRJyw1VKpEswqrlOwz+j8WuDHwT0FfOoJdiEG04I
	ZNtNBvP0UQxWGpx2009PDDTIhUMc2MUqn7/h41Xp+uSiPvxANIml0BgxeWMRwYl90ivX1fDWQuL
	oK+Gdh2FYvFyBs+Pn4uxSgBlFsOyBxyYaX8h+Ykqf6pMrhcJx4numRcojFpBpHKqt850IQlK35y
	NdJeCE47B2HBOsJZzcd4mLoI31plQHlK1oWxBhhb2Yd4tZ1gamn7sxWEuA1pg==
X-Received: by 2002:a05:600c:3514:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49fe670657cmr20145715e9.30.1790233008320;
        Wed, 23 Sep 2026 23:56:48 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5debbf4sm52557585e9.9.2026.09.23.23.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:56:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 08:56:47 +0200
Message-Id: <DLNCMY1V0TZO.2D3LW1W29OQCT@smile.fr>
Subject: Re: [OE-core][scarthgap 46/48] curl: Security Fix for
 CVE-2026-18924
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Martin Jansa" <martin.jansa@gmail.com>, "Siddharth Doshi"
 <sdoshi@mvista.com>
X-Mailer: aerc 0.20.0
References: <cover.1790154074.git.yoann.congal@smile.fr>
 <8305fd4d8e6e4a7a4435989c57fedd470306f0e6.1790154074.git.yoann.congal@smile.fr> <CA+chaQdq4NaDUJN7Zuxnmdv6EH0=z2Ru6HEXqTqk3jR0ei0W9g@mail.gmail.com>
In-Reply-To: <CA+chaQdq4NaDUJN7Zuxnmdv6EH0=z2Ru6HEXqTqk3jR0ei0W9g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 06:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246571

On Wed Sep 23, 2026 at 5:22 PM CEST, Martin Jansa wrote:
> This breaks the build when nthttp2 PACKAGECONFIG is enabled, because
> curl_share.h included here was renamed from share.h in newer curl
> 8.22:
> https://github.com/curl/curl/commit/3887069c661b40e76b053a4867eb565d4761a=
b3e
> 8.7.1 version in scarthgap fails with:
> curl-8.7.1/lib/http2.c:50:10: fatal error: 'curl_share.h' file not found
>
> Using share.h instead of curl_share.h fixes the include, but then it fail=
s with
> curl-8.7.1/lib/http2.c:781:15: error: call to undeclared function
> 'Curl_share_easy_link'; ISO C99 and later do not support implicit
> function declarations [-Wimplicit-function-declaration]
>
> Curl_share_easy_link was added in 8.20 with:
> https://github.com/curl/curl/commit/82009c4220774417c821496affa4aa834c028=
b68
> and that will be a bit more difficult to backport.
>
> Please drop this one from the PR until it's resolved.
>
> Cheers,
>
> On Wed, Sep 23, 2026 at 11:12=E2=80=AFAM Yoann Congal via
> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
> wrote:
>>
>> From: Siddharth Doshi <sdoshi@mvista.com>
>>
>> Picking patch as per [1], and same patch is mentioned in [2]
>>
>> [1] https://curl.se/docs/CVE-2026-18924.html
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-18924
>>
>> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  .../curl/curl/CVE-2026-18924.patch            | 39 +++++++++++++++++++
>>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch
>>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/=
recipes-support/curl/curl/CVE-2026-18924.patch
>> new file mode 100644
>> index 00000000000..28934ababee
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
>> @@ -0,0 +1,39 @@
>> +From 90325ff0444cbdff368bda5d26d6405a0bb6ee43 Mon Sep 17 00:00:00 2001
>> +From: Daniel Stenberg <daniel@haxx.se>
>> +Date: Wed, 5 Aug 2026 10:02:53 +0200
>> +Subject: [PATCH] http2: make server push transfers inherit share from p=
arent
>> +
>> +Reported-by: Stephan Zeisberg
>> +Closes #22488
>> +
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/90325ff0=
444cbdff368bda5d26d6405a0bb6ee43]
>> +CVE: CVE-2026-18924
>> +Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>> +---
>> + lib/http2.c | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/lib/http2.c b/lib/http2.c
>> +index 99d7f3b..e6305c9 100644
>> +--- a/lib/http2.c
>> ++++ b/lib/http2.c
>> +@@ -47,6 +47,7 @@
>> + #include "transfer.h"
>> + #include "dynbuf.h"
>> + #include "headers.h"
>> ++#include "curl_share.h"
>> + /* The last 3 #include files should be in this order */
>> + #include "curl_printf.h"
>> + #include "curl_memory.h"

Ok, dropped. Nice catch.

Thanks!
--=20
Yoann Congal
Smile ECS


