Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE79EC77B71
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 04:22:41 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.801.1681791758459327451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 21:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KOzMI3YB;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b51fd2972so1412010b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 21:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681791758; x=1684383758;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie8Mwk4norPq1gZBZkngkL/nR4ukHMCrQ/MIeWl9P4g=;
        b=KOzMI3YBYHxT+A20NE5Gtf0g1w4wDg3PLN/6y+4fd5+srgxjwH3ZzFuSQ4GJPQ7jHy
         kn5V0oICqzqz2beo9TzMDpXZyaa3iphkp92MToxkCrN1TnDQimdlRhxPixC3Q3LQAyw6
         l4cTvSoJYZW7zTWkHL0VPUwWYQoma+936ed70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681791758; x=1684383758;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ie8Mwk4norPq1gZBZkngkL/nR4ukHMCrQ/MIeWl9P4g=;
        b=JyWyAapJUiPknARS6xjHgWXYGcN4auoxPGVltUoY2SCdabnxraQstQgL5IhVQnKqhN
         krWAfJfJbUOiW78b1H8L7b4e/jepix1P9XSWkmR3864xf5FG8D2ECFVB//FMp7XE78+/
         KNyNHrgy5Lj1guc7HHw/pB+hTHw/eS28wOrucHKfYDmR69MLj5SwbobrgB8StPI8uU5H
         7yVe3ZK3N0QrVa9tYjRyI6n7DA2TU1oxke1AjaGd4QmBW3GstOq4vUn88NiySgDRzlR8
         oQmSIzA1e8t6GAKh1qeUYnt5qRX2e3i4WyYNK7sSReIIvrphvK9GaceQvhIaJ3c0swY4
         3Agw==
X-Gm-Message-State: AAQBX9c6xQIRwPKrgisJeGhGDAVRJyFt1QmuyYYjTg6Y2QFJ6By8/xlN
	n/gpXm9DbP+jz7hmSHqY9ooAmg==
X-Google-Smtp-Source: AKy350Z5F+n0nei5zfB8zknzmmSPxqaJ03ZMhuPCRKNZj43c00oNxdWGg+Yn1jlaFt54Ex1J8i1KRA==
X-Received: by 2002:a17:902:dac1:b0:1a6:4127:857 with SMTP id q1-20020a170902dac100b001a641270857mr1124987plx.5.1681791757380;
        Mon, 17 Apr 2023 21:22:37 -0700 (PDT)
Received: from [192.168.1.102] ([150.129.170.130])
        by smtp.gmail.com with ESMTPSA id g22-20020a1709029f9600b0019c91989a1csm8485948plq.300.2023.04.17.21.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 21:22:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Dj7nHnBLlwsc6M57jpqqCzZQ"
Message-ID: <b01b0157-98ec-e84f-8395-d5d6fb05d0ea@mvista.com>
Date: Tue, 18 Apr 2023 09:52:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [kirkstone][PATCH] curl: CVE-2023-27538 fix SSH
 connection too eager reuse
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230417080512.169770-1-hprajapati@mvista.com>
 <CAOSpxdYO7-MnXgOCrWqT0OF54=sWGyUbmN-yyNOHHy8b7mF-1g@mail.gmail.com>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <CAOSpxdYO7-MnXgOCrWqT0OF54=sWGyUbmN-yyNOHHy8b7mF-1g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 04:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180175

This is a multi-part message in MIME format.
--------------Dj7nHnBLlwsc6M57jpqqCzZQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steve,

It is fine with combined patch as it contains fix for CVE-2023-27538.

Thank you & Regards,

Hitendra

On 17/04/23 22:11, Steve Sakoman wrote:
> There is also a patch submitted today that fixes this CVE as well as
> two others:https://lists.openembedded.org/g/openembedded-core/message/180143
>
> Could you review the above patch and ack if you approve.  It would be
> nice to fix all three patches in a single commit if possible.
>
> Thanks!
>
> Steve
>
> On Sun, Apr 16, 2023 at 10:05 PM Hitendra Prajapati
> <hprajapati@mvista.com>  wrote:
>> Upstream-Status: Backport fromhttps://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb
>>
>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> ---
>>   .../curl/curl/CVE-2023-27538.patch            | 31 +++++++++++++++++++
>>   meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
>>   2 files changed, 32 insertions(+)
>>   create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch
>>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
>> new file mode 100644
>> index 0000000000..8ef81fb306
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
>> @@ -0,0 +1,31 @@
>> +From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 2001
>> +From: Daniel Stenberg<daniel@haxx.se>
>> +Date: Fri, 10 Mar 2023 08:22:51 +0100
>> +Subject: [PATCH] url: fix the SSH connection reuse check
>> +
>> +Reported-by: Harry Sintonen
>> +Closes #10735
>> +
>> +CVE: CVE-2023-27538
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb]
>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> +---
>> + lib/url.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/lib/url.c b/lib/url.c
>> +index f5e54c7..7dd342a 100644
>> +--- a/lib/url.c
>> ++++ b/lib/url.c
>> +@@ -1353,7 +1353,7 @@ ConnectionExists(struct Curl_easy *data,
>> +          (data->state.httpwant < CURL_HTTP_VERSION_2_0))
>> +         continue;
>> +
>> +-      if(get_protocol_family(needle->handler) == PROTO_FAMILY_SSH) {
>> ++      if(get_protocol_family(needle->handler) & PROTO_FAMILY_SSH) {
>> +         if(!ssh_config_matches(needle, check))
>> +           continue;
>> +       }
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
>> index 4c18afe293..b0a456016d 100644
>> --- a/meta/recipes-support/curl/curl_7.82.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
>> @@ -42,6 +42,7 @@ SRC_URI ="https://curl.se/download/${BP}.tar.xz \ file://CVE-2023-23916.patch 
>> \ file://CVE-2023-27533.patch \ file://CVE-2023-27534.patch \ + 
>> file://CVE-2023-27538.patch \ "
>>   SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
>>
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#180151):https://lists.openembedded.org/g/openembedded-core/message/180151
>> Mute This Topic:https://lists.openembedded.org/mt/98314707/3620601
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [steve@sakoman.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
--------------Dj7nHnBLlwsc6M57jpqqCzZQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Steve,</p>
    <p>It is fine with combined patch as it contains fix for
      CVE-2023-27538.</p>
    <p>Thank you &amp; Regards,</p>
    <p>Hitendra <br>
    </p>
    <div class="moz-cite-prefix">On 17/04/23 22:11, Steve Sakoman wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOSpxdYO7-MnXgOCrWqT0OF54=sWGyUbmN-yyNOHHy8b7mF-1g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">There is also a patch submitted today that fixes this CVE as well as
two others: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/180143">https://lists.openembedded.org/g/openembedded-core/message/180143</a>

Could you review the above patch and ack if you approve.  It would be
nice to fix all three patches in a single commit if possible.

Thanks!

Steve

On Sun, Apr 16, 2023 at 10:05 PM Hitendra Prajapati
<a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Upstream-Status: Backport from <a class="moz-txt-link-freetext" href="https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb">https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb</a>

Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
---
 .../curl/curl/CVE-2023-27538.patch            | 31 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27538.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27538.patch b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
new file mode 100644
index 0000000000..8ef81fb306
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27538.patch
@@ -0,0 +1,31 @@
+From af369db4d3833272b8ed443f7fcc2e757a0872eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <a class="moz-txt-link-rfc2396E" href="mailto:daniel@haxx.se">&lt;daniel@haxx.se&gt;</a>
+Date: Fri, 10 Mar 2023 08:22:51 +0100
+Subject: [PATCH] url: fix the SSH connection reuse check
+
+Reported-by: Harry Sintonen
+Closes #10735
+
+CVE: CVE-2023-27538
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb">https://github.com/curl/curl/commit/af369db4d3833272b8ed443f7fcc2e757a0872eb</a>]
+Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ lib/url.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index f5e54c7..7dd342a 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1353,7 +1353,7 @@ ConnectionExists(struct Curl_easy *data,
+          (data-&gt;state.httpwant &lt; CURL_HTTP_VERSION_2_0))
+         continue;
+
+-      if(get_protocol_family(needle-&gt;handler) == PROTO_FAMILY_SSH) {
++      if(get_protocol_family(needle-&gt;handler) &amp; PROTO_FAMILY_SSH) {
+         if(!ssh_config_matches(needle, check))
+           continue;
+       }
+--
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 4c18afe293..b0a456016d 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -42,6 +42,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://curl.se/download/${BP}.tar.xz\file://CVE-2023-23916.patch\file://CVE-2023-27533.patch\file://CVE-2023-27534.patch\+file://CVE-2023-27538.patch\">"https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-23916.patch \
            file://CVE-2023-27533.patch \
            file://CVE-2023-27534.patch \
+           file://CVE-2023-27538.patch \
            "</a>
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"

--
2.25.1


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#180151): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/180151">https://lists.openembedded.org/g/openembedded-core/message/180151</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/98314707/3620601">https://lists.openembedded.org/mt/98314707/3620601</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:steve@sakoman.com">steve@sakoman.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000ff">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
      </font></div>
  </body>
</html>

--------------Dj7nHnBLlwsc6M57jpqqCzZQ--

