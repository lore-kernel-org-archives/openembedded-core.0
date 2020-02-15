Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8888A61339
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 11:07:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so13974034wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 03:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=UxD5b6LZtvBHxNQjjAmnP2QmfA2kPwuWGu/+KTPPIZ4=;
	b=JavrkZpmG6tI5iGmoxIa5RKZpaQnqZ1A7i7s5yGCWXilFeZvk8n6+E3ggWFtbSGh7E
	mo6wKdaCooeg0yCRqQrbLZrMJOfLSWmc6oFBkPZo6sshODh/cEolUbIMjk1ffigwluqg
	GThTts/01ka5Sdq4wP1ifRH1rEKl8+VA0wzxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=UxD5b6LZtvBHxNQjjAmnP2QmfA2kPwuWGu/+KTPPIZ4=;
	b=CbIS4uP8/gSHPYa6Ca6KCM+wNkJtxfgMvKJwtciz7S0TFkPY1sHz+WFKumdSOKbijf
	UZ5IPLOw/YVfb+Jq5Ao11keYklmwVsDO19uaY69CvnlW2crd5AVmmDASPQJMGaVMM8QF
	VKYBnMMH7QjbvOZDBxHEZRflV8YHrffC1uvBNOG656y+qEm3O50cSCpNm0UUlrhPQlOb
	/WpZ39RbIkzu+XRW/SHAh3rNNvKYK66JbI8UfwHpzousJ4WA0S4RT+Epaaj8j/qWsTjG
	FnKL2Iskz/VKpKp7W9WnPY+gxwUjmaiA1EOuqBAjBDCnTfmBLI+JM8uf3J1QhZOMyE85
	3lkw==
X-Gm-Message-State: APjAAAUrCljTosMuwL6PgScz0rERlqkcc4LrlPSR/qK/3gjJK52o47oW
	hNkCxbMu/jd+Zu5SmA8BEWflkApAQgg=
X-Google-Smtp-Source: APXvYqyAAPitTSJGCSGvR5T/15lOfpwrWWxXfZ5KigwswRGtEWPUFurQ0US//y4mUzdbsyFLfonG3Q==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr10007280wri.95.1581764846078; 
	Sat, 15 Feb 2020 03:07:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k16sm11514260wru.0.2020.02.15.03.07.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 03:07:25 -0800 (PST)
Message-ID: <ae6aa1fd185955181b81170757887c3b19a9767c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 11:07:23 +0000
In-Reply-To: <20200212031435.792802-1-JPEWhacker@gmail.com>
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] oeqa: Run diffoscop on saved output
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
X-List-Received-Date: Sat, 15 Feb 2020 11:07:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-11 at 21:14 -0600, Joshua Watt wrote:
> Adds recipes to build the diffoscope tool and run it when the OEQA
> reproducible build test saves output to a local path. This should
> make
> it much easier to debug reproducible build issues from the
> autobuilder,
> since the published output can be easily viewed on the website.
> 
> Joshua Watt (4):
>   python: Add libarchive-c recipe
>   python: Add magic recipe
>   recipes-support: Add diffoscope recipe
>   oeqa: reproducible: Run diffoscope on saved output

Thanks!

The first production use:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200215-t1s21q9r/packages/diff-html/

:)

I am a bit puzzled/concerned about how this hasn't been removed from
the system yet as it should have been, unless its the hashequiv problem
with timestamps continuing to cause problems. Need to fix my patch...

Cheers,

Richard


