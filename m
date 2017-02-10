Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF167738B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 17:52:43 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 204so3631143pge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 09:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=8uS1I8y3jbeG7Fh7r4/I2hD54gpU+gowhLPGlk3XROM=;
	b=Y38GURCJUQb50Hxihwij82AWxivyq7cUvkmRKL3e6NJp1PAeCfjXosQMJ75UrRrhnP
	LZyF2G+dVxKiQ/ZTjHZpPMQJ7cfM8LEqgSp0FQ83bPGr8qaXtlDIO41Wq1SITJMY8SKQ
	NasWOCqscKvru7SAc5TlnECmpFUFFnrhCWOoVsA7vF7cPyNwVT/n8dsW5v2xikyM7APY
	KUv6qaL52eWqBzlXdAuk8Ii5PvzdNaE4xpUjEXAKuhrzRnagQLYZb7M/Y/RWZ3LfMWvA
	kIX+NAx8aX1zgiR4J03JsMRPttGwTAWEjmsuobPiPKMaYPfLiWw+4aQ3u/xtz/KuZ0MT
	wEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=8uS1I8y3jbeG7Fh7r4/I2hD54gpU+gowhLPGlk3XROM=;
	b=BnvXV9E/0sSI1u34wjMM3sY9Jqq9RMPwiKQ+8nMjqogDrnjtY+fkfsRoPAFqVUYe8m
	4NgU7jkdfrN7QOydZWzp0/+iE5kcpPfRbqxzNZJi/rJ2yXOVIaJX2LXpXb2Otp1LL9Q8
	9N/rd/VK/SS70YxO644xwHI/d89QfMJIblEQPZaHGv7ngXSnYju3FqSE67Esrrzlp7sy
	ENe7c3shPwiXwHE1O3ExpxoTbwMULxcA2icOH5UdOa6g0AuyOIUfDT8TMf+Md99nizTD
	mvUsPF5F3Lfydh8Qgk17djI/WDyyC+EzsDhdFJG38wB+3SdyWB295wIBGolJTJO5IVLG
	W/Yw==
X-Gm-Message-State: AMke39kvVk4PQWXbWRcyNxlj2k/G9QsGhaUYICNFC7sxuV4G/dFkUbuMd6x0FhnxFN+oLg==
X-Received: by 10.98.138.155 with SMTP id o27mr11579763pfk.113.1486749164000; 
	Fri, 10 Feb 2017 09:52:44 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:647:4c00:23ec:9075:bc4c:9a92:4854])
	by smtp.gmail.com with ESMTPSA id
	67sm622564pfd.120.2017.02.10.09.52.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 09:52:43 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1486622006.git.hongxu.jia@windriver.com>
	<a7a0e642035a2eae2e606dfd54857c1abf11d43a.1486622006.git.hongxu.jia@windriver.com>
	<CAJTo0LYAPXhuaOYNy1-VBEJNNLJY-zHHvkTNASrhmx68eFR3Ng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <24b27f48-5a49-fa7a-859b-b2aca7851812@gmail.com>
Date: Fri, 10 Feb 2017 09:53:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYAPXhuaOYNy1-VBEJNNLJY-zHHvkTNASrhmx68eFR3Ng@mail.gmail.com>
Subject: Re: [PATCH 04/13] ncurses: 6.0+20160625 -> 6.0+20161126
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
X-List-Received-Date: Fri, 10 Feb 2017 17:52:44 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 2/10/17 2:57 AM, Burton, Ross wrote:
> 
> On 9 February 2017 at 06:45, Hongxu Jia <hongxu.jia@windriver.com
> <mailto:hongxu.jia@windriver.com>> wrote:
> 
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
> 
> 
> This upgrade is failing all over the autobuilder.  I'm guessing it's due
> to this new warning in the configure log:
> 
>     checking $CC variable... broken
>     configure: WARNING: your environment misuses the CC variable to hold
>     CFLAGS/CPPFLAGS options

this is being too picky, why does it prefer to have a bare compiler
binary only for CC

> 
> 
> Because later on:
> 
>     checking for getcwd... no
>     checking for getegid... no
>     checking for geteuid... no
>     checking for getopt... no
>     checking for poll... no
>     checking for putenv... no
>     checking for select... no
>     ...
>     configure: error: getopt is required for building programs
> 
> 
> I'm pretty sure those failures are not accurate!
> 
> Ross
> 
> 

