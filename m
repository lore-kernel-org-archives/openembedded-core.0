Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 569F378077
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:02:07 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id m77so56941055lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 07:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=g0yKvPCFf8hX+N8/pylaeF+PLJUNXKa/Hf/lLb0fhkc=;
	b=nLnyVk0iX5sToclGV8wRwARRsh1orSZ+t9jMLjKmPhea7UrTUUvVw/1V/M72h4ZmU9
	3Le3SDtygeA8YvaVsOn/MDeCvMCL9WFxk0zrwmj2oBFZWVHZNvH2MeNVK+gtiiwU2ARG
	3Nt1MLCHqzw0tDJQnzEgGSkcZd2VJpr1JjsWtIdQXe8+15IRhLwlL1wdR25gk3qx2pD3
	WEvtHDECJcMlk+VlOFVVtimbX/hQtIg2GE5XRZgFFluEi6tQigsGGB8tNyoiJZD36+vr
	j9sfGhlHkJIX+mtY5v8Fi6E2j0bnC6+1qfym6+4MYWteTZqro9uAcPY+5a9ZaCESNpkn
	cM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=g0yKvPCFf8hX+N8/pylaeF+PLJUNXKa/Hf/lLb0fhkc=;
	b=spAEjjS19/A3nHB+MyRJXKUmf429YZ2vW46KaiVV5I2X9mbYsZ73X/Pft6855ghHtB
	/Cf9AvAoYKVkRrRcrhgBimq/oZ3AA6TDerqwjB6RmGx/UXD2S/NeJ+tOVnB/oVFbSOn+
	vR6GQ+Igh3je5SU0xDPEUo1OtAIEBpfDRdipJJMfyDJnFwqAbYj+u5KyfcWUDBJyldOX
	0WLVHHUma2hkuTmVgY0gtnO88Ts/vSdZYF0+wnHe4QEzIBAadwJeMqptVrq6RliFbnl2
	/NGek30joIlM+Hj9OW4QXmvbvXwNzhy2OlPXswBpuF1miIVAQsp4+xspcgRTqFHFS9g3
	w9xA==
X-Gm-Message-State: AKS2vOxhYPH77bSI93Mc++Ml445ZE8+5QYFexcuxEbs9H82hevdd1ETW
	lz783maWg0TRDPrwuHCygA==
X-Received: by 10.46.88.78 with SMTP id x14mr6074815ljd.108.1497880928429;
	Mon, 19 Jun 2017 07:02:08 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	g79sm3133642lfk.15.2017.06.19.07.02.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Jun 2017 07:02:01 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 16:01:45 +0200
Message-Id: <1497880906-18170-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <e818cf0a-65b7-7b6a-28ed-3b58d4e7d710@mender.io>
References: <e818cf0a-65b7-7b6a-28ed-3b58d4e7d710@mender.io>
Subject: Re: [PATCH v2] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Mon, 19 Jun 2017 14:02:08 -0000

Turns out this needed a rebase. Here you go.

-- 
Kristian

