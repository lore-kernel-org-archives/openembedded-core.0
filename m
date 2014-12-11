Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2547165D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 23:14:10 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id z20so541096igj.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 15:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=B03mDZXc9oFEpeEU79Y5SS0tumCA5MCkIcdDS0aFpto=;
	b=TTxUWuqLMKwNy/p02Gm6qUAcDnZjsjS9nk3ZO8qP1S4LSyX+voa/EjZdZlD9LldJaF
	w+DhDkQYJhlnCVu2PqlqS74WuwFsEdOcTq/2wdtfjg+Z90RMTJ0JHDGX1TCMs61Zh2Fg
	kNiKsDxcEFLwzGt8kD0Eg5bMlwEgOTRVcuLeh/XjYYm1vVjPPyhiAwJjWGDxqO+qc9T9
	dD3vShrTw7U7JJ1qqAmcjFXmvLktFGaVl8o0nPL5kFFAmtyMgVGZccdE9Y1RWx6B95NT
	4Vv9CE1/Rq21LD6dfuGBLCuds++gS5ESPsR+4TYuLEkNyOq/SvXYPxFZx3YK9gBFwvXC
	mEWQ==
X-Gm-Message-State: ALoCoQkuH5F0LZW0eRMgZJIPB7yWVelPdVGVFHP/RtMoapEeWsMpcM/veh6fIJhZUuS1wPDR8JLN
X-Received: by 10.42.167.1 with SMTP id q1mr13638907icy.48.1418339651431;
	Thu, 11 Dec 2014 15:14:11 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id s10sm480400igr.2.2014.12.11.15.14.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 15:14:10 -0800 (PST)
Message-ID: <548A253B.8070401@linaro.org>
Date: Thu, 11 Dec 2014 18:14:03 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<5489EDA6.1000709@linaro.org> <5489F3EC.1090206@linaro.org>
	<1836192.Oio3XIGmkc@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <1836192.Oio3XIGmkc@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Thu, 11 Dec 2014 23:14:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 12/11/14 16:35, Paul Eggleton wrote:
> Thanks for the quick bisect - I've fixed it so that wrapper is only used when 
> running bitbake through "devtool build", and now "devtool add" works properly 
> again. This is why I should probably write some proper tests before trying to 
> do anything further...

It works great now, thanks!

