Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64D4A6B073
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 08:50:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q9so2014899wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Oct 2019 01:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=+l1iU3OjvXNj37s/OzxUXK8E5whmhI4nIbLeXlzBfjs=;
	b=VE3XMz5cCMUb8G3dsHmBZ1D3iiIMm7RjJQNrvwbtM5hUcACK4rAeqcLTCe0BUCvjcE
	C0y8JirYsfBF5D+MnQJM+OFH0nzBWYJpBsxSz71wlWk2r2C3tcCcK8q/ErAbo+C1UdUF
	aXiTQA/iPo9Mi3CUXlRcDtzX1P5G9n+2ODzg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+l1iU3OjvXNj37s/OzxUXK8E5whmhI4nIbLeXlzBfjs=;
	b=b/HFRsbZCMLhqEfyHD19Gg3T/0Aw5zCW+DPJKgXFtlfgi546NRd07uMz+hQMxm7rSf
	DTpIPJkvnlvETNvkcYahEUOjKlaYd+X7MXIfwztL1vcbCTE9O3eRJVfMqX0DrpMnlso9
	fjhTrB/saOzR5x6p4t/KT1lwuyoxU64x2gbTCHBzOeE4KcDjf9507YeUeL11fOx0fHur
	hoSp4+CFviGO2g/7TrDH16PrShWRiYz5WB2+vy/ivYSrLaAD/8Q28F9qRuUCpv2COo6/
	YzO4XplHbp2MkEvzB05aGwcAmM3UYdkCgp9fXd8yTOZJBUbQvNXQ1oC6nkU5DqYloE2d
	znkA==
X-Gm-Message-State: APjAAAUX7RSXW3STFvZOZyFPZR9APicSEoMcREr28+7XozG65xhoH+4o
	neZ9BXjKYLK4VdAnU1NFzsk4fA==
X-Google-Smtp-Source: APXvYqy6VoQ1+7m03dErx6C7HXlltMKl6oCwkAfnXB+iC/5nXx9NFprhsvjxhXXOaYcNhGe9GaIL5A==
X-Received: by 2002:a5d:5290:: with SMTP id c16mr6176754wrv.381.1570092656850; 
	Thu, 03 Oct 2019 01:50:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id l7sm1834398wrv.77.2019.10.03.01.50.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 01:50:56 -0700 (PDT)
Message-ID: <883252a80598dcc074266fe0ae60046dc3877dec.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Oct 2019 09:50:54 +0100
In-Reply-To: <CA+chaQdY6JESztT2ziw=H4H=qdTTCsUe0uqWuk3C-CfeyMnCwg@mail.gmail.com>
References: <cover.1566540028.git.Martin.Jansa@gmail.com>
	<CA+chaQdY6JESztT2ziw=H4H=qdTTCsUe0uqWuk3C-CfeyMnCwg@mail.gmail.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] YOCTO #12937 - Consistent naming scheme for deployed artifacts
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
X-List-Received-Date: Thu, 03 Oct 2019 08:50:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-10-03 at 10:27 +0200, Martin Jansa wrote:
> Any feedback on this or does it have to wait for 3.1?

This is the kind of change we need to make early in the release since
it means the release scripts, release engineering and potentially QA
all need to update. It was late enough in M3 and we had enough other
issues that I didn't really want to go here then. Please do remind me
early in 3.1 to get this sorted.

> At least the last patch is a fix for regression already included in
> 3.0.

Thanks, it applied with offset fuzz so I'll queue it.

Cheers,

Richard


