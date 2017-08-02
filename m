Return-Path: <cliff.brake@gmail.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 52CFD77F38
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 14:19:06 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id s6so27772816qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 07:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=kCMt9OYRsXCgMY83Z8anDr66Bw4kVAqLdScmRKAutno=;
	b=XU67N57PbPIWMnXs8ug1MyXUPqOb7grAxRLfO5mLYwZK29EFPiDmExLbw7B9I3+OD+
	5H6/KBmHyVPpE7+9cweDT1c4lpb4sZA5ErqRil2vyyBNPu9orXDrlH6YMhTXY49U2TLz
	iJax99IKQvcCnjGRFZVZp9KPDF3zaD3KPoAktakaG6AEoQd/HU283jHT+5WQkHCeF6qf
	Pmspe+YrTCdMegsNhW1Tx7/ui3RcaUaxKxmbf34wzjNUdnpd2wTTqD1XMHcj91hTzZc8
	L/QAAEeMtsTUDHFZQvOPlZjJW6Ac6OqfCtv5se6b3ZiT7IoTFUqQiGbZFqEip2dU1MmO
	ANVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kCMt9OYRsXCgMY83Z8anDr66Bw4kVAqLdScmRKAutno=;
	b=lYtI85mqmER+CfzpTCX+Je21Fq8WwNMiednz5aP8sOft/GmtjzoZ34fMx09IvA1ObD
	U92mavG5fTHhqioew39je1qkHhIT1E5hTcpgGu+SONC152vKWi6Yi0H34TDdfQ4+xM6r
	9IHGG0oJw6XiOTJ9qfmq7tslll7WXNstGnvub05M3wMV4+NMwqnoPFLyJFF8/JBR1kC1
	57JUaMecQtihBZshMwMsTjJBiobQvCh7lyZFv+jQlHuMm7gSwKKg1xGSjN9lqTfTp71M
	SXV5ns3KsFwnxwaOApRnUVTGfEQky49sSfasO3DKHyg7RAdNPTLvNMnR+p2ivbjygxvL
	rbWg==
X-Gm-Message-State: AIVw113sa5YWL7vaxAVWDflBpqYOO8bBgSD0xVkSVSUPDVs1urW8aKDj
	Xuhy0PdMaXCAdZzh9xc=
X-Received: by 10.200.4.4 with SMTP id v4mr32901017qtg.23.1501683546750;
	Wed, 02 Aug 2017 07:19:06 -0700 (PDT)
Received: from [192.168.1.139] ([66.219.186.219])
	by smtp.gmail.com with ESMTPSA id
	f32sm26969377qkf.4.2017.08.02.07.19.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 07:19:04 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
References: <CAMKF1sqWosmxhDABfXu59DvPHmxMNybw0_5qprvbo+jHDoN+GA@mail.gmail.com>
	<a15e5c58-8834-3fec-3f8e-b848d8381ee6@gmail.com>
	<CAMKF1spWSv+HK1mpwToskZdADa4ga1kFOa4H2aWNcvCMUkLQFg@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <6b3bd161-eb96-5e82-3574-543408da1f79@gmail.com>
Date: Wed, 2 Aug 2017 10:19:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spWSv+HK1mpwToskZdADa4ga1kFOa4H2aWNcvCMUkLQFg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Pyro] backport request
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
X-List-Received-Date: Wed, 02 Aug 2017 14:19:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB-large

On 07/31/2017 12:30 AM, Khem Raj wrote:
> On Sun, Jul 30, 2017 at 8:23 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>> On 07/28/2017 01:08 PM, Khem Raj wrote:
>>> Hi Armin
>>>
>>> Please consider
>>>
>>>
>>> http://git.openembedded.org/openembedded-core/commit/?id=5d3df78367be0afbfe001b4fa776a98a82e6ce54
>>
>> does
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=pyro&id=cc48789276e0f91b37f1d89e418c87ee8bcc2d2f
>> work?
>>
> I guess yes.
>
> Cliff,
>
> need to bump to latest SRCREV on pyro for oe-core in template.

Worked great -- thanks all!

Cliff


