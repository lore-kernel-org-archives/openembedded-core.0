Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 423687BD97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:15:19 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id n15so3986117lfe.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 01:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Kkt58xcROe3OzYqRcV7k2IlKqUVSJ3zEUFWoDNwidqw=;
	b=YdBGyJbsNGomFGSRYzGiQv5dMmazTqdrWS8drd8fdWU9uG7d5deHO1oeuIjx9Z2oBS
	MD4S0zPgJLkeKKFMeY8bMaPPmqoIFPRf7v0uZrW6V6oF/2y5/bdL/gPKeJB6ZsbB6i7w
	jDXpc9fReG11cUL7yl6qPrx9qU9GgF8fcUN33kh49afihkAgcDWzpLrHPAGny4vC08+M
	GR95pnkYd3ue4SHTsqAmQKpoH/CRLptKGwH39OPTqLexufsNoGeHz0TcDe4fcm5aMlPT
	mMxDbIvtgV3Hjx2J9VFnzkLwU1aQQI7D7V0WWHiH26RB+dp879Y/5uHjfqpHYsOIbqyg
	ylJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Kkt58xcROe3OzYqRcV7k2IlKqUVSJ3zEUFWoDNwidqw=;
	b=AMRoMHGdmMnm32Et8SlgPqlyo6wmjne47c3NYiRlGV8qMEMsH1f4l9uaRItRfzCT3U
	uJqcSU7ge7W3nStHi3RgfoYgNbNJrdAY9a96k5LB7gJwn1bFesV646lYdOsUX8hvIwBR
	rgBKOPhrsNHkf+JkFizIE0wQk1i8LmYmRayrRGWXwBJPa+JkOmFYD2kV/p2ei5GHLH1G
	YUJkBbE08bgSO2eZjiASqo+RXmBa4IBHF6SxPC0nKKK+Y9aJTZbr584G8cji3bGatQpr
	ANWjPNYGKoUQKid6GuTVowTrahvCNZQqQ5lV6825dLiRDertTLKqn/jyMQuuP0Cf/+JX
	SBgw==
X-Gm-Message-State: AHQUAuaj5FcxWdoxYBw4lSJFJn5aWY4HhKFPsC947iI/IBEJXsMApiXb
	s6g8nQiY+k6xm6+C/HXm9jUjGV9xzIU=
X-Google-Smtp-Source: AHgI3IamJ96Dbh8nA4AX5MepZUM8jEbaAWboXQ1RxFHfpNvLPFOwhDTbhmbXiIWIBPWaXIab79UoZQ==
X-Received: by 2002:a19:7609:: with SMTP id c9mr1636415lff.95.1550135719436;
	Thu, 14 Feb 2019 01:15:19 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	p10-v6sm329462ljh.59.2019.02.14.01.15.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 01:15:18 -0800 (PST)
To: Randy MacLeod <randy.macleod@windriver.com>, Mikko.Rapeli@bmw.de,
	git@andred.net
References: <20190211120433.16148-1-git@andred.net>
	<b5314b5aba8fc6e7ec104246463769932469576e.camel@andred.net>
	<20190211121551.GZ7474@hiutale>
	<64408b4d-195b-f89f-4202-5591f6c5c78b@norrbonn.se>
	<1a4ece94-0216-5ab2-695e-70817c6ae497@windriver.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <153b1f17-fb40-fe4b-2af2-c2ff343858fa@norrbonn.se>
Date: Thu, 14 Feb 2019 10:15:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1a4ece94-0216-5ab2-695e-70817c6ae497@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Thu, 14 Feb 2019 09:15:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 13/02/2019 21:45, Randy MacLeod wrote:
> On 2/13/19 5:00 AM, Jonas Bonn wrote:
>>
>>
>> On 11/02/2019 13:15, Mikko.Rapeli@bmw.de wrote:
>>> On Mon, Feb 11, 2019 at 12:08:46PM +0000, André Draszik wrote:
>>>> Please ignore this patch. Looks like a red-herring. Sorry for the 
>>>> noise.
>>>
>>> FWIW, I would like to see this patch merged. Had some issues in the past
>>> with busybox umount and added same change as a bbappend.
>>
>> I'm also carrying a patch locally for this with the following 
>> explanation:
>>
>> systemd passes the "-c" parameter (do not canonicalize) to the umount 
>> command and busybox's umount does not understand this parameter.
> 
> With the current busybox do you really still see a problem since
> busybox umount has been told to ignore "-c" now:

OK, my patch predates the fix in busybox and I haven't tested without it 
recently.  Previously umount would error out due to the unknown option 
and systemd-mount would fail rather inelegantly; the busybox fix should 
be sufficient to rectify this.

/Jonas

