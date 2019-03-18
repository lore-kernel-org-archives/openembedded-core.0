Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id F07057C75E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 21:30:28 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id z126so20078879itd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 14:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R1CHjx8oQsdse9oWWGujMmBRuGjt2xwIR8oljSPgYhc=;
	b=LqRsDmFlAITAgNlKFzidDfCKrTHNXu8GZTEhD1QHbTuL/zIVRS+zInQJYP7d05qoq+
	cr71DTLlyO3ImU3VHvA+h5AGhIL33m9HulAYLpLARnVZLsL8sV/ZTFhkMNXtwxd0o1Ks
	CZs6OdocyOCMroOSOnGuiZrTtJofEd8RfLyF1lRNqxYqf9P0mB7sLgr1OBoeLt//Ekhw
	v9YfkNVbw1BrHCLnz3+FskEKZGLimkLn2FdXrWOxwVGRxeYat4eXxeGmk1A5DXG99CGS
	WAtvGCMnyPnzVfQFYL4S0i3MH0rmI6OIX9yNEyKa6M2bF+bTOPeYw96wVnU98cEJwJTZ
	fkIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R1CHjx8oQsdse9oWWGujMmBRuGjt2xwIR8oljSPgYhc=;
	b=R3Gd9fxut+ZIB7O/JUQ0ZC+U8ULGAgbOdCVsvQbmmLCu5Pu9QCgOktyXw6H1J7s2t7
	UGQTpEQTdF5Gw2Tcpks2unSv6SfH0M5wKmsCjcJQM4oTxfESCEMMJ790eyEB2Qjci462
	4AqtJZNDDl+MjiCEoDe3TvAd0qzIf2uoNleoovNUK9tgIDvHkcI9Lps043b7ZearsQp9
	MTINYiqyRxFFRdEm3hHhkrl+sZ2KXAmsQET1//vf3mpOGSae0loO4zKP0Sb5/8Ed1uJp
	r2mtW7mq+iaJiYXHyB17ZftqdS8b9U0ncUrZjtXhTUEYDG1VA7IJzd9rQHJ0iJtfAjk9
	+HuA==
X-Gm-Message-State: APjAAAXOaD2MpEp1Z27ibO27i6U/upjVX07woQhMw03fnd+flBZr9m+Y
	oOOCl1i9ghaqzA8+QH3zWkmhRGcs7NJPS/OaXEww+/yP
X-Google-Smtp-Source: APXvYqwVhCDKLE48Dw/wan0DjWyygo3iJrOfgjHrE9T982Kejx/z/yNKdWxTWFqvLS2MUUBeoCnk7BdRYOHHW7DT6pA=
X-Received: by 2002:a02:7654:: with SMTP id z81mr12744681jab.79.1552944629805; 
	Mon, 18 Mar 2019 14:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190318165138.30402-1-paul@betafive.co.uk>
	<CAJTo0Lbbcaexxy-PXpbmZhicdrR0z1pfi7Qu0St6N7CNT0VgEA@mail.gmail.com>
	<6d2b4813-483b-477e-8c20-5ebc2195a73d@www.fastmail.com>
In-Reply-To: <6d2b4813-483b-477e-8c20-5ebc2195a73d@www.fastmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Mar 2019 21:30:18 +0000
Message-ID: <CAJTo0LbaDk0044OMOE1m=Zy4sp0KmmHZ=gkPC4ri8QxSPN-PzQ@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzdata: Add tzdata-all package
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
X-List-Received-Date: Mon, 18 Mar 2019 21:30:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2019 at 17:10, Paul Barker <paul@betafive.co.uk> wrote:
> That is a good argument. I just checked the difference in image sizes though (from buildhistory):
>
> core-image-minimal + tzdata = 8,868 kB
> core-image-minimal + tzdata-all = 15,788 kB
>
> So it's probably not an appropriate change for everyone.

Agreed, and I didn't suggest that we switch to installing all of the
tzdata by default for that reason.

Ross

