Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id D8C63731B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 18:06:51 +0000 (UTC)
Received: from [192.168.1.17] (lfbn-bor-1-1001-35.w90-120.abo.wanadoo.fr
	[90.120.192.35]) by koncepto.io (Postfix) with ESMTPSA id 64CBD603E0;
	Wed, 22 Jan 2020 19:06:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1579716408;
	bh=y18Z9M4iqS1MEJ1S1NnNJ5fNk+Swo74T2nWmGJSHnIg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=hwcpcPJDThRIODrO6Cw2LWGVTJ75wm6Z98AufrqmuoMDv3OZua9Iib3+OXaiFGnvx
	fGsWy6vdetuxRJ5reGf6BpFt3gmOWWVl0+Jd3ixDUvcwlL/ON+pHAM0lOzTk89ywzJ
	4NhaR9kpbb790f6oiPjiwlC5TGx7/eYCRyFk2w4V/sdco5GuyTuLxcLRu12jJOVfli
	PEJhNXc1pGhafUigShjkqvIoChjJ7cI6bDMbIZ9Dl3TPJK+6JAkLdASmiuS3fTnjnk
	pchCM2HIZ0/D8xjAo2nktY1NU9M7ANd009BhYTKmV4Gd1bjElEFIvYnsEZupa1D1AU
	3ir7lor/8IC4w==
To: Mikko.Rapeli@bmw.de
References: <1579631324-16775-1-git-send-email-pjtexier@koncepto.io>
	<20200122092837.GH34396@korppu>
From: Pierre-Jean Texier <pjtexier@koncepto.io>
Message-ID: <a68132ef-a36b-b517-bde0-ca2419ae15fb@koncepto.io>
Date: Wed, 22 Jan 2020 19:06:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200122092837.GH34396@korppu>
Cc: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: upgrade 2.34 -> 2.35
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
X-List-Received-Date: Wed, 22 Jan 2020 18:06:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Mikko,

Le 22/01/2020 à 10:28, Mikko.Rapeli@bmw.de a écrit :
> Which parts of util-linux are now licensed with GPLv3?

As said by Peter previously, it's only for hwclock. In fact
since commit 7a3000f7ba548cf7d74ac77cc63fe8de228a669e ("hwclock: use 
parse_date function ") so the version 2.30,
hwclock is linked with parse_date.y from gnullib.
And gnulib code is distributed with GPLv3

Regards
-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io

