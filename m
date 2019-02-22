Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B94107CBCE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 07:25:51 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x10so968930wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 23:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=yk7UMIzcANFytMCm3UeuKmnVO36z8/qJTPeIgonv2BY=;
	b=Qlsl6WIcNn3S73vXvPCWzuDg7bHf1UFrvV9ZyQh3dcK6BUyB++kfuY6wECv4BVDz8K
	n4DWUSfXWmQPwRPbcXMhHqz5PZLUBmh5fBXkSHjxjPBRuqMsGZAUKw7FBbPVW5Al1PzU
	zm5la2GfLDdlIoykl1Odf22yTaNpgNKYOZX84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=yk7UMIzcANFytMCm3UeuKmnVO36z8/qJTPeIgonv2BY=;
	b=PujYKtOJgFnD3WAzbkN5Ow3Oafqvi4l+RsL7DQeRl7h4Ths7tNa+w/iHFjabjJH/EL
	8bSBYp3uLcyCpVj9wihJrdCtTZ2LwBd4WuqoDpg3VgchWRQJG2slfKuy0vVpoZv9TeU/
	CA9J0aSmJu8Td7gj5NtZ38CkM5QiUvqxLKdxr6P06QwVOsoNZ9Nr/couTYNwbqyGkMDf
	CTHLKiuLaGRYB/vlm9gZmkWtJYjD7tpwb10NhBbdaympNbNt9+pDC/GM1XqhvMczQlr4
	mY+Epp+fXFGqsSAOpIDCP6S2qijEgilabSTE9S26suweCywnva9r+2qmXl+XNg8PNiuw
	nMEQ==
X-Gm-Message-State: AHQUAuazY4UOT0bqIib4Ur+WU0lmsVx1tWGlxnrAh1H+zy22toUTFaCT
	ja+ga8wuue5giKOaoT02gmpuCg==
X-Google-Smtp-Source: AHgI3IZlwXWACCq4A9fV1gJMdKw/cBIyJ4pGSKG3RRwUsyzgrUpM49FVnttuQqG08mAmZujZh/5wEQ==
X-Received: by 2002:a1c:7a1a:: with SMTP id v26mr1385312wmc.129.1550820352226; 
	Thu, 21 Feb 2019 23:25:52 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id k6sm1331672wrq.82.2019.02.21.23.25.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Feb 2019 23:25:51 -0800 (PST)
Message-ID: <7a1ce7ab12631b1980d4815ee955d10958275f1d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tanu Kaskinen <tanuk@iki.fi>, openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 07:25:50 +0000
In-Reply-To: <52ec539cbf4ec7511f1259fef31e0c13244b0836.1550779769.git.tanuk@iki.fi>
References: <cover.1550779769.git.tanuk@iki.fi>
	<52ec539cbf4ec7511f1259fef31e0c13244b0836.1550779769.git.tanuk@iki.fi>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] alsa-utils: 1.1.6 -> 1.1.8
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
X-List-Received-Date: Fri, 22 Feb 2019 07:25:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-21 at 22:13 +0200, Tanu Kaskinen wrote:
> SRC_URI was changed to a more reliable source (at least currently the
> ftp server is flaky).
> 
> [...]
>  
> -SRC_URI = "
> ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
> -          "
> -
> -SRC_URI[md5sum] = "50ae75567459646b843bed78d916b002"
> -SRC_URI[sha256sum] =
> "155caecc40b2220f686f34ba3655a53e3bdbc0586adb1056733949feaaf7d36e"
> +SRC_URI = "
> https://www.alsa-project.org/files/pub/utils/${BP}.tar.bz2"
> +SRC_URI[md5sum] = "54d6f9b483144823d0fc0c26e8cea028"
> +SRC_URI[sha256sum] =
> "fd9bf528922b3829a91913b89a1858c58a0b24271a7b5f529923aa9ea12fa4cf"

Thanks for the upgrades, its much appreciated!

I have a small fixup queued in master-next for this, the SRC_URI uses
alsa-utils-${PV} because of the alsa-utils-scripts recipe. I'll squash
that in when merging if that is ok.

Cheers,

Richard




