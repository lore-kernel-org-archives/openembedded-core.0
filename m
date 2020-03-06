Return-Path: <jpuhlman@mvista.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 406F360069
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 22:14:07 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id v19so4114924oic.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 14:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=2RGqLp1ikzzy1GT1a9IVub+PYDxXAbJmSG8FqwLFWf0=;
	b=b8znD2DCU2WGDkYvQa8G6jv2uoGJBrRrlK0MBLQXVtiSKeVeA1s3BpPcXoC3sLZSTs
	i8PndHEenO0YURJEdGccrLfWc1d4wdNlG3dcr42UkK8nXmPxwGexkCDjuipkg1BiPLLA
	kOCAQblnscROaRQKmdLv72ZF1G7fnA1CwfTZ9wjPKHf5s09tghvcB0PCXc1Xlt1JPDER
	p3Xzxutr5TMgwFfOV+GSB3usqlccOzRgzDQqE93EMFXnrrM7Uc5YsaZCADDchZB7FZAN
	YQOG6OIZjd+cbRdDHIEz44fi4cNZKoW03+3RWLETVubB06UsHNm9W2Mx0VHROwM0tty0
	Zwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=2RGqLp1ikzzy1GT1a9IVub+PYDxXAbJmSG8FqwLFWf0=;
	b=OSMAqm3iRFLKOShD+1drWMA8kfAudi4dw0NmxSLyEnH9WihwDwJ93ayVoMbbklsY3B
	x+jOgBEaUbhDKLEYs9SMsmO8nL5CZ1p81vaztyJM+JjrejPXglT1BhqcAK3wlIFMRLkd
	9i8B+fKO3c1VKmvy38RjccswLQBbBpkUNxMDWgHBLOoBWrjLjNkrPIb4qMH+nVpZsD/f
	YBqdoDuSF6bV//OnPPim58UrxTzSqVwndky990y4vylUeo/OrSMZTUSzqEwIScxiW7n6
	sgGV8TZczoOOi2yNk+0OrlKNaNtCz2z+gBMEP8zKdjdvri7A4kqAdWaTtEOz5bCjgQrL
	httw==
X-Gm-Message-State: ANhLgQ2NgPDjuuMDOIwIhodLSzZ7ZPay/khefW4I4GoCDbTc2Sg2yQid
	awRcXqmd58V7ADvacRA/kr1Uqe2kWSU=
X-Google-Smtp-Source: ADFU+vtJJpliM3MWTjbJc9J9y+1hFU3HEupuTTvXtmOUO1XJKVGXmRyByob1lrxpRLT/pKL8/7uW4Q==
X-Received: by 2002:a05:6808:9a5:: with SMTP id
	e5mr4107529oig.168.1583532847853; 
	Fri, 06 Mar 2020 14:14:07 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3?
	([2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3])
	by smtp.gmail.com with ESMTPSA id f1sm6773063otl.22.2020.03.06.14.14.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Mar 2020 14:14:07 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <62ba6d2a-098e-acbd-db0e-b2283a3b476a@mvista.com>
	<446c96a2d520e581eee85d519233fdb961c9d1c2.camel@linuxfoundation.org>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <f7e28eac-848e-1eb7-2ae7-345d737482d2@mvista.com>
Date: Fri, 6 Mar 2020 14:14:04 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <446c96a2d520e581eee85d519233fdb961c9d1c2.camel@linuxfoundation.org>
Subject: Re: Multilib conflicts in man pages.
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
X-List-Received-Date: Fri, 06 Mar 2020 22:14:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/6/2020 2:00 PM, Richard Purdie wrote:
> On Tue, 2020-03-03 at 15:22 -0800, Jeremy Puhlman wrote:
>> Is there a preferred method in oe-core for dealing with man pages
>> that conflict due to differences in multilib pathing.
>>
>> For example an application lives in /usr/lib/foo/bar for one abi but
>> /usr/lib64/foo/bar in another, and
>> that kind of information is encoded in to the man pages.
>>
>> Some things i have seen done in the past, is move the man pages
>> under
>> /user/share/man/${PN} or
>> use something like mutlilib script to deal with it.
>>
>> I am just curious if there is a canned, preferred way the project
>> handles those or wants to handle them?
>>
>> xinit, xserver-org, and groff each exhibit  these issues.
> Could we just put a placeholder into the man page so they'd be
> identical? Multiple copies seems like overkill for something as
> trivial...

A placeholder like:
/usr/<system libdir>/sys.startxrc
from
/usr/lib64/sys.startxrc


> Cheers,
>
> Richard
>
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


