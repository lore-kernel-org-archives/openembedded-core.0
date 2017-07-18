Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A2F417820F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 22:36:41 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id v190so4473009pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 15:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=5PxMJ4a3UkVys162aatwoAOzao6LmxPa+q0b1cVFU/A=;
	b=qC9weIj3EJ4M+vjZgfTzbtePtE9ge116HWF1Y1aUxkKb9jTw32lTcT2fxd1+EWdzwX
	GXHewQdRwCBvZvU5bKVrV77l6sJ9iWzFYzvPG8Wot6IXgHEq8vVE6g6WjiRYn2eTmVXs
	aJpzKz1f4bBGZQWctfomzwv/cPoNxashhkfB9hdHbsU87dXYdHBYF65pgHGWuow5lSz+
	evXvMGslScowYHbvA5zc4xWp0HKkalM0rXqt+zELuNTxY3I3ghAI2YTTqfFmfd8phDUE
	LGsDVyRDYRxJIM7B2ZnrJQSNKUk2A+xyBffiYdT3B7B072NVkjy7fg9tg4YvyfBIrL2Q
	8jdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=5PxMJ4a3UkVys162aatwoAOzao6LmxPa+q0b1cVFU/A=;
	b=HoRnju428YbJ8ZCGiIFSusbimNJems8B1CpJWwZHfQRR5hbJYB4+P/uotCTOz6ceS8
	Gd+Dw/aTlCensVaLthM3ZbPUhShXYMT2SBN3L9byGOkAF84dQYy6hDWRNQ0zYITsXD6W
	g9FtjRW4/b1vkTaIIGKn2gKOl6PDKBTW5C+XM4mSBxI+nLIKN9lbdX/Z24LD8LZoso5G
	6Ozu0pWOE8RnQDGynyMQaT5oY7i4kBN0ROX9T3cvaUwsueyj4jRkcuQt8q6oCUsNN24w
	n6PWjPQ4/zmPRC6HAGDHfWQCsieU6RfSnAjXNkFnv5eyhGHkbiK/V2QCdrVZbuv04S5V
	TOBw==
X-Gm-Message-State: AIVw113V8YBmjyd2ol7Swd9iwfr/XdYL3YwC2fiCuJRQwphzp6m2qEY4
	1jy+MUwTbd1qiQ==
X-Received: by 10.98.217.145 with SMTP id b17mr4101455pfl.70.1500417402818;
	Tue, 18 Jul 2017 15:36:42 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156])
	by smtp.gmail.com with ESMTPSA id k5sm8523183pfj.31.2017.07.18.15.36.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 15:36:42 -0700 (PDT)
To: openembedded-core@lists.openembedded.org,
	Patchwork <patchwork@patchwork.openembedded.org>,
	Ross Burton <ross.burton@intel.com>
References: <20170718220735.6547-1-ross.burton@intel.com>
	<20170718223151.2383.3115@do.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <26f98399-395a-27c3-990f-bef2ff5dec81@gmail.com>
Date: Tue, 18 Jul 2017 15:36:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718223151.2383.3115@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbbW9ydHldIGxpYmdjcnlwdDogZml4IENWRS0yMDEuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Tue, 18 Jul 2017 22:36:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/18/2017 03:31 PM, Patchwork wrote:
> == Series Details ==
>
> Series: "[morty] libgcrypt: fix CVE-201..." and 1 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/7801/

looks like patch test got confused. your patches look fine to me.

- armin
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Patch            [morty,1/2] libgcrypt: fix CVE-2017-9526
>   Issue             Missing or incorrectly formatted CVE tag in commit message [test_cve_presence_in_commit_message]
>    Suggested fix    Include a "CVE-xxxx-xxxx" tag in the commit message
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>


