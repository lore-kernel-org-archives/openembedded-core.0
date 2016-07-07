Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id A692D6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 05:38:49 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id f6so12636966ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 22:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cxdZOdOBcYwHm08FVHTF83suJzz6bYWSXp0Tmrrw80Q=;
	b=g/DpTR+LVxl7fT96k4GhL3LvNkd7/zIYOZLLO11uQF5CIFSFcVdtJu/uEj9YiVCX5l
	kFI9R8y/HstkQiXXMrhnWCPooCKoy//4oelMkcFt2sEjg8AXnwuQZZjfRO99nTkXKh03
	weCyCyKs8f9VjEgwmMUAxwtJdg/WQa7CoVrlCqtxHg5XF91LlDg071d8W5COJ8uQamZF
	/KaYJEXz+ocbXnaUM4Kcr2ttJglAeQL6AAp2Dc82XPngoUJrGYqY0aXEfRnEoLALfd2R
	3WqpLIGVz0o05sO25IebUqOCTviVPiKt7B7WCRLnXD+H9rlfwIZcKJQD8AS+BpxAJuuD
	zRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cxdZOdOBcYwHm08FVHTF83suJzz6bYWSXp0Tmrrw80Q=;
	b=WM9ZhCxO7yI7idD8WVm5bqHEkYje+xtOAmrdwSMrYjBd1cBEMmLaTNliSRjMuYPdmN
	qg5trGo7E/aDxzm94fAEBIZSGF63k2X3mVQEMaLRRyDoWipFB0dwzfe3FxyMT72t2INv
	c/wUChLZtkh3Ma1+FtcIhlqc665qY4vCdNgWDeXpN3N9b46AKd5p/h5CGv3jQ0GRgsrm
	V88dEh4H60Iz5wmxJWRpg0LncXv3g3yWHLE92H5iKup1WwTDbKk4/EmUjlczDRYhVRIT
	VXkW7VrxAnceCCBXYYYDeQrJxuT6hc6MRrjeXflj5c3eNdYDoaxFA5xDSz+zlSDKnLuS
	eQpg==
X-Gm-Message-State: ALyK8tJrE/eVg5pRUMskWWvcW2iZwVe8SG2D2aEm2rGz8L900cdxgRJmA+HJD5HkMhiqSA==
X-Received: by 10.36.194.71 with SMTP id i68mr884138itg.86.1467869930654;
	Wed, 06 Jul 2016 22:38:50 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	f69sm855493ioj.39.2016.07.06.22.38.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jul 2016 22:38:49 -0700 (PDT)
Date: Thu, 7 Jul 2016 01:39:05 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160707053905.GA28068@openSUSE-i7.site>
References: <20160702081927.7365-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160702081927.7365-1-raj.khem@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] glibc: Upgrade to latest tip of master
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
X-List-Received-Date: Thu, 07 Jul 2016 05:38:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Even after applying this patch, I'm still seeing crashes in Chromium (which
aren't there before the glibc update to 2.24)

I wish I could understand why Chromium is crashing, but everything else seems
to run okay. I wouldn't be surprised to find Chromium is doing something
funky; but what, exactly, would be nice to know.

