Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.3171.1591864682372614502
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 01:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=lCLi5eyD;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.0.123] (unknown [189.154.223.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7B4EE20B4778;
	Thu, 11 Jun 2020 01:38:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7B4EE20B4778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1591864681;
	bh=QPCiGgjzWIFa1XJj5ZT40HJjYlp0pZznuyiIy+yZ7Jo=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=lCLi5eyDLVG2QQCHF1Vb/evwkWQUBRc9mYbYreyGM2XFuHwE+mASHE5SrsWREkNhs
	 AxEKhEKVEH+o2QLk/KurE/IA7fAJTvaE2MBTHVdpzfU1E7i28SlctZpOacEltGGvnp
	 oWcnn3JRnHkMd7FPjPN/uvJljuYBq9GADBKFPZfQ=
Subject: Re: [OE-core] [PATCH] python3: add the rdepends for python3-misc
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200611073928.1974192-1-mingli.yu@windriver.com>
From: "Alejandro Hernandez" <alhe@linux.microsoft.com>
Message-ID: <8eaf539d-d1af-6ff9-8720-8fb90ddcadb6@linux.microsoft.com>
Date: Thu, 11 Jun 2020 02:38:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611073928.1974192-1-mingli.yu@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------DD3C2D9D47B79EFBEEBB4036"
Content-Language: en-US

--------------DD3C2D9D47B79EFBEEBB4036
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Mingli,

What are you adding to the image to reproduce this issue?


Cheers,

Alejandro

On 6/11/20 1:39 AM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Add python3-numbers to rdepends for python3-misc to fix below error:
>   # python3
>   [snip]
>   >>> import statistics
>   [snip]
>   ModuleNotFoundError: No module named 'numbers'
>
> * Don't use the hardcoded python3 moudules rdepends
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-devtools/python/python3_3.8.3.bb | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
> index 09793dade2..997308dc75 100644
> --- a/meta/recipes-devtools/python/python3_3.8.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.3.bb
> @@ -331,7 +331,15 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
>   
>   # catch all the rest (unsorted)
>   PACKAGES += "${PN}-misc"
> -RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
> +RDEPENDS_${PN}-misc += "\
> +  ${PN}-core \
> +  ${PN}-email \
> +  ${PN}-codecs \
> +  ${PN}-pydoc \
> +  ${PN}-pickle \
> +  ${PN}-audio \
> +  ${PN}-numbers \
> +"
>   RDEPENDS_${PN}-modules_append_class-target = " ${MLPREFIX}python3-misc"
>   RDEPENDS_${PN}-modules_append_class-nativesdk = " ${MLPREFIX}python3-misc"
>   FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
>
> 

--------------DD3C2D9D47B79EFBEEBB4036
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hey Mingli,</p>
    <p>What are you adding to the image to reproduce this issue?</p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p>Alejandro<br>
    </p>
    <div class="moz-cite-prefix">On 6/11/20 1:39 AM, Yu, Mingli wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200611073928.1974192-1-mingli.yu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>

* Add python3-numbers to rdepends for python3-misc to fix below error:
 # python3
 [snip]
 &gt;&gt;&gt; import statistics
 [snip]
 ModuleNotFoundError: No module named 'numbers'

* Don't use the hardcoded python3 moudules rdepends

Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
---
 meta/recipes-devtools/python/python3_3.8.3.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
index 09793dade2..997308dc75 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -331,7 +331,15 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
-RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
+RDEPENDS_${PN}-misc += "\
+  ${PN}-core \
+  ${PN}-email \
+  ${PN}-codecs \
+  ${PN}-pydoc \
+  ${PN}-pickle \
+  ${PN}-audio \
+  ${PN}-numbers \
+"
 RDEPENDS_${PN}-modules_append_class-target = " ${MLPREFIX}python3-misc"
 RDEPENDS_${PN}-modules_append_class-nativesdk = " ${MLPREFIX}python3-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DD3C2D9D47B79EFBEEBB4036--
