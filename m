Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A45E06FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 15:47:46 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n24so2671459pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=iqBQfvu9knhLGkKcWPnJy/ED0BjsTPQhy3uB97R4cdk=;
	b=qOGLeLjEXISePmoyct7tPSKNTmJ5xoBD9h/6BETijrLDyzJPIcn1jXcct/URqHKQlz
	nlF65KYrUCHCOu/D4EBBjmiiiCObkTsxRbDdfwy2HiUFt2zuU2LmoVdxJZTKHLkIC0Cz
	EHVSe90t5rIFhca7wsLG/jNcqRd3hmDOTduQ4EpbZ0ZXyLk5gITw4k8h6OaPFR3Jh/uo
	Jy7zNQVszpypDlQflxjGX+3asTk+ZTrvoR0ryiqnRmbB2pIAWAzIwhJaneDY/P/aBR9S
	UvLQjQcQqSa6ZF0AGPGQ+dnmaS8hGE81BSdwndc6IpU3lalSkjMnadXQHg1+SOrY4TII
	d12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=iqBQfvu9knhLGkKcWPnJy/ED0BjsTPQhy3uB97R4cdk=;
	b=f4HR5wxycOCdUWp8RvjfLNsBk4jVIG4ipGmBt/Q2SVNKPLNBqEesiTrsAG/yyq/ILC
	absCP/SoUwwzOhejdM/JiwH919MjCzPjppv7Gj1pbGkMjlyMOKcWgDXZojE9h9ovqSuZ
	WJTxA1FwbQovOMGWgWF/Wv2ETL9+hm38ARmYxcCLETklsp4t763slIt9iSCwdNL0EAt8
	1Xiw1UYK2jkYUJ2vcRQjNSl1ypU/Pv7c/GblK/flhZf9iHgzV2nEt+swCOPKCmwK6JZ6
	tbeIlZzY/z8ZGjcnkBUBabEDou3Iqo2dVjVT7+OzIMD/LwP9BSkWZgwkbWpV8vd+qdcI
	mV7Q==
X-Gm-Message-State: AE9vXwOlpU+G2lwJ0QkgX+3XvZzak65udnbvXC6GjRC9AKoYCxLY5t0Ib7XFNoZQVHe1Ig==
X-Received: by 10.98.34.156 with SMTP id p28mr568263pfj.102.1473349667214;
	Thu, 08 Sep 2016 08:47:47 -0700 (PDT)
Received: from [10.22.11.169] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156])
	by smtp.gmail.com with ESMTPSA id i7sm57474008paf.9.2016.09.08.08.47.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 08:47:46 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1473341630-23751-1-git-send-email-sona.sarmadi@enea.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ed9f52c1-bdf6-07c9-e7cc-d958a24dcb1a@gmail.com>
Date: Thu, 8 Sep 2016 08:47:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473341630-23751-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][krogoth] curl: security fix for CVE-2016-7141
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
X-List-Received-Date: Thu, 08 Sep 2016 15:47:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/08/2016 06:33 AM, Sona Sarmadi wrote:
> Affected versions:
>      Affected versions: libcurl 7.19.6 to and including 7.50.1
>      Not affected versions: libcurl >= 7.50.2
>
> Reference to upstream patch:
> https://curl.haxx.se/CVE-2016-7141.patch
>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>

merged to stagging.

thanks,
Armin
> ---
>   meta/recipes-support/curl/curl/CVE-2016-7141.patch | 50 ++++++++++++++++++++++
>   meta/recipes-support/curl/curl_7.47.1.bb           |  1 +
>   2 files changed, 51 insertions(+)
>   create mode 100644 meta/recipes-support/curl/curl/CVE-2016-7141.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2016-7141.patch b/meta/recipes-support/curl/curl/CVE-2016-7141.patch
> new file mode 100644
> index 0000000..eb03afd
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2016-7141.patch
> @@ -0,0 +1,50 @@
> +From 7700fcba64bf5806de28f6c1c7da3b4f0b38567d Mon Sep 17 00:00:00 2001
> +From: Kamil Dudka <kdudka@redhat.com>
> +Date: Mon, 22 Aug 2016 10:24:35 +0200
> +Subject: [PATCH] nss: refuse previously loaded certificate from file
> +
> +... when we are not asked to use a certificate from file
> +
> +Bug: https://curl.haxx.se/docs/adv_20160907.html
> +Reported-by: kdudka@redhat.com
> +
> +Upstream-Status: Backport
> +https://curl.haxx.se/CVE-2016-5421.patch
> +
> +CVE: CVE-2016-7141
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> + lib/vtls/nss.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/vtls/nss.c b/lib/vtls/nss.c
> +index 20c4277..cfb2263 100644
> +--- a/lib/vtls/nss.c
> ++++ b/lib/vtls/nss.c
> +@@ -1002,10 +1002,10 @@ static SECStatus SelectClientCert(void *arg, PRFileDesc *sock,
> +   struct ssl_connect_data *connssl = (struct ssl_connect_data *)arg;
> +   struct Curl_easy *data = connssl->data;
> +   const char *nickname = connssl->client_nickname;
> ++  static const char pem_slotname[] = "PEM Token #1";
> +
> +   if(connssl->obj_clicert) {
> +     /* use the cert/key provided by PEM reader */
> +-    static const char pem_slotname[] = "PEM Token #1";
> +     SECItem cert_der = { 0, NULL, 0 };
> +     void *proto_win = SSL_RevealPinArg(sock);
> +     struct CERTCertificateStr *cert;
> +@@ -1067,6 +1067,12 @@ static SECStatus SelectClientCert(void *arg, PRFileDesc *sock,
> +   if(NULL == nickname)
> +     nickname = "[unknown]";
> +
> ++  if(!strncmp(nickname, pem_slotname, sizeof(pem_slotname) - 1U)) {
> ++    failf(data, "NSS: refusing previously loaded certificate from file: %s",
> ++          nickname);
> ++    return SECFailure;
> ++  }
> ++
> +   if(NULL == *pRetKey) {
> +     failf(data, "NSS: private key not found for certificate: %s", nickname);
> +     return SECFailure;
> +--
> +2.7.4
> diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
> index 6c71760..3670a11 100644
> --- a/meta/recipes-support/curl/curl_7.47.1.bb
> +++ b/meta/recipes-support/curl/curl_7.47.1.bb
> @@ -14,6 +14,7 @@ SRC_URI += " file://configure_ac.patch \
>                file://CVE-2016-5419.patch \
>                file://CVE-2016-5420.patch \
>                file://CVE-2016-5421.patch \
> +             file://CVE-2016-7141.patch \
>              "
>   
>   SRC_URI[md5sum] = "9ea3123449439bbd960cd25cf98796fb"


