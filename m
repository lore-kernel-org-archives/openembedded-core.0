Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6788271A1C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 15:51:37 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id t196so31750792lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=tflRxHpZgE3ZE4mPdJsnsC4tk2DFGXX0ZS5TGhmsv1A=;
	b=PCk8ED6qOKpd31RCfgUdEEnXUy1LBx0JR2KGcJ7uH8bTz5thuKm8TI+AuDMFf64mbb
	Myb9LPNMW9X9ZU7ru+NeLCDEMRYNm6ElQygYcT9GJ5DQv07BHPhK0Z3gXmAGdmXOzfjY
	O9zkj+7dQt3klievZ3aS/iSjwH/Wiax3BtCnJ/WGD0b9y+/xB7b+3EO+R9c/oWgEbBng
	+fVsZgbDbLVbo7UOQJdJ+rlbTHR7b5gZXMiQ6WWHXA+eL78BIczcdMtwKvrgQHvXnQZw
	2LaUHjcyxqNfacqoU2oxadbSeYwwJ2tv9ZdYHLZkXab+DGrHoyVHfhC2ldtgq8QAgYll
	BacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=tflRxHpZgE3ZE4mPdJsnsC4tk2DFGXX0ZS5TGhmsv1A=;
	b=f3fPb4GA1XQpeChkp+KNn8GUHaCvTgmctzEUXUtzuDgHAEfjkrs3Fmd6+GTTp52Kes
	H0Ba79bCtoTBkdXjyLIgpLnXdtm2dRFluf8qEbs5XBXumnNiPpjwzclFfA7X9g+CNeev
	MWcZjCUZk3+cLfQklZSjiXABUR1oPL3JakI5GayDSlyQfJIsO/zjfFd7aLwJztzXCltP
	b35Lt9oq7t8NYh7/Vb4uCDZ5ZxBDUK61Llbca+QS9tj7LnfxtVE/cU61qyupoYom/JHz
	ck7y06OqMAJF422xVbsGgy54w8NPeEbJBinvbXQMl3Z0yd/6ThI/Y9wi9dOeqPtp91E5
	NQCA==
X-Gm-Message-State: AKaTC03ANCf9GX10Bp7M4Y916QvrAbwr4te+UW1gxfoTRLObl0Qfn+XjaVnxCWLV0kjFfQ==
X-Received: by 10.25.198.132 with SMTP id w126mr1420095lff.175.1480002698455; 
	Thu, 24 Nov 2016 07:51:38 -0800 (PST)
Received: from [192.168.1.14] ([176.111.205.58])
	by smtp.googlemail.com with ESMTPSA id
	i129sm8232540lfd.8.2016.11.24.07.51.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Nov 2016 07:51:37 -0800 (PST)
To: Andreas Oberritter <obi@opendreambox.org>, ed.bartosh@linux.intel.com
References: <1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
	<1479916616.31880.48.camel@intel.com>
	<20161124061543.e2xpgh7zjir3oynk@pengutronix.de>
	<fa1edaed-1498-160e-2015-8b7882c04877@mender.io>
	<20161124132315.GA14497@linux.intel.com>
	<1e1a7126-15dc-33be-a863-ea93063b554f@mender.io>
	<20161124145136.GA31813@linux.intel.com>
	<1bac8afc-7037-3891-7e3a-5a590dbed9e2@opendreambox.org>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <23608ccc-ebaa-f2a6-6b39-02121e7b4287@mender.io>
Date: Thu, 24 Nov 2016 16:51:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1bac8afc-7037-3891-7e3a-5a590dbed9e2@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Thu, 24 Nov 2016 15:51:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 24/11/16 16:28, Andreas Oberritter wrote:
> Note that in a shell, "data/*" doesn't include "data/.*". So this syntax
> avoids the confusing rsync syntax in trade for another one. I'd prefer
> the rsync flavour, because "behaves like rsync" is easier to remember
> than "behaves like a shell glob, but differently". Confusion could be
> prevented with good documentation, FWIW.

This is turning into a bit of a bikeshed discussion. I have a slight
preference for the glob version, because I think it's less surprising,
but I'm fine either way.

I count myself and Ed in favor of glob version, Ulrich and Andreas in
favor of rsync version. Patrick, you wanna be tie breaker? :-)

-- 
Kristian

