Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 572FD6D4C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 18:31:20 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id 18so1088883ioe.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 11:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BzIOvOR/PHcriqFt4TN2+VBNZel7Pbq5Pbxxauh9kI0=;
	b=OLKi+i5I6xvawdedLZ7qZ4jaJP91nNmWPp7PodaEsj+p/ntVI1s3y1ktMWbJj08iVE
	JxAjV729uLe2m3Qg9MeMXfke+0GuYReVdZtW4gRmcpbq//n+3xeP74c5p56eM5uBFazV
	BTvN6E/1tm6fSZYYZbs2VNdK+3086K8CuhALEb9fttDZpNpSiElB3IwaTAHpfeqWL/WS
	uLCwqypTOLfJ+8T+uDxe1+XaIjW4tPl5BmEvY3dOp71LkM+7tAwbh2d2hz3KShKGO0XZ
	9Zx0bIb96euGjrc/PiVBwJXNGb4mTMDxqcCVz2ITiAEl1YiyAatdL6TvUUMv5ubestvo
	X0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=BzIOvOR/PHcriqFt4TN2+VBNZel7Pbq5Pbxxauh9kI0=;
	b=SuKm6uezAexF/GK/6jCwTWt1yYTYkVe39rpnGmYtpSleKlSY6sR1bYTmKflw7x5grq
	4f+71SGGmfCBwNRQBG0dQ5PMTFJZ0OsPrNS8vnSZhOIBF7qAYbWceIRD9akWqsEuViR9
	hQyTQznIJ9R7in9fISMfLxHYUsAuHXiE6rOEB61s9D894jffGBJdWYP5g32DNFTljquz
	+YjBgknitTvAGqCobKIR471abFBhTUcYhmBeX5xKvd80NJti1Wh+jofFFDT29yZrEUhU
	8SXUlU6U9ZCyXPeV7FzmSyW+tPkJzTw5BP8pfo0WKo7gSWpfnMXZKEkhxVmPEBDfBJku
	BLKw==
X-Gm-Message-State: APjAAAVaTtkzTaVHJJ9Cp0Dwk0cja/WKB8+EfA3hxeEqQAhbQp3MuIOi
	8Dy8NYtjOZ5RE0Yjjv07BLA7++ZGE9I=
X-Google-Smtp-Source: APXvYqx+O1akXUxWV1NWdA7qTRw08hSgmyxp4FBXlDUeDqHUDWh+eqiuVKjb8O2JZr6j59M891EzhA==
X-Received: by 2002:a6b:7e07:: with SMTP id i7mr4698565iom.254.1565893880726; 
	Thu, 15 Aug 2019 11:31:20 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6:d9ea:d615:1834:130b?
	([2601:646:8500:6bc6:d9ea:d615:1834:130b])
	by smtp.gmail.com with ESMTPSA id
	q22sm2442081ioj.56.2019.08.15.11.31.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Aug 2019 11:31:20 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190815071713.14503-1-raj.khem@gmail.com>
	<20190815182222.GA15416@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5e22091c-c7a6-e850-2b25-c020787a002a@gmail.com>
Date: Thu, 15 Aug 2019 11:31:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815182222.GA15416@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-9: Upgrade to 9.2
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
X-List-Received-Date: Thu, 15 Aug 2019 18:31:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/15/19 11:22 AM, Adrian Bunk wrote:
> On Thu, Aug 15, 2019 at 12:17:13AM -0700, Khem Raj wrote:
>> ...
>>   create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>> ...
> 
> That would be a partial revert of a change in master.
> 

thanks, that missed to be removed from local rebased trees. I will send 
a v2.

> cu
> Adrian
> 


