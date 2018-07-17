Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB13782EF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 19:05:44 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id b15-v6so4058011oib.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 12:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IhGaQujJL0P8k9s2Lu0D5Uz6y+rvyzWHNGciLTtt+VA=;
	b=wHKaDN0RMerfkCFMe9gXO2J1mRmQ7tLJbYderWj29AUBYR3R4/OvTPCJSJnbaTJNT8
	SUmB4vq5h/m682br0Idl4qKSNJVBfuUIc0UN/lJ7tYxl2lKXZaspeA5VYF9/KpMPXT3/
	9Nz7jin3qpWX5Wzh68UjUSNhvQf1sNYF2717hnwYng1pPyUEgcKatbYjwn90emFp3pXf
	pSfvNwa/gLFqTD40IpMFlfEU+B3gRcZOzsZgPhAE5AiYXjuXazGg9zjujikC4og7g7+H
	DUAgc31BtZQdzePARSD3inaPJ2eRct+z7JmsDpeBYMmpS/6Cnv8YsufRcGtlqfYEXHcm
	dJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IhGaQujJL0P8k9s2Lu0D5Uz6y+rvyzWHNGciLTtt+VA=;
	b=DfW0NUlPrZY+QFhl/pnjXbrOjS9F/B88fYUFUW2OEsnLfk6kMpC7JDO4V5Sk4XzPK5
	joRp4hEPlrwDLwwD0osiMoqe7KE3vLPkPj3t1Cm6SLjI1ZlZ4NsGrhtE+jYwo+b527jo
	15bw12aiD1mx/UIywlfyGJ20EWDEEYy2szx/COYj2yr6uDApMvuDUfx5PYSJGOAsMv69
	/kdBIp2Od/q9Eag+cCdMHH/4S2jFCJvmeJHk+lABECfKZjAx1T/r2DicuDU9pWRqHngm
	tar2tUalK348QWzEJwwVydyu6Zogd9OmTp+njB5wu59weEtUaBIEo9Dm3JS6nY2pcfNA
	qPVA==
X-Gm-Message-State: AOUpUlHE57yqykLXHT2KXaqf5DUD50LoWKPpf+gf9fYPhGSJ24snZnnS
	wVCKc3EvOzPlbrDkVh/peg3a1k2uOfnkGhPPYFH6uw==
X-Google-Smtp-Source: AAOMgpe/xR78bBBpePrwMS24nnHgzgl0g44nlTpEwohitaQmOyeB8dYS24H/c88fW+P2oHXRirNCLd32Zxp+h+U1vnI=
X-Received: by 2002:aca:2808:: with SMTP id 8-v6mr3194793oix.235.1531854345571;
	Tue, 17 Jul 2018 12:05:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 12:05:24
	-0700 (PDT)
In-Reply-To: <CAJ86T=XhVww9055CC8dcyySHPhiRfK1bDPdoyQwzFCXorep6yg@mail.gmail.com>
References: <1531850817-26274-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sp3z1n+t5QKgbiWn6MkXEGOEFF_8G_X=1dYFTcx48U3RQ@mail.gmail.com>
	<CAJ86T=WYor_Gf2dpio37Yu86bmCfeDht9s6p02XFgH_2QDOv9w@mail.gmail.com>
	<CAMKF1spGseSt53y4jON1S0sX8VFn4MfuQhyfPNfh3zK0Jt4asQ@mail.gmail.com>
	<CAJ86T=XhVww9055CC8dcyySHPhiRfK1bDPdoyQwzFCXorep6yg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jul 2018 20:05:24 +0100
Message-ID: <CAJTo0LbasEDM9nTA43Gm4rc+L_b5s4P1A2k9dEzh2TE1TSNSGA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: disable C source code generator
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
X-List-Received-Date: Tue, 17 Jul 2018 19:05:44 -0000
Content-Type: text/plain; charset="UTF-8"

On 17 July 2018 at 19:49, Andre McCurdy <armccurdy@gmail.com> wrote:
> It's an extremely obscure feature and I think PACKAGECONFIG options
> should be reserved for stuff which we want to advertise as being
> something a general user might want or need to control.

FWIW, agreed.

Ross

