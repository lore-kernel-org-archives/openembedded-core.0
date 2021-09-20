Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web08.11705.1632144879505466795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 06:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lvXOwmjs;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id j11-20020a9d190b000000b00546fac94456so7117718ota.6
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 06:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=gHTkUkW/OsbbzwVCAFNZqCSg0w2MT7GikPkdjltywvo=;
        b=lvXOwmjsRxDX2bhmVzZmBjkkYWEl0CFYxnEVhrsQhVcxKpu58XjW0P8bI1wycQWFAF
         5BWsW60AkLpJuzU+xuXq8UGJivVBgG2E6lUc3LXNY1BMAlaJ66XBXV4/Rxlczhn+Pq4n
         iIN+uO5g/jjSqKlUxhYflczosfRx30NyXenl8MWU8Hu8dmOYSTjOfv5YcN6jWcNx01yN
         ZWBOUr3DxOygrdZS7NhDy+v7pCY6AVouGV1/4CwGIOEYyCZKO+RMNKYTBpTbsyaGojNp
         nEY6tArANmYUcPtMs28P7t1DX247wyscFJaM7Kn8AKdOZkGNmPj1bzg9ujM4DfuPtNwK
         O6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=gHTkUkW/OsbbzwVCAFNZqCSg0w2MT7GikPkdjltywvo=;
        b=yw/SrHniIFNDtqggcqK1bTdL9eMAoXhK8og+R5Hkyowz9feTIwknVxAgqKm69PJaBZ
         NFu4F+504ZBGW81bZ26QVPYC+wrNJVxOSqISm1qoWEO6Il6k/4IfrZhCOw3d9fVOsA8e
         cG400sceQak8XEFzNrJwNI0cbIDjPloG07q2dU9wE6i8/8769neacuse62l2X/muUWKv
         MJ+ddKn7bZ8I0hrSU4sG2XWaqVnSk17KwWgS4SbFlRqnT/JmYFpF46yDUxw077PGx+9g
         DuUbD3NHcpiqqOpCDU2jCGRHEIXaUMS79Tm8wd7ga5EzeUfXDPUOlLX6FkIHzFoTV09c
         IrDA==
X-Gm-Message-State: AOAM532U4agX0IT5ka1y+8NP2FWiQlHWuzSwZzrbfFduwdsxpq4NGu1z
	eOVF+VWRoKe6h7Odxj5P0V8cXa6kwOo=
X-Google-Smtp-Source: ABdhPJy4uO0aIQKnweISFA3jmEFI+KXfymGSmVpqNKuRRHK2Jn3/HrYF74u/+vwnQs40vDQc17LKkA==
X-Received: by 2002:a05:6830:40ca:: with SMTP id h10mr2517914otu.187.1632144878604;
        Mon, 20 Sep 2021 06:34:38 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id 21sm3268435oij.39.2021.09.20.06.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 06:34:38 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to install without explict dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <16A68880435BB472.28512@lists.openembedded.org>
 <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
Message-ID: <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
Date: Mon, 20 Sep 2021 08:34:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------6133B509BFDB2D9349E6E3A0"
Content-Language: en-US

--------------6133B509BFDB2D9349E6E3A0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/20/21 7:48 AM, Richard Purdie wrote:
> On Mon, 2021-09-20 at 13:46 +0100, Richard Purdie via lists.openembedded.org
> wrote:
>> There are several dependencies which recipes have which are not needed
>> at runtime, only at build time. Extend the list of these from bison to
>> include quilt, patch, meson, autoconf, automake and ninja which should
>> reduce the amount of data being included in native sysroots.
>>
>> This speeds up and reduces the sstate needed for image builds for example.
>>
>> If this change breaks recipes, it probably means they're missing an explicit
>> DEPENDS on something in this list which is a bug in the recipe.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/conf/layer.conf | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index 307ad7e2237..b3cc8a249e9 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -48,6 +48,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>>   "
>>   
>>   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>> +  *->patch-native \
>>     *->quilt-native \
>>     *->subversion-native \
>>     *->git-native \
>> @@ -90,7 +91,16 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>>   # (e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
>>   # dependency incidentally. This improves determinism and avoids build
>>   # failures when people switch to external toolchains.
>> -SSTATE_EXCLUDEDEPS_SYSROOT += ".*->bison-native"
>> +SSTATE_EXCLUDEDEPS_SYSROOT += "\
>> +    .*->autoconf-native \
>> +    .*->automake-native \
>> +    .*->bison-native \
>> +    .*->meson-native \
>> +    .*->ninja-native \
>> +    .*->patch-native \
>> +    .*->pkgconfig-native \
>> +    .*->quilt-native \
>> +"
> I've marked this one as an RFC since it caused a fair bit of pain even in OE-
> core due to recipes having pkgconfig class inherits missing.
>
> We do really want to do this and correctly mark up the recipe dependencies, the
> question is whether it is too late for 3.4 or not. We could go for a smaller
> list for now too but I wanted to hear opinions.


It looks like a great change! I'd say it's too late for 3.4 and we 
should do it for 3.5 instead.

>
> Cheers,
>
> Richard
>
>
> 
>

--------------6133B509BFDB2D9349E6E3A0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/20/21 7:48 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Mon, 2021-09-20 at 13:46 +0100, Richard Purdie via lists.openembedded.org
wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">There are several dependencies which recipes have which are not needed
at runtime, only at build time. Extend the list of these from bison to
include quilt, patch, meson, autoconf, automake and ninja which should
reduce the amount of data being included in native sysroots.

This speeds up and reduces the sstate needed for image builds for example.

If this change breaks recipes, it probably means they're missing an explicit
DEPENDS on something in this list which is a bug in the recipe.

Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 meta/conf/layer.conf | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 307ad7e2237..b3cc8a249e9 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -48,6 +48,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  *-&gt;patch-native \
   *-&gt;quilt-native \
   *-&gt;subversion-native \
   *-&gt;git-native \
@@ -90,7 +91,16 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 # (e.g. X -&gt; Y -&gt; binutils-cross -&gt; bison-native) no longer meet the
 # dependency incidentally. This improves determinism and avoids build
 # failures when people switch to external toolchains.
-SSTATE_EXCLUDEDEPS_SYSROOT += ".*-&gt;bison-native"
+SSTATE_EXCLUDEDEPS_SYSROOT += "\
+    .*-&gt;autoconf-native \
+    .*-&gt;automake-native \
+    .*-&gt;bison-native \
+    .*-&gt;meson-native \
+    .*-&gt;ninja-native \
+    .*-&gt;patch-native \
+    .*-&gt;pkgconfig-native \
+    .*-&gt;quilt-native \
+"
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I've marked this one as an RFC since it caused a fair bit of pain even in OE-
core due to recipes having pkgconfig class inherits missing.

We do really want to do this and correctly mark up the recipe dependencies, the
question is whether it is too late for 3.4 or not. We could go for a smaller
list for now too but I wanted to hear opinions.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>It looks like a great change! I'd say it's too late for 3.4 and
      we should do it for 3.5 instead.<br>
    </p>
    <blockquote type="cite"
cite="mid:e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------6133B509BFDB2D9349E6E3A0--
