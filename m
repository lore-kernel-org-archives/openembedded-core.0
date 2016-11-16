Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 687B3719A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 16:17:34 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id p66so80591047pga.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 08:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=z0n+3IennU+4LfwITzdMBtWOYehhFRM8JxiFjT6BgQ8=;
	b=AWqiiOdOQbD+4n9we8M8GXVMWyc7ndPsvJaPc2h8uFwkF8wHtxF+jy6IGYSRz6b2Jf
	SIzxiPFrGkRnkpD/5z/Alaua+ikE32xyannUiEr9Zr5IQx9b/PTUi/RI3wONdAz1h+b/
	7VrRjb7/H1aJFJP9DX79m6rvZ0ko3Yu90k7fCSb2DWvTbIgcgoHwgNZsMm/ZRogquCt1
	MRWjz3iTv9hFxrQsM9xlEkBzMjP5KwXlEtnlzVrNgpzFSE8n4f5wB8bn5xJZ1GLZVcQE
	tZQaopvAF217DcWUwU4vz/hnaPpBqXWkqKicC8QTbOmaSWCPr4+tz7gS23mFMDIJJ/XE
	tMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=z0n+3IennU+4LfwITzdMBtWOYehhFRM8JxiFjT6BgQ8=;
	b=AYt+GXlk0De9cERhllK6czlKOVHHaJNg8sfCQdf7Ig/3ZmkAbPT1zSy8UJkeQfgl7X
	/K3TtWDeXNFy3u/2iUAd42RUVVeiUzFDmr6nVblPqlGc8ZtKVpDUM8p9fIK/cv/9y5Bj
	XYG1FFfraabQ0klVa55XIZjz1/cjoePY09kZuZSduwuFxtSAGUdmuLPK0yCw9iU2HbpU
	O5jr9BA5S/ttdOCXm/439M0WVPfMaO9eiV3IMdWUHCMaJPd1i00TwfwoNIeGk6+T7/RN
	Lx6MWyFu4ytWfLK5E543fyPmJpLferaX/M7Ke5lb97NArINVBFSSvNFLe3UDilygcjjr
	5S0g==
X-Gm-Message-State: ABUngvcWnY4gZYu/2CXYHMJ9wyDXphILT6v9503jOGtMc7OpCGsmN+W291wtynZ5l0YzPQ==
X-Received: by 10.99.122.14 with SMTP id v14mr9933288pgc.31.1479313055818;
	Wed, 16 Nov 2016 08:17:35 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:90e8:e402:95d:e46d?
	([2601:202:4001:9ea0:90e8:e402:95d:e46d])
	by smtp.gmail.com with ESMTPSA id
	g82sm55333766pfb.43.2016.11.16.08.17.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 08:17:35 -0800 (PST)
To: Andreas Oberritter <obi@opendreambox.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E572AE52E@fmsmsx111.amr.corp.intel.com>
	<e188c300-ce1b-4591-cb87-81a1497bbf34@opendreambox.org>
	<1478613085.23123.137.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2b20c3bd-32e1-695f-cc5b-58f9e2f5996e@gmail.com>
Date: Wed, 16 Nov 2016 08:17:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478613085.23123.137.camel@linuxfoundation.org>
Subject: Re: Yocto Project Status WW45 - UPDATED
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
X-List-Received-Date: Wed, 16 Nov 2016 16:17:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Andreas,

On 11/08/2016 05:51 AM, Richard Purdie wrote:
> On Tue, 2016-11-08 at 11:00 +0100, Andreas Oberritter wrote:
>> Hello Stephen,
>>
>> On 04.11.2016 18:06, Jolley, Stephen K wrote:
>>> ·        There was a challenging taskhash mismatch test case this
>>> week
>>> which has resulted in some significant debugging improvements for
>>> taskhashes and basehashes which are now in master.
>> is there an entry in bugzilla about this issue, or can you please add
>> a reference to the actual commits in master? I'm facing a similar
>> issue, so it might be helpful for me to backport them to the branch
>> I'm using.
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=0a4a6d6956a10aa0a6589de12b0b2380a9f0a7d9
>
> has info in the commit message. You also want:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=589f08aa852dd43af5d05d698cfa917bec084210
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=157947efc7e505e01baafb33ec93fe2f485308fe
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f6b0c60664e86fec55d282f1ea41238abd74712d
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=71c837611690ab4bec1656a58d13ca48e7c6a6e6

This are now in Morty via Richard merging. I pulling these over for Krogoth.

- armin
>
> Cheers,
>
> Richard


