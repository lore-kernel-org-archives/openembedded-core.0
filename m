Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9D5C77B7D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 06:04:37 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.43240.1684303474170525113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 23:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=B23DRGOI;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64a9335a8e7so10785009b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 23:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1684303473; x=1686895473;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5VNWTV+QwXV/siQ+xQEYufqz4lIRXb2scV1zJuY6uc=;
        b=B23DRGOIvG53EjzLVh+lyE0caYBDTnGziqNKpulkhKAlKtFAkAA6dLcYVpXRO6A2ZV
         tTx4xS/BIgk4fndptcsRCvmv2FkkDRdgHYwSlYzlsQ1H1bBDmfNkCm50LVMvjWp8BKVH
         BaI+0LC+c5vihWiaL+kNZm9uDvXI0k86cep7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684303473; x=1686895473;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x5VNWTV+QwXV/siQ+xQEYufqz4lIRXb2scV1zJuY6uc=;
        b=Ghexn9moZRzpCy0NOSVoGE1vGzJY7Oo31/xpSqn4mBZLv6KcgrvHgHGqL53pFntMVy
         wylBZ8qLnCSgtrHf1V1FzpRtpG7/bchqx0byZ7A9Rf71dRsSutksXqjplOqDqMb8iTfT
         s3I7XC7ecXvmguiFw1sDd8Vf7EKI2IQ/BE3EPGxokyoOXDDr4rqHEuyJCz5ZBHIpCkDE
         ewfGN2YSFeyegKasKe92ywqVGlLHSy/BH5WSgHK8ncgMi7eIdB1xSrwB+LK6WYDdKdAM
         1PzMFaRzPJJ64l4Lo0jiZVXcHxxtWzJ09DVMZKmN076CFuptPrB73ig8v3aUMZ2dZRXo
         hcqA==
X-Gm-Message-State: AC+VfDxIWwbJZ5XDOXsGgCJI4lPagZwxixEkW9tyoq9uUByWPwEUWqoZ
	pPtbL48226bYT0K0CYQCyPo3Kg==
X-Google-Smtp-Source: ACHHUZ6AXAqmFf8E2MkW+4bfQN5qX/xnRUlWg8Skww9TjNtWVE9ssWbgnusQoYEf2AHgbDuHe5hHMw==
X-Received: by 2002:a17:902:eccc:b0:1ac:76a6:a1f with SMTP id a12-20020a170902eccc00b001ac76a60a1fmr1336439plh.16.1684303473292;
        Tue, 16 May 2023 23:04:33 -0700 (PDT)
Received: from [192.168.0.119] ([43.249.234.155])
        by smtp.gmail.com with ESMTPSA id jg17-20020a17090326d100b001ae57277a87sm294561plb.255.2023.05.16.23.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 23:04:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------SEVLZ1E18A97fDl1aqGposPz"
Message-ID: <e9b46e5a-8219-6f88-f39c-ba219b9fe8dc@mvista.com>
Date: Wed, 17 May 2023 11:34:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [dunfell][PATCH] curl: CVE-2023-27534 SFTP path ~
 resolving discrepancy
Content-Language: en-US
To: "Abdurrahman Hussain (fib)" <fib@cisco.com>,
 Steve Sakoman <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230414105523.81661-1-hprajapati@mvista.com>
 <CAOSpxdZZ9=DEf-ehFjta-qU=NeDGbzh4puJO-H1=QpH+B3X7og@mail.gmail.com>
 <ba598e31-fa5b-6e20-47de-f0acd9f8f649@mvista.com>
 <BL1PR11MB60017A36FB0BE5D303293F9FAD799@BL1PR11MB6001.namprd11.prod.outlook.com>
From: Hitendra Prajapati <hprajapati@mvista.com>
In-Reply-To: <BL1PR11MB60017A36FB0BE5D303293F9FAD799@BL1PR11MB6001.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 06:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181445

This is a multi-part message in MIME format.
--------------SEVLZ1E18A97fDl1aqGposPz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Team,

Please revert the changes of curl: CVE-2023-27534 SFTP path ~ resolving 
discrepancy as of now.

My apologies for the delay in reply.

Regards,

Hitendra

On 17/05/23 00:08, Abdurrahman Hussain (fib) wrote:
>
> Hi Hitendra,
>
> Any update on this? This should be reverted since the dynbuf APIs are 
> not available in curl 7.69.
>
> Regards,
>
> Abdurrahman
>
> *From:* openembedded-core@lists.openembedded.org 
> <openembedded-core@lists.openembedded.org> *On Behalf Of *Hitendra 
> Prajapati
> *Sent:* Friday, May 12, 2023 4:26 AM
> *To:* Steve Sakoman <steve@sakoman.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [dunfell][PATCH] curl: CVE-2023-27534 SFTP 
> path ~ resolving discrepancy
>
> Hi Steve,
>
> I'll look into this issue by enabling the package at my end and send 
> the possible solution if any.
>
> Regards,
>
> Hitendra
>
> On 11/05/23 20:15, Steve Sakoman wrote:
>
>     Hi Hitendra,
>
>     There's been a bug filed against this patch (build failure when when
>
>     curl is configured with `libssh2` i.e. PACKAGECONFIG_append = "
>
>     libssh2"):
>
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=15114
>
>     Could you investigate and advise whether there is an easy fix or
>
>     whether we should revert?
>
>     Thanks,
>
>     Steve
>
>     On Fri, Apr 14, 2023 at 12:55 AM Hitendra Prajapati
>
>     <hprajapati@mvista.com>  <mailto:hprajapati@mvista.com>  wrote:
>
>         Upstream-Status: Backport fromhttps://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6
>
>         Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>  <mailto:hprajapati@mvista.com>
>
>         ---
>
>           .../curl/curl/CVE-2023-27534.patch            | 123 ++++++++++++++++++
>
>           meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
>
>           2 files changed, 124 insertions(+)
>
>           create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534.patch
>
>         diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534.patch b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
>
>         new file mode 100644
>
>         index 0000000000..aeeffd5fea
>
>         --- /dev/null
>
>         +++ b/meta/recipes-support/curl/curl/CVE-2023-27534.patch
>
>         @@ -0,0 +1,123 @@
>
>         +From 4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6 Mon Sep 17 00:00:00 2001
>
>         +From: Daniel Stenberg<daniel@haxx.se>  <mailto:daniel@haxx.se>
>
>         +Date: Thu, 9 Mar 2023 16:22:11 +0100
>
>         +Subject: [PATCH] curl_path: create the new path with dynbuf
>
>         +
>
>         +CVE: CVE-2023-27534
>
>         +Upstream-Status: Backport [https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6]
>
>         +
>
>         +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>  <mailto:hprajapati@mvista.com>
>
>         +---
>
>         + lib/curl_path.c | 71 ++++++++++++++++++++++++-------------------------
>
>         + 1 file changed, 35 insertions(+), 36 deletions(-)
>
>         +
>
>         +diff --git a/lib/curl_path.c b/lib/curl_path.c
>
>         +index f429634..e17db4b 100644
>
>         +--- a/lib/curl_path.c
>
>         ++++ b/lib/curl_path.c
>
>         +@@ -30,6 +30,8 @@
>
>         + #include "escape.h"
>
>         + #include "memdebug.h"
>
>         +
>
>         ++#define MAX_SSHPATH_LEN 100000 /* arbitrary */
>
>         ++
>
>         + /* figure out the path to work with in this particular request */
>
>         + CURLcode Curl_getworkingpath(struct connectdata *conn,
>
>         +                              char *homedir,  /* when SFTP is used */
>
>         +@@ -37,60 +39,57 @@ CURLcode Curl_getworkingpath(struct connectdata *conn,
>
>         +                                              real path to work with */
>
>         + {
>
>         +   struct Curl_easy *data = conn->data;
>
>         +-  char *real_path = NULL;
>
>         +   char *working_path;
>
>         +   size_t working_path_len;
>
>         ++  struct dynbuf npath;
>
>         +   CURLcode result =
>
>         +     Curl_urldecode(data, data->state.up.path, 0, &working_path,
>
>         +                    &working_path_len, FALSE);
>
>         +   if(result)
>
>         +     return result;
>
>         +
>
>         ++  /* new path to switch to in case we need to */
>
>         ++  Curl_dyn_init(&npath, MAX_SSHPATH_LEN);
>
>         ++
>
>         +   /* Check for /~/, indicating relative to the user's home directory */
>
>         +-  if(conn->handler->protocol & CURLPROTO_SCP) {
>
>         +-    real_path = malloc(working_path_len + 1);
>
>         +-    if(real_path == NULL) {
>
>         ++  if((data->conn->handler->protocol & CURLPROTO_SCP) &&
>
>         ++     (working_path_len > 3) && (!memcmp(working_path, "/~/", 3))) {
>
>         ++    /* It is referenced to the home directory, so strip the leading '/~/' */
>
>         ++    if(Curl_dyn_addn(&npath, &working_path[3], working_path_len - 3)) {
>
>         +       free(working_path);
>
>         +       return CURLE_OUT_OF_MEMORY;
>
>         +     }
>
>         +-    if((working_path_len > 3) && (!memcmp(working_path, "/~/", 3)))
>
>         +-      /* It is referenced to the home directory, so strip the leading '/~/' */
>
>         +-      memcpy(real_path, working_path + 3, working_path_len - 2);
>
>         +-    else
>
>         +-      memcpy(real_path, working_path, 1 + working_path_len);
>
>         +   }
>
>         +-  else if(conn->handler->protocol & CURLPROTO_SFTP) {
>
>         +-    if((working_path_len > 1) && (working_path[1] == '~')) {
>
>         +-      size_t homelen = strlen(homedir);
>
>         +-      real_path = malloc(homelen + working_path_len + 1);
>
>         +-      if(real_path == NULL) {
>
>         +-        free(working_path);
>
>         +-        return CURLE_OUT_OF_MEMORY;
>
>         +-      }
>
>         +-      /* It is referenced to the home directory, so strip the
>
>         +-         leading '/' */
>
>         +-      memcpy(real_path, homedir, homelen);
>
>         +-      real_path[homelen] = '/';
>
>         +-      real_path[homelen + 1] = '\0';
>
>         +-      if(working_path_len > 3) {
>
>         +-        memcpy(real_path + homelen + 1, working_path + 3,
>
>         +-               1 + working_path_len -3);
>
>         +-      }
>
>         ++  else if((data->conn->handler->protocol & CURLPROTO_SFTP) &&
>
>         ++          (working_path_len > 2) && !memcmp(working_path, "/~/", 3)) {
>
>         ++    size_t len;
>
>         ++    const char *p;
>
>         ++    int copyfrom = 3;
>
>         ++    if(Curl_dyn_add(&npath, homedir)) {
>
>         ++      free(working_path);
>
>         ++      return CURLE_OUT_OF_MEMORY;
>
>         +     }
>
>         +-    else {
>
>         +-      real_path = malloc(working_path_len + 1);
>
>         +-      if(real_path == NULL) {
>
>         +-        free(working_path);
>
>         +-        return CURLE_OUT_OF_MEMORY;
>
>         +-      }
>
>         +-      memcpy(real_path, working_path, 1 + working_path_len);
>
>         ++    /* Copy a separating '/' if homedir does not end with one */
>
>         ++    len = Curl_dyn_len(&npath);
>
>         ++    p = Curl_dyn_ptr(&npath);
>
>         ++    if(len && (p[len-1] != '/'))
>
>         ++      copyfrom = 2;
>
>         ++
>
>         ++    if(Curl_dyn_addn(&npath,
>
>         ++                     &working_path[copyfrom], working_path_len - copyfrom)) {
>
>         ++      free(working_path);
>
>         ++      return CURLE_OUT_OF_MEMORY;
>
>         +     }
>
>         +   }
>
>         +
>
>         +-  free(working_path);
>
>         ++  if(Curl_dyn_len(&npath)) {
>
>         ++    free(working_path);
>
>         +
>
>         +-  /* store the pointer for the caller to receive */
>
>         +-  *path = real_path;
>
>         ++    /* store the pointer for the caller to receive */
>
>         ++    *path = Curl_dyn_ptr(&npath);
>
>         ++  }
>
>         ++  else
>
>         ++    *path = working_path;
>
>         +
>
>         +   return CURLE_OK;
>
>         + }
>
>         +--
>
>         +2.25.1
>
>         +
>
>         diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
>
>         index 899daf8eac..fddf15e3ff 100644
>
>         --- a/meta/recipes-support/curl/curl_7.69.1.bb
>
>         +++ b/meta/recipes-support/curl/curl_7.69.1.bb
>
>         @@ -42,6 +42,7 @@ SRC_URI ="https://curl.haxx.se/download/curl-${PV}.tar.bz2 \  <https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/>
>
>                     file://CVE-2022-32221.patch
>         \<https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/>
>
>                     file://CVE-2022-35260.patch
>         \<https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/>
>
>                     file://CVE-2022-43552.patch
>         \<https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/>
>
>         +           file://CVE-2023-27534.patch
>         \<https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/>
>
>         "
>         <https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/>
>
>           SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
>
>         --
>
>         2.25.1
>
> -- 
> Regards,
> Hitendra Prajapati
> MontaVista Software LLC
>
-- 
Regards,
Hitendra Prajapati
MontaVista Software LLC
--------------SEVLZ1E18A97fDl1aqGposPz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Team,</p>
    <p>Please revert the changes of curl: CVE-2023-27534 SFTP path ~
      resolving discrepancy as of now.</p>
    <p>My apologies for the delay in reply.</p>
    <p>Regards,</p>
    <p>Hitendra  <br>
    </p>
    <div class="moz-cite-prefix">On 17/05/23 00:08, Abdurrahman Hussain
      (fib) wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BL1PR11MB60017A36FB0BE5D303293F9FAD799@BL1PR11MB6001.namprd11.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:12.0pt">Hi Hitendra,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt">Any update
            on this? This should be reverted since the dynbuf APIs are
            not available in curl 7.69.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt">Regards,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt">Abdurrahman<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:12.0pt"><o:p> </o:p></span></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b>From:</b>
              <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
              <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a>
              <b>On Behalf Of </b>Hitendra Prajapati<br>
              <b>Sent:</b> Friday, May 12, 2023 4:26 AM<br>
              <b>To:</b> Steve Sakoman <a class="moz-txt-link-rfc2396E" href="mailto:steve@sakoman.com">&lt;steve@sakoman.com&gt;</a><br>
              <b>Cc:</b> <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>
              <b>Subject:</b> Re: [OE-core] [dunfell][PATCH] curl:
              CVE-2023-27534 SFTP path ~ resolving discrepancy<o:p></o:p></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p>Hi Steve,<o:p></o:p></p>
        <p>I'll look into this issue by enabling the package at my end
          and send the possible solution if any.<o:p></o:p></p>
        <p>Regards,<o:p></o:p></p>
        <p>Hitendra<o:p></o:p></p>
        <div>
          <p class="MsoNormal">On 11/05/23 20:15, Steve Sakoman wrote:<o:p></o:p></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <pre>Hi Hitendra,<o:p></o:p></pre>
          <pre><o:p> </o:p></pre>
          <pre>There's been a bug filed against this patch (build failure when when<o:p></o:p></pre>
          <pre>curl is configured with `libssh2` i.e. PACKAGECONFIG_append = "<o:p></o:p></pre>
          <pre>libssh2"):<o:p></o:p></pre>
          <pre><o:p> </o:p></pre>
          <pre><a href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15114" moz-do-not-send="true" class="moz-txt-link-freetext">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15114</a><o:p></o:p></pre>
          <pre><o:p> </o:p></pre>
          <pre>Could you investigate and advise whether there is an easy fix or<o:p></o:p></pre>
          <pre>whether we should revert?<o:p></o:p></pre>
          <pre><o:p> </o:p></pre>
          <pre>Thanks,<o:p></o:p></pre>
          <pre><o:p> </o:p></pre>
          <pre>Steve<o:p></o:p></pre>
          <pre><o:p> </o:p></pre>
          <pre>On Fri, Apr 14, 2023 at 12:55<span style="font-family:&quot;Cambria Math&quot;,serif"> </span>AM Hitendra Prajapati<o:p></o:p></pre>
          <pre><a href="mailto:hprajapati@mvista.com" moz-do-not-send="true">&lt;hprajapati@mvista.com&gt;</a> wrote:<o:p></o:p></pre>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre><o:p> </o:p></pre>
            <pre>Upstream-Status: Backport from <a href="https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6" moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6</a><o:p></o:p></pre>
            <pre><o:p> </o:p></pre>
            <pre>Signed-off-by: Hitendra Prajapati <a href="mailto:hprajapati@mvista.com" moz-do-not-send="true">&lt;hprajapati@mvista.com&gt;</a><o:p></o:p></pre>
            <pre>---<o:p></o:p></pre>
            <pre> .../curl/curl/CVE-2023-27534.patch            | 123 ++++++++++++++++++<o:p></o:p></pre>
            <pre> meta/recipes-support/curl/curl_7.69.1.bb      |   1 +<o:p></o:p></pre>
            <pre> 2 files changed, 124 insertions(+)<o:p></o:p></pre>
            <pre> create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534.patch<o:p></o:p></pre>
            <pre><o:p> </o:p></pre>
            <pre>diff --git a/meta/recipes-support/curl/curl/CVE-2023-27534.patch b/meta/recipes-support/curl/curl/CVE-2023-27534.patch<o:p></o:p></pre>
            <pre>new file mode 100644<o:p></o:p></pre>
            <pre>index 0000000000..aeeffd5fea<o:p></o:p></pre>
            <pre>--- /dev/null<o:p></o:p></pre>
            <pre>+++ b/meta/recipes-support/curl/curl/CVE-2023-27534.patch<o:p></o:p></pre>
            <pre>@@ -0,0 +1,123 @@<o:p></o:p></pre>
            <pre>+From 4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6 Mon Sep 17 00:00:00 2001<o:p></o:p></pre>
            <pre>+From: Daniel Stenberg <a href="mailto:daniel@haxx.se" moz-do-not-send="true">&lt;daniel@haxx.se&gt;</a><o:p></o:p></pre>
            <pre>+Date: Thu, 9 Mar 2023 16:22:11 +0100<o:p></o:p></pre>
            <pre>+Subject: [PATCH] curl_path: create the new path with dynbuf<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+CVE: CVE-2023-27534<o:p></o:p></pre>
            <pre>+Upstream-Status: Backport [<a href="https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6" moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/curl/curl/commit/4e2b52b5f7a3bf50a0f1494155717b02cc1df6d6</a>]<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+Signed-off-by: Hitendra Prajapati <a href="mailto:hprajapati@mvista.com" moz-do-not-send="true">&lt;hprajapati@mvista.com&gt;</a><o:p></o:p></pre>
            <pre>+---<o:p></o:p></pre>
            <pre>+ lib/curl_path.c | 71 ++++++++++++++++++++++++-------------------------<o:p></o:p></pre>
            <pre>+ 1 file changed, 35 insertions(+), 36 deletions(-)<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+diff --git a/lib/curl_path.c b/lib/curl_path.c<o:p></o:p></pre>
            <pre>+index f429634..e17db4b 100644<o:p></o:p></pre>
            <pre>+--- a/lib/curl_path.c<o:p></o:p></pre>
            <pre>++++ b/lib/curl_path.c<o:p></o:p></pre>
            <pre>+@@ -30,6 +30,8 @@<o:p></o:p></pre>
            <pre>+ #include "escape.h"<o:p></o:p></pre>
            <pre>+ #include "memdebug.h"<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>++#define MAX_SSHPATH_LEN 100000 /* arbitrary */<o:p></o:p></pre>
            <pre>++<o:p></o:p></pre>
            <pre>+ /* figure out the path to work with in this particular request */<o:p></o:p></pre>
            <pre>+ CURLcode Curl_getworkingpath(struct connectdata *conn,<o:p></o:p></pre>
            <pre>+                              char *homedir,  /* when SFTP is used */<o:p></o:p></pre>
            <pre>+@@ -37,60 +39,57 @@ CURLcode Curl_getworkingpath(struct connectdata *conn,<o:p></o:p></pre>
            <pre>+                                              real path to work with */<o:p></o:p></pre>
            <pre>+ {<o:p></o:p></pre>
            <pre>+   struct Curl_easy *data = conn-&gt;data;<o:p></o:p></pre>
            <pre>+-  char *real_path = NULL;<o:p></o:p></pre>
            <pre>+   char *working_path;<o:p></o:p></pre>
            <pre>+   size_t working_path_len;<o:p></o:p></pre>
            <pre>++  struct dynbuf npath;<o:p></o:p></pre>
            <pre>+   CURLcode result =<o:p></o:p></pre>
            <pre>+     Curl_urldecode(data, data-&gt;state.up.path, 0, &amp;working_path,<o:p></o:p></pre>
            <pre>+                    &amp;working_path_len, FALSE);<o:p></o:p></pre>
            <pre>+   if(result)<o:p></o:p></pre>
            <pre>+     return result;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>++  /* new path to switch to in case we need to */<o:p></o:p></pre>
            <pre>++  Curl_dyn_init(&amp;npath, MAX_SSHPATH_LEN);<o:p></o:p></pre>
            <pre>++<o:p></o:p></pre>
            <pre>+   /* Check for /~/, indicating relative to the user's home directory */<o:p></o:p></pre>
            <pre>+-  if(conn-&gt;handler-&gt;protocol &amp; CURLPROTO_SCP) {<o:p></o:p></pre>
            <pre>+-    real_path = malloc(working_path_len + 1);<o:p></o:p></pre>
            <pre>+-    if(real_path == NULL) {<o:p></o:p></pre>
            <pre>++  if((data-&gt;conn-&gt;handler-&gt;protocol &amp; CURLPROTO_SCP) &amp;&amp;<o:p></o:p></pre>
            <pre>++     (working_path_len &gt; 3) &amp;&amp; (!memcmp(working_path, "/~/", 3))) {<o:p></o:p></pre>
            <pre>++    /* It is referenced to the home directory, so strip the leading '/~/' */<o:p></o:p></pre>
            <pre>++    if(Curl_dyn_addn(&amp;npath, &amp;working_path[3], working_path_len - 3)) {<o:p></o:p></pre>
            <pre>+       free(working_path);<o:p></o:p></pre>
            <pre>+       return CURLE_OUT_OF_MEMORY;<o:p></o:p></pre>
            <pre>+     }<o:p></o:p></pre>
            <pre>+-    if((working_path_len &gt; 3) &amp;&amp; (!memcmp(working_path, "/~/", 3)))<o:p></o:p></pre>
            <pre>+-      /* It is referenced to the home directory, so strip the leading '/~/' */<o:p></o:p></pre>
            <pre>+-      memcpy(real_path, working_path + 3, working_path_len - 2);<o:p></o:p></pre>
            <pre>+-    else<o:p></o:p></pre>
            <pre>+-      memcpy(real_path, working_path, 1 + working_path_len);<o:p></o:p></pre>
            <pre>+   }<o:p></o:p></pre>
            <pre>+-  else if(conn-&gt;handler-&gt;protocol &amp; CURLPROTO_SFTP) {<o:p></o:p></pre>
            <pre>+-    if((working_path_len &gt; 1) &amp;&amp; (working_path[1] == '~')) {<o:p></o:p></pre>
            <pre>+-      size_t homelen = strlen(homedir);<o:p></o:p></pre>
            <pre>+-      real_path = malloc(homelen + working_path_len + 1);<o:p></o:p></pre>
            <pre>+-      if(real_path == NULL) {<o:p></o:p></pre>
            <pre>+-        free(working_path);<o:p></o:p></pre>
            <pre>+-        return CURLE_OUT_OF_MEMORY;<o:p></o:p></pre>
            <pre>+-      }<o:p></o:p></pre>
            <pre>+-      /* It is referenced to the home directory, so strip the<o:p></o:p></pre>
            <pre>+-         leading '/' */<o:p></o:p></pre>
            <pre>+-      memcpy(real_path, homedir, homelen);<o:p></o:p></pre>
            <pre>+-      real_path[homelen] = '/';<o:p></o:p></pre>
            <pre>+-      real_path[homelen + 1] = '\0';<o:p></o:p></pre>
            <pre>+-      if(working_path_len &gt; 3) {<o:p></o:p></pre>
            <pre>+-        memcpy(real_path + homelen + 1, working_path + 3,<o:p></o:p></pre>
            <pre>+-               1 + working_path_len -3);<o:p></o:p></pre>
            <pre>+-      }<o:p></o:p></pre>
            <pre>++  else if((data-&gt;conn-&gt;handler-&gt;protocol &amp; CURLPROTO_SFTP) &amp;&amp;<o:p></o:p></pre>
            <pre>++          (working_path_len &gt; 2) &amp;&amp; !memcmp(working_path, "/~/", 3)) {<o:p></o:p></pre>
            <pre>++    size_t len;<o:p></o:p></pre>
            <pre>++    const char *p;<o:p></o:p></pre>
            <pre>++    int copyfrom = 3;<o:p></o:p></pre>
            <pre>++    if(Curl_dyn_add(&amp;npath, homedir)) {<o:p></o:p></pre>
            <pre>++      free(working_path);<o:p></o:p></pre>
            <pre>++      return CURLE_OUT_OF_MEMORY;<o:p></o:p></pre>
            <pre>+     }<o:p></o:p></pre>
            <pre>+-    else {<o:p></o:p></pre>
            <pre>+-      real_path = malloc(working_path_len + 1);<o:p></o:p></pre>
            <pre>+-      if(real_path == NULL) {<o:p></o:p></pre>
            <pre>+-        free(working_path);<o:p></o:p></pre>
            <pre>+-        return CURLE_OUT_OF_MEMORY;<o:p></o:p></pre>
            <pre>+-      }<o:p></o:p></pre>
            <pre>+-      memcpy(real_path, working_path, 1 + working_path_len);<o:p></o:p></pre>
            <pre>++    /* Copy a separating '/' if homedir does not end with one */<o:p></o:p></pre>
            <pre>++    len = Curl_dyn_len(&amp;npath);<o:p></o:p></pre>
            <pre>++    p = Curl_dyn_ptr(&amp;npath);<o:p></o:p></pre>
            <pre>++    if(len &amp;&amp; (p[len-1] != '/'))<o:p></o:p></pre>
            <pre>++      copyfrom = 2;<o:p></o:p></pre>
            <pre>++<o:p></o:p></pre>
            <pre>++    if(Curl_dyn_addn(&amp;npath,<o:p></o:p></pre>
            <pre>++                     &amp;working_path[copyfrom], working_path_len - copyfrom)) {<o:p></o:p></pre>
            <pre>++      free(working_path);<o:p></o:p></pre>
            <pre>++      return CURLE_OUT_OF_MEMORY;<o:p></o:p></pre>
            <pre>+     }<o:p></o:p></pre>
            <pre>+   }<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+-  free(working_path);<o:p></o:p></pre>
            <pre>++  if(Curl_dyn_len(&amp;npath)) {<o:p></o:p></pre>
            <pre>++    free(working_path);<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+-  /* store the pointer for the caller to receive */<o:p></o:p></pre>
            <pre>+-  *path = real_path;<o:p></o:p></pre>
            <pre>++    /* store the pointer for the caller to receive */<o:p></o:p></pre>
            <pre>++    *path = Curl_dyn_ptr(&amp;npath);<o:p></o:p></pre>
            <pre>++  }<o:p></o:p></pre>
            <pre>++  else<o:p></o:p></pre>
            <pre>++    *path = working_path;<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>+   return CURLE_OK;<o:p></o:p></pre>
            <pre>+ }<o:p></o:p></pre>
            <pre>+--<o:p></o:p></pre>
            <pre>+2.25.1<o:p></o:p></pre>
            <pre>+<o:p></o:p></pre>
            <pre>diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb<o:p></o:p></pre>
            <pre>index 899daf8eac..fddf15e3ff 100644<o:p></o:p></pre>
            <pre>--- a/meta/recipes-support/curl/curl_7.69.1.bb<o:p></o:p></pre>
            <pre>+++ b/meta/recipes-support/curl/curl_7.69.1.bb<o:p></o:p></pre>
            <pre>@@ -42,6 +42,7 @@ SRC_URI = <a href="https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/" moz-do-not-send="true">"https://curl.haxx.se/download/curl-${PV}.tar.bz2 \<o:p></o:p></a></pre>
            <pre><span class="MsoHyperlink"><a href="https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/" moz-do-not-send="true">            file://CVE-2022-32221.patch \<o:p></o:p></a></span></pre>
            <pre><span class="MsoHyperlink"><a href="https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/" moz-do-not-send="true">            file://CVE-2022-35260.patch \<o:p></o:p></a></span></pre>
            <pre><span class="MsoHyperlink"><a href="https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/" moz-do-not-send="true">            file://CVE-2022-43552.patch \<o:p></o:p></a></span></pre>
            <pre><span class="MsoHyperlink"><a href="https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/" moz-do-not-send="true">+           file://CVE-2023-27534.patch \<o:p></o:p></a></span></pre>
            <pre><span class="MsoHyperlink"><a href="https://curl.haxx.se/download/curl-$%7bPV%7d.tar.bz2/file:/CVE-2022-32221.patch/file:/CVE-2022-35260.patch/file:/CVE-2022-43552.patch/+file:/CVE-2023-27534.patch/" moz-do-not-send="true"> "</a></span><o:p></o:p></pre>
            <pre><o:p> </o:p></pre>
            <pre> SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"<o:p></o:p></pre>
            <pre>--<o:p></o:p></pre>
            <pre>2.25.1<o:p></o:p></pre>
            <pre><o:p> </o:p></pre>
            <pre><o:p> </o:p></pre>
            <pre><o:p> </o:p></pre>
            <pre><o:p> </o:p></pre>
          </blockquote>
        </blockquote>
        <div>
          <p class="MsoNormal">-- <br>
            <span style="color:blue">Regards,<br>
              Hitendra Prajapati<br>
              MontaVista Software LLC</span><o:p></o:p></p>
        </div>
      </div>
    </blockquote>
    <div class="moz-signature">-- <br>
      <font color="#0000ff">
        Regards,<br>
        Hitendra Prajapati<br>
        MontaVista Software LLC<br>
      </font></div>
  </body>
</html>

--------------SEVLZ1E18A97fDl1aqGposPz--

