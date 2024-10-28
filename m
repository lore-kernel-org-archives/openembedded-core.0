Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCB6D13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 09:06:59 +0000 (UTC)
Received: from h3.cmg2.smtp.forpsi.com (h3.cmg2.smtp.forpsi.com [185.129.138.188])
 by mx.groups.io with SMTP id smtpd.web10.47399.1730106416178313044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 02:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=ubMJyB7Z;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=ubMJyB7Z;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.188, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id 5Li9tmMqMTNCy5Li9te0w6; Mon, 28 Oct 2024 10:06:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1730106414; bh=TuJQkCX4haW724StI3qGq3ir1XLcqjOsrLIeOImR+aM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:From;
	b=ubMJyB7ZURzmvgQG2hco0tCNFTkxG1pcfrgtnZqBcVHHuvKs3+WpQh8kdy5t5Fc0U
	 l6Y0WiCThMj7FxObdzezMGXLUD/rhf4ItId2IOKSJn8lRJNfh2y4TagIU3jiEWzoi/
	 jNRXxP5EpM6z8l+v/C2g/F0FZCremIfzYsF6l5fB0zf7RHQT9+CZ+jGi2U1LnHF8X5
	 gGuw6iK+NM5U7t2zCPImVYHwaq1N4Kn6N+APxp24/pBi6qya891yIfv2Z8aEY6e8Sn
	 PWL0QKFXqu9i3iTmsy38chKaOsARNoSCmslk6dpIx+ysZy8DzEx23YgSXknRVNJ2BE
	 T4UZfZ/LQ3hcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1730106414; bh=TuJQkCX4haW724StI3qGq3ir1XLcqjOsrLIeOImR+aM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:From;
	b=ubMJyB7ZURzmvgQG2hco0tCNFTkxG1pcfrgtnZqBcVHHuvKs3+WpQh8kdy5t5Fc0U
	 l6Y0WiCThMj7FxObdzezMGXLUD/rhf4ItId2IOKSJn8lRJNfh2y4TagIU3jiEWzoi/
	 jNRXxP5EpM6z8l+v/C2g/F0FZCremIfzYsF6l5fB0zf7RHQT9+CZ+jGi2U1LnHF8X5
	 gGuw6iK+NM5U7t2zCPImVYHwaq1N4Kn6N+APxp24/pBi6qya891yIfv2Z8aEY6e8Sn
	 PWL0QKFXqu9i3iTmsy38chKaOsARNoSCmslk6dpIx+ysZy8DzEx23YgSXknRVNJ2BE
	 T4UZfZ/LQ3hcQ==
Content-Type: multipart/alternative;
 boundary="------------fYHe1liv0YWyb00XHnptUj2O"
Message-ID: <824ea7ce-b5d0-4da3-8e3d-5445373e1e9a@skyrain.eu>
Date: Mon, 28 Oct 2024 10:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] busybox: disable defconfig options from simpler
 fragments
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: yocto@pengutronix.de, openembedded-core@lists.openembedded.org
References: <20241028082913.418505-1-ejo@pengutronix.de>
 <20241028082913.418505-3-ejo@pengutronix.de>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <20241028082913.418505-3-ejo@pengutronix.de>
X-CMAE-Envelope: MS4xfNHyWZ7dzXabQCZ7nih0Ab24c+nxZHtaOSt8cGNSQ3qRcWF8wneWmu3AwKCCjiNkf/R3pAGqevix/d/O/7DguJY7zHgRuD/Dx389eCMBNJCOaYDCat9w
 lu8SnJfMn2qzmf7gJRxiGnOT/B4kXPI/3ekfAk6lHs6QRyhKy1pA1tyBaJ1l/IJz+fKBCdiaQHeRawyGruK/1Lhcq6u3cZ6AqDy06UyLJKpAfCNNAWmWP5ge
 f7TNJCkr6PvLmp3hXA0d4E8YjpBKt7OBQ+uMaoU5qjXpdMh0SMQZDx7FCA2Tmfv9yHsjsheWbQvJNTvk8DTNnv3bH9yZRzVsb4aHClXFVQs=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 09:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206437

This is a multi-part message in MIME format.
--------------fYHe1liv0YWyb00XHnptUj2O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Enrico,

I tried to follow (and applied) your patch, but it looks little bit 
inconsistent to me. In the first round you enabled SHAx_HWACCEL, which 
is broken on some architectures. That's the reason, why is disabled by 
default. Ok, so first apply looks like this:

  # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
  CONFIG_PASSWORD_MINLEN=6
  CONFIG_MD5_SMALL=1
+CONFIG_SHA1_SMALL=3
+CONFIG_SHA1_HWACCEL=y
+CONFIG_SHA256_HWACCEL=y
  CONFIG_SHA3_SMALL=1
  CONFIG_FEATURE_NON_POSIX_CP=y
  # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
@@ -884,6 +887,7 @@ CONFIG_FEATURE_HWIB=y

Then I applied next patch:

  # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set
  CONFIG_PASSWORD_MINLEN=6
  CONFIG_MD5_SMALL=1
+CONFIG_SHA1_SMALL=3
+CONFIG_SHA1_HWACCEL=y
+CONFIG_SHA256_HWACCEL=y
  CONFIG_SHA3_SMALL=1
  CONFIG_FEATURE_NON_POSIX_CP=y
  # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set
@@ -278,8 +281,8 @@ CONFIG_FEATURE_LS_USERNAME=y
  CONFIG_FEATURE_LS_COLOR=y
  # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
  CONFIG_MD5SUM=y
-CONFIG_SHA1SUM=y
-CONFIG_SHA256SUM=y
+# CONFIG_SHA1SUM is not set
+# CONFIG_SHA256SUM is not set
  # CONFIG_SHA512SUM is not set
  # CONFIG_SHA3SUM is not set

@@ -383,8 +386,8 @@ CONFIG_DEFAULT_SETFONT_DIR=""

and you disabled CONFIG_SHA1SUM, but keep enabled the acceleration? Is 
there any special reason for that?

Anyway, there was one commit in the usptream which was touching the 
acceleration. So I have to try it on the broken machine and see if it's 
still broken or not.

> On Fri, 2024-10-25 at 19:26 +0200, Andrej wrote:
>> Ok, I was thinking that it was done by intention, but it happened 14y
>> ago
>> https://github.com/openembedded/openembedded-core/commit/615a98ed9a02
>> 1da245513790c064761a0a5a67e9 . So I guess not.
> I am not sure if I fully understand what you are referring to here.
> Could you provide some details about what happened there?
> OE didn't have those fragments 14y ago I guess.
So the idea behind is that you're going to remove the fragments and keep 
just a one defconfig. But according to your commits you kept the 
fragments there, even if you put some values into defconfig.

Regards,
Andrej


On 28.10.2024 09:29, Enrico Jörns wrote:
> This disables options from the defconfig file that are enabled by
> explicit config fragments.
>
> Having them enabled in the defconfig renders the fragments useless and
> takes away the ability to disable options with
>
>    SRC_URI:remove = "<fragment>.cfg".
>
> The respective options were all deactivated once but got accidentally
> enabled in 4335cd24 ("busybox: refresh the defconfig from 1.33.0").
>
> This commit disables the features for:
>
> - sha1sum.cfg
> - sha256sum.cfg
> - resize.cfg
> - pgrep.cfg
> - rev.cfg
>
> Signed-off-by: Enrico Jörns<ejo@pengutronix.de>
> ---
>   meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
> index 6c5a8764ce..0ec65c65af 100644
> --- a/meta/recipes-core/busybox/busybox/defconfig
> +++ b/meta/recipes-core/busybox/busybox/defconfig
> @@ -281,8 +281,8 @@ CONFIG_FEATURE_LS_USERNAME=y
>   CONFIG_FEATURE_LS_COLOR=y
>   # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
>   CONFIG_MD5SUM=y
> -CONFIG_SHA1SUM=y
> -CONFIG_SHA256SUM=y
> +# CONFIG_SHA1SUM is not set
> +# CONFIG_SHA256SUM is not set
>   # CONFIG_SHA512SUM is not set
>   # CONFIG_SHA3SUM is not set
>   
> @@ -386,8 +386,8 @@ CONFIG_DEFAULT_SETFONT_DIR=""
>   CONFIG_LOADKMAP=y
>   CONFIG_OPENVT=y
>   CONFIG_RESET=y
> -CONFIG_RESIZE=y
> -CONFIG_FEATURE_RESIZE_PRINT=y
> +# CONFIG_RESIZE is not set
> +# CONFIG_FEATURE_RESIZE_PRINT is not set
>   CONFIG_SETCONSOLE=y
>   # CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
>   # CONFIG_SETKEYCODES is not set
> @@ -689,7 +689,7 @@ CONFIG_RDATE=y
>   # CONFIG_RDEV is not set
>   # CONFIG_READPROFILE is not set
>   CONFIG_RENICE=y
> -CONFIG_REV=y
> +# CONFIG_REV is not set
>   # CONFIG_RTCWAKE is not set
>   # CONFIG_SCRIPT is not set
>   # CONFIG_SCRIPTREPLAY is not set
> @@ -1070,7 +1070,7 @@ CONFIG_KILLALL=y
>   # CONFIG_LSOF is not set
>   # CONFIG_MPSTAT is not set
>   # CONFIG_NMETER is not set
> -CONFIG_PGREP=y
> +# CONFIG_PGREP is not set
>   # CONFIG_PKILL is not set
>   CONFIG_PIDOF=y
>   # CONFIG_FEATURE_PIDOF_SINGLE is not set

--------------fYHe1liv0YWyb00XHnptUj2O
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace">Hello Enrico,<br>
      <br>
      I tried to follow (and applied) your patch, but it looks little
      bit inconsistent to me. In the first round you enabled
      SHAx_HWACCEL, which is broken on some architectures. That's the
      reason, why is disabled by default. Ok, so first apply looks like
      this:<br>
      <br>
       # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set<br>
       CONFIG_PASSWORD_MINLEN=6<br>
       CONFIG_MD5_SMALL=1<br>
      +CONFIG_SHA1_SMALL=3<br>
      +CONFIG_SHA1_HWACCEL=y<br>
      +CONFIG_SHA256_HWACCEL=y<br>
       CONFIG_SHA3_SMALL=1<br>
       CONFIG_FEATURE_NON_POSIX_CP=y<br>
       # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set<br>
      @@ -884,6 +887,7 @@ CONFIG_FEATURE_HWIB=y<br>
      <br>
      Then I applied next patch:<br>
      <br>
       # CONFIG_FEATURE_BUFFERS_GO_IN_BSS is not set<br>
       CONFIG_PASSWORD_MINLEN=6<br>
       CONFIG_MD5_SMALL=1<br>
      +CONFIG_SHA1_SMALL=3<br>
      +CONFIG_SHA1_HWACCEL=y<br>
      +CONFIG_SHA256_HWACCEL=y<br>
       CONFIG_SHA3_SMALL=1<br>
       CONFIG_FEATURE_NON_POSIX_CP=y<br>
       # CONFIG_FEATURE_VERBOSE_CP_MESSAGE is not set<br>
      @@ -278,8 +281,8 @@ CONFIG_FEATURE_LS_USERNAME=y<br>
       CONFIG_FEATURE_LS_COLOR=y<br>
       # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set<br>
       CONFIG_MD5SUM=y<br>
      -CONFIG_SHA1SUM=y<br>
      -CONFIG_SHA256SUM=y<br>
      +# CONFIG_SHA1SUM is not set<br>
      +# CONFIG_SHA256SUM is not set<br>
       # CONFIG_SHA512SUM is not set<br>
       # CONFIG_SHA3SUM is not set<br>
       <br>
      @@ -383,8 +386,8 @@ CONFIG_DEFAULT_SETFONT_DIR=""<br>
      <br>
      and you disabled </font><font face="monospace">CONFIG_SHA1SUM,
      but keep enabled the acceleration? Is there any special reason for
      that?<br>
      <br>
      Anyway, there was one commit in the usptream which was touching
      the acceleration. So I have to try it on the broken machine and
      see if it's still broken or not.<br>
      <br>
    </font>
    <pre class="moz-quote-pre" wrap=""></pre>
    <blockquote type="cite" style="color: #007cff;">
      <pre class="moz-quote-pre" wrap="">On Fri, 2024-10-25 at 19:26 +0200, Andrej wrote:
</pre>
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">Ok, I was thinking that it was done by intention, but it happened 14y
ago 
<a class="moz-txt-link-freetext"
href="https://github.com/openembedded/openembedded-core/commit/615a98ed9a02">https://github.com/openembedded/openembedded-core/commit/615a98ed9a02</a>
1da245513790c064761a0a5a67e9 . So I guess not. 
</pre>
      </blockquote>
    </blockquote>
    <blockquote type="cite" style="color: #007cff;">
      <pre class="moz-quote-pre" wrap="">I am not sure if I fully understand what you are referring to here.
Could you provide some details about what happened there?
OE didn't have those fragments 14y ago I guess.<span
      style="white-space: pre-wrap">
</span></pre>
    </blockquote>
    <font face="monospace">So the idea behind is that you're going to
      remove the fragments and keep just a one defconfig. But according
      to your commits you kept the fragments there, even if you put some
      values into defconfig.<br>
      <br>
      Regards,<br>
      Andrej<br>
    </font><br>
    <br>
    <div class="moz-cite-prefix">On 28.10.2024 09:29, Enrico Jörns
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241028082913.418505-3-ejo@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">This disables options from the defconfig file that are enabled by
explicit config fragments.

Having them enabled in the defconfig renders the fragments useless and
takes away the ability to disable options with

  SRC_URI:remove = "&lt;fragment&gt;.cfg".

The respective options were all deactivated once but got accidentally
enabled in 4335cd24 ("busybox: refresh the defconfig from 1.33.0").

This commit disables the features for:

- sha1sum.cfg
- sha256sum.cfg
- resize.cfg
- pgrep.cfg
- rev.cfg

Signed-off-by: Enrico Jörns <a class="moz-txt-link-rfc2396E" href="mailto:ejo@pengutronix.de">&lt;ejo@pengutronix.de&gt;</a>
---
 meta/recipes-core/busybox/busybox/defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 6c5a8764ce..0ec65c65af 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -281,8 +281,8 @@ CONFIG_FEATURE_LS_USERNAME=y
 CONFIG_FEATURE_LS_COLOR=y
 # CONFIG_FEATURE_LS_COLOR_IS_DEFAULT is not set
 CONFIG_MD5SUM=y
-CONFIG_SHA1SUM=y
-CONFIG_SHA256SUM=y
+# CONFIG_SHA1SUM is not set
+# CONFIG_SHA256SUM is not set
 # CONFIG_SHA512SUM is not set
 # CONFIG_SHA3SUM is not set
 
@@ -386,8 +386,8 @@ CONFIG_DEFAULT_SETFONT_DIR=""
 CONFIG_LOADKMAP=y
 CONFIG_OPENVT=y
 CONFIG_RESET=y
-CONFIG_RESIZE=y
-CONFIG_FEATURE_RESIZE_PRINT=y
+# CONFIG_RESIZE is not set
+# CONFIG_FEATURE_RESIZE_PRINT is not set
 CONFIG_SETCONSOLE=y
 # CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS is not set
 # CONFIG_SETKEYCODES is not set
@@ -689,7 +689,7 @@ CONFIG_RDATE=y
 # CONFIG_RDEV is not set
 # CONFIG_READPROFILE is not set
 CONFIG_RENICE=y
-CONFIG_REV=y
+# CONFIG_REV is not set
 # CONFIG_RTCWAKE is not set
 # CONFIG_SCRIPT is not set
 # CONFIG_SCRIPTREPLAY is not set
@@ -1070,7 +1070,7 @@ CONFIG_KILLALL=y
 # CONFIG_LSOF is not set
 # CONFIG_MPSTAT is not set
 # CONFIG_NMETER is not set
-CONFIG_PGREP=y
+# CONFIG_PGREP is not set
 # CONFIG_PKILL is not set
 CONFIG_PIDOF=y
 # CONFIG_FEATURE_PIDOF_SINGLE is not set
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------fYHe1liv0YWyb00XHnptUj2O--

