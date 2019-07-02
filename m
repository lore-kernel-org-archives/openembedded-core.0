Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF8E7EA62
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:56:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id s3so45512wms.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 01:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ywAUM/wHkG6oz4lf70nzCLrc+pHYtbIR3V2lNAysdiY=;
	b=UxebDV5qTGbvuXRX5kCO7wz6yrCTMoiyvD61Xri1Nc2qhN4WH9i+Em/H2kMr/g7qrT
	ydv4FPUDFvp0aB33YHH/fQFg7mqQjGLGCJwUxhVTuv6VHtaobkdvI93jNjj7Uj55A/ne
	JUKf61ktGDVA53djTz234e2qtO5lJIK12uE9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ywAUM/wHkG6oz4lf70nzCLrc+pHYtbIR3V2lNAysdiY=;
	b=KAxjRQ2F7mNRKZco82JbPwN8N1ScYEeniJswWcxNtCdGgRwNp7no51IYEuGEmKyA8G
	4O1BCjO30M8waJZhOYrxDn8OmmnLdlSWRFgcDJmJPbeSf6Ig1/6vlEJOK6CJu32mFXA6
	jZzIMLRaoOZ7cJJm1cUKEo0NMcgpX1PHUdnnWa9SEWbC+KCvUtrF0pd/cFOcxLylje/w
	YlEYaFC3zUoJqUR6yKW6F0a5rhoyVCi0hE/TOojiYT90g9W4EjHc7I3JqK81aXZxs5Va
	5QSpDijt0/Eo3aKjuZcxWotXkfPKW0coF2eWZ4xC1jHZv0wohRJWWY5LHdxELcUlIaQv
	kxWg==
X-Gm-Message-State: APjAAAXoFDr6bjlhPbGVNc+myD5Hq56QBElHYbp9M2SbLTrnv2aJkgl1
	iODl3JHZrrjMsnHASdzafRMzVg==
X-Google-Smtp-Source: APXvYqyMoAF7NjpKZZ2UZxZ4BQgA6Pm/TBR4XVCoE8e2pWrje7RuttRcSyMamAvmsnmRQm9EqIe8eQ==
X-Received: by 2002:a1c:b757:: with SMTP id h84mr2737767wmf.127.1562057816303; 
	Tue, 02 Jul 2019 01:56:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j10sm6899520wrw.87.2019.07.02.01.56.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 01:56:55 -0700 (PDT)
Message-ID: <dee71c54f502a346433289c8cc3e268c5f719614.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, Pierre Le Magourou <lemagoup@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Jul 2019 09:56:54 +0100
In-Reply-To: <2baee5f7-f293-f9ce-447a-c2a6297a5529@windriver.com>
References: <20190624094438.7596-1-lemagoup@gmail.com>
	<19369a4e-80ec-9659-faa0-fc0f5925aa87@windriver.com>
	<2baee5f7-f293-f9ce-447a-c2a6297a5529@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] cve-update-db: Use std library instead of urllib3
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
X-List-Received-Date: Tue, 02 Jul 2019 08:56:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-07-02 at 16:08 +0800, ChenQi wrote:
> I just tired to open the web but failed. The web seems down.
> 
> Regards,
> Chen Qi
> 
> On 07/02/2019 03:39 PM, ChenQi wrote:
> > A recent do_populate_cve_db failure:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1005/steps/7/logs/errors 
> > 
> > 
> > Could you please help look at what's going on?

We were making some changes to the autobuilder to speed it up (changing
database backends), its back now.

Cheers,

Richard


