Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD31F75321;
	Thu, 10 May 2018 19:21:37 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g20-v6so1378440pgv.1;
	Thu, 10 May 2018 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KXMZDc1aQluANBc9wP4ZonRCJ9XcQWt8gMOfPusGENs=;
	b=BXXb4ouVLNQrvVm3Kh9La4qH1n8aHQtWiMbG0d8SpcanqOlZxLu5wHbMkaB0Fr6DIS
	P28GC4QGr38C7u9dR1iX1xtwIdf4AgPYTIHVV7flYuuTZfPW3cteC8zWp1RbVusmb/Hr
	lIr5e6TdeoshEuC9hIzROgZ1I0jYVX2o4bgeh6/O6iQyqdnLaYifccNIOEJpKtQjLrHU
	XnGceVnpGw/G2nU5KeUwkiOhMrjDV9GHJjYg+2uZi2lFiypQefon8Gk4egftTraqlS56
	AWEjnhP4Nr26V0KlFzSfMpWNUptK7/1Xt3opL3EufUWqrK8U2crQB24SBRSSLeqNEV8c
	M7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=KXMZDc1aQluANBc9wP4ZonRCJ9XcQWt8gMOfPusGENs=;
	b=KMpF8DgIsxMt5+Q8vle6jitosFPf7mWgeIKknb1mOZLf3J6Ew9kRPTxgeLLgvtdprp
	rBGCtgDttRwmmTV8sOf0BB2UaGhygJp3RJigblCyLFBHVBm4J4lZEot9QNtGS6aV7LZR
	cqpmucD1Djc5bqmOfcEtZnw0KPuM7bPPmBY5FMXvE/SOGA9RZvi2vYbty5o203TfxX00
	bbuAzFPQoyWUfRewekEa87hHIo8GYhXbbS+3R/SiHM3pQ2BT9gbWvANtzUZMujQHDktF
	t3NxRyTD/na72Ifz9vLMHQ6d/ROmLY9ZGJdM92uuoQ6QH9AFnwrJlA+N/3XMVfYdQ6Xb
	Jl/g==
X-Gm-Message-State: ALKqPweF9rF2ohq9rvWiXPlvbpEOxWdQzG3551fDMSEz7/DPcvI0GHD4
	xnU2/gSOJuy+ywDnwqW46Pk=
X-Google-Smtp-Source: AB8JxZo/llQJR2CrQJAWZPLj4CV0hBhMAqjunThZ4JDSbY6OOnFvIgomxRKPzDwVFvwX2WskTGxTEQ==
X-Received: by 2002:a62:a65c:: with SMTP id
	t89-v6mr2507323pfe.27.1525980098259; 
	Thu, 10 May 2018 12:21:38 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:49fa:9382:bcbc:28ae])
	by smtp.gmail.com with ESMTPSA id
	y197-v6sm3451776pfg.184.2018.05.10.12.21.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 12:21:37 -0700 (PDT)
To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CAGAf8LxceSXvK-pgfWYDvYLmcvMMK0D5q==PKG9jeRWs6YEbGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9ce7ff3b-c139-6e4e-638c-1a5c864e53ef@gmail.com>
Date: Thu, 10 May 2018 12:21:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAGAf8LxceSXvK-pgfWYDvYLmcvMMK0D5q==PKG9jeRWs6YEbGA@mail.gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 8.1
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
X-List-Received-Date: Thu, 10 May 2018 19:21:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/5/18 12:31 AM, Zoran Stojsavljevic wrote:
>> May fourth be with you !!
> 
> @off topic!
> 
> Who is here (and in wider context) Darth Vader? Bourne Kingpin (BK)? ;-)

Well the message was sent on "may 4th" hence it was meant to be a 
light-hearted encouragement to test the patchset

> 
> Zoran
> _______
> 
> On Sat, May 5, 2018 at 2:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi All
>>
>> As you might have noticed that gcc 8.1 was released this week, I am
>> calling out for some testing help on testing branch so we can weed out
>> issues you might see in your setups. so if you have your
>> builders idling over weekend, then you know what they can do this weekend :)
>>
>> Highlighted changes are
>>
>> https://gcc.gnu.org/gcc-8/changes.html
>>
>> and porting doc is
>>
>> https://gcc.gnu.org/gcc-8/porting_to.html
>>
>> The branch is here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>>
>> Its uptodate on top of current master oe-core
>>
>> May fourth be with you !!
>>
>> Cheers!
>>
>> -Khem
>> --
>> _______________________________________________
>> yocto mailing list
>> yocto@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/yocto

