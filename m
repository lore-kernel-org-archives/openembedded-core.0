Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 512046C111
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 22:33:03 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id o89so51484224qko.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o0rjPfGQIQbqQW0VzbYLTDzrMWXTf0lKtWaAbC++fQA=;
	b=H0H5CmWpbby3qEJFwnDePB3ddG9qx2VPyZTOiNq2Ho8yjkV48JyA/75VmBQSbVFjs0
	ujG7Ee3zCO6mqcRQdEQp6KMaQ5bBuVmc6Bk8n8G1PcGufiCQl1jrnptQNMLPuk02e7Fs
	//UIi59R4W6vRMVM7VJR6qWPTmJOxotDQJSMx09uewcVmqsmvik5IROKLQlPwcFNjIZ0
	NjwaR300txVnWmYOqNi2V+LZtq9k/GSblswCe2Svh9k8KiAR2wzVPO/0pnT5gweHbE9m
	NYbjjOWcx6Z7E6PJsjFA2v3Ch3XijLfzHGURFFTq9lEdDmZzcVfhTlVSAs4ChriJ1Ar+
	Z4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o0rjPfGQIQbqQW0VzbYLTDzrMWXTf0lKtWaAbC++fQA=;
	b=DrOBGnn4aDet5tIRgoVVVrzBXS06XxOa+XzuGJtueRtu0r8ArHjA3ewLn8CWgTjD+r
	M847MV/GODv9GBnCePKRE6u04BSMwi7cW6wZJvKGKz7JW/WJgAARYbPwY3fKbBSyrfRm
	pZ1GfJ050o+xOSHeC3K3yBN6QFh0g5i7XGTUCgX6WOt3FZmcC6IxzcoHIXDLvQ2rq6N4
	1N/Xr7Kv69aalhSqXt4Hc69DDGEWC2rZt5J4UI1/TCwb50xmcAo8Z5qprXud/AX+paVW
	bXl5YkYQy+cVF+snvN/CpkPW5Mi8fkrm1mmNhKJaBic8JkM6MiUMd3epxjAL3JuNmZMX
	HDUg==
X-Gm-Message-State: AGRZ1gK+SjtZ/52L72cLFNQ5e2Gz0eL4zVxTGtTyOGpgS7rdIuBA90/A
	kOSilp+XQwBNPzkO72Jx2mKTmP5tL10XlX5TYuQ=
X-Google-Smtp-Source: AJdET5e6hDB/ZW3zBCxYJ2yU7y9EfrYFuxRVQz79yOGCosFY/0C0WE1SOqmR8GrNTmb5/4EMlZuyIU+l5uDWmGQz9QE=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr22885626qtf.196.1542666783692;
	Mon, 19 Nov 2018 14:33:03 -0800 (PST)
MIME-Version: 1.0
References: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1542638517-19735-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Nov 2018 14:32:37 -0800
Message-ID: <CAMKF1so+5yESK37Lg87dbAQZJxhWFjYkbsn09VWjFi8hriddnQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] curl: update to 7.62.0
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
X-List-Received-Date: Mon, 19 Nov 2018 22:33:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 19, 2018 at 6:42 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Drop all CVE patches now included in update.
>
> For details see: https://curl.haxx.se/changes.html
>

This comes with some consequences since curl 7.62.0 deprecates the
CURLE_SSL_CACERT error code, and unifies it with
CURLE_PEER_FAILED_VERIFICATION some applications will break e.g.

http://errors.yoctoproject.org/Errors/Details/201569/

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-support/curl/curl/CVE-2018-14618.patch | 37 -------------------
>  .../recipes-support/curl/curl/CVE-2018-16839.patch | 35 ------------------
>  .../recipes-support/curl/curl/CVE-2018-16840.patch | 43 ----------------------
>  .../recipes-support/curl/curl/CVE-2018-16842.patch | 35 ------------------
>  .../curl/{curl_7.61.0.bb => curl_7.62.0.bb}        |  8 +---
>  5 files changed, 2 insertions(+), 156 deletions(-)
>  delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-14618.patch
>  delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-16839.patch
>  delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-16840.patch
>  delete mode 100644 meta/recipes-support/curl/curl/CVE-2018-16842.patch
>  rename meta/recipes-support/curl/{curl_7.61.0.bb => curl_7.62.0.bb} (91%)
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2018-14618.patch b/meta/recipes-support/curl/curl/CVE-2018-14618.patch
> deleted file mode 100644
> index db07b43..0000000
> --- a/meta/recipes-support/curl/curl/CVE-2018-14618.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 57d299a499155d4b327e341c6024e293b0418243 Mon Sep 17 00:00:00 2001
> -From: Daniel Stenberg <daniel@haxx.se>
> -Date: Mon, 13 Aug 2018 10:35:52 +0200
> -Subject: [PATCH] Curl_ntlm_core_mk_nt_hash: return error on too long password
> -
> -... since it would cause an integer overflow if longer than (max size_t
> -/ 2).
> -
> -This is CVE-2018-14618
> -
> -Bug: https://curl.haxx.se/docs/CVE-2018-14618.html
> -Closes #2756
> -Reported-by: Zhaoyang Wu
> -
> -CVE: CVE-2018-14618
> -Upstream-Status: Backport
> -Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ----
> - lib/curl_ntlm_core.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/lib/curl_ntlm_core.c b/lib/curl_ntlm_core.c
> -index e27cab353c..922e85a926 100644
> ---- a/lib/curl_ntlm_core.c
> -+++ b/lib/curl_ntlm_core.c
> -@@ -557,8 +557,11 @@ CURLcode Curl_ntlm_core_mk_nt_hash(struct Curl_easy *data,
> -                                    unsigned char *ntbuffer /* 21 bytes */)
> - {
> -   size_t len = strlen(password);
> --  unsigned char *pw = len ? malloc(len * 2) : strdup("");
> -+  unsigned char *pw;
> -   CURLcode result;
> -+  if(len > SIZE_T_MAX/2) /* avoid integer overflow */
> -+    return CURLE_OUT_OF_MEMORY;
> -+  pw = len ? malloc(len * 2) : strdup("");
> -   if(!pw)
> -     return CURLE_OUT_OF_MEMORY;
> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16839.patch b/meta/recipes-support/curl/curl/CVE-2018-16839.patch
> deleted file mode 100644
> index bf972d2..0000000
> --- a/meta/recipes-support/curl/curl/CVE-2018-16839.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 55b90532f9190dce40a325b3312d014c66dc3ae1 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 1 Nov 2018 15:27:35 +0800
> -Subject: [PATCH] Curl_auth_create_plain_message: fix too-large-input-check
> -
> -CVE-2018-16839
> -Reported-by: Harry Sintonen
> -Bug: https://curl.haxx.se/docs/CVE-2018-16839.html
> -
> -Upstream-Status: Backport [https://github.com/curl/curl/commit
> -/f3a24d7916b9173c69a3e0ee790102993833d6c5?diff=unified]
> -
> -CVE: CVE-2018-16839
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - lib/vauth/cleartext.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lib/vauth/cleartext.c b/lib/vauth/cleartext.c
> -index 5d61ce6..1367143 100644
> ---- a/lib/vauth/cleartext.c
> -+++ b/lib/vauth/cleartext.c
> -@@ -74,7 +74,7 @@ CURLcode Curl_auth_create_plain_message(struct Curl_easy *data,
> -   plen = strlen(passwdp);
> -
> -   /* Compute binary message length. Check for overflows. */
> --  if((ulen > SIZE_T_MAX/2) || (plen > (SIZE_T_MAX/2 - 2)))
> -+  if((ulen > SIZE_T_MAX/4) || (plen > (SIZE_T_MAX/2 - 2)))
> -     return CURLE_OUT_OF_MEMORY;
> -   plainlen = 2 * ulen + plen + 2;
> -
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16840.patch b/meta/recipes-support/curl/curl/CVE-2018-16840.patch
> deleted file mode 100644
> index 3d086c4..0000000
> --- a/meta/recipes-support/curl/curl/CVE-2018-16840.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 3c2846bec008e03d456e181d9ab55686da83f140 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 1 Nov 2018 15:33:35 +0800
> -Subject: [PATCH] Curl_close: clear data->multi_easy on free to avoid
> - use-after-free
> -
> -Regression from b46cfbc (7.59.0)
> -CVE-2018-16840
> -Reported-by: Brian Carpenter (Geeknik Labs)
> -
> -Bug: https://curl.haxx.se/docs/CVE-2018-16840.html
> -
> -Upstream-Status: Backport [https://github.com/curl/curl/commit/
> -81d135d67155c5295b1033679c606165d4e28f3f]
> -
> -CVE: CVE-2018-16840
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - lib/url.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/lib/url.c b/lib/url.c
> -index 27b2c1e..7ef7c20 100644
> ---- a/lib/url.c
> -+++ b/lib/url.c
> -@@ -320,10 +320,12 @@ CURLcode Curl_close(struct Curl_easy *data)
> -        and detach this handle from there. */
> -     curl_multi_remove_handle(data->multi, data);
> -
> --  if(data->multi_easy)
> -+  if(data->multi_easy) {
> -     /* when curl_easy_perform() is used, it creates its own multi handle to
> -        use and this is the one */
> -     curl_multi_cleanup(data->multi_easy);
> -+    data->multi_easy = NULL;
> -+  }
> -
> -   /* Destroy the timeout list that is held in the easy handle. It is
> -      /normally/ done by curl_multi_remove_handle() but this is "just in
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-support/curl/curl/CVE-2018-16842.patch b/meta/recipes-support/curl/curl/CVE-2018-16842.patch
> deleted file mode 100644
> index 82e7557..0000000
> --- a/meta/recipes-support/curl/curl/CVE-2018-16842.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 0e4a6058b130f07cfa52fde8a3cb6f2abfe4c700 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 1 Nov 2018 15:30:56 +0800
> -Subject: [PATCH] voutf: fix bad arethmetic when outputting warnings to stderr
> -
> -CVE-2018-16842
> -Reported-by: Brian Carpenter
> -Bug: https://curl.haxx.se/docs/CVE-2018-16842.html
> -
> -Upstream-Status: Backport [https://github.com/curl/curl/commit
> -/d530e92f59ae9bb2d47066c3c460b25d2ffeb211]
> -
> -CVE: CVE-2018-16842
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - src/tool_msgs.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/tool_msgs.c b/src/tool_msgs.c
> -index 9cce806..05bec39 100644
> ---- a/src/tool_msgs.c
> -+++ b/src/tool_msgs.c
> -@@ -67,7 +67,7 @@ static void voutf(struct GlobalConfig *config,
> -         (void)fwrite(ptr, cut + 1, 1, config->errors);
> -         fputs("\n", config->errors);
> -         ptr += cut + 1; /* skip the space too */
> --        len -= cut;
> -+        len -= cut + 1;
> -       }
> -       else {
> -         fputs(ptr, config->errors);
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.62.0.bb
> similarity index 91%
> rename from meta/recipes-support/curl/curl_7.61.0.bb
> rename to meta/recipes-support/curl/curl_7.62.0.bb
> index 56327a6..2baab2b 100644
> --- a/meta/recipes-support/curl/curl_7.61.0.bb
> +++ b/meta/recipes-support/curl/curl_7.62.0.bb
> @@ -7,14 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ef889a37a5a874490ac7ce116396f29a"
>
>  SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>             file://0001-replace-krb5-config-with-pkg-config.patch \
> -           file://CVE-2018-14618.patch \
> -           file://CVE-2018-16839.patch \
> -           file://CVE-2018-16840.patch \
> -           file://CVE-2018-16842.patch \
>  "
>
> -SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
> -SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
> +SRC_URI[md5sum] = "7adf426f80c68bbdd04d44b9bc171d61"
> +SRC_URI[sha256sum] = "7802c54076500be500b171fde786258579d60547a3a35b8c5a23d8c88e8f9620"
>
>  CVE_PRODUCT = "curl libcurl"
>  inherit autotools pkgconfig binconfig multilib_header
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

