Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id A0E8971AB7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 21:28:09 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id p21so155502069qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 14:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PcakhPhH5WUCVHQi21MyUN1+yUDYBj6T0/rQ12Q3hK0=;
	b=eDvZZTFo//0OfaD3VP7mPu7bcdvAdMxJZ2uYQQdmdmeC8R1xyLdkPWzDvk5rXmd9xx
	rbET41eUk4A3SwOIalrTocrBm/p1w3YQMFBriBMY+wiuJAu8JzvaFYL+guVq5VmLEXRD
	gM47FAIyDFp1+t61rZih0buP0oZwtIFFFxybw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PcakhPhH5WUCVHQi21MyUN1+yUDYBj6T0/rQ12Q3hK0=;
	b=FQhVZdHtlK0RQVBsZVw3FFdT48HSzqDNI4WKe/9hPrE61JzeTNlmkHkMHQSYGvkUx7
	66nqwxVM8cy59ILHyCVXEUtJNgMtgn1LL2PwQxFGwQt55FypJ5Br/4PyV+TCjYG28XwR
	Jg7cPn81x4qH9+xd2qMzkunWPwnzHB20zmE+daxRb5cIQx0KyasYZqhKGDMpLjpo2+5p
	afCWcDwS6IIP9UOzkHlHI8VXxYGjinwK3n7UWT6yJrSST5HZRO9Wm9ehTuqMsbHZCFXn
	2dgSqH6bcxHoMcoj6GkrEPdyoNMdfVXcoa0o62Jlsqe4FEGR6hj8Q8E5ai2pShD1Q759
	Kfnw==
X-Gm-Message-State: AKS2vOzpG/3Wx0s+Zp20p+Fwb8uW1LIUMydKEs32BODiJpA/CDpTtqY1
	NXx8HsF4ZohJKXfLMVsWZdhsCWEZvmPVV1iUNQ==
X-Received: by 10.55.100.145 with SMTP id y139mr37156579qkb.215.1499117290822; 
	Mon, 03 Jul 2017 14:28:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.96.226 with HTTP; Mon, 3 Jul 2017 14:27:50 -0700 (PDT)
In-Reply-To: <20170703200210.32229-1-otavio@ossystems.com.br>
References: <20170703200210.32229-1-otavio@ossystems.com.br>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 3 Jul 2017 23:27:50 +0200
Message-ID: <CAP71WjxebfDBUhWAAkPQxR_k6NWGOtnZBm+F+EVobs2b3cDCGw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] mesa: Avoid platform probing when building without EGL
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
X-List-Received-Date: Mon, 03 Jul 2017 21:28:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 3, 2017 at 10:02 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The issue has been exposed by meta-freescale BSP. Fix tested with
> imx6qsabresd machine.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

this looks correct to me, and this is due to this upstream commit:
1d89787a19 configure: loosen --with-platforms heuristics

Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

