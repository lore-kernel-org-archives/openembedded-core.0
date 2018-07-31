Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id BC85F74589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 15:46:41 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id v8-v6so28811236oie.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=io0W02+eviw3DQQmMsXpF/eYQEwScA/XIP9WIusSHbA=;
	b=g84GuXn9XA2oDqE4ChDPKau6Bc+cXiZeyvP0yOnGMhoEomuwndzLz5LAK3qJ4/o12b
	eW9OlHv1fWkgPZHsrkijwOJ1x2lqZ4gOQh6rDbHidBfBxrqL3EK0k8SGGCo44Jml92JP
	pJT59zQBYXT2JEGLg0fv7UCPxeA/H8c9o/D3IWPg+CuZWC4eY5zzpnXxCTavvVEYE/IH
	4Dq93x+0KRF5nzzH9iTCBIEh7N8+n4yX/YWoN5b8IxpjrCaGzchjYcfdxOiJ9fOMAIFF
	TxsLr317ar07cfq+ek7mCDyRejavUjz69jtRdYQbZqgA0vLkesvKNOA5sAhqqkHkOWLu
	0Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=io0W02+eviw3DQQmMsXpF/eYQEwScA/XIP9WIusSHbA=;
	b=n395cGcGV5mdJi0N4GSl63KuH27vImg1u98NOO22WJQjLoyHQ9e3Nks3NGq7T4hI8P
	Ycl+cBYECU3AVduv6UBi8H6MjgOFAzJmMq9LE7G9LnLbQZ6ms3vT2HCGC3aa8JidNRQt
	6OQQRA69GnpDmMQzO/5pEX+I4qp1Dz6qlLBVtK126cZ7N2/nxmL7coWbusO9kim5xzl+
	RTSSVuhlZ3cHN12eZvAHoyU5dOskUF3sEesaDmKIPMlrjWrAL1DWlSCmZ4oLYncispZS
	0bNM3CFps7sEiE3kiRxYLPWy8FPCaQ/3szOSlJRDORxteyxeT4h2/EmTwGMDMZ+v243P
	o1nw==
X-Gm-Message-State: AOUpUlGBfi5C5BcdqGs0Kv6H0P9IWXpF9CfeIfyeYcAT3iBRnEhKKVEK
	jr1ff4aw1Q1UzOAUX7Q5nd4CbChd5g/9XLNb27A=
X-Google-Smtp-Source: AAOMgpcYfZho/seWGr1KicsZrerpwO7lYMShu9d/fgthcvaV9qWOSi9JoLBT2sxbZxDuKM9llH7dXD6AHsfx+mb7z3I=
X-Received: by 2002:aca:4782:: with SMTP id
	u124-v6mr24122929oia.45.1533052002607; 
	Tue, 31 Jul 2018 08:46:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 08:46:41
	-0700 (PDT)
In-Reply-To: <619fe34cca9bc682823913d12cc88486f8458d72.camel@linuxfoundation.org>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<1529783581-46179-9-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<575b002da9b0b86490a3eada07f254428549965e.camel@linuxfoundation.org>
	<33D4DBCAC5F2D74E96B07F6E7632BF738709F509@G08CNEXMBPEKD01.g08.fujitsu.local>
	<619fe34cca9bc682823913d12cc88486f8458d72.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Jul 2018 17:46:41 +0200
Message-ID: <CANNYZj9aNrxLyUvntPE7=kkMtrR-0GgHxvZvyu_+Ze+zH3vHGQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] [PATCH v2] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Tue, 31 Jul 2018 15:46:41 -0000
Content-Type: text/plain; charset="UTF-8"

2018-07-31 13:15 GMT+02:00  <richard.purdie@linuxfoundation.org>:
> Why not add some dnf like wrappers around the eSDK though? We have
> tools like devtool and recipetool but there is a lot of potential to
> add a simpler interface to enable these "customise rootfs" type of
> workflows.

For what it's worth, I'm just now looking into an integration process
of one of automotive tier1s. They use a similar, custom developed ipk
tooling to add pre-built binaries to a pre-generated rootfs. So yes,
I'd also rather have a standard, common solution for this.

Alex

