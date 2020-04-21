Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.9555.1587478477360650982
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 07:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p6Led2MB;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id ms17so1413108pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=TNc1OqBTnicecoQwZCFWyoKl96pp2V4BFRJPV7VIn98=;
        b=p6Led2MBOFh7I7QLS1i83wWDts4ulHeG36AqrWyU5NRUgozcYjM7MWwF14CvI6IPmx
         3KP6jpaFJaafDJJ9a2xsIT1kgWDooVqM2YgInUSSmqUapSAjfQaJtr3Qooi4N0FnFc+a
         bgOcsGBnJbB8S/vLiuXaAKahT1QW9ZgPRe9gsgPLKdQ+OPKs9ufSQfRJ6wDbtIpndA+e
         BPTpgnH8gVyEjJ1NO1XjIDAdOuPxNvPP+zMqSZmrgesgMRGwWmAuZ7XuT54p/CTUKW1V
         pGFfd4f4xYNi03zAho6eEidvt6KjT5n0YT2Rd8aXvUSkY0H9ACoAJY+lRzRlDzbgGUzU
         yP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=TNc1OqBTnicecoQwZCFWyoKl96pp2V4BFRJPV7VIn98=;
        b=S8en8tUYMMWfXAx3Axq5ullq5Kgia29uD3UEqSzRGAdcMVmhu4GqnO+bHUNUlM8R3u
         ppQbXeysfsA7gAFeQbFoVTaInvCVVrwPbsLwS715khimWNHPAp5bhjJzq+SLEzL49Tpj
         6epGxVUvOz58bfQbh3eZtyA4bxmcUks+aTHBqYpABH3en7+q1G4iuYFD6kkUm41qjgXb
         iOqXHhWsAEhh583g3CKtwxBV8Ox+IqIJfaqo3gxWWZ6DiswJgRFy0vKwY3GDoiRcaDOb
         jhrdYtr5Nc6Uk1dQfoAYXuLsJuAUKcWuL7a8+dgFw23atw/jGNWvr9orgQpnV8jVH9xi
         KzvQ==
X-Gm-Message-State: AGi0Pubv9euragJIXR+YvyQPwU3iuw8n/QETaq0zI+fUMdeccxQMrvpb
	T7/2M+Bt2u1bo7a5GBbPP5HjCtYa
X-Google-Smtp-Source: APiQypKe/2uDskn5qpe3g6EHqiaJnSokshfnPKNus6FzNo6MuK8E+i/Qpb3NdatR4XcE/J+O5+fGdw==
X-Received: by 2002:a17:902:61:: with SMTP id 88mr22474634pla.30.1587478476639;
        Tue, 21 Apr 2020 07:14:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:356e:ada7:6577:9bd? ([2601:202:4180:a5c0:356e:ada7:6577:9bd])
        by smtp.gmail.com with ESMTPSA id o7sm2665045pfg.74.2020.04.21.07.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 07:14:35 -0700 (PDT)
Subject: Re: [OE-core] [oe][zeus][PATCH] git: Security Advisory - git - CVE-2020-5260
To: Li Zhou <li.zhou@windriver.com>, openembedded-core@lists.openembedded.org
References: <1587457084-159482-1-git-send-email-li.zhou@windriver.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
 Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
 mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
 aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
 mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
 C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
 Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
 7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
 dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
 FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
 IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
 FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
 vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
 ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
 IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
 g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
 rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
 FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
 wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
 t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
 aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
 oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
 Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
 37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
 0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
 IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
 0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
 0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
 ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
 UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
 Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
 AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
 mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
 ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
 vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
 JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
 EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
 dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
 /mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
 PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
 ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
 8CS2NxU=
Message-ID: <f381a328-7d6c-714e-7be0-139acd08d106@gmail.com>
Date: Tue, 21 Apr 2020 07:14:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1587457084-159482-1-git-send-email-li.zhou@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------0546F4D0D1AF713AD9BE4E3E"
Content-Language: en-US

--------------0546F4D0D1AF713AD9BE4E3E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 4/21/20 1:18 AM, Li Zhou wrote:
> Backport patch from <https://github.com/git/git/commit/
> 9a6bbee8006c24b46a85d29e7b38cfa79e9ab21b> to solve CVE-2020-5260.

Does this affect dunfell or master?
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  meta/recipes-devtools/git/git.inc                 |  4 +-
>  meta/recipes-devtools/git/git/CVE-2020-5260.patch | 65 +++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/git/git/CVE-2020-5260.patch
>
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
> index 6e13743..176423e 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -7,7 +7,9 @@ DEPENDS = "openssl curl zlib expat"
>  PROVIDES_append_class-native = " git-replacement-native"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
> -           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
> +           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
> +           file://CVE-2020-5260.patch \
> +          "
>  
>  S = "${WORKDIR}/git-${PV}"
>  
> diff --git a/meta/recipes-devtools/git/git/CVE-2020-5260.patch b/meta/recipes-devtools/git/git/CVE-2020-5260.patch
> new file mode 100644
> index 0000000..d03e701
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git/CVE-2020-5260.patch
> @@ -0,0 +1,65 @@
> +From 9a6bbee8006c24b46a85d29e7b38cfa79e9ab21b Mon Sep 17 00:00:00 2001
> +From: Jeff King <peff@peff.net>
> +Date: Wed, 11 Mar 2020 17:53:41 -0400
> +Subject: [PATCH] credential: avoid writing values with newlines
> +
> +The credential protocol that we use to speak to helpers can't represent
> +values with newlines in them. This was an intentional design choice to
> +keep the protocol simple, since none of the values we pass should
> +generally have newlines.
> +
> +However, if we _do_ encounter a newline in a value, we blindly transmit
> +it in credential_write(). Such values may break the protocol syntax, or
> +worse, inject new valid lines into the protocol stream.
> +
> +The most likely way for a newline to end up in a credential struct is by
> +decoding a URL with a percent-encoded newline. However, since the bug
> +occurs at the moment we write the value to the protocol, we'll catch it
> +there. That should leave no possibility of accidentally missing a code
> +path that can trigger the problem.
> +
> +At this level of the code we have little choice but to die(). However,
> +since we'd not ever expect to see this case outside of a malicious URL,
> +that's an acceptable outcome.
> +
> +Reported-by: Felix Wilhelm <fwilhelm@google.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2020-5260
> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +---
> + credential.c           | 2 ++
> + t/t0300-credentials.sh | 6 ++++++
> + 2 files changed, 8 insertions(+)
> +
> +diff --git a/credential.c b/credential.c
> +index 9747f47..00ee4d6 100644
> +--- a/credential.c
> ++++ b/credential.c
> +@@ -194,6 +194,8 @@ static void credential_write_item(FILE *fp, const char *key, const char *value)
> + {
> + 	if (!value)
> + 		return;
> ++	if (strchr(value, '\n'))
> ++		die("credential value for %s contains newline", key);
> + 	fprintf(fp, "%s=%s\n", key, value);
> + }
> + 
> +diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
> +index 03bd31e..15cc3c5 100755
> +--- a/t/t0300-credentials.sh
> ++++ b/t/t0300-credentials.sh
> +@@ -309,4 +309,10 @@ test_expect_success 'empty helper spec resets helper list' '
> + 	EOF
> + '
> + 
> ++test_expect_success 'url parser rejects embedded newlines' '
> ++	test_must_fail git credential fill <<-\EOF
> ++	url=https://one.example.com?%0ahost=two.example.com/
> ++	EOF
> ++'
> ++
> + test_done
> +-- 
> +1.9.1
> +
>
> 


--------------0546F4D0D1AF713AD9BE4E3E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/21/20 1:18 AM, Li Zhou wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1587457084-159482-1-git-send-email-li.zhou@windriver.com">
      <pre class="moz-quote-pre" wrap="">Backport patch from <a class="moz-txt-link-rfc2396E" href="https://github.com/git/git/commit/9a6bbee8006c24b46a85d29e7b38cfa79e9ab21b">&lt;https://github.com/git/git/commit/
9a6bbee8006c24b46a85d29e7b38cfa79e9ab21b&gt;</a> to solve CVE-2020-5260.</pre>
    </blockquote>
    <br>
    Does this affect dunfell or master?<br>
    <blockquote type="cite"
      cite="mid:1587457084-159482-1-git-send-email-li.zhou@windriver.com">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Li Zhou <a class="moz-txt-link-rfc2396E" href="mailto:li.zhou@windriver.com">&lt;li.zhou@windriver.com&gt;</a>
---
 meta/recipes-devtools/git/git.inc                 |  4 +-
 meta/recipes-devtools/git/git/CVE-2020-5260.patch | 65 +++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2020-5260.patch

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 6e13743..176423e 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -7,7 +7,9 @@ DEPENDS = "openssl curl zlib expat"
 PROVIDES_append_class-native = " git-replacement-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
-           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages"
+           ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
+           <a class="moz-txt-link-freetext" href="file://CVE-2020-5260.patch">file://CVE-2020-5260.patch</a> \
+          "
 
 S = "${WORKDIR}/git-${PV}"
 
diff --git a/meta/recipes-devtools/git/git/CVE-2020-5260.patch b/meta/recipes-devtools/git/git/CVE-2020-5260.patch
new file mode 100644
index 0000000..d03e701
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2020-5260.patch
@@ -0,0 +1,65 @@
+From 9a6bbee8006c24b46a85d29e7b38cfa79e9ab21b Mon Sep 17 00:00:00 2001
+From: Jeff King <a class="moz-txt-link-rfc2396E" href="mailto:peff@peff.net">&lt;peff@peff.net&gt;</a>
+Date: Wed, 11 Mar 2020 17:53:41 -0400
+Subject: [PATCH] credential: avoid writing values with newlines
+
+The credential protocol that we use to speak to helpers can't represent
+values with newlines in them. This was an intentional design choice to
+keep the protocol simple, since none of the values we pass should
+generally have newlines.
+
+However, if we _do_ encounter a newline in a value, we blindly transmit
+it in credential_write(). Such values may break the protocol syntax, or
+worse, inject new valid lines into the protocol stream.
+
+The most likely way for a newline to end up in a credential struct is by
+decoding a URL with a percent-encoded newline. However, since the bug
+occurs at the moment we write the value to the protocol, we'll catch it
+there. That should leave no possibility of accidentally missing a code
+path that can trigger the problem.
+
+At this level of the code we have little choice but to die(). However,
+since we'd not ever expect to see this case outside of a malicious URL,
+that's an acceptable outcome.
+
+Reported-by: Felix Wilhelm <a class="moz-txt-link-rfc2396E" href="mailto:fwilhelm@google.com">&lt;fwilhelm@google.com&gt;</a>
+
+Upstream-Status: Backport
+CVE: CVE-2020-5260
+Signed-off-by: Li Zhou <a class="moz-txt-link-rfc2396E" href="mailto:li.zhou@windriver.com">&lt;li.zhou@windriver.com&gt;</a>
+---
+ credential.c           | 2 ++
+ t/t0300-credentials.sh | 6 ++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/credential.c b/credential.c
+index 9747f47..00ee4d6 100644
+--- a/credential.c
++++ b/credential.c
+@@ -194,6 +194,8 @@ static void credential_write_item(FILE *fp, const char *key, const char *value)
+ {
+ 	if (!value)
+ 		return;
++	if (strchr(value, '\n'))
++		die("credential value for %s contains newline", key);
+ 	fprintf(fp, "%s=%s\n", key, value);
+ }
+ 
+diff --git a/t/t0300-credentials.sh b/t/t0300-credentials.sh
+index 03bd31e..15cc3c5 100755
+--- a/t/t0300-credentials.sh
++++ b/t/t0300-credentials.sh
+@@ -309,4 +309,10 @@ test_expect_success 'empty helper spec resets helper list' '
+ 	EOF
+ '
+ 
++test_expect_success 'url parser rejects embedded newlines' '
++	test_must_fail git credential fill &lt;&lt;-\EOF
++	url=<a class="moz-txt-link-freetext" href="https://one.example.com?%0ahost=two.example.com/">https://one.example.com?%0ahost=two.example.com/</a>
++	EOF
++'
++
+ test_done
+-- 
+1.9.1
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------0546F4D0D1AF713AD9BE4E3E--
