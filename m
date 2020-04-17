Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.67.1587139354906788498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 09:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LmUemKlN;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id x26so1295608pgc.10
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 09:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=Ld13aG8SU81MGnNptcQm0LJDSLNqo52W0bpUZmMyEDc=;
        b=LmUemKlNNvwRx48eoYTCqTa5QSA1elk/QYCNKUtY6nN2+d/lo5oM7pJiVpwFjKyULQ
         o82RtUxj7rFRBKXqc0zPBROtyBS5+njC7o1oRyERalTTqyWqQaQkKFhGcYDFDLIBQXFX
         J2G2l4DSIWfVkiscXqiWbuHcSdac+MnfqMBmqJ3HIhRzDrYKht9IlBzrgw78P2Nc+8xP
         vBebXEcSY7c+jK8nnjpCxyVznZHU/jYUBmCDfquFfK+/i01q+4wnr97iYUk05d6RrmjI
         wREdbYZrOgXO6jXUsani7/fyXogpXFNCskWq1XDfUuyK4NQ7l+0qdlc8qx8NjFRnHIOZ
         mTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=Ld13aG8SU81MGnNptcQm0LJDSLNqo52W0bpUZmMyEDc=;
        b=ZV3+irhY6+t8qJicH/ZiHVUDQzfW/We+uQqZFNgZNeYLcL+w4j4jpC3K0c/UUCYjdv
         2oJupxXmHly1hRV64fUTIjJLCdneMh99hwKfb0pZGYTVLUSn61yl4hFcCSHhRpsZNAlE
         XpPzADKBPIk6int5ZdTDsJsPPGVXwZ6rhC0b0V8qtV4ayKd637eaKdcPdGJUdvOtPPp7
         IHSUzIJ7VanMJOBJ4G0mRoW+VtuL/VTBRqusdmWZSCUpF/YGa0lzdoDEiY0woJFtfXdR
         NVfAZ/JDduC6iRgvxcvrwOXoTHdSCqbYlwfUtPHXN/24QlwGAzjwgklHX3uMTGvIKk2j
         V6mw==
X-Gm-Message-State: AGi0PuZj0GGtXrGTgfHITHjxELEm6H1eSilzBALnEnFKErn4ZZTTbtZR
	ybZwdGhhvQjuveUOtFgeNxY54lDKcog=
X-Google-Smtp-Source: APiQypLqkDTdhJYBQrHAtIurDrklg/RAG+kR4iymgOoO4sdKMmHcRZD/4t8zgc9HLZOxbIOlDbu1Ew==
X-Received: by 2002:a62:fccf:: with SMTP id e198mr3682496pfh.119.1587139353699;
        Fri, 17 Apr 2020 09:02:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:356e:ada7:6577:9bd? ([2601:202:4180:a5c0:356e:ada7:6577:9bd])
        by smtp.gmail.com with ESMTPSA id g25sm19701805pfh.55.2020.04.17.09.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 09:02:32 -0700 (PDT)
Subject: Re: [OE-core] [PATCH RFC] kernel.bbclass: run checkpatch.pl for all patches
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
 openembedded-core@lists.openembedded.org
References: <20200417121103.27918-1-mikko.rapeli@bmw.de>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <1146552b-92dc-08f4-8335-366edc56a64b@gmail.com>
Date: Fri, 17 Apr 2020 09:02:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200417121103.27918-1-mikko.rapeli@bmw.de>
Content-Type: multipart/alternative;
 boundary="------------FC5CB536EA72E910194AB6DA"
Content-Language: en-US

--------------FC5CB536EA72E910194AB6DA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 4/17/20 5:11 AM, Mikko Rapeli wrote:
> RFC: currently unconditionally, but this may need to be changed because
> so many patches are not passing this check. Even upstream backports
> from Linus Torvalds are failing the check sometimes.
>
> This is test is important to keep all kernel patches in upstreamable state.
> It would help keeping BSP and project specific kernel recipes in better shape.
> It will not help if BSP git trees contain 1000's of non-upstreamed
> patches. Passing this script is mandatory for patches according to
> https://www.kernel.org/doc/html/latest/process/submit-checklist.html

I am not opposed to having more checks, I worry about the impact on build.

Maybe have this in a separate class so folks can opt-in or out depending
on final conclusion of this RFC.

- armin
>
> checkpatch.pl catches for example:
>
>  * missing Signed-off-by lines
>  * spaces vs. tabs indents, new line issues etc coding style issues
>  * some bugs like useless initialization of global variables
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta/classes/kernel.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a724645466..b0c0359d38 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -547,6 +547,15 @@ do_savedefconfig() {
>  do_savedefconfig[nostamp] = "1"
>  addtask savedefconfig after do_configure
>  
> +do_checkpatch() {
> +	bbplain "Running checkpatch.pl QA check for all kernel patches"
> +	if ls "${S}"/patches/*.patch > /dev/null; then
> +		"${S}/scripts/checkpatch.pl" "${S}"/patches/*.patch
> +	fi
> +}
> +do_checkpatch[nostamp] = "1"
> +addtask checkpatch after do_configure
> +
>  inherit cml1
>  
>  KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
>
> 


--------------FC5CB536EA72E910194AB6DA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/17/20 5:11 AM, Mikko Rapeli wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200417121103.27918-1-mikko.rapeli@bmw.de">
      <pre class="moz-quote-pre" wrap="">RFC: currently unconditionally, but this may need to be changed because
so many patches are not passing this check. Even upstream backports
from Linus Torvalds are failing the check sometimes.

This is test is important to keep all kernel patches in upstreamable state.
It would help keeping BSP and project specific kernel recipes in better shape.
It will not help if BSP git trees contain 1000's of non-upstreamed
patches. Passing this script is mandatory for patches according to
<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/latest/process/submit-checklist.html">https://www.kernel.org/doc/html/latest/process/submit-checklist.html</a></pre>
    </blockquote>
    <br>
    I am not opposed to having more checks, I worry about the impact on
    build.<br>
    <br>
    Maybe have this in a separate class so folks can opt-in or out
    depending on final conclusion of this RFC.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
      cite="mid:20200417121103.27918-1-mikko.rapeli@bmw.de">
      <pre class="moz-quote-pre" wrap="">

checkpatch.pl catches for example:

 * missing Signed-off-by lines
 * spaces vs. tabs indents, new line issues etc coding style issues
 * some bugs like useless initialization of global variables

Signed-off-by: Mikko Rapeli <a class="moz-txt-link-rfc2396E" href="mailto:mikko.rapeli@bmw.de">&lt;mikko.rapeli@bmw.de&gt;</a>
---
 meta/classes/kernel.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645466..b0c0359d38 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -547,6 +547,15 @@ do_savedefconfig() {
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
+do_checkpatch() {
+	bbplain "Running checkpatch.pl QA check for all kernel patches"
+	if ls "${S}"/patches/*.patch &gt; /dev/null; then
+		"${S}/scripts/checkpatch.pl" "${S}"/patches/*.patch
+	fi
+}
+do_checkpatch[nostamp] = "1"
+addtask checkpatch after do_configure
+
 inherit cml1
 
 KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------FC5CB536EA72E910194AB6DA--
