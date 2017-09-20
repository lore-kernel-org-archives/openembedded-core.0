Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0048877E93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 19:30:28 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id d8so2231303pgt.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 12:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=SOyyF+KSwH8+Ise05A0enJUTI9JZvEzroX0I+kTcm8g=;
	b=kdunxA/d2XvpwarCLx6ILXEKOeg+H4oShAR8OARFxqSJcrTIPoh3t6qTofux4co3RY
	pvNDSl9dTRa9/chOu/gCWDBmlisR7sAvpGJKcLjzT1dpIcbXca3T7RwM/UTfEfejaII0
	Hv5ByftxSx/qV0I1IRaM3SLTM4JZiaB9OopX6uFaY1C4Ue+kFmnIhxnW3Pdj2uRGvkYN
	TBjhXo6eEd8rvbDdT5J/tUQ+4vzm4gwScPdXaQltgU2KedzfFZ/gxOsCXdUdBFm79JVc
	UjIrSqIsU1xgJihVndNgPFc3tTPtxOTQh96h8HndfmC2H3Sz+rGVypm6tXZj67n3z/h/
	Zchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SOyyF+KSwH8+Ise05A0enJUTI9JZvEzroX0I+kTcm8g=;
	b=jtqqyCGBSAjmSbAFCASf3dNShVkwM+PwrVuMl7yvt+xmqdZ72RbVLkA67El+ErmNu2
	caBeJ6m+zrCelPQXx1bhESwKC502Rjd4VH1WchFuxvVytK+oTyejNa/qE4+sIiHA+fYv
	VEaJITCkGXSMS1Sl03tEqNt20c8BoBO+EXLhDA3UQgzqxEQR3iXBUc/prW9j+rphXBj/
	bguo1zUM+4oxkTz/H/iq+gtgsTZnz3wZdNXgh2806P/pzz04mFFbmXfHZVRuxI/ZDREo
	r96ZSdqwEq0AUEI2QLQFjhpoLogisY+ugLQPSG9Xn1RygFwhZwl+ydvaml1xMaTmrnCz
	dMEA==
X-Gm-Message-State: AHPjjUhsR/udrLd4DsOc+xwwkQhgkPmttDDDJqE+055nbmLX6NdljXiZ
	tCS/NdOEvTCrNX9ut1RreDicAQ==
X-Google-Smtp-Source: AOwi7QAlsuCMP6rBkcicth9H/PXTeryLrr7sFIpRKTcbj4devTKp70SYMsFjD70Iz8Yp8TWL5Qpigg==
X-Received: by 10.98.59.66 with SMTP id i63mr3226951pfa.31.1505935829349;
	Wed, 20 Sep 2017 12:30:29 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	g16sm8691608pgn.62.2017.09.20.12.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 12:30:28 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170914122753.12713-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c93c3583-f1aa-bf91-c86e-bde0f6229592@gmail.com>
Date: Wed, 20 Sep 2017 12:30:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170914122753.12713-1-ross.burton@intel.com>
Subject: Re: [PATCH][morty] bluez5: fix out-of-bounds access in SDP server (CVE-2017-1000250)
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
X-List-Received-Date: Wed, 20 Sep 2017 19:30:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/14/2017 05:27 AM, Ross Burton wrote:
> All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to an
> information disclosure vulnerability which allows remote attackers to obtain
> sensitive information from the bluetoothd process memory. This vulnerability
> lies in the processing of SDP search attribute requests.

merged to stagging.
thanks
- armin
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
>  .../bluez5/bluez5/cve-2017-1000250.patch           | 34 ++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index ecefb7b593e..3421c382063 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -23,6 +23,7 @@ SRC_URI = "\
>      file://run-ptest \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
>      file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
> +    file://cve-2017-1000250.patch \
>  "
>  S = "${WORKDIR}/bluez-${PV}"
>  
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
> new file mode 100644
> index 00000000000..9fac961bcf6
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/cve-2017-1000250.patch
> @@ -0,0 +1,34 @@
> +All versions of the SDP server in BlueZ 5.46 and earlier are vulnerable to an
> +information disclosure vulnerability which allows remote attackers to obtain
> +sensitive information from the bluetoothd process memory. This vulnerability
> +lies in the processing of SDP search attribute requests.
> +
> +CVE: CVE-2017-1000250
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 9e009647b14e810e06626dde7f1bb9ea3c375d09 Mon Sep 17 00:00:00 2001
> +From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> +Date: Wed, 13 Sep 2017 10:01:40 +0300
> +Subject: sdp: Fix Out-of-bounds heap read in service_search_attr_req function
> +
> +Check if there is enough data to continue otherwise return an error.
> +---
> + src/sdpd-request.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/sdpd-request.c b/src/sdpd-request.c
> +index 1eefdce..318d044 100644
> +--- a/src/sdpd-request.c
> ++++ b/src/sdpd-request.c
> +@@ -917,7 +917,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp_buf_t *buf)
> + 	} else {
> + 		/* continuation State exists -> get from cache */
> + 		sdp_buf_t *pCache = sdp_get_cached_rsp(cstate);
> +-		if (pCache) {
> ++		if (pCache && cstate->cStateValue.maxBytesSent < pCache->data_size) {
> + 			uint16_t sent = MIN(max, pCache->data_size - cstate->cStateValue.maxBytesSent);
> + 			pResponse = pCache->data;
> + 			memcpy(buf->data, pResponse + cstate->cStateValue.maxBytesSent, sent);
> +-- 
> +cgit v1.1


