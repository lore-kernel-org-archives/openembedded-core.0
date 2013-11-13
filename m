Return-Path: <layliu@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 068456D7DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 03:05:10 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so1982446pab.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 19:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5g0rKwOc6B0+yzU0ekuJFzFZI54YqS+8YiwldLo5Pbg=;
	b=MVcyUqOUk/ZPno2S6Z4UNyExlNTSKQAZVeU4iW+sKuQOyOgqzyQJbdPbNBQuk5Zo28
	XlNTngH5pcULGZdNjUyiKCiV9sBg1lAqkL4LQor9Gv9gPiMzy58WqG/c+mW2EvOaiCuP
	YkRw7UBrvvBTk4IdWHF9f+Su3qHwjN+R9k1e+GNfVTaC31M21aVU+1G00Sm18G79n7V4
	dn27SenXVjftwsfFy/9/PsWu15Ykn/xVQBykVmqzmOQdxq/RaEMChzv/sUOaxfYkuRHl
	yqFKBt/CCKcAM7uLnJWKdpYgjqOr4+7vDPXS5+aTC3rlLzpm68MiTma/UU/muq9tSK4R
	u4oQ==
X-Received: by 10.68.225.232 with SMTP id rn8mr38352706pbc.32.1384311912117;
	Tue, 12 Nov 2013 19:05:12 -0800 (PST)
Received: from [128.224.163.160] ([1.202.252.122])
	by mx.google.com with ESMTPSA id
	iu7sm40793388pbc.45.2013.11.12.19.05.09 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Nov 2013 19:05:11 -0800 (PST)
Message-ID: <5282EC62.9010805@gmail.com>
Date: Wed, 13 Nov 2013 11:05:06 +0800
From: Lei Liu <layliu@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <no> <1384162062-30319-2-git-send-email-layliu@gmail.com>
	<1384251828.1143.3.camel@ted>
In-Reply-To: <1384251828.1143.3.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] Fix grep pattern when mklibs collects executables in rootfs
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
X-List-Received-Date: Wed, 13 Nov 2013 03:05:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2013年11月12日 18:23, Richard Purdie wrote:
> On Mon, 2013-11-11 at 17:27 +0800, Lei Liu wrote:
>> From: Lei Liu <lei.liu2@windriver.com>
>>
>> File command in some version could print extra space between
>> "LSB" and "executable" - it causes mklibs can't find any executables
>> using grep "LSB executable".  Fix the grep pattern to catch
>> multiple spaces.
>>
>> Signed-off-by: Lei Liu <lei.liu2@windriver.com>
>> ---
>>  meta/classes/image-mklibs.bbclass |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
> I've queued this but please put the area name in the short line of the
> commit in future ("image-mklibs: " in this case).
>

Okay.  Thanks.

Lei

