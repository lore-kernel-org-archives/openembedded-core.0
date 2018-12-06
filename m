Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id ED4B76BBEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 16:03:52 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id i145so2110907ita.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 08:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mCKHx5g31tZt5Rx+BKNuMfutmRocGi9oDRtebCROz/o=;
	b=gFicGTuH4NjcvMXSJzLgbtLRQ1UaxeDGiX0jQ4U3/HHVyH/wRFkYZIg1tIWfukRAOR
	4kyENYP5QqO5mlToOAWSVe2TJsQBH8ClCjP6TDRre1pRVlscq6/fBFdHFhTCbBrzEqiG
	q1WhuzyV+0iQFj52eKek+Bw+4026tc4hwJsFRgIDMkJENmAd92dTjqbM6slITqdxmmEu
	pDdzr+GTnv5gA+pK336cSzwOR2Ioc7aHfHOUwM6qLTSr9IBJkMWZnUDBSxnb++lfCB1B
	ZlH8i1yj6VDaRFccrIwztSw291kiwvrjxkHycjAu/G2qB27mLmyrr14FTvb1izDZxsqg
	vX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mCKHx5g31tZt5Rx+BKNuMfutmRocGi9oDRtebCROz/o=;
	b=niP2vpwXxZLqL/evOyf67R+KxJyoQJK6oPjqxxP/FFJBUbuF/a6r0bijKqBEpuCbDL
	uTlXShiqa4je1HTMmNo9GQWIgyCYX6YqwhnqyekVh+4gSNdjmArp9lbkAmD8cGg/8J/w
	1vJmVeTSiONUkYvWCJeaccT3mdn6IioQ6lX4Q8JEzdbxncb8D0jAfGxDEK9qiJQk041d
	bSFMMbr4ET4UiVDQFZXLEwHSYpLXeQB3yRMtsVUtX1bNhRbqG30KiDfepvfk5AFGg7Od
	zg7oTKOEdC3HElw9QfSAdxe7qmrMI1nfQBM/kR3En5D6O+LI+7RpmgexBD+A3bZSM4k2
	rcgQ==
X-Gm-Message-State: AA+aEWZ/qPWn1oUH2VcLNR90bnpb/5tZd2GaBBNw6nP5vs90Ymlyxu7n
	UmkmyIjOuzusniIEzVFRoV4bJF3olQEo14wZq+aIBw==
X-Google-Smtp-Source: AFSGD/V4sAeAj0TGrC683OazufAX1qhBfxAh1LN41GgGXb47nBQCey9fEAvrgPVhaqx08nN5xY2TWvv+n7q38bBvbK4=
X-Received: by 2002:a02:9c53:: with SMTP id h19mr27112676jal.31.1544112234010; 
	Thu, 06 Dec 2018 08:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20181206000749.28731-1-raj.khem@gmail.com>
	<CAJTo0LZi7zY+g9PKd=eUr9PnipvfTBeOXaC_y91Wm87+aP=oPw@mail.gmail.com>
	<CAMKF1srv3AYsM8XFpOPO=A+mt-cQLxVKkU9rm17XxNeg0yMkyQ@mail.gmail.com>
In-Reply-To: <CAMKF1srv3AYsM8XFpOPO=A+mt-cQLxVKkU9rm17XxNeg0yMkyQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Dec 2018 16:03:42 +0000
Message-ID: <CAJTo0Lau1hQKrPyCBiF7GA=LgUHcLh8n27KwrSQ5qo247qVK=Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: Enable building static archive on musl
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
X-List-Received-Date: Thu, 06 Dec 2018 16:03:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Dec 2018 at 15:45, Khem Raj <raj.khem@gmail.com> wrote:
> Yes, they are. But for musl libunwind static lib is required for rust runtime to build all the time static or not

And that's a musl-specific quirk of rust?

Ross

