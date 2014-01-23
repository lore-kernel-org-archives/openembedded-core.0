Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2A46BC92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:33:12 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id m1so1937042oag.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ffoCmpH9sKR7ZvT212jPvpknzFN4IrIUBA1Qh+uX2kA=;
	b=R19K0BC/Nb9AGOxA3mL5CHs/s42M42Ypb5eyO3Y6auTi3z7GjLGifgCRbLrak9qlKa
	d3Yt+wlxY9/SW3l+677ZluZ/yIlQpKHpZmBs+yF5AxdNFYdh3hJaax8fA6qCPHU5DWTu
	fGtShZ3lv/ZaA8T16TLz248FRtFh7jlsdazFHZIFEsk83chC8k793lLp82jaDsFR0X6m
	3GVcq+6JOMIVpAfdQMLfNcdYdHuejpLYUKHYlZzTBIMU2VCj4U/slhnjugXZfsd5RWoL
	zixypmCOcFX9egoxKCrZL8ZoO5JA09vLbLLHYCRqw0yUuRgbV3SKNhpLJtuCx3CcODmt
	goNg==
MIME-Version: 1.0
X-Received: by 10.182.117.195 with SMTP id kg3mr6141483obb.17.1390476793712;
	Thu, 23 Jan 2014 03:33:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 03:33:13 -0800 (PST)
In-Reply-To: <52E0E238.9030601@linaro.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
	<1390312633.874.84.camel@ted> <52DE7E17.2090301@linaro.org>
	<1390316993.874.85.camel@ted> <52E0E238.9030601@linaro.org>
Date: Thu, 23 Jan 2014 09:33:13 -0200
X-Google-Sender-Auth: Dsh8e8A4_dkqmwfunhYsME4D-Fg
Message-ID: <CAP9ODKr3CKE-dvrKiFvSek+T65ggM02ZA-0wiCD3nA6f+c2pDA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Thu, 23 Jan 2014 11:33:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Thu, Jan 23, 2014 at 7:34 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> meta-fsl-arm
...

I got this patch and I will merge it next time I merge things there.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

