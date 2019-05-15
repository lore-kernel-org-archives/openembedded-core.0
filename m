Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4F47BD72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 20:07:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id o189so1311826wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 13:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=9uHI4FHawzqbKBlpEkcr00vVyP0nHFoduQh6pzExho4=;
	b=RVhjQGU+sjA+TJCfvWNSZHv4O/Dzb48lKeWyRGMThQLvPpUs7eDKZWDGIpeVT0W3Oy
	6K8GPCb8ACT/7jrIql2N9bTxFUtC0pabqD5txjkPj9bS6LJ6JsKn3ngkFd3d60urDTaC
	YdGDh0ed5M/sLG3cjPnXXP/Ku7hGFYO6q/374=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9uHI4FHawzqbKBlpEkcr00vVyP0nHFoduQh6pzExho4=;
	b=kVY99HGDZRA8LC+4Xg1wbrRx355gwDiQObf9gqIqvo3QUKzBJEKvgg+KxELpL68JIc
	a3oMjRnrnB2N0KJTzzhLx8cA6Ux9DbLlknHVD2y6UbjlbXh3wrp5AXS+ETBOTwcZNymB
	kq5mtpqmqP8D293nQDxhrOceVDZIFd4SdUVBcLnCA03jvz47m2LT4M6STKZQxEb4yc7E
	YEnY5HEvPuMG5EgtrlnDGZ5EWNVwnzI2qgScb3UfgO2ztdNCbSRHMdNg4lwKP5jdZmjP
	G7uzepyS9aQOvdRz4l+Q9MlG4WyEAP+UXD1VGaX05oQIL1ihNZbZew8E4xomf7jLLcRx
	VBNg==
X-Gm-Message-State: APjAAAVKFWFor48eDUWMhQHN4IpVkkUzVl1Lt4JCtibbI94Zzh7NRbNV
	t6IxSt7TA2L8LIJcgLCZAJGy4g==
X-Google-Smtp-Source: APXvYqz4B/Gi5xFULLH/uDUFLCROVPjTwD5LIfELlBd2sGSX6keBcqTdqckdFzBA1jTX2Jq2Zk8HTg==
X-Received: by 2002:a1c:3c2:: with SMTP id 185mr7020131wmd.91.1557950872083;
	Wed, 15 May 2019 13:07:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b10sm6612466wrh.59.2019.05.15.13.07.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 15 May 2019 13:07:51 -0700 (PDT)
Message-ID: <b578fb2cf8678888f069c7565d9a94c89c1adab0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yeoh Ee Peng
	<ee.peng.yeoh@intel.com>
Date: Wed, 15 May 2019 21:07:49 +0100
In-Reply-To: <CANNYZj_kU12GxGk8Mi2gOyPNuQVyRbe+9BzCpxvOYKdJ3UEKMQ@mail.gmail.com>
References: <1557888470-57934-1-git-send-email-ee.peng.yeoh@intel.com>
	<CANNYZj_kU12GxGk8Mi2gOyPNuQVyRbe+9BzCpxvOYKdJ3UEKMQ@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oeqa/runtime/cases/rpm.py: Enable rpm install dependency testing
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
X-List-Received-Date: Wed, 15 May 2019 20:07:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-15 at 21:43 +0200, Alexander Kanavin wrote:
> This needs the same condition guard as other rpm tests, e.g.
> 
> @OETestDepends(['rpm.RpmBasicTest.test_rpm_query'])
> 
> should be enough.

Yes, there were failures on the autobuilder from this, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/602

https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/596

and so on.

Cheers,

Richard


