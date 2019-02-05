Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B67737BFFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 21:52:15 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g67so568504wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 13:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=XGJI1XuFLTqdhW9Ei447w7JaU1t3orTPtqhm6h9KkqQ=;
	b=AwIqbs6Y3c6oIXpFEVJJS3br4kNBjO1wGyUWMh2fH/LcLIxX8yZjyQbL+rk/kKdBeV
	PmIF3yU/eBmetVHDPTOS5I80YsKM8uAiWqgQI5nSNeSWexLtS2j0WPrd//0JhzY3CM1L
	JgtTkpnDPqg7Nl/EfAV+ZvNMp9wTISURaZLNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=XGJI1XuFLTqdhW9Ei447w7JaU1t3orTPtqhm6h9KkqQ=;
	b=iVMfF9DY9Bx0r3CUDtQmQIhoKu21PwbLP5GksuvgCQ8bizg1uRoRlC0lXCW6nADzOV
	alwVXOkz60r4chIRsOL+00iEUYcYA6Put5L02WN68pyivglDSREePN3F696PdqoDJhwZ
	qoNx4fvShw4kaBIK7hfHSD06HGH65+9TjIaqWbsJaL9O3P/T0kjE1YE5B2BE1mamUbJs
	GOysc4CsMz7dYn8TAiu/Re8jceiZsWGnhEN8vWIN69I1q0N673z4YlrnvgQgm9dqWNLo
	S4BcVjNNWTQ+/emM8Xf75luF02c8g4ZUb2bHeld0vKDHwz5XVA8skYggSwSN3W+8cHU1
	3eIQ==
X-Gm-Message-State: AHQUAub1ZtqXefqcfmcRyktIJvgZ6WDwnXJ6bUS2uCUI7DLBZvNYczTv
	WarYLVyx6R+t3VY9olkqWavFjQ==
X-Google-Smtp-Source: AHgI3IbTMQSnxg1htDYHSZbe1aVt30hcklsDenD01Kekd4r60BGOnR3Aq5PncS01pLmSYbbvVpxeRg==
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr558866wmg.78.1549403536223;
	Tue, 05 Feb 2019 13:52:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q1sm7432030wrs.89.2019.02.05.13.52.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Feb 2019 13:52:15 -0800 (PST)
Message-ID: <9a5432388d2f7cc7b3f8ec52814516a53df72b53.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua DeWeese <josh.deweese@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Feb 2019 21:52:14 +0000
In-Reply-To: <20190205162644.24971-1-josh.deweese@gmail.com>
References: <20190205162644.24971-1-josh.deweese@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Joshua DeWeese <jdeweese@hennypenny.com>
Subject: Re: [PATCH] wpa_supplicant: Changed systemd template units
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
X-List-Received-Date: Tue, 05 Feb 2019 21:52:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-02-05 at 11:26 -0500, Joshua DeWeese wrote:
> From: Joshua DeWeese <jdeweese@hennypenny.com>
> 
> https://www.freedesktop.org/software/systemd/man/systemd.unit.html#WantedBy=
> 
> When building root filesystems with any of the wpa_supplicant systemd
> template service files enabled (current default is to have them
> disabled) the
> systemd-native-fake script would not process the line:
> 
> Alias=multi-user.target.wants/wpa_supplicant@%i.service
> 
> appropriately due the the use of "%i."
> 
> According to the systemd documentation "WantedBy=foo.service in a
> service
> bar.service is mostly equivalent to
> Alias=foo.service.wants/bar.service in
> the same file." However, this is not really the intended purpose of
> install
> Aliases.
> 
> All lines of the form:
> 
> Alias=multi-user.target.wants/*%i.service
> 
> Were replaced with the following lines:
> 
> WantedBy=multi-user.target
> 
> Signed-off-by: Joshua DeWeese <jdeweese@hennypenny.com>

This patch doesn't seem to apply against master (which has 2.6, not
2.5)?

Cheers,

Richard


