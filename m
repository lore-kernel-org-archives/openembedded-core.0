Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 469A46612D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 15:39:14 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so88456317pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 07:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=mqXH9c5V5RYiZFP/5FdKi3DnJjs2K/06m1K8+2C6mwI=;
	b=xqhcZ/XGF6TYCkWy7sRkemHNleC8x//ppL7emFoRbn0wsv7TPUOiA+UCbTvhp5FlDq
	4VmBExVtTazl+4yLPtoPSFfALuqCxOPRJbfdLnFlD8YGfjnluYQ2Zhw7oiZRJtTvN8t1
	joMWTumdS+/6Ys39iopvoZeh77uYVwUSQ8DD2hdDmk7ImuWL45bbygGuTyWDGwLWkhyj
	sP4aDRC2Lb9jPsJMGFLV/cuPPL1AAFlJgK/DrAsFEsuTaDrw25Tr99ttVfqQoRrkMKFP
	RDwvER+AhhwbiV0Oee59ynxE2fi/Rbasy5MOHq7jcIz3405D1kEUqleErFqiP8FxQ4Ro
	jQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=mqXH9c5V5RYiZFP/5FdKi3DnJjs2K/06m1K8+2C6mwI=;
	b=JWoKt6wCOBFaehuCycA4Z5ibS6qaDSThKfbt4mMoYM+nc38CDmFk9WA6dFP3k2BMPJ
	gn03yajKw8eHGsVNOceHU0m0L0+3/BL8xpl9gbRlsCw5vfTkUFCd5Yd3yC1XZqg43BeW
	ZCi8RcjlZDnI53J/H80XpxAFXSLEwsf1SoqJX9RtrheZ+DBGltY03aEqW63LFOuUTdPV
	v0UKhYPknPtJSMCcADgBsQ8SXxqWWDYgkgNUin4kayA1SBXHqaKOPRZuzEd3+BUg30qw
	OFJbT7TSgkhvxkEMNqGDoCOcvxJ2dxhdfPU8+Kl7lqVsi5602cxKvtg42GKdmIH5M3qy
	4sRg==
X-Gm-Message-State: ALoCoQn4teiP0jkrqqNVMC9VIX6+ek1jBA2CLWOYc4ALMHan6EAkCFvMUeqB9wqJL1Yia0bVbjp1
X-Received: by 10.66.227.102 with SMTP id rz6mr22295371pac.4.1449243554936;
	Fri, 04 Dec 2015 07:39:14 -0800 (PST)
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com.
	[209.85.220.48]) by smtp.gmail.com with ESMTPSA id
	tm4sm17985316pab.3.2015.12.04.07.39.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Dec 2015 07:39:13 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacwq6 with SMTP id wq6so11181748pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 07:39:13 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.119.136 with SMTP id ku8mr22700994pab.128.1449243553344; 
	Fri, 04 Dec 2015 07:39:13 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Fri, 4 Dec 2015 07:39:13 -0800 (PST)
In-Reply-To: <5661018E.1080501@windriver.com>
References: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
	<1447948114-30329-3-git-send-email-otavio@ossystems.com.br>
	<5661018E.1080501@windriver.com>
Date: Fri, 4 Dec 2015 13:39:13 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrRQQezpd1X_uZH4mKh0g0nEHDcea+NA-MJZi2-QSQOpQ@mail.gmail.com>
Message-ID: <CAP9ODKrRQQezpd1X_uZH4mKh0g0nEHDcea+NA-MJZi2-QSQOpQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 3/4] lttng-tools: Upgrade to 2.7 release
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
X-List-Received-Date: Fri, 04 Dec 2015 15:39:15 -0000
Content-Type: text/plain; charset=UTF-8

Hello Robert,

On Fri, Dec 4, 2015 at 12:59 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> It breaks when PACKAGECONFIG = "lttng-ust python":
>
> PACKAGECONFIG = "lttng-ust python"
>
> MACHINE = "qemux86"
>
> bitbake lttng-tools
>
> do_configure failed:
>
> configure:6331: $? = 127
> configure:6337: result: none
> configure:6389: error: no suitable Python interpreter found

I reproduced the error. I will debug it today.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

