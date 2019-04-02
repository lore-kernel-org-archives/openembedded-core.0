Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id E41737D265;
	Tue,  2 Apr 2019 20:58:16 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d1so5166670plj.8;
	Tue, 02 Apr 2019 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+qswfvgfhZYJsbijOfa70q24NMR2oEkzg5ZXpJFDNVQ=;
	b=dTNPsBLYfhkDmgQEMBHZUFdTC5WuGoH5DuKTjnjfLbHbyifDmg57fWpDnVdRXgNsMe
	Q32osGYwziory/q8sVzvh3J4oAijjGc0RJMl7po7BjtqPMRK+oo8mswU1lMkXlmlMGG8
	ymmM21k9l/GsoezYT1tp6Oywpz5uL9HkDf8dI3OrSnQxk5CT9c+IOusHXM2B+ZmVm6vl
	S4rmPTp5PQdfcJTniuX0IGCoEIuz43WrecUtLDlgSxaHOb9b60CAYkDAPC7t78MjqVfU
	tyQisqfTSkM5i9ralTSNu7AHeoA1fxzL4ng+5CFLjWLvw+hyhSK1mqR6tYn365+j8NhY
	LfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=+qswfvgfhZYJsbijOfa70q24NMR2oEkzg5ZXpJFDNVQ=;
	b=WxQhbNrzx6g/ZygvF15Ser17+o5dVJv2x6sO5SY02yscctUf20uhv+uGB0JBvSGVpO
	J7vtE4a2ZxlrJXN9VthGFIabUhfTKX2M8aCRFkKEkRJGIcM4CamEnXlQBuGW45JpI/gk
	81jVMba+BgahSSqHwdxYOxQLrEey4A0trQlyWWYUyq2A3EPF6X1XPW80LcHHL22ybHBe
	0ZU/Pka1FwNTRRcL61XIQuAj4U901E3kYqCUskWeJxMWptFTKtLL8PylggHmSMMmLEbf
	t7xzpJrrvOUvfkjhgWNA7XuROVn+f1NgHqm5wol28cpKmrr4RO6wU1c5Lfpyp+Rc03fT
	GnrA==
X-Gm-Message-State: APjAAAUaao5ncX45bgkRFYuJLYdrjGOmtMPjGVvtBb5UppVOI9UkeFYY
	EyILxhPTrpd/O8EjaJw2be7UxUZf
X-Google-Smtp-Source: APXvYqwz42GZPNsXY/cYjjTIjqqW84xEAL7SM2M2iJb7GWmW3OsdKh5RkSJvm/SsOIluuLrcnH2lyg==
X-Received: by 2002:a17:902:6b8c:: with SMTP id
	p12mr73583844plk.282.1554238697717; 
	Tue, 02 Apr 2019 13:58:17 -0700 (PDT)
Received: from [10.188.84.210] ([206.121.102.138])
	by smtp.gmail.com with ESMTPSA id
	o89sm27357089pfi.178.2019.04.02.13.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 13:58:16 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>, Adrian Bunk <bunk@stusta.de>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<20190402065121.GA31468@localhost> <20190402194614.GY4664@bill-the-cat>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d526f577-71bf-d99d-1cbd-767a6d69f0d2@gmail.com>
Date: Tue, 2 Apr 2019 13:58:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190402194614.GY4664@bill-the-cat>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Git commit process question.
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
X-List-Received-Date: Tue, 02 Apr 2019 20:58:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/2/19 12:46 PM, Tom Rini wrote:
> On Tue, Apr 02, 2019 at 09:51:21AM +0300, Adrian Bunk wrote:
>> On Mon, Apr 01, 2019 at 04:20:41PM -0700, akuster808 wrote:
>>>
>>> On 4/1/19 4:02 PM, Richard Purdie wrote:
>>>> On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
>>>>> Hello,
>>>>>
>>>>> I have noticed a large number of git commits with no header
>>>>> information being accepted.
>>>> Can you be more specific about what "no header information" means? You
>>>> mean a shortlog and no full log message?
>>> Commits with just a "subject" and signoff. No additional information
>>>
>>> We tend to reference back to how the kernel does things.
>>>
>>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
>>> These two sections in particular.
>>>
>>>
>>>     2) Describe your changes
>>>
>>> Describe your problem. Whether your patch is a one-line bug fix or 5000
>>> lines of a new feature, there must be an underlying problem that
>>> motivated you to do this work. Convince the reviewer that there is a
>>> problem worth fixing and that it makes sense for them to read past the
>>> first paragraph.
>>> ...
>> The kernel does not have "upgrade foo to the latest upstream version" commits.
>>
>> With the Automatic Upgrade Helper this is a semi-automatic task, and 
>> most of the time there is no specific motivation other than upgrading
>> to the latest upstream version.
> But since that's just filling in a template the body can also be a
> template perhaps with useful AUH data (run at ... by ... ?) ?..

Maybe, if someone want to enhance the AUH.

- armin
>


