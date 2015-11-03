Return-Path: <ruslan@babayev.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 35C6B7702B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:39:21 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so30925088pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 14:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babayev.com; s=google;
	h=references:user-agent:from:to:subject:in-reply-to:date:message-id
	:mime-version:content-type;
	bh=vTHwLG6CtNpuQhn704sr7whkbRzXPrCIYjl+qsanbZE=;
	b=XpE1SZLZ7yldLj7VxW+bTd/x2Yz4NSicFeb1qUNgE4Qyamqoq/L1oGP9iLFUSr5B1p
	eN2qlPByWdCir7TOLP9wrLzLo1NdzUf/t/Xy36mM00Wi1zP1+e2rYpzM/1DUqW+smuB1
	H5Sexi0uvgAVrLQC9gwLMC4rKC91t6Kw0gcUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:subject
	:in-reply-to:date:message-id:mime-version:content-type;
	bh=vTHwLG6CtNpuQhn704sr7whkbRzXPrCIYjl+qsanbZE=;
	b=Jlm+OhTAhD4zMgXQKV3VHTELVD986P+zAKkR5l4jFsZKxaLdbk8R9RaL+j5ZjwbNeQ
	y2T065iRXjIRwI74nsZk4Qh4AeUrbv+5azynBHkroRGLDFjferqSfaHpUvmtuvdxxuN4
	Rwz5l9aVJp/LQ85bTr/pXTHzM18yiPtRuZb6A99pT4KH12SzOLGsWKawnzeQGfWwsZ8Q
	vYrUTAXCBfLvjqvanab9ILObcUXe1yAgPWxiTUCwzbFrm/siELIsJHCoi4CtoC0BBGaZ
	dI/D5jVFHHjhpSJMDeUX5GXuSYnDfk0nnSsY+gCBTABeg+J8UK6YxudZ8VZSwVHvJfnH
	oJNg==
X-Gm-Message-State: ALoCoQn5AOmxSCirSj8A/qpfVjdX5rpRGFEyFyReh44JXJQT+EqncJMtChuwmyOog6nANRsYfXJo
X-Received: by 10.68.217.194 with SMTP id pa2mr36632150pbc.105.1446590361851; 
	Tue, 03 Nov 2015 14:39:21 -0800 (PST)
Received: from localhost ([50.247.64.110]) by smtp.gmail.com with ESMTPSA id
	rc5sm31314371pbc.95.2015.11.03.14.39.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Nov 2015 14:39:21 -0800 (PST)
References: <87d1vqk67s.fsf@babayev.com>
User-agent: mu4e 0.9.15; emacs 24.5.1
From: Ruslan Babayev <ruslan@babayev.com>
To: openembedded-core@lists.openembedded.org
In-reply-to: <87d1vqk67s.fsf@babayev.com>
Date: Tue, 03 Nov 2015 15:39:21 -0800
Message-ID: <87bnbak5zq.fsf@babayev.com>
MIME-Version: 1.0
Subject: Re: Add LibreSSL support
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
X-List-Received-Date: Tue, 03 Nov 2015 22:39:22 -0000
Content-Type: text/plain

Sorry I meant this:

PREFERRED_PROVIDER_openssl ?= "libressl"
PREFERRED_PROVIDER_openssl-native ?= "libressl-native"
PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-libressl"

Ruslan Babayev writes:

> Please find attached the patch to add support for LibreSSL.
>
> OpenSSL is still preferred, so you'd have add these to your local.conf
>
> PREFERRED_PROVIDER_openssl ?= "openssl"
> PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
> PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"


