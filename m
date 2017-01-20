Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id ECC7673173
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 15:13:24 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f144so5649913pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 07:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XBpezQVQkFt64hvV7y3wujVeAge53hzSBfcWvSXl1Jw=;
	b=g6tphCytCnOe1Zx4D1Yt2K3wa0FAzDIDZzolqqZ7SZxjiouvbQwPCKCWFUR06azO7q
	kc41oymRk3xCrmN59tT/Fs41YYgNa4WCVgdScoA5qcHGlWzNNe7aQHLZOcp7S2TsIXGG
	TtHUcJmx7WbS8Y5+2wc1LLX4/YtQkn/zDdkDwZ1avuAznFWC0JgYJXXeZjk2UeP4z9E1
	BYxgBsuXIAD5jpg8sP6tIE6fcVj8zvIQ0vwqIZwXpvVQGpYCwLoycr/7U/WKfTz0XQru
	a00CO0k9McVBsfaY0fKNrAXZF1mPkpAFhon6JwDRK/2MQeUl9or0WiEiID/sZnEjAE/r
	Ohjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XBpezQVQkFt64hvV7y3wujVeAge53hzSBfcWvSXl1Jw=;
	b=eYZjC182CLkxkWE64KCalSp444oMmnlr/NuNaqpeFOKy6v0wjc1xGifjKA94BzQ2D1
	ySpy7FgHlPpmNxiJ/UxJdAiY7EzOdAsZU96gmq9C4yHiZyYqx/H6ax/yr7zhW9FOC1aY
	xEL2YPEGp+PEKmDRMYHxLlT0Z1StyH0WAhYgTKzNJPo5eSuCuNU6E+OXekWV61SGwpFM
	xQWjodRPzPmefK9nQ9lGPxj+hLE2O57w2tdDCBsArgs4IB1ngTIpCaqHX1K1N9I1gxLU
	iGs/06/TaVneaK9unP60X4Ry4k75fnFGYg3aQQECX60kLBmajTE1V32oVGL7JOlyULHQ
	V+Tw==
X-Gm-Message-State: AIkVDXJUjyRxO8D4aFACqjEaVkYQgpyhTobneY1fpWZ68N+1nnAJemi6ML+SDWx2zDSuWQ==
X-Received: by 10.84.210.35 with SMTP id z32mr22514752plh.112.1484925204695;
	Fri, 20 Jan 2017 07:13:24 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	195sm17703407pfa.6.2017.01.20.07.13.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jan 2017 07:13:24 -0800 (PST)
To: Max Krummenacher <max.oss.09@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1484915651.4907.9.camel@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <d08ba5b3-380e-a315-80dd-4a374150cdd1@gmail.com>
Date: Fri, 20 Jan 2017 07:13:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1484915651.4907.9.camel@gmail.com>
Subject: Re: [morty] backport request: nspr: set correct version in pkg-config file
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
X-List-Received-Date: Fri, 20 Jan 2017 15:13:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/20/2017 04:34 AM, Max Krummenacher wrote:
> Hi
>
> Can we backport the following commit to morty?
got it.
Thanks,
Armin
> http://cgit.openembedded.org/openembedded-core/commit/?id=cb4f5ecf32006192baaf41218a3d7b43ca1c2951
>
> It fixes pkgconfig to no longer report an old version.
>
> Currently this breaks firefox in meta-browser morty branch.
>
> Thanks
> Max


