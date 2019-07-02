Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 62B4E7EB0D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 13:01:51 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i10so22918993iol.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=47vDdKGYpGob0NvoXuCkpS1ovDbHeU+/fG6ZeRLHAzs=;
	b=P9iZ25r2rJCMC1ps1tyI7G3ICTGSQDFANKoAzfcGA3s5OaFzcVmo2paOD7kUH/HfpT
	HsM+xcJEsWtNY8PRUibcsmG0YA1g3of/OpnNv+Wl0y69SpK35APbKFRdb2HzWWi+EXpE
	E2N0lt/bOvyG1J0IkBQ/fwQR5UtT7zZ1gyT+HelVo6ymoI7GObYNFEOMNMLPGI3yR7Dg
	2f1GgFBJnUAAmQz0QmC1OkbuEWLiNEqcBoqlvT9fDVeZn06FRZ4JCy+J++rQkl5lxe3g
	Ae/JGVpevbsEZMCqPawac6f142uXrAO5ZdrpIYO6lKKsvlHfyDADMytaFxLbk/56EuSL
	ROjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=47vDdKGYpGob0NvoXuCkpS1ovDbHeU+/fG6ZeRLHAzs=;
	b=EO31IalhSzhnKfdDoH9YqwYYMpMFaYk5uLFZxqGZjVq+tDLjgE5PW4wNPTBUx46jKN
	XUgILv3bgTnM5j4KP4RfRlrkfKmDMSOahLGvkCaBrFiOSAOEPb8TzajtXbtrud2M8nUI
	0PqtzaZ69covJBY6AtwNuQ+VvkznV1k2MGFGo6JFGcmWU2XuFSVt0b6QZgO8Ut1Y4yPs
	isycdaq8BghUmufLe5FScCSCRGCAPiAwSngDToiknLKEc/Q3HFKLzsj+dD9JhnuTlFgg
	uOMn0UjOVBuYFULssa4Tyl6LJcRSSgdNY7MPGdpNEKaZG5cY+a6E2jU4eXgIT07RyRKx
	ISXg==
X-Gm-Message-State: APjAAAVu7HqQTxjjH+w2OI/zOaA17XHVXSD2wIkqfTFZcI9wO6Mq3kWc
	Oo/nBQ/dphrkXNKvw59shsztp2dw
X-Google-Smtp-Source: APXvYqwK2k/oEjLqSAR8OoMlcklD2z5siTCF6KiNIUThb0UOz1iW5SsNdTm43QpFAlLxvcmW/VB2gA==
X-Received: by 2002:a6b:6409:: with SMTP id t9mr1689459iog.270.1562072511792; 
	Tue, 02 Jul 2019 06:01:51 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v25sm12068459ioh.25.2019.07.02.06.01.50
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jul 2019 06:01:51 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190701182306.32677-1-JPEWhacker@gmail.com>
	<5216e46ff0ed4d283b2a072e7a9780feba89df69.camel@linuxfoundation.org>
Message-ID: <ab437ea7-d53b-f015-b82e-618ebcf2b89b@gmail.com>
Date: Tue, 2 Jul 2019 08:01:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5216e46ff0ed4d283b2a072e7a9780feba89df69.camel@linuxfoundation.org>
Subject: Re: [PATCH] oeqa: Test bitbake --skip-setsecene
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
X-List-Received-Date: Tue, 02 Jul 2019 13:01:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 7/2/19 7:36 AM, Richard Purdie wrote:
> On Mon, 2019-07-01 at 13:23 -0500, Joshua Watt wrote:
>> Tests the bitbake --skip-setscene option to verify that it correctly
>> reuses tasks previously restored from sstate, but doesn't execute new
>> sstate tasks
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/bbtests.py | 30
>> +++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
> I like the idea but unfortunately it doesn't pass:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/267
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/265

I think it failed because 
http://lists.openembedded.org/pipermail/bitbake-devel/2019-July/020105.html 
is not in master-next of bitbake? I split the bitbake change and the 
oeqa change to test it into separate patches.

>
> Cheers,
>
> Richard
>
>

