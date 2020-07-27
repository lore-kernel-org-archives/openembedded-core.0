Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.47752.1595818428940463919
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 19:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B+JF0tVY;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id l6so7253663plt.7
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 19:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=xgAAtfYA0hWrMHYwtjtdIZLFewY5KGsuIpXxnz1Qp5g=;
        b=B+JF0tVY/PQ4nV+q5m5UqI5uqMkt0GFoRegaL4NoBKfDYxWpK6F1getD/6Yrv0DNTE
         BT+RDxaP3mZblaxJbyfLzH1QTOUyzvxn2QT6JbrruZ+miF5bAexiKwxoTC5dkwJCKPbn
         Jp7aKfFXFhc+zHNRdMEUW21YQNtYQg5YIGEgr3GjQlycwYQbpVC+iukhFOEU1XPG/p5Z
         Xhdo9TBu9u2VzakGwtTdF4cCBSRtGchUcGrJYn0DQEVQdxW6GYy+BvPz98XoQNuVys8q
         JcSyX3d1S/q8Abe3ntaVpwJkiQBX2U+lL/AvHtUSwJrIidiefnTqEziQGvr2S8EJwIa+
         ni2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=xgAAtfYA0hWrMHYwtjtdIZLFewY5KGsuIpXxnz1Qp5g=;
        b=BAkKsXCyrQGSFV3d+SU33LhQasR/lOAfncVHDzfGzeeoLXZjArh61sTR8cgT2Ld4lK
         0FRrcbtJvSOsB9ni0Nhwy31tbElsR3z6TBzcK2Vuf72W/o98BJfhX8XJKspiqeYAACjZ
         sSHRrpgZqnNCJMwZIYHX5EvZkt7l2UuM9T3s6u7WVfvJbPqZSdi58sFBOYPFOncN04Aj
         bth96goWWOC0xCDn/i7Z/ZcCwLkkEBCYHlHJSZAi5VB+q8D/WiCodGq01VpYvnM76JjT
         t1BM73tByD2dj04ljE52mDHjUFmbAWcdUNhk0YfFqjhETXSJKAtgJXlUoOQ1jvTuIUKP
         ESxQ==
X-Gm-Message-State: AOAM533ErZ3W3RBmNvjdKe063DSP4DWxp7FWH1KdAZse54N38hBYf6s6
	hPwaVsoTneXM94mayxr9LCF3TfpBivE=
X-Google-Smtp-Source: ABdhPJx7veEFyZDZSTAYlBs+v/nI6Rs8nUf9T72eeM8rPzoAQDYAUYjSDFxB1waKByp9ePY/8G7pBw==
X-Received: by 2002:a17:902:7c92:: with SMTP id y18mr7855261pll.10.1595818428289;
        Sun, 26 Jul 2020 19:53:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:957c:826:e40f:5fde? ([2601:202:4180:a5c0:957c:826:e40f:5fde])
        by smtp.gmail.com with ESMTPSA id g19sm13109129pfb.152.2020.07.26.19.53.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 19:53:47 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] cve-check: print warning if file is missing
To: openembedded-core@lists.openembedded.org
References: <16257C3E9F1B8850.7401@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <26894197-4421-f931-d436-15ea1466df93@gmail.com>
Date: Sun, 26 Jul 2020 19:53:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <16257C3E9F1B8850.7401@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------59D92BD327A677112C16E43B"
Content-Language: en-US

--------------59D92BD327A677112C16E43B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

ignore this one. should have been squished a local change.

-armin

On 7/26/20 7:50 PM, akuster via lists.openembedded.org wrote:
> If the "tmp/cve_check" file was not create as in the case for -c populate_sdk, just print a
> warning instead of dumping a trace back
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/cve-check.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index e61c90e5600..b16da9890af 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -56,7 +56,7 @@ python cve_save_summary_handler () {
>      cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
>  
>      if not os.path.isfile(cve_tmp_file):
> -        bb.warn("File Not found, check has no affect: %s" % cve_tmp_file)
> +        bb.warn("File Not found: %s" % cve_tmp_file)
>          return
>  
>      cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
>
> 


--------------59D92BD327A677112C16E43B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    ignore this one. should have been squished a local change.<br>
    <br>
    -armin<br>
    <br>
    <div class="moz-cite-prefix">On 7/26/20 7:50 PM, akuster via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:16257C3E9F1B8850.7401@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">If the "tmp/cve_check" file was not create as in the case for -c populate_sdk, just print a
warning instead of dumping a trace back

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e61c90e5600..b16da9890af 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -56,7 +56,7 @@ python cve_save_summary_handler () {
     cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
     if not os.path.isfile(cve_tmp_file):
-        bb.warn("File Not found, check has no affect: %s" % cve_tmp_file)
+        bb.warn("File Not found: %s" % cve_tmp_file)
         return
 
     cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------59D92BD327A677112C16E43B--
