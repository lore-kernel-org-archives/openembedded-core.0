Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 158DB7C5F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 10:12:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y15so1794531wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 02:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=HBcJC+CTiUpZWryhp0+sIIBC8jSaKnKMtVm9m8pJ3sU=;
	b=Xi4c96ezEwNdK6yFWXAVH8OTXRmWC92+sr1vNYfJBmAPGauxxTha5f7D4ra0jmCGkW
	1/844lBUJRstuua74Tl0pdk0Z4iTveoRVduz1dObHR+a4RrA+yqGJQaWdud9+nb4n5vN
	o7MA4fXxOnqtJZMRN3S9pvx+Pyw2ym4XtRNco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HBcJC+CTiUpZWryhp0+sIIBC8jSaKnKMtVm9m8pJ3sU=;
	b=ZlPxqn967UHkyTdnQYEMRdKm/5mhQs3gO6XHOBgHKNjbpgk9LooMDC8+Mvx/kKBDCb
	PIkGevgztfupHSHmf649rfO2vNIhiddZIK9hEP8oolVuykMzs/EjPA2cIZtTxbWJQoQI
	be9QJ+qn5aD/IGoluwVclctozaiqLji5stmuudhwYFx13wC3nC1O5fVeCG5jg7qMak42
	l55OLIn8zAyv+7e9yKVcesiZPgi8vuxv2qVWOwPnun8CYegFxrJKGqQ8yPX11EnMOthH
	5yLsOyxscTE1IW9RjTrrzcZ1Xx66nZw8bgU8ZnfiEw32cM813JYpUuEfkysKSlMifkA3
	3Qnw==
X-Gm-Message-State: AHQUAuZFLpIWikWSmhlyWpdt3YviFo+yyS4M3JMMlTmmIw/zVu4C9lWJ
	rBTpbA4XBz3MG62lk3Z1gtPDEw==
X-Google-Smtp-Source: AHgI3IbHWotsWQ71tMSXJaNxjzUHnGhRqUG4bG3OMo+pukJ/SXjDh/Uk0uiHtvnZb5MR8OlsDs2ynQ==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr15249051wmk.149.1550484737645;
	Mon, 18 Feb 2019 02:12:17 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h17sm8319200wrq.17.2019.02.18.02.12.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 18 Feb 2019 02:12:16 -0800 (PST)
Message-ID: <f4c88aab6ff934328e03be66ade30d04a679e65f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Feb 2019 10:12:15 +0000
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D043481860E7@PGSMSX109.gar.corp.intel.com>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
	<8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
	<8f156c0c1b0cc7fe18bd25a03a8f5f0cdc4f422d.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D0434818607F@PGSMSX109.gar.corp.intel.com>
	<f8f1b23ffe248d9ad469b25ed2226fa426ed152c.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D043481860E7@PGSMSX109.gar.corp.intel.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Mon, 18 Feb 2019 10:12:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-18 at 09:20 +0000, Yeoh, Ee Peng wrote:
> Thank you for sharing on the selftest comparison consideration! 
> 
> I agreed with you that in the high level, selftest should be
> independent of which HOST_DISTRO, it shall compared 2 selftest even
> when the host distro are different. 
> 
> But in the case that the build have multiple set of selftest each
> with slightly different environments (eg. host distro), in that case,
> will it better to compare selftest more closely if possible with same
> host distro used? 

In an ideal world, yes. In reality trying to do that and making it
conditional will complicate the code for little "real" end difference
though?

Cheers,

Richard


