Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 939AD7E452
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 02:16:54 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w22so4129055pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 19:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5v6ooadEq8fAqCE5lNt3WtB6wLRes2YdPX3htfNVu6A=;
	b=MNj9SSVkTRksouyaDwB0jHamFTs8KA77GNquu/RxNNzYebIutNaXd3CV6cqG33flYq
	of3Pj434Tk1sUm4lmEInOChsvwtWPFs1JnmMIYh3K+AL625xL33YLGDLGSCnd/aQ4owU
	IJg4P8Eb4JkCiGNcqZxoJxpk5xBU6mzPgpAfiKvCfTJL/emuEnz2DTVNum0dhqRiVWOU
	xmP/M0JgMbZHytrvTo0nHjad+HqcfstSFFBzHXY1Qx599sSbcT2EfZSr77tlrQt4LEny
	4HoGSzQuP9qCctlwZl89sRzG3IGuPIESmnIhTENniugUH9z1IEKkQNIjsjN/UYAS3gOo
	930w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=5v6ooadEq8fAqCE5lNt3WtB6wLRes2YdPX3htfNVu6A=;
	b=g2iom7mmYPLlzUx92evfDcHaQPoTqR47ZoebkyFC4gS0D551nJ7rrRZDo1e/E2x+NX
	38LGnhUmteTkaPekS3vxJ4lmJIRhQ2OOYqSRiblWvNz1uETV6rP9uM0c0/JdRxF7kTd3
	i8yR0VCGL8i8LHgwXLEs6dv12/v2AAEiWJ6fjPsGWAXjGU5/i1VNyBIL2ZAc+WxuDZ7r
	FMazKxhL0sqPH+quQgyBngAyWUPQ5E0H9TbhEBNP/yiW8bVYcK4eloftCFKNQSyUCQnl
	SkcHOiOEZHyUG9kOpsWRFYaVWOLqCVeiMs0ZIxiJxlljACrBDsJwENZnF3VKMPox7jgZ
	fRNg==
X-Gm-Message-State: APjAAAUwkhoVjh2iflFtsV0ZHKi7tpfFikdcC8t7WVotDfC+xH6eSE0p
	filixSHmJTlNLvdzR3kRH2g4Veejf+8=
X-Google-Smtp-Source: APXvYqxJTNKsmzDuJ9U0flKPT/pKcUfCP+y/aLX8OhngyX03JlIi2vZkM2L5aOXjrfNvczHpIIrVxw==
X-Received: by 2002:a63:d613:: with SMTP id q19mr67614522pgg.339.1558664215201;
	Thu, 23 May 2019 19:16:55 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:41da:1c8d:2ccb:5914])
	by smtp.gmail.com with ESMTPSA id
	ds14sm556233pjb.32.2019.05.23.19.16.54
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 19:16:54 -0700 (PDT)
To: ChenQi <Qi.Chen@windriver.com>, "Burton, Ross" <ross.burton@intel.com>,
	Adrian Bunk <bunk@stusta.de>
References: <20190523103352.GA25084@localhost>
	<CAJTo0LaErQVjmJoAFr3e45fZ75+TiZFi_hDS2f-KUGuLyC3hTA@mail.gmail.com>
	<45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f9b4e583-3e93-6e6e-ebaf-891093a135b3@gmail.com>
Date: Thu, 23 May 2019 19:16:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <45b3b2b0-02c0-1073-df0b-2ab03df1bb29@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should systemd be marked as incompatible with musl?
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
X-List-Received-Date: Fri, 24 May 2019 02:16:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/23/19 6:45 PM, ChenQi wrote:
> On 05/23/2019 08:22 PM, Burton, Ross wrote:
>> On Thu, 23 May 2019 at 11:34, Adrian Bunk <bunk@stusta.de> wrote:
>>> systemd is fundamentally Linux-only and not portable to other kernels.
>>>
>>> systemd upstream is using glibc extensions not present in other
>>> C libraries.
>>>
>>> systemd upstream is accepting technically correct patches that help
>>> building with musl, but there is no interest upstream in keeping systemd
>>> working with non-glibc C libraries.
>>>
>>> The way things currently go, systemd/musl will require an ever-growing
>>> amount of not upstreamable patches - and this is not sustainable.
>> I think I have to agree with you: several of the extensions are for
>> security purposes, so we're potentially actively introducing issues.
>>
>> Ross
> 
> 
> I suggest we only apply these musl patches when the libc is musl.
> 
> SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') == 'musl' 
> else ''}"
> 
> In this way, these patches do not affect glibc users. People who 
> actually use musl will test these patches and maybe improve them if they 
> really care about it.

thats acceptable approach. So far we have helped upstreams of apps to 
cleanup or add support for musl and it has worked reasonably well, 
systemd is a bit of odd man out since they explicitly seems to not care 
for non glibc/linux systems, still they do accept cleanups which are 
resulting from such ports so its not completely wasted excercise, but I 
think dropping systemd support completely from musl is not an option I 
would like to go with, there are cases where this makes sense. 
Especially when you have to cater to different set of devices from small 
to big, userspace remaining same is big advantage atleast in the world I 
am in.

> 
> For example, the following patches are written by me.
> 
> 0017-Do-not-disable-buffering-when-writing-to-oom_score_a.patch and
> 0001-do-not-disable-buffer-in-writing-files.patch
> 
> These two patches are to solve runtime problems in musl based system. I 
> knew there's something different in buffering mechanism between glibc 
> and musl that causes this problem, but I really did not want to spend 
> time digging into it. And as systemd was using unbuffered way for 
> writing files for a long time, I just disabled them.
> 
> As Adrian and Ross pointed out, these patches are introducing potential 
> security problems. I agree that we should do something about it. At a 
> minimum, the glibc based system should not be affected.
> 
> I'll send out patch and please help review it.
> 
> Best Regards,
> Chen Qi
> 

