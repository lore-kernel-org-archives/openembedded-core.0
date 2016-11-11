Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB50719BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 18:20:16 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 3so2420007pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 10:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=TIWLlxEW2rz3g2dtXVINoHzrD+uIz7KsPHkYDjpuvpo=;
	b=EKjf11A2B+QTNKHss76ihiObWVhKsIt8aCa49HkIoPxq2zMo99rufd3/KZrQK6P2EH
	TjQo6QbV/dNH204S1CWjkHbSC/u7KDUbCPmCIqMvZW6XxZo4ZllsPKw2npf+ovQ1g/o0
	+tL6qTrPqVFNtAgeck/zYSh1C+r0ck6LPlQC/vJf7o1MHav7EOxqJlhEiKXSumoiik4V
	4gO8pYNb968LaZGvLUx2yYkj7klwdV+RcPpoZJdFSQ83gE72Jrm2PG1MTNAJ7NE+iNn/
	vXpIqRy8AGB+c9sMcEFK54gJNZKwRXj7WTFJezSmTxkTvOZQbobR78Y/CqTnYVOcg6FY
	KyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TIWLlxEW2rz3g2dtXVINoHzrD+uIz7KsPHkYDjpuvpo=;
	b=EgkNZkSiXrH0dgdlvPv0ltusTjxNDZDOkjYJkwcCP32rzhLoBzslrSzTFe1NOWC/CQ
	w03J5+iyv8mh9DuETPOgSwtfB34A2HQniUUpG9xVDpTq4x5N0NLffYOKHVRRteuf2cPV
	PMB6cFDhfnwNtcxZtz0CePPv2gGg4i5oJ1N/fDwpyi7HjsXk5k9wlqTp2H+BrHn05tne
	qmzZFTkxLwD8Rz6J4YJpTmmrhByMUlQKW0t9SkPTtRiaQh84eJGag1aHB3dlRmAdb6Sg
	Y/IGw3vWUMsq2bZ+dqaxdW8zBfRHOfLzk69BFNZ4ZSQFRa3Es0+vX0aQo99z5Lu19wsA
	GKPQ==
X-Gm-Message-State: ABUngvekWOaAsHgpP7DlznIHZj5m+NfC1kOxfR9dCGWB5RfuoeyYgVnIKqfvyhXrJm7UOA==
X-Received: by 10.98.64.195 with SMTP id f64mr9319540pfd.16.1478888418234;
	Fri, 11 Nov 2016 10:20:18 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:c5c9:503:ecaf:3a27?
	([2601:202:4001:9ea0:c5c9:503:ecaf:3a27])
	by smtp.gmail.com with ESMTPSA id
	q9sm16734543pfg.47.2016.11.11.10.20.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Nov 2016 10:20:17 -0800 (PST)
To: Andreas Oberritter <obi@opendreambox.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Jolley, Stephen K" <stephen.k.jolley@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E572AE52E@fmsmsx111.amr.corp.intel.com>
	<e188c300-ce1b-4591-cb87-81a1497bbf34@opendreambox.org>
	<1478613085.23123.137.camel@linuxfoundation.org>
	<c2bf93e9-5aa6-1849-487c-3a30336b9a0f@opendreambox.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <414710d2-e436-02cb-6df9-a9a2f83f3a29@gmail.com>
Date: Fri, 11 Nov 2016 10:20:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <c2bf93e9-5aa6-1849-487c-3a30336b9a0f@opendreambox.org>
Subject: Re: Yocto Project Status WW45 - UPDATED
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
X-List-Received-Date: Fri, 11 Nov 2016 18:20:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/11/2016 12:53 AM, Andreas Oberritter wrote:
> On 08.11.2016 14:51, Richard Purdie wrote:
>> On Tue, 2016-11-08 at 11:00 +0100, Andreas Oberritter wrote:
>>> Hello Stephen,
>>>
>>> On 04.11.2016 18:06, Jolley, Stephen K wrote:
>>>> ·        There was a challenging taskhash mismatch test case this
>>>> week
>>>> which has resulted in some significant debugging improvements for
>>>> taskhashes and basehashes which are now in master.
>>> is there an entry in bugzilla about this issue, or can you please add
>>> a reference to the actual commits in master? I'm facing a similar
>>> issue, so it might be helpful for me to backport them to the branch
>>> I'm using.
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=0a4a6d6956a10aa0a6589de12b0b2380a9f0a7d9
>>
>> has info in the commit message. You also want:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=589f08aa852dd43af5d05d698cfa917bec084210
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=157947efc7e505e01baafb33ec93fe2f485308fe
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f6b0c60664e86fec55d282f1ea41238abd74712d
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=71c837611690ab4bec1656a58d13ca48e7c6a6e6
> I backported these patches to krogoth. I think I would never have found
> the cause for my taskhash mismatch without them. Thank you very much!
sounds like I should queue these up in my staging.

- Armin
>
> Best regards,
> Andreas
>
>> Cheers,
>>
>> Richard
>>


