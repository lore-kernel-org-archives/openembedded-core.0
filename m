Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1799460167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 14:35:28 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id k14so19927949wgh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 06:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=5wojBsMI1GLULeRjnCbNNMM87/9df2KxFczipnwmV3A=;
	b=OeNdAfywPJfa8J8kxGfFCysAh7OA25/ZKx+IGNlietajm9KGhb1/KkpaqansvnhqpX
	iy8G5W/yDcbgUBJepOYH78WMDToSZHa7eWk+9GiWmTr67ouw8SQt2Q2/iS03hgIciECc
	tRId/vJLh35Gb9nZegWWpRitqUjPOZ7pnwtl9DGpb6c0CgKInu6b7yAzbkw8iNWm6M+S
	WZzOAzCbmWHDA6Q5AGYWEbzOBOmD9jKlITaSb+lMQ3JMy7XiI+w074ntK9r9zYYhwAWk
	F7GmtpJT7ZHK1rsxrvKsmYWheC45RQHCfhy6yVPYAh1kiR+tx68HPOGSgWulMcuht7FD
	uU4A==
X-Received: by 10.194.122.38 with SMTP id lp6mr52556189wjb.24.1424097329112;
	Mon, 16 Feb 2015 06:35:29 -0800 (PST)
Received: from [192.168.50.198] (ip-84-119-96-251.unity-media.net.
	[84.119.96.251]) by mx.google.com with ESMTPSA id
	gi9sm14412009wib.21.2015.02.16.06.35.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 06:35:28 -0800 (PST)
Message-ID: <54E20034.9030402@gmail.com>
Date: Mon, 16 Feb 2015 15:35:32 +0100
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, brendan.le.foll@intel.com, 
	martin.jansa@gmail.com
References: <1424085509-25433-1-git-send-email-brendan.le.foll@intel.com>	<1424085509-25433-2-git-send-email-brendan.le.foll@intel.com>	<20150216131003.GG2297@jama>
	<20150216135119.GC9950@jupiter.iwi.intel.com>
In-Reply-To: <20150216135119.GC9950@jupiter.iwi.intel.com>
Subject: Re: [PATCH] openssl: disable SSLv3 by default
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
X-List-Received-Date: Mon, 16 Feb 2015 14:35:29 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Am 16.02.2015 um 14:51 schrieb Brendan Le Foll:
> 
> No real reason, was trying to keep it as simple as possible whilst
> making it clear it was not a good idea to re-enable it. I can make it
> a PACKAGECOUNFIG[ssl3] = "--no-ssl3" if you think that's best.

Shouldn't it be PACKAGECOUNFIG[nossl3] ?
This makes it more clear that one is actually disabling SSLv3 instead of
trying to enable it.

> 
> Cheers,
> Brendan
> 

Cheers,
Sven

