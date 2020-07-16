Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.20002.1594918963660488545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 10:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rsa8cJwx;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id t11so3948820pfq.11
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=gBiQXGxk2jzUMcEIB9Uh+40KvCpDPhaa5q+2Pipstbo=;
        b=rsa8cJwx8ZJ//ghDZyIjXUAvSISRNqrl/1jTm1AAnJlFkPCZfTlltmhbU16dF5NzvJ
         XUqcEsBagQ3KG00m3hGAxqnULQa9EHCLq+XbbcD+ONFjxHDBn0gyw/hnpb7mya3aYp8u
         7mmc2ev35LbmlKHKI7P0CSYatGAuL9JNtIhD8PTDmK9LzsIwiwfKgbJbW8wqSxC5IMrm
         TjP2+NWfTdsf1CgO6yIvAqSTtQTqjtHtTxwNJ47BOmbjKfWI0fZDi5fAR1nkLcw0EJ5+
         6VfJmgu64uGnZumRC1D/71w9bIEIMhenuzhbKfdzliRT0tGyvyxgDhsodnJPwRkgIuPj
         CIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=gBiQXGxk2jzUMcEIB9Uh+40KvCpDPhaa5q+2Pipstbo=;
        b=ZH98rIkQDfd3ErtMtI2KGwyMh1zl8BJ2aZI+OOY0MRHQKlDC8EKD+KNh3gzFDWNZE/
         yG5YfDcaJ2pntKSnKXZXjQSq1cBnxCVeMM7vby4/VPDd9/+TgGLwqTacxWRz+7KiWncd
         0+fu/UEhKlqsgkidwI8lVcs3otWcY07vZZp0vpCfRt0mHhMd4G7BQwFpleA7/ruNnOw2
         yT7w00rxhMEDBQ5WdjIrhYSXf/nn1Lq239u7+X8gTbhEGLLEapFHDlVOkzu/SckqJR6J
         vvwALZIEB/rWHY8P0ILWG8p9P3W81quwRY3ORIY1SdVUx9LwuSA//31j9oLpvZCcrxD9
         GqSg==
X-Gm-Message-State: AOAM531goLo0EeCjyrLC7uCsAx8vyhXJMsEQGE/HGoAZUdLjoWwdX1lt
	3y90gNbnwFwfCoKNeHUB9jIjSCX0UTI=
X-Google-Smtp-Source: ABdhPJxhQFEH/wmP7KvkcHn3Rz1qaJIVNJs7un95bQljpnbJ/XxPlvhePBSoTZEW9d1gicuvoWouaA==
X-Received: by 2002:a63:d446:: with SMTP id i6mr4842427pgj.438.1594918962724;
        Thu, 16 Jul 2020 10:02:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7df4:7f73:717d:af68? ([2601:202:4180:a5c0:7df4:7f73:717d:af68])
        by smtp.gmail.com with ESMTPSA id b22sm564583pju.26.2020.07.16.10.02.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 10:02:42 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: always save cve report
To: openembedded-core@lists.openembedded.org
References: <16212259C6FDF098.6073@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <4b4917d1-6496-2ffe-cce8-9ea519716de7@gmail.com>
Date: Thu, 16 Jul 2020 10:02:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <16212259C6FDF098.6073@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------C3EF4A9804121D4499DEC47C"
Content-Language: en-US

--------------C3EF4A9804121D4499DEC47C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 7/12/20 3:38 PM, akuster via lists.openembedded.org wrote:
> The cve-check file should be saved always, it has good info.
>
> Put a copy in the log dir as cve-summary with symlinks to latest run.
>
> [Yocto #13974]

ping.  Any issues with this? Did I miss a response to this?

-armin
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/cve-check.bbclass | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 514897e8b8..0889e7544a 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -30,6 +30,9 @@ CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
>  
>  CVE_CHECK_LOG ?= "${T}/cve.log"
>  CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
> +CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
> +CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
> +CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
>  
>  CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
>  CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
> @@ -46,6 +49,32 @@ CVE_CHECK_PN_WHITELIST ?= ""
>  # 
>  CVE_CHECK_WHITELIST ?= ""
>  
> +python cve_save_summary_handler () {
> +    import shutil
> +    import datetime
> +
> +    cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
> +
> +    cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
> +    cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
> +    bb.utils.mkdirhier(cvelogpath)
> +
> +    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
> +    cve_summary_file = os.path.join(cvelogpath, "%s-%s.txt" % (cve_summary_name, timestamp))
> +
> +    shutil.copyfile(cve_tmp_file, cve_summary_file)
> +
> +    if cve_summary_file and os.path.exists(cve_summary_file):
> +        cvefile_link = os.path.join(cvelogpath, cve_summary_name)
> +
> +        if os.path.exists(os.path.realpath(cvefile_link)):
> +            os.remove(cvefile_link)
> +        os.symlink(os.path.basename(cve_summary_file), cvefile_link)
> +}
> +
> +addhandler cve_save_summary_handler
> +cve_save_summary_handler[eventmask] = "bb.event.BuildCompleted"
> +
>  python do_cve_check () {
>      """
>      Check recipe for patched and unpatched CVEs
> @@ -331,5 +360,8 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
>              f.write(write_string)
>  
>      if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
> +        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
> +        bb.utils.mkdirhier(cvelogpath)
> +
>          with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
>              f.write("%s" % write_string)
>
> 


--------------C3EF4A9804121D4499DEC47C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/12/20 3:38 PM, akuster via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16212259C6FDF098.6073@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">The cve-check file should be saved always, it has good info.

Put a copy in the log dir as cve-summary with symlinks to latest run.

[Yocto #13974]</pre>
    </blockquote>
    <br>
    ping.  Any issues with this? Did I miss a response to this?<br>
    <br>
    -armin<br>
    <blockquote type="cite"
      cite="mid:16212259C6FDF098.6073@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
---
 meta/classes/cve-check.bbclass | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 514897e8b8..0889e7544a 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -30,6 +30,9 @@ CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.1.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
+CVE_CHECK_SUMMARY_DIR ?= "${LOG_DIR}/cve"
+CVE_CHECK_SUMMARY_FILE_NAME ?= "cve-summary"
+CVE_CHECK_SUMMARY_FILE ?= "${CVE_CHECK_SUMMARY_DIR}/${CVE_CHECK_SUMMARY_FILE_NAME}"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
@@ -46,6 +49,32 @@ CVE_CHECK_PN_WHITELIST ?= ""
 # 
 CVE_CHECK_WHITELIST ?= ""
 
+python cve_save_summary_handler () {
+    import shutil
+    import datetime
+
+    cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
+
+    cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
+    cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+    bb.utils.mkdirhier(cvelogpath)
+
+    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+    cve_summary_file = os.path.join(cvelogpath, "%s-%s.txt" % (cve_summary_name, timestamp))
+
+    shutil.copyfile(cve_tmp_file, cve_summary_file)
+
+    if cve_summary_file and os.path.exists(cve_summary_file):
+        cvefile_link = os.path.join(cvelogpath, cve_summary_name)
+
+        if os.path.exists(os.path.realpath(cvefile_link)):
+            os.remove(cvefile_link)
+        os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+}
+
+addhandler cve_save_summary_handler
+cve_save_summary_handler[eventmask] = "bb.event.BuildCompleted"
+
 python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
@@ -331,5 +360,8 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
             f.write(write_string)
 
     if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
+        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+        bb.utils.mkdirhier(cvelogpath)
+
         with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
             f.write("%s" % write_string)
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------C3EF4A9804121D4499DEC47C--
