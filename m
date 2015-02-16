Return-Path: <scerveau@connected-labs.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 20F1071634
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:13:30 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id m14so23321031wev.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 05:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:message-id:date:from:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=HD0AhRH31AHV9IlF7T8o702YBKssycs7eJiEDr10ZLk=;
	b=OyvnXmsfFm2LC191h7DaWjRyngw9dJBLZvZmgz67ZHL3lj7YoGKmLQ3DAAWzQSYTQz
	1QeE/7ZKltc36kKFlk6GVJ1c9h+PLhqOUJatLsHArZzTN9xsEgnBTmhjKe3iISLmdsxU
	xGYQtY3ki6zFQo9zKvZQNQCirVUxeixkpRsRVrfIM+XCsb54TgM3QgoSNvB6rk6gGRS0
	3aPYUbNvT5ZtvB+mgQpRfJZqbKERX3cv3fezQwl5mhlVPmwjsp6WcM+JwBfpZzbyXWbG
	Cx5euWl8o5AJopjegy2NDXh37oKtl94HR9Y8TxbFoTQXqGOeNfsjzzKS1P+aZXNQeiNF
	hJ6w==
X-Gm-Message-State: ALoCoQmaUMyiRNf7Kk6VSuztCKmr3ntcyA0HdCUpNonVGueqoOM/43endZNB3SnLcyx2P/ARIn3U
X-Received: by 10.180.126.69 with SMTP id mw5mr32277411wib.12.1424092411110;
	Mon, 16 Feb 2015 05:13:31 -0800 (PST)
Received: from [172.24.63.26]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id vq9sm22836077wjc.6.2015.02.16.05.13.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 05:13:30 -0800 (PST)
Sender: Stephane Cerveau <scerveau@connected-labs.com>
Message-ID: <54E1ECF5.2010405@voxtok.com>
Date: Mon, 16 Feb 2015 14:13:25 +0100
From: scerveau <scerveau@voxtok.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <54E1CED1.6060900@voxtok.com> <20150216130844.GF2297@jama>
In-Reply-To: <20150216130844.GF2297@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: cdra_1.1.3 is not available anymore.
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
X-List-Received-Date: Mon, 16 Feb 2015 13:13:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Dear Martin,

I'm using dora and daisy branch and the build will be failing on this 
branch 1.1.3.
Is it planned to backport thee 3.13 patch to dora and daisy ?
I just posted a patch to use the 1.1.3 as before but is there a license 
issue, so we cant use this version anymore ?


Best regards.

Stéphane
On 02/16/2015 02:08 PM, Martin Jansa wrote:
> On Mon, Feb 16, 2015 at 12:04:49PM +0100, scerveau wrote:
>> Dear all,
>>
>> It seems that crda_1.1.3 recipe is broken according that the link
>> http://wireless.kernel.org/download/crda/crda-1.1.3.tar.bz2 is not
>> available anymore.
>> It can be now downloaded here
>> https://www.kernel.org/pub/software/network/crda/crda_1.1.3.tar.bz2
>>
>> But concerning the binary
>> http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.11-regulatory.bin
>> it is not available also but i dont find a server which will allow to
>> fetch it.
>>
>> Does someone modify the recipe already or does someone know where we
>> could fetch the binary?
>> I'll continue my investigation.
> http://patches.openembedded.org/patch/87751/
>


