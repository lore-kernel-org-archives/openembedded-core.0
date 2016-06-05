Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 63520771CF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 13:04:08 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id o189so108270390ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=c43xOvn2+ksan4VUYPmL07UnyWeczeGfX4U+HKaL0Kg=;
	b=h3ClIy2R9lJvZHf3s+J9WWBE7YI1iOxnBLk1ie5DnFgUKi61FQbjuTOYnIahAfej79
	+3bzCEveD3hu4GfWzppfcQwEJT0VLOKd31miyLRpSUtyBlow6TWcrms0jkzVvQ6FXXyf
	E3qS3TGIlEyB+eO1D3MpeUfyePVtQk0v9slHFGwewSFCgurY1lzUQToVU0M5QHjX1QDK
	Iv9LN/NHk4TfUik7WZfUsr7LE+IC6xg9OFoxMCFuemeGkSzdtQZoDgUZlYkE2R95+QX8
	gAu7bv1eEhxK41a0191Y1Rub+Naojqtve3blgyjo0wE/KjXrmcjK4a8GCOnuYAv6elqj
	9UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=c43xOvn2+ksan4VUYPmL07UnyWeczeGfX4U+HKaL0Kg=;
	b=OnKClD4xysuvbpfQ6Do3i8S3xfhxixNqZtkhPvtGJbjjUDijY+ylQmKwiZRTrcFPGz
	xLfcrgb10wwkG+1ic9HhCRkHtEyWnqiKmnf6lfn2/7ZLLvApiYCOmsyVd+KDXRsDz5Gw
	5UESTYHx+/6/FJZ8B7l0F6XMA+KJRAVTp/WSq8uwvu+4xyORyGrQ5oMHPFFzpw1JOHsA
	CvevIjEmwoA5h2KKBhD7uw/CyrHAZdRzIqRmUnNwSXY24Y3crljg1uzOHRoNNNHmhokw
	rW6RrwDsYH1Ikvmkdr0CvpXdAAODejfQF+UjSDHMkWIj7c4lKRMruVHk0ndyDYekc6T2
	ByNQ==
X-Gm-Message-State: ALyK8tKH6P8wdijCMRqERWA88z3YCXv43Ts5fS6MwdcSgKi4A8WMomwS1disGseSRRk2mQ==
X-Received: by 10.107.160.76 with SMTP id j73mr15101160ioe.66.1465131849539;
	Sun, 05 Jun 2016 06:04:09 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	198sm3926322itk.5.2016.06.05.06.04.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Jun 2016 06:04:08 -0700 (PDT)
Date: Sun, 5 Jun 2016 09:04:12 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160605130412.GC5652@openSUSE-i7.site>
References: <20160604225509.GB28175@openSUSE-i7.site>
	<1465111211.13979.38.camel@linuxfoundation.org>
	<20160605130253.GB5652@openSUSE-i7.site>
MIME-Version: 1.0
In-Reply-To: <20160605130253.GB5652@openSUSE-i7.site>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: INHERIT += "image-buildinfo" doesn't parse
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
X-List-Received-Date: Sun, 05 Jun 2016 13:04:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

oh... wait, sorry my mistake I didn't test properly, let me try again...

