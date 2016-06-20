Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id DC5E360088
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 13:39:31 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id q132so37857782lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=hia0EkXRzisS11bcCUITC7DHj0oPEyGOSIVRVUAF08w=;
	b=G8zQ+ZJo/hxAeccxZXlDs/+Tw0dOxRsX44lUmRQQdU1DjJgeMOv/4VX3gaUsvX87jn
	+g4b3jwlDAqkrB31krdo7HYt5a1rJii12DbD2IytbXvVh0Xe0p3kGO/kJsvrlHDybfld
	ZPy0Ri90dgpYNxEQtMPymxA8ciwqdgcU07Z5bkQkMhXQMPtJ7WSj2zZaqgYeCREyiusp
	jIB9RvfID5AHE6mIbfcFpY5a+x0W3QGeRo/l78SpLlaHj8vX0M81nVyhCRAoACSxFrlc
	zCMopb6BulM42/Dt2diJwgiWUbuiQ5nRWqP9YxEDABrnzFwqUluuiTfnHmaKQfkhotEn
	MxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=hia0EkXRzisS11bcCUITC7DHj0oPEyGOSIVRVUAF08w=;
	b=E1WVBLO532SoU6QSmrOq3HnBlIFLChcyZYBtRBtt1BIp2yzR1Snz3LUt8lRkeP6Jru
	xWHv/faxUYcT+sKgnoBFTAgVifKv8bp93/zUsEOnbC7ORg8KkvPXRngAvx9D0o4VGm7G
	eSM+s2vZU3QkXxaquqCW6n078bbxS1oVAyC7wMl2Q4ZQRdbxSeGWsPhqf1W0gayvPedh
	pjR1+03lrnKA6c7jT4RYfQO2iUruAxw1Hp9A1l1Sh0tqpD2CFl0Bk1A3CwE5AK2U9+xu
	uRa28bBQfjMBOgI3TCbURKyVvRCJ9fCYpvYnkZwyz+lam8DIf7FO7H/0b7nHOwCaHWzO
	s+fQ==
X-Gm-Message-State: ALyK8tI3A7W+o5GqhTHUZeDp3GjhybWbFVtTTt++SNqxyCuQRgkAwP20WRoWY4YW8HQndw==
X-Received: by 10.25.39.78 with SMTP id n75mr3064228lfn.91.1466429970775;
	Mon, 20 Jun 2016 06:39:30 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	p126sm3603460lfb.3.2016.06.20.06.39.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 06:39:29 -0700 (PDT)
Date: Mon, 20 Jun 2016 15:39:28 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160620133928.GA3741@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1464025858.git.akuster808@gmail.com>
	<57593804.9040403@gmail.com> <20160609103438.GA2586@jama>
	<57594F42.1080607@gmail.com>
MIME-Version: 1.0
In-Reply-To: <57594F42.1080607@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [PATCH 00/72] Krogoth-next V2, pull request
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
X-List-Received-Date: Mon, 20 Jun 2016 13:39:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* akuster808 <akuster808@gmail.com> [160609 13:14]:

> On 06/09/2016 03:34 AM, Martin Jansa wrote:
> > On Thu, Jun 09, 2016 at 02:33:56AM -0700, akuster808 wrote:
> > > ping

Do we have a status on this one?

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

