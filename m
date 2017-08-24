Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5FDB56FFEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 09:27:27 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id q2so522263pgr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=lv/UQERCcAUWRlmDQwB/im1FgEhkDa5PfwUv51USzfU=;
	b=TKDAKZz9vWKJUrmpV2sw+sMu1p0HSliJcs0otX44BIEnqzH2shBP+B+4cxGDC5YaGf
	fYn6kMCvw8o7lJT6JvK3rVqt4ZFTd4tWB3Z6UuH7n09LxAIarXcDqAqIE731Ry3ZKCvF
	CV/yvhW2LjQLGpFEdPEvXq9A3ilpz1RIZTNgbrf8tQBOxnZLFeAdLS934wiBrZHLriXA
	RWYe3ewbaCHfvTjZfZijbF6AcuxridHroow7a4p1eZS8ZEpodr4SvAVybohTW3Wgqh8r
	1Y1PE3LoAgFJQTyAzfvNhxSJSH0qKasSTrm+wwQvfBHwIacfeCyXMtz0zrdSqWK+0NkQ
	wQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=lv/UQERCcAUWRlmDQwB/im1FgEhkDa5PfwUv51USzfU=;
	b=JQY9osGZVtEVy3ISGX54xp/CJ8Bjsz83xFw1qTkO9NsesBE8WS5llk1+4J75raqRhc
	WUOwGBM4CJxSNqn8MoZokX3mFuD5aGjaYwbbs2UOfAZ58f8N08TR3zxmPJqk8ZMtTa2j
	wMvkrdATfB17NMp7hQDw+7gPcXDxpiL9Y60qt9hKheL/gwNm4emfy1T8kPkWaPO8QM4n
	FpUV3LsufUoIL6zFRJb5vz8cGSZX9JoQj4xM2ZDtVQ8+23AkYO2S2/Lraz0TidtOep/6
	eeRg1qT5VIax82iOlaFWF4MA3RKaDu7zeb4/0v4hyX447EF7rwYwBict9pN4ritePWqo
	dMMQ==
X-Gm-Message-State: AHYfb5jSCHuJ9UzmnmHpKy8ZlRevpnWLaZy89D2p0a/+WlA0BgpGADn1
	oEjdbn3K7erERV8p
X-Received: by 10.84.129.103 with SMTP id 94mr6049678plb.63.1503566849235;
	Thu, 24 Aug 2017 02:27:29 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F93A.dip0.t-ipconnect.de. [93.232.249.58])
	by smtp.gmail.com with ESMTPSA id f2sm5643028pgc.17.2017.08.24.02.27.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Aug 2017 02:27:27 -0700 (PDT)
Message-ID: <1503566841.3674.6.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 24 Aug 2017 11:27:21 +0200
In-Reply-To: <1496995960.30163.175.camel@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
	<1496932400.6630.250.camel@linuxfoundation.org>
	<1496935714.8427.7.camel@gmail.com>
	<1496950316.30163.152.camel@intel.com>
	<1496995960.30163.175.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Thu, 24 Aug 2017 09:27:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 10:12 +0200, Patrick Ohly wrote:
> I also get for all recipes (i.e. the error is in the base
> configuration):
> 
> meta/conf/bitbake.conf:752: include/require/inherit "conf/target/${TARGET_SYS}.conf" resulted in including "conf/target/x86_64-oe-linux.conf" while parsing. Variables effecting the parameter changed later such that "conf/target/x86_64-refkit-linux.conf" would have been included at the end of the recipe.
> 
> None of these two files exist, so it doesn't make a difference. But is
> it really intended that a conf/target/${TARGET_SYS}.conf gets included
> that isn't the one for the final TARGET_SYS? That looks like a genuine
> bug to me.

And Andre McCurdy also came to the same conclusion - see his
"[OE-core] [PATCH] bitbake.conf: fix ineffective include conf/target/${TARGET_SYS}.conf"
patch. However, that patch IMHO is incomplete, because it doesn't account for
${DISTRO}.conf changing the TARGET_VENDOR part of TARGET_SYS. I'll comment there, too.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



