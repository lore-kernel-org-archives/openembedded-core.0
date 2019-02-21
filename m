Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 925FE6BE2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 21:08:55 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id i2so43130ite.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 13:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bQq2xslx2f/INdB7UzY4uXmJF5DrJanZCBBklkI9G1I=;
	b=rE4t8sNydyzRxaZxpHl9V6vJr3c27qdOo1i2vPdtpfKgIywZf3dBWTHYh3MFCqprud
	w8U165npTfJD36WYTxLvkFyT+cC2RtLrU35+s52lf6BgCF4jn+cxYwaByc2/XRKfNQ8r
	DOal2G83ddBeP6F627HTfVTdZcSPaSWtFANAireQqhPhQ/KIS+uq7DX+GAEYJXzh32Vz
	xhUukqsPWg7QUS+dFRqRJT1/FCZALFlTQzOLs0GAfL58MlqOXOvwRoxew73WJ8LZie8B
	L2gXRmlEJoiRXTU+1MnHH0HCZ6ffVc2ZVU8jJuJ9f5+BadOxb96v+AGOe6QdmyXn+wRQ
	CPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bQq2xslx2f/INdB7UzY4uXmJF5DrJanZCBBklkI9G1I=;
	b=t3w31YaWDDsrtB/nhJ7wlTyxndprBUnNWGvDdEfGRqG3opgJyajSBe9JiUgyezQQsh
	HpxubdTtAryqAhumL3nVYmffP4IWXbWnz3GBGt9o+0u71EB+VXy5jIq0o32QUO+yoTm2
	oOmpS5v/ZjVca9iSi9/E2OGyQswEvgJB/0sLyro8Q6ZjSF4fMvBHE+tHJNWop9ZMGQes
	Ro5gmmO9RU17901gsgDWSfMQfS/Med7EI/3X5uLEO8I4zVxrMO/Mx2jf4/uFJZGJl266
	w/Nmt2KrTuSqklq6tV7vlJLJ0AXfz6i8BziVDueeCpW1gwWHUmHly0JLJ7HZcW8kDGsv
	xTHw==
X-Gm-Message-State: AHQUAualg7RVhNvhmXFxVQjHOb4TDXp7pioXCXTrCe3BsvBotmLrxqWg
	ASL0y0Aa83jOG38vtxwKy1xOH7GZMRUyCruVmhZpME89eEg=
X-Google-Smtp-Source: AHgI3IYlSdQtSpfTzS5dPzOTgZSxcWS/lzVouUpHRqlBiUKSK1vuJahQ6W/xMOCh+VSzA2w155C6CEUjH/dppviZ3DE=
X-Received: by 2002:a24:2ec2:: with SMTP id i185mr368122ita.62.1550783336356; 
	Thu, 21 Feb 2019 13:08:56 -0800 (PST)
MIME-Version: 1.0
References: <20190114125632.4780-1-git@andred.net>
	<20190205023241.29707-1-git@andred.net>
	<20190205023241.29707-14-git@andred.net>
In-Reply-To: <20190205023241.29707-14-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Feb 2019 21:08:45 +0000
Message-ID: <CAJTo0LbAe_VNjcn=-ehnD4wqJKprn5CBj2cfM9cjSUMaF=ssDQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 13/13] util-linux: final cleanup
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
X-List-Received-Date: Thu, 21 Feb 2019 21:08:55 -0000
Content-Type: text/plain; charset="UTF-8"

Looks like the manpage cleanup didn't quite work:

WARNING: util-linux-2.32.1-r0 do_configure: QA Issue: util-linux:
invalid PACKAGECONFIG: manpages [invalid-packageconfig]

Ross

