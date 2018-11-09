Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id E6C3A600BC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 16:36:15 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id v9-v6so1163969pff.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 08:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UR1GRlr4I5D250OhGthZ3/y2T7S/m1j0QZR6H+qW+OQ=;
	b=JL5eULueOm0eeO3hqiHS/xwv6jKzu86oA7bAz248khZUM586Scm/fmZvyoUJq6NThe
	/I5D21YKnmZw4q0aJsVUSZ+9Jr/w0Z3u7IgpOSq1EzQeL1dw6bfu39ECznN37RzjlT8m
	M6k9GaeVJTD9/J+GJ7GbeifvQtP/Xu3vv7JqquQZP0LGdg5rzVh52TEAl+Zh+vIpNrbq
	7M5UPK55RD/ocdWsse1kJ+laSbpeDRI9o80dniorN8IytMcizubUjtG1yuPEa1Geej7i
	346w1IankkcbZ/vCFJUyr0uBcqmVFgXEMTrfGZ/Jg1/2uzs1wrRwDbCLAXF/Ax9CDxXZ
	iwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=UR1GRlr4I5D250OhGthZ3/y2T7S/m1j0QZR6H+qW+OQ=;
	b=JTYAnfYfbdMeQ/GsBHWW6WZyvNV6lret2fchasLMk69lmmOKQbeOzuguwzv0idtiwR
	LPHxdPsQ44mnAHNLQW3n030+FC/eY8xM31gSMzjUO/ogkGJNs2LJqDc5/0ih3umX3dB7
	LfmW0cOJd6KaFdjZhWxw6n6zdSyaR5mrDmJcQ6WO2owjRxmVgPo5dvL/SBOVGMgSLO4r
	TPzoLCuoBBGQJ+OabMkV0LwSMdzfkfMruACWVJAryY59EQRGTleQDhzHOUC7tN6NO1tv
	IjrSZxeueANQT48ktRqTPzueBWQW4lgF+hir07YWFUDZ9FpEAcctDq+PemMEcqFsRuQJ
	2aFA==
X-Gm-Message-State: AGRZ1gKC7ckWitfXE/UETT1exWAngdd6z7UY+ulj7KpTgL3ZCMAXqLRb
	gDAHMz5MyuOrJ/Ry/JI+xLvp+kvj
X-Google-Smtp-Source: AJdET5fEEfOhwys7HcLLKFMPnnFcahIbyPvI9pyKYp/cnXLmlJvQ324YXxXSJ8vLiPOCh09mHmMo5g==
X-Received: by 2002:a62:8a0d:: with SMTP id
	y13-v6mr9730079pfd.142.1541781376701; 
	Fri, 09 Nov 2018 08:36:16 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:bc38:12a0:5835:9ef9?
	([2601:202:4180:c33:bc38:12a0:5835:9ef9])
	by smtp.gmail.com with ESMTPSA id
	c14-v6sm8396381pfc.92.2018.11.09.08.36.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 08:36:16 -0800 (PST)
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1541138869-68039-1-git-send-email-changqing.li@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f7a43956-5062-ae8c-dc1f-77abc4f8b6a9@gmail.com>
Date: Fri, 9 Nov 2018 08:36:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541138869-68039-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH] curl: fix for CVE-2018-16839/CVE-2018-16840/CVE-2018-16842
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Nov 2018 16:36:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11/1/18 11:07 PM, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-support/curl/curl/CVE-2018-16839.patch | 35 ++++++++++++++++++
>  .../recipes-support/curl/curl/CVE-2018-16840.patch | 43 ++++++++++++++++++++++
>  .../recipes-support/curl/curl/CVE-2018-16842.patch | 35 ++++++++++++++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16839.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16840.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16842.patch

Patchtest is not catching missing bb file changes. 

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13005

Sad thing is 3 people commented on this thread and no one saw the
missing recipe changes to add these patches.

- armin

>
> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16839.patch b/meta/recipes-support/curl/curl/CVE-2018-16839.patch
> new file mode 100644
> index 0000000..bf972d2
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2018-16839.patch
> @@ -0,0 +1,35 @@
> +From 55b90532f9190dce40a325b3312d014c66dc3ae1 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 1 Nov 2018 15:27:35 +0800
> +Subject: [PATCH] Curl_auth_create_plain_message: fix too-large-input-check
> +
> +CVE-2018-16839
> +Reported-by: Harry Sintonen
> +Bug: https://curl.haxx.se/docs/CVE-2018-16839.html
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit
> +/f3a24d7916b9173c69a3e0ee790102993833d6c5?diff=unified]
> +
> +CVE: CVE-2018-16839
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + lib/vauth/cleartext.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/vauth/cleartext.c b/lib/vauth/cleartext.c
> +index 5d61ce6..1367143 100644
> +--- a/lib/vauth/cleartext.c
> ++++ b/lib/vauth/cleartext.c
> +@@ -74,7 +74,7 @@ CURLcode Curl_auth_create_plain_message(struct Curl_easy *data,
> +   plen = strlen(passwdp);
> + 
> +   /* Compute binary message length. Check for overflows. */
> +-  if((ulen > SIZE_T_MAX/2) || (plen > (SIZE_T_MAX/2 - 2)))
> ++  if((ulen > SIZE_T_MAX/4) || (plen > (SIZE_T_MAX/2 - 2)))
> +     return CURLE_OUT_OF_MEMORY;
> +   plainlen = 2 * ulen + plen + 2;
> + 
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16840.patch b/meta/recipes-support/curl/curl/CVE-2018-16840.patch
> new file mode 100644
> index 0000000..3d086c4
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2018-16840.patch
> @@ -0,0 +1,43 @@
> +From 3c2846bec008e03d456e181d9ab55686da83f140 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 1 Nov 2018 15:33:35 +0800
> +Subject: [PATCH] Curl_close: clear data->multi_easy on free to avoid
> + use-after-free
> +
> +Regression from b46cfbc (7.59.0)
> +CVE-2018-16840
> +Reported-by: Brian Carpenter (Geeknik Labs)
> +
> +Bug: https://curl.haxx.se/docs/CVE-2018-16840.html
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/
> +81d135d67155c5295b1033679c606165d4e28f3f]
> +
> +CVE: CVE-2018-16840
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + lib/url.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/url.c b/lib/url.c
> +index 27b2c1e..7ef7c20 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -320,10 +320,12 @@ CURLcode Curl_close(struct Curl_easy *data)
> +        and detach this handle from there. */
> +     curl_multi_remove_handle(data->multi, data);
> + 
> +-  if(data->multi_easy)
> ++  if(data->multi_easy) {
> +     /* when curl_easy_perform() is used, it creates its own multi handle to
> +        use and this is the one */
> +     curl_multi_cleanup(data->multi_easy);
> ++    data->multi_easy = NULL;
> ++  }
> + 
> +   /* Destroy the timeout list that is held in the easy handle. It is
> +      /normally/ done by curl_multi_remove_handle() but this is "just in
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16842.patch b/meta/recipes-support/curl/curl/CVE-2018-16842.patch
> new file mode 100644
> index 0000000..82e7557
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2018-16842.patch
> @@ -0,0 +1,35 @@
> +From 0e4a6058b130f07cfa52fde8a3cb6f2abfe4c700 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 1 Nov 2018 15:30:56 +0800
> +Subject: [PATCH] voutf: fix bad arethmetic when outputting warnings to stderr
> +
> +CVE-2018-16842
> +Reported-by: Brian Carpenter
> +Bug: https://curl.haxx.se/docs/CVE-2018-16842.html
> +
> +Upstream-Status: Backport [https://github.com/curl/curl/commit
> +/d530e92f59ae9bb2d47066c3c460b25d2ffeb211]
> +
> +CVE: CVE-2018-16842
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/tool_msgs.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/tool_msgs.c b/src/tool_msgs.c
> +index 9cce806..05bec39 100644
> +--- a/src/tool_msgs.c
> ++++ b/src/tool_msgs.c
> +@@ -67,7 +67,7 @@ static void voutf(struct GlobalConfig *config,
> +         (void)fwrite(ptr, cut + 1, 1, config->errors);
> +         fputs("\n", config->errors);
> +         ptr += cut + 1; /* skip the space too */
> +-        len -= cut;
> ++        len -= cut + 1;
> +       }
> +       else {
> +         fputs(ptr, config->errors);
> +-- 
> +2.7.4
> +

