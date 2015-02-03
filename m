Return-Path: <mail@timomueller.eu>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id ACA796E5DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 09:02:11 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w55so38222542wes.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 01:02:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=YkgwP/jpEB+RpoI7kdkScgO5tu2DjAoYT7ebPr+Y1sM=;
	b=CkfxSYrUuXYGI4ilfUOcp3Z+iYXaHYQ9e3Avg2SG+Fb5GJ2BAvP3/NqKFWfz8Q4qal
	Vo4QwHuChLoY3u01SzknvpiVS1wIlCteTzBqWBleWrvitz6Dp2VxtlAOjYxpXSo56X6v
	b/lIXCzrBft8aMUDU288MxvHUTp/CO6jlb53SOhXU8U46Gm1qF/+39M/Ns9IH9PYCSFp
	8OZrtn++oF9gZ3PBz4dK7JpyYXAabG/MnNRRN/+P6YmAS5hg7f9E2hqZoj7LxuNQbW+H
	+DJUNrX9gDSIscRZNsFOHNV9JmZMFFjQK5aN4u4MluZ9LvvYoX0CFiDLOYKabgTe05Hb
	8LaA==
X-Gm-Message-State: ALoCoQleZc9jeE24S+qPqXpUToBwgkX1aH7dm6qdWUdSmD0MKdLdOGX97eEmq+pP78bvliCQuBWK
X-Received: by 10.180.88.103 with SMTP id bf7mr33280177wib.21.1422954132725;
	Tue, 03 Feb 2015 01:02:12 -0800 (PST)
Received: from mintberrycrunch.bmw-carit.intra (mail.bmw-carit.de.
	[62.245.222.98]) by mx.google.com with ESMTPSA id
	di11sm23612138wid.8.2015.02.03.01.02.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Feb 2015 01:02:11 -0800 (PST)
Message-ID: <54D08E92.4070009@timomueller.eu>
Date: Tue, 03 Feb 2015 10:02:10 +0100
From: Timo Mueller <mail@timomueller.eu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <49e336fde7b762f9e00013cf7adf53618fbb4f2a.1420813096.git.timo.mueller@bmw-carit.de>
	<a5726f608827c0a0325705eae8dadbf90edd7c5f.1420813096.git.timo.mueller@bmw-carit.de>
	<CAJTo0LaOUYJTw7j7XEyh-JM_q-F5Xuze4Mq6gqufpgRm9E94GA@mail.gmail.com>
In-Reply-To: <CAJTo0LaOUYJTw7j7XEyh-JM_q-F5Xuze4Mq6gqufpgRm9E94GA@mail.gmail.com>
Cc: Timo Mueller <timo.mueller@bmw-carit.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] apr-util: Allow use in SDK
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
X-List-Received-Date: Tue, 03 Feb 2015 09:02:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Ross,

Burton, Ross wrote on 02/02/2015 04:19 PM:
> Hi Timo,
>
> On 2 February 2015 at 14:03, Timo Mueller <mail@timomueller.eu> wrote:
>
>> From: Timo Mueller <timo.mueller@bmw-carit.de>
>>
>> This adds 'nativesdk' in the BBCLASSEXTEND.
>>
> This doesn't apply to master, can you rebase?

Sorry, my bad. I'll do so and send a v2 asap.
>
> Ross
>
Regards,
Timo

