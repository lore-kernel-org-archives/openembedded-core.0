Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C353C60B21
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 23:20:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p17so12811355wma.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 15:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/MWodiCmhWXOSn9uyyvFW9UYjiCaHTObG61rwWIu+NI=;
	b=KpYfY1lH7rD91zNj3XGOQK2+HYv4eWx9d+hrEGTWtV3epdGlK54U2hGUU/ZR0YYD7s
	1Qn9TR7BvnOcUetuIljcHvW4ENLGOflBv/3chTas8zzYRLu+P9q9vT/rfmbZDs1qAwDH
	58wxXiLjNCDGFKwDOKI3R4m00HWpw0w0X2GvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/MWodiCmhWXOSn9uyyvFW9UYjiCaHTObG61rwWIu+NI=;
	b=s9nd9QynuWNiIAWTriEuX6xz6x7XQIOB9/ThkHQrawN+2C0g2zfCmCemSDJ3Wc6DaS
	M9OuZqyjtixLwmGJpw4/Ds7l41d+f6N1fG6UHSCjlCOou43Nlf0k2qECCKNdXqE9Iu7K
	hhC4VF8okaG4+roT3s4s/5Oc101EATj4j02Txs/XJsGvoQGslxOAGhPpmOLpKmeXUxDN
	807iZi/67T+6DmykzGGKVugOlEh4ZkOUzBGwbERfkg6GIyAlR2+J9jj3fpSeLDV/cZpN
	OOOGTXlBY6BSwsXBcoqb8yXf7DEqHMKdTSFJB9uFXneOsmu0JYp7rTIOQg9QzYXsB5I0
	lpGg==
X-Gm-Message-State: APjAAAUFVMBVuBAdnaBSFFxEGE9S5gJEuXDisFXKV/2FjpChMfB3kgR3
	N0igT/7811R3uZmbiHir2EIz8A==
X-Google-Smtp-Source: APXvYqwrgJrQV096DL1oG5s/9NgSVcCE2PMGIGMCbVy23MfatGocs4iN36rf+HN74wO5VoE7ufVqxQ==
X-Received: by 2002:a1c:545d:: with SMTP id p29mr21434692wmi.91.1580599231439; 
	Sat, 01 Feb 2020 15:20:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x132sm22214244wmg.0.2020.02.01.15.20.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Feb 2020 15:20:30 -0800 (PST)
Message-ID: <2875492fcb3e455aab53cccca7544794d9839663.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrey Zhizhikin <andrey.z@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>, anuj.mittal@intel.com
Date: Sat, 01 Feb 2020 23:20:29 +0000
In-Reply-To: <CAHtQpK5sz23fBd+QxoSE83=bMfhc3P_W8Mu+FTGY0m393+rz-Q@mail.gmail.com>
References: <20200127104444.14102-1-andrey.zhizhikin@leica-geosystems.com>
	<CAHtQpK5sz23fBd+QxoSE83=bMfhc3P_W8Mu+FTGY0m393+rz-Q@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: resolve opencv pkg-config in meson build
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
X-List-Received-Date: Sat, 01 Feb 2020 23:20:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-01 at 19:48 +0100, Andrey Zhizhikin wrote:
> A one gentle ping here.

Sorry, autobuilder results are a complete wreak at the moment which is
making review/testing of patches 'problematic'. Mailing list issues,
lack of the SWAT team and a ton of other tangential issues are also not
helping.

There is a backlog building up and I'm quite depressed about it. Tests
failed today, I see if I can do something more tomorrow to get things
unblocked.

Richard


