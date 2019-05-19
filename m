Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id E258F7D712
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 05:08:16 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t1so3769290pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 22:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=S7ENGnPqCe0bFjTSVSNkkcSjIJEp9tO6pmbkybi82WM=;
	b=Rto8x1Vih0RvGYH7Dx2NrWylAKNKbVwTy5vAwh95CZoGmzpaPXbMGIlX+KhaTKGC1a
	CgxP+gezNEdsV9s1Oqz5P+szC9ceWv8+F08gImOwECOfc+mkMByI1skHG2/Kzl70bUkO
	vGbllBrZjWHnAL6UlGDf1cc/m2ryLTAtiOhA691S13WHnMAokM65MatKUNboq/72Z6L1
	ekiy34K40n9aMlXRIDoP6t6fkM4yaBlSdNFpgCjDzC3lbQwNRSmZKbr/frmaUY+0P6vu
	YcYnQKR+Pz97LNQXnssst6dVb8VfyryqVhlC2Y+q+dU+ZJQm8aZC0jJfKnbnDYrKMkpI
	9ILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=S7ENGnPqCe0bFjTSVSNkkcSjIJEp9tO6pmbkybi82WM=;
	b=VjIQcqMJCd1zm0siA0psOWn7HxNdXrCSyYqzZpi+DVhFMJF/cwWjVUaBchLoy+43Jg
	LhKiHakEJroFFK1ofVGkET+XCzdPDzN5kgNkp/0kr3o5imw5aUTk1gZ+DuogI0NW5g10
	IzsOqsmZ9VazBp0rHdkuBPlUVZJToqgrDwj4MhqgmzPkFWgkNoeaRl4asS9XR9W3N9+q
	39eQD/Wnhp3b2xogyzOsDtxMnmRcl4p8AbhzHS901BPLN0p94EaP5IMBKWjbwOOzRE0v
	EEO+IIRq6ww3q9bmPVeadTCLW4/9kGJg2PUsJjzbbfAp8RZJ1kv6fAXMjg5rQacSHQW1
	/w+Q==
X-Gm-Message-State: APjAAAV9eQjpiUrikgGi2htNSpDjbXhv9kLnhE+HaLa2zeUY0wc8ImoQ
	5cdQZymBTiZ5fl/joaBk39rdb+f2PwQ=
X-Google-Smtp-Source: APXvYqyNuK1DhWifF/eNAhhIrMCSpjOMf21ENMF5ZVbo7AgB7jX2Evb2x4q8Eo/eDt5OI9g8iT8//Q==
X-Received: by 2002:a62:e205:: with SMTP id a5mr34895187pfi.40.1558242497440; 
	Sat, 18 May 2019 22:08:17 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:2991:b26a:5bdc:753c])
	by smtp.gmail.com with ESMTPSA id
	k30sm8183929pgl.89.2019.05.18.22.08.16
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 22:08:16 -0700 (PDT)
To: Randy MacLeod <randy.macleod@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190513225205.14791-1-alistair.francis@wdc.com>
	<d2813cd316e8c8574f532727cb464d2a6e0bd796.camel@linuxfoundation.org>
	<a0e0cda1-dd25-5347-fcc2-c01a5de3cc04@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b11a59ff-bc90-57fd-e2ef-8dd353df7fde@gmail.com>
Date: Sat, 18 May 2019 22:08:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <a0e0cda1-dd25-5347-fcc2-c01a5de3cc04@windriver.com>
Subject: Re: [PATCH] gdb: Upgrade from 8.2.1 to 8.3
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
X-List-Received-Date: Sun, 19 May 2019 05:08:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/14/19 11:24 AM, Randy MacLeod wrote:
> On 5/14/19 1:36 PM, Richard Purdie wrote:
>> On Mon, 2019-05-13 at 22:53 +0000, Alistair Francis wrote:
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>> If there are issues with the patch the branch is avaliable here:
>>> https://github.com/alistair23/openembedded-core/tree/alistair/gdb-8.3
>>
>> Seems there is a problem in oe-selftest:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/174/steps/7/logs/step2d 
>>
>>
>> "oe-selftest -r package.PackageTests.test_gdb_hardlink_debug" should
>> reproduce and it seemed to happen on more than one host.
> 
> I have some off-list notes, show below, for a bug that I haven't
> gotten to yet.
> 
> Alistair,
> 
> Could you adjust the oeqa match criteria based on the info below?
> 
> ../Randy
> 
> 
> The oe-selftest:
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=13123
> is failing because the check at:
>     meta/lib/oeqa/selftest/cases/package.py:
>                 elif "Breakpoint 1, main () at hello.c:4" in l:
> is too precise. (This wasn't obvious to me for quite a
> while based on the defect report!)
> 
> Anyway, at times, the test would pass for me other times
> it would not as you may have noticed. For interactive tests, gdb
> always functions properly but the breakpoint doesn't always
> result in the *exact* string:
>     "Breakpoint 1, main () at hello.c:4"
> sometimes (with glibc-dev, iirc) it's:
>     "Breakpoint 1, 0x0804905e in main () at hello.c:4"
> and sometimes it's just:
>     "Breakpoint 1, 0x0804905e: file hello.c, line 4"
> 

perhaps its better to check output of

i b 1

instead of relying on output of setting the breakpoint.

> so unless Khem or someone knows how to ensure
> 100% consistent behaviour, perhaps we should search for:
> 
>     "Breakpoint 1, .* hello.c.*4"   ( I'm not sure of the proper regex.)
> since that will confirm that a breakpoint was hit at the proper file/line.
> 
>>
>> Cheers,
>>
>> Richard
>>
> 
> 

