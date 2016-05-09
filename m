Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id D2DE2601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 21:27:28 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id c189so82654055pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 14:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=TCw48Xcz42B3r50PkE/V2Cryynco+L8nmopAimbOzSA=;
	b=phRD8dm3x4Hg3G6snjiEoeiTCzVZ8Up/atfHU6iun08VgiUsj8oVm2LXbRQ4Nawxyk
	hD5NiUwK1+FCUo+CDT+oN+JXA5xGhlbf7mdRvOZufXl/Hj3g0qfNmJIeqRk3kUHcvYrC
	LlRakaGUB2obyWYF5YRmfgV0CvJHMy7dHzCybdJDoNwKftgnw/vywV6uTzjucmKeHSPR
	BTl7tJ1FCqRo5t2hVmogEvRNXKlhhCFZkCbBzzhn2Rz2HMiAbhHib1ouIk9GR/oiwx66
	qtHY/l6Nqjii/eqHOKHkJeph5tk3bkAApeTh9qQfFcT1B+cPEluLXag7iGf1i7+Q0Kem
	avog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TCw48Xcz42B3r50PkE/V2Cryynco+L8nmopAimbOzSA=;
	b=UVHYKEYbc8W1Pi40WgN3R/P+cqIOMl8b7ja2HwPCp7EYF8ncyfIRoUQcrEbIEynGJR
	1aHbqAm18Wz0cPUxcs6tiYLIxJn4v/p92BCW/8fyLkdq/TPyg35SJYTWBOnFRWYRItDk
	utWwdfzqV45qj3eYxE1D+UNDhEo657YMNfYLdibjs/OfPMEgLxCaC0zOiE7VnuKFtVHg
	DayRpAg0R1Y8MNzXFBrVKM6EeomA5KUHOcpcGmDpaHpeadbbu4Dg68wQNQNdBTJZpYTX
	fCoWI+9pe1r0wKBs08z+m0AHhmMZGYAB202dV4TUOy///ZAx4HOSMMWRMAOvRbuHTrdl
	axcA==
X-Gm-Message-State: AOPr4FWUfovTK9NNyTSEx7CAySsryaWi3hQ5ZvNw4fGua5uXpKMcDt/VL0KtIwEeWgrlYA==
X-Received: by 10.98.93.5 with SMTP id r5mr52558429pfb.15.1462829249758;
	Mon, 09 May 2016 14:27:29 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4000:1239:839:9ac2:c9fe:96e6])
	by smtp.googlemail.com with ESMTPSA id
	87sm42662073pfq.93.2016.05.09.14.27.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 14:27:28 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1461867811-7837-1-git-send-email-akuster808@gmail.com>
	<1462355553.6485.5.camel@linux.intel.com> <572A0450.10100@mvista.com>
	<1462400231.6485.19.camel@linux.intel.com> <572CBC7E.9080407@gmail.com>
	<572CBD85.8040500@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <573100BD.9020907@gmail.com>
Date: Mon, 9 May 2016 14:27:25 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <572CBD85.8040500@linux.intel.com>
Subject: Re: [master][krogoth][PATCH 1/2] qemu: Security fix CVE-2016-2857
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
X-List-Received-Date: Mon, 09 May 2016 21:27:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 5/6/16 8:51 AM, Alexander Kanavin wrote:
> On 05/06/2016 06:47 PM, akuster808 wrote:
>
>> I can not reproduce this issue. I have used two different build systems.
>> I have another I will try.
>>
>> so the testcase be?
>>
>> 1) bitbake core-image-sato
>> 2) runqemu qemux86
>
> 3) verify that you have a bunch of .gir and .typelib files on that
> image (or in target sysroot)

yeah. they are there. wonder how to reproduce this issue?? host os release??

- armin
>
>
> Alex
>


