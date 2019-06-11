Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id E8FF17E6E1;
	Tue, 11 Jun 2019 20:59:02 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id x22so7143979itl.2;
	Tue, 11 Jun 2019 13:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=UBXjg1blMpc3yC/hmbFMfUt+ZIxQsOufRxs+2Rn8j0k=;
	b=V/YcqhdKHTQ0JgRifXJ/qtvKaPjOBPKt0mhd5eh+MkfxsP3XTQdVxXU4bk7MEW+DOo
	aWj2s4HM57dQZ0fwjnWQV/zvi4jOxb3+ZQku/kNKX6R1DcOrqMtQDUNJDzgKH4Cqa28T
	0icBsKMLiwUTgXg1E5DSNT1iaUZJCCnuqzwY7GnCa6fc2iZGpFK0bnqxNj1Wg/J990cy
	fI/rHPXOxVJjj0ywHU5GyN6jFkOO9KrUT88fy2Apy4ftfe6rkjX54Vfk86OykZQ2AdPe
	/tm80cE1MwzHFEPSI61bAjhpUYEnFy9u0CnpWCqCnHx4Rmxe0QsAbAF8r4ZN2pdshXfd
	jbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UBXjg1blMpc3yC/hmbFMfUt+ZIxQsOufRxs+2Rn8j0k=;
	b=Zkcps1krGDgLrA64KzWmXkLCBmt9QWrQTCM5X8dmp9I826dwFQ+uLNVd2D/ykb+UeJ
	0U+jw+QUCt6bQUpSBMbN5En9B4l1kLRwFPGXQrb2JQOrrQ0ngZm1Y2ZVmN9cZDAmlMWj
	4mRX8rByWNluGQN5Shq6engDiaIZB1KxzLdUK8MSSxZ4vxNnOSNcjSOODJ9k91fsFvTY
	1Ex+6QTGr0au5J0flO9A1lrh7/U4ePaep5xlKPtHOcdojekiJdSrXvuZ2RUI3Q+5DvBX
	oNRohNTI7vKwnl69UoRS0Li7pPeyPYqw5QTaSlIaOOa5Frgny5kJIFq2OG78aOoTWm2J
	Joqg==
X-Gm-Message-State: APjAAAWjZK95bUHmEBufOux0zRXxuTJPVsFXh3fZycWq1sZHut+jJlJa
	xa/HXpPnWh86ocojAHqXNAAHP4Fg
X-Google-Smtp-Source: APXvYqz9fE9301S31UTZU8BIwiS25ksOpV3vZrmO8k5rSyABvJvVNdb7DqAynWWWD3FEDqECB9iJEw==
X-Received: by 2002:a24:148b:: with SMTP id 133mr21995871itg.73.1560286743680; 
	Tue, 11 Jun 2019 13:59:03 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id r143sm232558ita.0.2019.06.11.13.59.02
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jun 2019 13:59:03 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Philip Balister <philip@balister.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <A084970538D2234B96D99D06FA9D974FC37CEE23@ALA-MBD.corp.ad.wrs.com>
	<9d4f1478-434d-1671-7039-417f1d624ac0@balister.org>
	<3e53b535-a287-df96-3399-593c32ac3e26@gmail.com>
Message-ID: <03942929-30f6-837f-7272-2878a3ea1773@gmail.com>
Date: Tue, 11 Jun 2019 15:59:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3e53b535-a287-df96-3399-593c32ac3e26@gmail.com>
Subject: Re: [yocto] Yocto Project DevDay NA 2019 - Extend your Embedded Linux Conference Experience
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
X-List-Received-Date: Tue, 11 Jun 2019 20:59:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 6/11/19 3:57 PM, Joshua Watt wrote:
> Both of the registration links take me to the ELC registration 
> page.... is there a way to register outside of the ELC registration? 
> We lost our confirmation numbers due to a mix up in the ordering 
> process and can't change our registration anymore :(

Of course, as soon as I send that, we find the confirmation numbers in 
our Junk mail. Sorry for the noise


>
> On 6/10/19 7:21 AM, Philip Balister wrote:
>> FYI
>>
>> -------- Forwarded Message --------
>> Subject: [yocto] Yocto Project DevDay NA 2019 - Extend your Embedded
>> Linux Conference Experience
>> Date: Tue, 4 Jun 2019 19:39:08 +0000
>> From: Volosincu, Andreea S <andreea.volosincu@windriver.com>
>> To: Yocto list discussion <yocto@yoctoproject.org>
>>
>> Hello Everybody,
>>
>> The registration for the Yocto Project DevDay NA 2019 is now open. Join
>> our knowledgeable and engaging instructors to learn about creating
>> custom-build Linux distributions using the Yocto Project infrastructure
>> and tools, across multiple architectures.
>>
>> Date: Tuesday, August 20, 2019
>> Time: 9:00 am - 5:00 pm
>> Location: Hilton San Diego Bayfront
>>
>> There are two ways to register - by adding it your ELC registration or
>> on the separate registration page.
>>
>> Register now.
>> <https://www.yoctoproject.org/yocto-project-dev-day-north-america-2019/>
>>
>> Best regards,
>> Yocto Project Advocacy Team
>>
>>
>>

