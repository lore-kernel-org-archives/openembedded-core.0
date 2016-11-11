Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id EBFFD60722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 10:53:25 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id c13so9616325lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 02:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=qwYjJc1RSj+75pCotmSsturxCYO9inUfnmijXk9YST8=;
	b=erAvUEDDE2EsqIJMmOCOBCL4/Z03GRIoBTbLbrvcT3ENGzfho7D8LpqpBkmdhJYSfq
	YzxAaXt9H9ln9sDoTzHBfKonyRijsLPtTykkCMOnUcgkWcEN6nVYcX2ZKZGgAT1j7N81
	AJcw1UqdzGrxXZROYrsf1/t/z2lXV9EaeSvDq8MHjHxNaCoLxvs1a/REukNzmNiCO5jv
	5Xgmk12eY1g7h7u/Xo78LazjNzGUkFV0yv8E8tT3LrFcBint8g+xD1HqE6MDW4qDNJhw
	RV3JeWvTIaeMbFT2Cwffex7w+Ny+v03ywopCo5dOqCTWgfvslsTjK7jLZAht9HnnMw0w
	bgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=qwYjJc1RSj+75pCotmSsturxCYO9inUfnmijXk9YST8=;
	b=gjVV+jnVzMU+Yn4xpxuBCUEeueASIrbfkxEplFJGtpnoT5gl71y05CjIdoozITbTOC
	VZCIiVjEHr1tuxnhUlI7VOVXM8cAJfzU5rV3GxQFyxSDsN0Q/B7H5sQn+O4eUpHPCArZ
	ca1IGeamv66aliuESWbfSvOlV6YffYEZBZi+pU1XI4nE0i+N7p3Oosgt7eS1ByMjmOxH
	gvRoKharj6c0X9fCThi9zV/0Z49eWs2uH64bsVGGqSB1rT6EeWmNJWujlmxOcjdVigHF
	QU3At00kUIRJkPebGy0p9InsrkjxP2KNbccDk7HxL7DiQRXd18Fvu+Z7JqpmN98qYdRP
	BdgQ==
X-Gm-Message-State: ABUngvdtmZQQfA5ZH9/dSS6vGMDIV28k4SoxYusmxwZDkSNPvo3uLvsXoTuUJeA4YXW6pw==
X-Received: by 10.25.213.68 with SMTP id m65mr1056203lfg.43.1478861606828;
	Fri, 11 Nov 2016 02:53:26 -0800 (PST)
Received: from ad.chargestorm.se (213-64-218-49-no126.business.telia.com.
	[213.64.218.49])
	by smtp.gmail.com with ESMTPSA id g5sm2089975lfe.47.2016.11.11.02.53.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 Nov 2016 02:53:26 -0800 (PST)
Date: Fri, 11 Nov 2016 11:53:24 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20161111105324.mpmn7grsyw7uoqtw@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1478857754-61379-1-git-send-email-sona.sarmadi@enea.com>
	<1478857754-61379-12-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
In-Reply-To: <1478857754-61379-12-git-send-email-sona.sarmadi@enea.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20161104 (1.7.1)
Subject: Re: [PATCH][krogoth 12/12] curl/url: remove unconditional idn2.h include
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
X-List-Received-Date: Fri, 11 Nov 2016 10:53:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Sona Sarmadi <sona.sarmadi@enea.com> [161111 11:15]:

> Mistake brought by 9c91ec778104a [fix to CVE-2016-8625]

Is that patch unnecessary for some branch that this is either
cherry-picked from, or cherry-picked to? Otherwise, squash this one with
11, there's no need to have a separate fix-up patch.

Cheers,
Anders
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

