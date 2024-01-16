Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B795C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 04:47:52 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.4805.1705380464918632937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 20:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IEkELvaN;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d98ce84e18so8263869b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 20:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705380464; x=1705985264; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bp3scob5roMgLoDFuz+/xRhk4IJKq288XK57h6dDZsY=;
        b=IEkELvaNHq/Yult2Qjt2kuOXyauCU+p8gh3Mf6AXHkB38yr5DGgHiA8t0HgZodJLLj
         LerHrijscrp0QGXoO7hy3q6Zo0bAOx//p2/Jx2V6Q4lDJDm0xm8xLpf/oxyQbe5DjI/Y
         zrsfzgA4MYAOIBZYOW8IBuF/yzYdqkQJXVrPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705380464; x=1705985264;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bp3scob5roMgLoDFuz+/xRhk4IJKq288XK57h6dDZsY=;
        b=TZ6Jz49FGCmfIYGWVIK4a+IqYE1VgWD4ZReXi639uUAV3MVKp11JQiVx08LZRv9An7
         RuENJugyKdPTvT5o8jGuZsKUFMo9MoYLBfxljIr756WEFI3LBpIBZMDYLpg4P8390e3g
         FJrkiJTBg9i/qUV2NEAkxRu59Z1CKxzzxEpC5srQP9i9xT0c5yZfr2yo7RvjYPdz3mu3
         3f066tLGrUWgmGV8UFbEjdXoNyVYYF65yqad9TzALta83B5jOi2riVe4gIt/22aTRQ5R
         mxTaql6vfcH+qK+a51Hz/KaayRkzL7pnA8Mbdmsr/FKxQjQwJYvljWgbdrqL/RJWiTZh
         3A3w==
X-Gm-Message-State: AOJu0YyPeu/rMV0MegfaVxsCzY6/fOfxPtGGMQSb2K/nNcRBnXpj2iWx
	2WyAdad9yH05m2+C+Xph/7w+ILqvQI2dbNIpiOeuhnFh6c0=
X-Google-Smtp-Source: AGHT+IH90QHo+d0kGTqcJwPTsVCe36kXWCx7bNNiMvlSeymZ8k3mhZeWm9ZpN4WaoAACRPCDTw9QqQ==
X-Received: by 2002:a05:6a00:1994:b0:6d9:af4e:804 with SMTP id d20-20020a056a00199400b006d9af4e0804mr8108687pfl.35.1705380464114;
        Mon, 15 Jan 2024 20:47:44 -0800 (PST)
Received: from [192.168.1.102] ([27.121.101.81])
        by smtp.gmail.com with ESMTPSA id m6-20020a62f206000000b006dae568baedsm8355871pfh.24.2024.01.15.20.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 20:47:43 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------OaqXcj3osjg5bJtVjVHmO0Ry"
Message-ID: <c3558205-eeb4-4da2-9b1f-e3315751a1af@mvista.com>
Date: Tue, 16 Jan 2024 10:17:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [dunfell][PATCH] systemd: fix CVE-2023-7008
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240112041206.4901-1-hprajapati@mvista.com>
 <CAOSpxdZqKUJDURHM7i3Fmzr+tTsXhgBrGDpJ5qjv6wu13QP7Gw@mail.gmail.com>
Content-Language: en-US
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <CAOSpxdZqKUJDURHM7i3Fmzr+tTsXhgBrGDpJ5qjv6wu13QP7Gw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 04:47:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193818

This is a multi-part message in MIME format.
--------------OaqXcj3osjg5bJtVjVHmO0Ry
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steve,

Yes, it is for kirkstone branch.

Sorry for my mistake.

Regards,

Hitendra

On 14/01/24 7:41 am, Steve Sakoman wrote:
> On Thu, Jan 11, 2024 at 6:12 PM Hitendra Prajapati via
> lists.openembedded.org<hprajapati=mvista.com@lists.openembedded.org>
> wrote:
>> Upstream-Status: Backport fromhttps://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1
>>
>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> ---
>>   .../systemd/systemd/CVE-2023-7008.patch       | 40 +++++++++++++++++++
>>   meta/recipes-core/systemd/systemd_250.5.bb    |  1 +
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch b/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
>> new file mode 100644
>> index 0000000000..e2296abc49
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
>> @@ -0,0 +1,40 @@
>> +From 3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1 Mon Sep 17 00:00:00 2001
>> +From: Michal Sekletar<msekleta@redhat.com>
>> +Date: Wed, 20 Dec 2023 16:44:14 +0100
>> +Subject: [PATCH] resolved: actually check authenticated flag of SOA
>> + transaction
>> +
>> +Fixes #25676
>> +
>> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1]
>> +CVE: CVE-2023-7008
>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>> +---
>> + src/resolve/resolved-dns-transaction.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/resolve/resolved-dns-transaction.c b/src/resolve/resolved-dns-transaction.c
>> +index f937f9f7b5..7deb598400 100644
>> +--- a/src/resolve/resolved-dns-transaction.c
>> ++++ b/src/resolve/resolved-dns-transaction.c
>> +@@ -2761,7 +2761,7 @@ static int dns_transaction_requires_rrsig(DnsTransaction *t, DnsResourceRecord *
>> +                         if (r == 0)
>> +                                 continue;
>> +
>> +-                        return FLAGS_SET(t->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
>> ++                        return FLAGS_SET(dt->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
>> +                 }
>> +
>> +                 return true;
>> +@@ -2788,7 +2788,7 @@ static int dns_transaction_requires_rrsig(DnsTransaction *t, DnsResourceRecord *
>> +                         /* We found the transaction that was supposed to find the SOA RR for us. It was
>> +                          * successful, but found no RR for us. This means we are not at a zone cut. In this
>> +                          * case, we require authentication if the SOA lookup was authenticated too. */
>> +-                        return FLAGS_SET(t->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
>> ++                        return FLAGS_SET(dt->answer_query_flags, SD_RESOLVED_AUTHENTICATED);
>> +                 }
>> +
>> +                 return true;
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
>> index c35557471a..889473ee1f 100644
>> --- a/meta/recipes-core/systemd/systemd_250.5.bb
>> +++ b/meta/recipes-core/systemd/systemd_250.5.bb
> Did you mean this patch for kirkstone instead of dunfell?  Dunfell
> systemd is version 244.5, not 250.5
>
> Steve
>
>> @@ -32,6 +32,7 @@ SRC_URI +="file://touchscreen.rules \ file://CVE-2022-4415-2.patch \ 
>> file://0001-network-remove-only-managed-configs-on-reconfigure-o.patch 
>> \ 
>> file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch 
>> \ + file://CVE-2023-7008.patch \ "
>>
>>   # patches needed by musl
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#193569):https://lists.openembedded.org/g/openembedded-core/message/193569
>> Mute This Topic:https://lists.openembedded.org/mt/103677352/3620601
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [steve@sakoman.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
Mo: +91 9998906483
--------------OaqXcj3osjg5bJtVjVHmO0Ry
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Steve,</p>
    <p>Yes, it is for <span style="white-space: pre-wrap">kirkstone branch. </span></p>
    <p><span style="white-space: pre-wrap">Sorry for my mistake. </span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Hitendra 
</span></p>
    <div class="moz-cite-prefix">On 14/01/24 7:41 am, Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAOSpxdZqKUJDURHM7i3Fmzr+tTsXhgBrGDpJ5qjv6wu13QP7Gw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Jan 11, 2024 at 6:12 PM Hitendra Prajapati via
lists.openembedded.org <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati=mvista.com@lists.openembedded.org">&lt;hprajapati=mvista.com@lists.openembedded.org&gt;</a>
wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Upstream-Status: Backport from <a class="moz-txt-link-freetext" href="https://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1">https://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1</a>

Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
---
 .../systemd/systemd/CVE-2023-7008.patch       | 40 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2023-7008.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch b/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
new file mode 100644
index 0000000000..e2296abc49
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2023-7008.patch
@@ -0,0 +1,40 @@
+From 3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <a class="moz-txt-link-rfc2396E" href="mailto:msekleta@redhat.com">&lt;msekleta@redhat.com&gt;</a>
+Date: Wed, 20 Dec 2023 16:44:14 +0100
+Subject: [PATCH] resolved: actually check authenticated flag of SOA
+ transaction
+
+Fixes #25676
+
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1">https://github.com/systemd/systemd/commit/3b4cc1437b51fcc0b08da8cc3f5d1175eed25eb1</a>]
+CVE: CVE-2023-7008
+Signed-off-by: Hitendra Prajapati <a class="moz-txt-link-rfc2396E" href="mailto:hprajapati@mvista.com">&lt;hprajapati@mvista.com&gt;</a>
+---
+ src/resolve/resolved-dns-transaction.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/resolve/resolved-dns-transaction.c b/src/resolve/resolved-dns-transaction.c
+index f937f9f7b5..7deb598400 100644
+--- a/src/resolve/resolved-dns-transaction.c
++++ b/src/resolve/resolved-dns-transaction.c
+@@ -2761,7 +2761,7 @@ static int dns_transaction_requires_rrsig(DnsTransaction *t, DnsResourceRecord *
+                         if (r == 0)
+                                 continue;
+
+-                        return FLAGS_SET(t-&gt;answer_query_flags, SD_RESOLVED_AUTHENTICATED);
++                        return FLAGS_SET(dt-&gt;answer_query_flags, SD_RESOLVED_AUTHENTICATED);
+                 }
+
+                 return true;
+@@ -2788,7 +2788,7 @@ static int dns_transaction_requires_rrsig(DnsTransaction *t, DnsResourceRecord *
+                         /* We found the transaction that was supposed to find the SOA RR for us. It was
+                          * successful, but found no RR for us. This means we are not at a zone cut. In this
+                          * case, we require authentication if the SOA lookup was authenticated too. */
+-                        return FLAGS_SET(t-&gt;answer_query_flags, SD_RESOLVED_AUTHENTICATED);
++                        return FLAGS_SET(dt-&gt;answer_query_flags, SD_RESOLVED_AUTHENTICATED);
+                 }
+
+                 return true;
+--
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index c35557471a..889473ee1f 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Did you mean this patch for kirkstone instead of dunfell?  Dunfell
systemd is version 244.5, not 250.5

Steve

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">@@ -32,6 +32,7 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://touchscreen.rules\file://CVE-2022-4415-2.patch\file://0001-network-remove-only-managed-configs-on-reconfigure-o.patch\file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch\+file://CVE-2023-7008.patch\">"file://touchscreen.rules \
            file://CVE-2022-4415-2.patch \
            file://0001-network-remove-only-managed-configs-on-reconfigure-o.patch \
            file://0001-nspawn-make-sure-host-root-can-write-to-the-uidmappe.patch \
+           file://CVE-2023-7008.patch \
            "</a>

 # patches needed by musl
--
2.25.1


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#193569): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/193569">https://lists.openembedded.org/g/openembedded-core/message/193569</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/103677352/3620601">https://lists.openembedded.org/mt/103677352/3620601</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:steve@sakoman.com">steve@sakoman.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000FF">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
        Mo: +91 9998906483 <br>
      </font></div>
  </body>
</html>

--------------OaqXcj3osjg5bJtVjVHmO0Ry--

