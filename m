Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id 59A4C610A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:38:21 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id s7so4449092qvn.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 07:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xIwmmKkZz7ULlxZt3xLbGifE2rGFSgKTC4SKeSKsOoE=;
	b=NTBMiDEjbAULcQyPeGX0OuNc6h4+JwTP8e8N30vwrI8K8NPNLEnBj401uCsvgpAwgy
	buw+vGDCDPBWWJP23Gkus5MEot0OeCRMPrnAhqH9mLzJrGQW/eiWyIxeGJPApfsP4NNg
	sYKINL2IdHPgR59a4/VzgC8VmX3J/IoYNOV8BmZDAYXUPp1ykjr55RQMTCOt8P+oypoO
	6bMC0/mJWT+gMeIkhkvFvQnDyNszFSK/CeKIxgukoIRje4l/wAZMWTf4vHLsxyPm9zdf
	0+gFpMR+XPF9XZm7lijZd/QMXuZKS43R30WuyhNx/c6VO2qLF/4HzKp9nRZ0kTB1iH5P
	SoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xIwmmKkZz7ULlxZt3xLbGifE2rGFSgKTC4SKeSKsOoE=;
	b=czP6sDME9hmuGgxjO4zEmDr1kUP9gTXj65M2JV7HMmSNxioS1zVuQrAGw0GZ1B8CeW
	oHo9SaKf56ALke45G+1SIWmRV5Ylcmr6hGLmMBRoWE+qBCExvcHwlmyxeGwK9m2krLoL
	2IgIJcWxeVpT5A19kIYOo9BefngIiTcXUMOwTK2jTkxtTgRH+5gllSF4xzfTW45lZQJT
	Td4tJrcM6tSmODMtoGyaWlJMWtAMlnK10t0Wt//FR+fktnJ9xgmsqe8IPxP+BRCTbxDI
	4p9OJghmkLaFaplS4JvDUo0dAA9jmPjucjmNvIoIVWHfjUwMCHZi8BKFn6TJsKX5iqrz
	NvTQ==
X-Gm-Message-State: APjAAAVBFb0p1VVxo1ly3zHFNW9gtld5ay9perK6ePW3p6kNz6FikSob
	tfDgHvgMOnKspFRN3zifzP9ge+8uThj5Sb8135KyeZvQ
X-Google-Smtp-Source: APXvYqw29l1s98GKLfFrp2YFzD9vyqRsXkVc5eEI9sJdYtjVRtbqj4gF/NcVF7gI2wDu5f9z5l+0BaUYNy1+nXn4zuY=
X-Received: by 2002:ad4:4d94:: with SMTP id cv20mr2507529qvb.99.1581694701859; 
	Fri, 14 Feb 2020 07:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20200214070352.1206450-1-raj.khem@gmail.com>
	<20200214143525.GA31591@localhost>
	<alpine.LFD.2.21.2002140948580.2881294@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.21.2002140948580.2881294@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 07:37:55 -0800
Message-ID: <CAMKF1sqTqDWa1mDYtrHObWO885DOUSMTcAXnaps3nNGF1RGzSw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH] swuashfs-tools: Enable on musl
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
X-List-Received-Date: Fri, 14 Feb 2020 15:38:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 6:49 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   "swuashfs"?
>

I think I sent a v2

> rday

