Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8138A7D2E0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:54:05 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k17so21463009wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=VRxb8GDEPvht/uh+57ZvATHd+txcTu2PekG8F2RhXmM=;
	b=CX1ZD3juQgzU6kaFhAa8qIw7kvOpdhqLLX0pHMk9wZNAtz/KK6JGWjAXUxxc8GuM8c
	lz73gx1BLTP/MdHDTlP1je8w99oOXxAXK1CZ5D2gcvtbvRxIVc1c23m6ltc8EtWMubLG
	zC3V0GdBAOYo+wzSXVhESvdmQJ4LR8CSzDaPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VRxb8GDEPvht/uh+57ZvATHd+txcTu2PekG8F2RhXmM=;
	b=qyEs7B2GyZ086nYiYq2uQ9KHK8AF2SPHm4GSka4aefumtueTU+n0L9ncz+ao/aDqtz
	CmXBwVA740+QuRCsRqlfcHorubrMgyrVQ3krjbOF3XYyNd8aOKXsuppePMHeWvcGoc69
	GP4cRpKfQaCEEtyjweC59IeqDLsqsT/hPa4+krrWL/ZiUbysHiHWFmoNgDtlgE7LFR97
	xuKZcVPLs2nImFdPtKOvO1yfo5MRjYUalVAIq1+qGwr/N2Z4OTcoi+cG4On2O9LnGTAu
	tcRfaeKmd9BhzebGdXi/uIjqPqBz/PsNzxWy1hk0ra7SkFH/Z4gG6uf+gIXo4N6YesF8
	M6zw==
X-Gm-Message-State: APjAAAW6cCPvB1BDQTgKoTH4JXOA2QpaLRDSG9YF2ErxsF+HKcCVrLqn
	fmQ7hXZ/EnwXYP1QIcmst8MZuQ==
X-Google-Smtp-Source: APXvYqzlcj62zZ985BKTrK7WrpBXJsEl31gUvYCzMwxIVtGSqjzAQPFfOO2yLE3aI6M74I+1sM2pig==
X-Received: by 2002:adf:f1ce:: with SMTP id z14mr33118448wro.152.1554299646271;
	Wed, 03 Apr 2019 06:54:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v190sm41091077wme.18.2019.04.03.06.54.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 06:54:05 -0700 (PDT)
Message-ID: <b81178abe3687349967473ab48fadef48cff088f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Bach, Pascal" <pascal.bach@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 03 Apr 2019 14:54:04 +0100
In-Reply-To: <355BE46A91031048906B695426A8D8E62EA2ECB0@DENBGAT9EL2MSX.ww902.siemens.net>
References: <20190401121654.27469-1-pascal.bach@siemens.com>
	<355BE46A91031048906B695426A8D8E62EA2ECB0@DENBGAT9EL2MSX.ww902.siemens.net>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] cmake: 3.14.0 -> 3.14.1
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
X-List-Received-Date: Wed, 03 Apr 2019 13:54:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-03 at 09:20 +0000, Bach, Pascal wrote:
> This patch should also go into warrior as I think we should not ship
> 3.14.0 due to the issue mentioned bellow.

Thanks, will queue this in warrior-next.

Cheers,

Richard


