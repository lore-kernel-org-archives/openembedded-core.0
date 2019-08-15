Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 280396C0F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:09:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z11so3430963wrt.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=+/46sTTuc8IMQabmUUqMpWCpUBtwlnFEojvNq3ib+oU=;
	b=UhwI4H1KVS9vebM6Su1oKQBFxlrQGADjFjGKgk4p8t7RaC48hlUqt0TeGqF3HOjNKH
	czXbAGqp3OGex7nIwRww5zXGt0G2d61vAu9N/es20ZYkTpFVtBClEsqOFTmNu88KvnKv
	oEEr0mgPVBI1AaCOzbWbZ5tNgFL6Y5czKAUFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+/46sTTuc8IMQabmUUqMpWCpUBtwlnFEojvNq3ib+oU=;
	b=nukBnlDQNEHddygBroC7mi2Ap4GsAQEii+wOH2mPj1rRZRyJBgkGlSSnuMaC2ZXC/G
	/F0H37tg24yzQS8ulf5Bg3wCuF0zTZYJyP1dntbXI2Zb1luxb4I8M2af2+I++WUhJoq0
	Qpoosaxqaty+DK2XkaJF2zyMTo4neeXEwcr1XluMuDvD3MojVki8seozCadQuF6qIHW5
	VMxna6lWT6gRoqHq7rS3NJR5+XGTtDlPppc87BUEihjR2Sp4JUM36b+UtESw2Ms0cZwm
	Oj9MDocCpssf0FleiaAj5dDXWdamlh01phARyX+PWBQWWREVNApYTAThPZuxplIwbw5n
	tIAg==
X-Gm-Message-State: APjAAAW6CZPjQMM5BwQ8o0KjEOtQgUxg3R/YEvPpr29+qz7G+ycJ5JSa
	5Xa7FRV516DgoRgxU1/LwU/DXA==
X-Google-Smtp-Source: APXvYqwm4HS2D8FvFYEKpgQK7V7ZvoB0D5EPFjtG+4Rqjlg3kaBMOnexy3L9KMglB8BgWcNTsCOdww==
X-Received: by 2002:a05:6000:104f:: with SMTP id
	c15mr6910095wrx.225.1565903347850; 
	Thu, 15 Aug 2019 14:09:07 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm2843632wrv.55.2019.08.15.14.09.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:09:07 -0700 (PDT)
Message-ID: <b2ae3b8bff8bf0c2f42d588841347ad8b6844ef6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Saini, Naveen Kumar"
	<naveen.kumar.saini@intel.com>
Date: Thu, 15 Aug 2019 22:09:06 +0100
In-Reply-To: <CA+chaQeeS+Ludz64ke19Hr5h1knrvbe769N5vhMQLH7=E_dmbQ@mail.gmail.com>
References: <20190815065343.5291-1-naveen.kumar.saini@intel.com>
	<7128b7d3-78c0-0a66-8e55-65fedeab2dd1@intel.com>
	<CA+chaQeeS+Ludz64ke19Hr5h1knrvbe769N5vhMQLH7=E_dmbQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Thu, 15 Aug 2019 21:09:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-15 at 09:23 +0200, Martin Jansa wrote:
> NAK
> 
> Yes, the first part was merged in warrior and is correct.
> 
> But this second part isn't good (you don't want git-lfs to sometimes
> work and sometimes fail) and that's why it was rejected for master
> and _shouldn't_ be merged to warrior. If you have recipes which need
> git-lfs, then add it to normal HOSTTOOLS in your builds to make sure
> it's always present when needed.

I don't like the patch but it did merge to master.

Building a git-lfs-native is a nightmare due to all its dependencies (I
think its go based?) and there wasn't really any other way to sort it.

Having recipe specific hosttools would be ideal but we don't have that.

Cheers,

Richard


