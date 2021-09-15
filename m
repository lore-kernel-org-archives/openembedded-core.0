Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web08.564.1631731535537650758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 11:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nrrnczFU;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso4896434ots.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 11:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=Pp7VlA6AqwX3ZAK3A+jpCVtBpnA5kC0+UezxJ8Nfo1s=;
        b=nrrnczFUOEst2XjUc1sAaxJwTgxsZhJOdmR8ZXuTH3M9Sv/qC5Kf1QzGLa9XvVpDJC
         lqkIjjuFEbQ5srsNvaDW8GOL/cAGnYvWEkJOaRKjT8lQKcCAXBvzVkg6lriTSp45Cnbr
         nFnytRDCbc638oSbSNKpEHsHJiKQEFSm8sX9Ugg+CBDiKPM/iGx8LAvnsbv105IGO6wf
         jUaHegD8ZKcXQ9ghLfpYO6A3UfpFUfxIWf4ejmHCyEM85av+7t2Goz81nboPpCVedtER
         rsXvFaJnvk1NxKxoWI0QvMEpcQRxwwHIETDZKZ+sdv37kAezNejD9EwTpKETVe6N+kK6
         zWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=Pp7VlA6AqwX3ZAK3A+jpCVtBpnA5kC0+UezxJ8Nfo1s=;
        b=toSIncWF4Yg8SF4R7SgqJu/kl2ptIoE0AWn+C934xKqDFOmeFQAhn0Yj2xjSuNnEdz
         YBz6ZjqKmdPppumANoWb2pbmDKTEeQC7l+wcJjx/ruwhogzY5bP9OACPkMHPwiB4/JB9
         zi7PoJ66aS6PQEdREwQ3gSIjYis9qnjrFb4jXIhzQkYSLcePHfIb69BYBfgroAQ0b2kK
         QT7pWs91ZE4PNq/5KmIRW9OhfExAONpSe06Wa3IKDSsMXZSMsxooNDUY8qel5gZkcZI2
         UKBltRHcosj0RBxm3DkweD9hkS6HlEAnPv+09djXwh/vWxpgwGlVEDkzWkx0XXVjhwXt
         rqcg==
X-Gm-Message-State: AOAM531eKTqadlznY+stpA0IftqADEwYjs+LP52wAwk9c4M8AuMqlmbz
	BFKyB0+SRwNTxvjV/6vAkID3XEIh/8Q=
X-Google-Smtp-Source: ABdhPJwSlJO892pAusJDZH0xqWTIPclYKSl9BvHtbwwvVbVv2EFNGf3kPCsfZ0ZctjHh2442ZHbR/Q==
X-Received: by 2002:a05:6830:2487:: with SMTP id u7mr1270505ots.253.1631731534563;
        Wed, 15 Sep 2021 11:45:34 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id e14sm192229otl.38.2021.09.15.11.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 11:45:34 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] create-spdx.bbclass: Search all license directories for licenses
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 openembedded-core@lists.openembedded.org
References: <20210914181115.28873-1-pkj@axis.com>
Message-ID: <1505261d-a1dc-3e1d-064e-f58102238379@gmail.com>
Date: Wed, 15 Sep 2021 13:45:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914181115.28873-1-pkj@axis.com>
Content-Type: multipart/alternative;
 boundary="------------765D1021D4351E1A20E665E1"
Content-Language: en-US

--------------765D1021D4351E1A20E665E1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/21 1:11 PM, Peter Kjellerstedt wrote:
> Before, even if the code was seemingly written to search through all
> licenses in ${COMMON_LICENSE_DIR} and ${LICENSE_PATH}, it would
> actually bail out after only searching ${COMMON_LICENSE_DIR} due to
> the exception handling.
>
> Also refrain from using f-strings.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   meta/classes/create-spdx.bbclass | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> index db85677d4c..3c73c21c04 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -67,6 +67,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
>           extracted_info = oe.spdx.SPDXExtractedLicensingInfo()
>           extracted_info.name = name
>           extracted_info.licenseId = ident
> +        extracted_info.extractedText = None
>   
>           if name == "PD":
>               # Special-case this.
> @@ -78,10 +79,12 @@ def convert_license_to_spdx(lic, document, d, existing={}):
>                       with (Path(directory) / name).open(errors="replace") as f:
>                           extracted_info.extractedText = f.read()
>                           break
> -                except Exception as e:
> -                    # Error out, as the license was in available_licenses so
> -                    # should be on disk somewhere.
> -                    bb.error(f"Cannot find text for license {name}: {e}")
> +                except FileNotFoundError:
> +                    pass
> +            if extracted_info.extractedText is None:
> +                # Error out, as the license was in available_licenses so should
> +                # be on disk somewhere.
> +                bb.error("Cannot find text for license %s" % name)
>           else:
>               # If it's not SPDX, or PD, or in available licenses, then NO_GENERIC_LICENSE must be set
>               filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
> @@ -90,7 +93,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
>                   with open(filename, errors="replace") as f:
>                       extracted_info.extractedText = f.read()
>               else:
> -                bb.error(f"Cannot find any text for license {name}")
> +                bb.error("Cannot find any text for license %s" % name)
>   
>           extracted[name] = extracted_info
>           document.hasExtractedLicensingInfos.append(extracted_info)

LGTM

Reviewed-By: Joshua Watt <JPEWhacker@gmail.com>

>
> 
>

--------------765D1021D4351E1A20E665E1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 9/14/21 1:11 PM, Peter Kjellerstedt
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210914181115.28873-1-pkj@axis.com">
      <pre class="moz-quote-pre" wrap="">Before, even if the code was seemingly written to search through all
licenses in ${COMMON_LICENSE_DIR} and ${LICENSE_PATH}, it would
actually bail out after only searching ${COMMON_LICENSE_DIR} due to
the exception handling.

Also refrain from using f-strings.

Signed-off-by: Peter Kjellerstedt <a class="moz-txt-link-rfc2396E" href="mailto:peter.kjellerstedt@axis.com">&lt;peter.kjellerstedt@axis.com&gt;</a>
---
 meta/classes/create-spdx.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index db85677d4c..3c73c21c04 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -67,6 +67,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
         extracted_info = oe.spdx.SPDXExtractedLicensingInfo()
         extracted_info.name = name
         extracted_info.licenseId = ident
+        extracted_info.extractedText = None
 
         if name == "PD":
             # Special-case this.
@@ -78,10 +79,12 @@ def convert_license_to_spdx(lic, document, d, existing={}):
                     with (Path(directory) / name).open(errors="replace") as f:
                         extracted_info.extractedText = f.read()
                         break
-                except Exception as e:
-                    # Error out, as the license was in available_licenses so
-                    # should be on disk somewhere.
-                    bb.error(f"Cannot find text for license {name}: {e}")
+                except FileNotFoundError:
+                    pass
+            if extracted_info.extractedText is None:
+                # Error out, as the license was in available_licenses so should
+                # be on disk somewhere.
+                bb.error("Cannot find text for license %s" % name)
         else:
             # If it's not SPDX, or PD, or in available licenses, then NO_GENERIC_LICENSE must be set
             filename = d.getVarFlag('NO_GENERIC_LICENSE', name)
@@ -90,7 +93,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
                 with open(filename, errors="replace") as f:
                     extracted_info.extractedText = f.read()
             else:
-                bb.error(f"Cannot find any text for license {name}")
+                bb.error("Cannot find any text for license %s" % name)
 
         extracted[name] = extracted_info
         document.hasExtractedLicensingInfos.append(extracted_info)</pre>
    </blockquote>
    <p>LGTM</p>
    <p>Reviewed-By: Joshua Watt <a class="moz-txt-link-rfc2396E" href="mailto:JPEWhacker@gmail.com">&lt;JPEWhacker@gmail.com&gt;</a></p>
    <blockquote type="cite"
      cite="mid:20210914181115.28873-1-pkj@axis.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------765D1021D4351E1A20E665E1--
