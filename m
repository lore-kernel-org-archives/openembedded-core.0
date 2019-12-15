Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id C587E7F7BC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 12:53:13 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b72so1640063wme.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 04:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=MMHBkygMNdwJZhfRyYZHIK+EIwquBB+O16UIqogjX6g=;
	b=bxZOA+FidLow8oURuIBpfT0T5WzE8L49LUxcUE1y0w/8/sOaD2PRjh/MVbNTkJ5zph
	1HKxYC6EWwh/9p7Guqksc2oKuuIKTEq2fZf+FrwnhYvEjAfUUgJ4eZw3D5Yb/ScIozDZ
	9OOeotAQWHkLeL0tkVudXfa1FtPHDIqWPDDts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=MMHBkygMNdwJZhfRyYZHIK+EIwquBB+O16UIqogjX6g=;
	b=GfU3Y59ftCVMyAZw+bsxMZmUgKVjHpcPZErxx5Qr3k43NhMX3gtTPXHvnWthGRF7Yw
	gi13ZfhDwHVZv0F54Ezif/yd5eArbCR2QbjlJUCsVQrbNX9uLe9NnHrBseHG076nDedg
	29lr86kvD+LkQ5BbzO9KmAKJEbiO4deyrfUUUeXo++ucr0t/IW7mH/pggGXXN5Y/KC74
	ojv9dpkgH2xXONl5rk58caY5uKF9P7V2MQNxZKhgBdkkFyfTQHx/kcQSOsYYp3TIvzDb
	xpcK+O3ltDsR9lnlYz1kFM0jsKBy7qCam7OBS0Y32tjSNHDr+98x6u5Dqoqz6jHtG3N7
	9ryA==
X-Gm-Message-State: APjAAAVCjhYzm0yN9Kf/tIG43qDa9zuin6XbJuAHo5RkdvyNipzwL9D3
	C09JD36dEHKoHTzGNr+iHLd5yQ==
X-Google-Smtp-Source: APXvYqyht63vUoapoOs2sDmr92fCafM+hx5uRDULUKWNEZ5diY1Aih4+jqvIQAxNDD14iFvDluubAg==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr25282639wma.62.1576414394486; 
	Sun, 15 Dec 2019 04:53:14 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z83sm17909605wmg.2.2019.12.15.04.53.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 04:53:13 -0800 (PST)
Message-ID: <e4288403d08c96589c285bcb3fb5ccda219809a1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 12:53:12 +0000
In-Reply-To: <20191212181436.1322-20-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-20-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 20/30] lttng-modules: update to 2.11.0
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
X-List-Received-Date: Sun, 15 Dec 2019 12:53:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-12-12 at 19:14 +0100, Alexander Kanavin wrote:
> Removed the bleeding-edge variant; if it is still useful please
> maintain it separately.

Its needed due to people using varying kernel versions and in
particular by Bruce for testing of new kernels.

Cheers,

Richard


