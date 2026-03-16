Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CCBF53D72
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 16:37:49 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55258.1773679062786693008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 09:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=m6YXxIVV;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.61])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1EAF120B6F01;
	Mon, 16 Mar 2026 09:37:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1EAF120B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773679062;
	bh=VAUlNVdysDCz4CoS7pE96YCM2is4Y7YuwuOcMdbz4u4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=m6YXxIVVy098tiP+dL91gJ4KPbe/q2PhLqv/gDmQgiMt+oianV45rIzwv9JznhFkK
	 I5yUx2wOt3967avcOe5YL7WNENeh1jhHjyFO5Ztlma/AiKQYDGXYfoWjg8G5x68Qrv
	 YaedjEOjcr/R1Dvts5ifBPYDeUEGyOiyL29FjD+s=
Content-Type: multipart/alternative;
 boundary="------------9yqvz2NXDYTzA4KPJpUQNhRh"
Message-ID: <fdc3ba7d-e193-4c58-885a-2f269eaf7159@linux.microsoft.com>
Date: Mon, 16 Mar 2026 10:37:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] bitbake.conf: Add SDKMACHINE to
 BUILDCFG_VARS, drop TARGET_FPU
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
 <20260314094758.3929192-2-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <20260314094758.3929192-2-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 16:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233258

This is a multi-part message in MIME format.
--------------9yqvz2NXDYTzA4KPJpUQNhRh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

What are your thoughts on including TCLIBC in BUILCFG_VARS?.

I often find myself missing this key information, but I may be biased due to my particular usecase,
hence I would like other folks opinion on how useful this may be for the general public, sometimes
we get similar information from TARGET_OS / LIBCEXTENSION, but that isn't always the case.

Thanks

Alejandro

On 3/14/2026 3:47 AM, Richard Purdie via lists.openembedded.org wrote:
> Tweak the default build header to add SDKMACHINE and drop TARGET_FPU since
> that data is more likely to be of use to the general user.
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
>   meta/conf/bitbake.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5f632d9f8e7..6b3443695a0 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -761,7 +761,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
>   
>   # Pre-build configuration output
>   BUILDCFG_HEADER = "Build Configuration${@" (mc:${BB_CURRENT_MC})" if d.getVar("BBMULTICONFIG") else ""}:"
> -BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
> +BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE SDKMACHINE DISTRO DISTRO_VERSION TUNE_FEATURES"
>   BUILDCFG_VARS[type] = "list"
>   BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
>   BUILDCFG_NEEDEDVARS[type] = "list"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233077):https://lists.openembedded.org/g/openembedded-core/message/233077
> Mute This Topic:https://lists.openembedded.org/mt/118311455/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------9yqvz2NXDYTzA4KPJpUQNhRh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello,</pre>
    <pre>What are your thoughts on including TCLIBC in BUILCFG_VARS?.</pre>
    <pre>I often find myself missing this key information, but I may be biased due to my particular usecase,
hence I would like other folks opinion on how useful this may be for the general public, sometimes
we get similar information from TARGET_OS / LIBCEXTENSION, but that isn't always the case.</pre>
    <pre>
Thanks

Alejandro</pre>
    <div class="moz-cite-prefix">On 3/14/2026 3:47 AM, Richard Purdie
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:20260314094758.3929192-2-richard.purdie@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">Tweak the default build header to add SDKMACHINE and drop TARGET_FPU since
that data is more likely to be of use to the general user.

Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5f632d9f8e7..6b3443695a0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -761,7 +761,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 
 # Pre-build configuration output
 BUILDCFG_HEADER = "Build Configuration${@" (mc:${BB_CURRENT_MC})" if d.getVar("BBMULTICONFIG") else ""}:"
-BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
+BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE SDKMACHINE DISTRO DISTRO_VERSION TUNE_FEATURES"
 BUILDCFG_VARS[type] = "list"
 BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
 BUILDCFG_NEEDEDVARS[type] = "list"
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#233077): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/233077">https://lists.openembedded.org/g/openembedded-core/message/233077</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/118311455/4354175">https://lists.openembedded.org/mt/118311455/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------9yqvz2NXDYTzA4KPJpUQNhRh--

