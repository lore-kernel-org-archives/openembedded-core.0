Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEE26E5FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 05:58:29 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id g2so4324179pge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 22:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XBXICfDVX/JFgP8QmMgRUHb7+WhaK55Vt8qSrq4o0Og=;
	b=iUflT3J8e04htppTEbzVMjs1GO+j2bzPEvQ6WFD2pMXTmQkOm8L1UAqGJhvKUJW9/z
	eRC6klOnA0Oa3Q8y5afn+ElekB1Hf2EtyvtqFOS4MCiVFK4Tj8zP9/IYdeF2hyB++0YB
	UzxcE7JOkfSSSUQvhNWA7L3Jq1uCMJBqrCjSdxMFjV8i8Dobl3w8xdtmJ9ayEw6kCXMb
	DAMiOQ90nk8E719vJDOsZJK+0c+zBU78Cn0vnkA3nc3J26BY5RD0NKapgLPob8CNQVYq
	S9sP0JL0OuVJMcGs4coAfwOFFRnTucoyGdFzTKPkey9lKG2joxeYaX5z/Od5Wxt6nqRd
	B5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XBXICfDVX/JFgP8QmMgRUHb7+WhaK55Vt8qSrq4o0Og=;
	b=fabRg6p6lejSa1jqv4jsOrIacarDpHkftxxQ864Xv1Oqc9L5aBLYMmyuBgwNj72yq7
	01V5CdVzO6BDJqmHqNhBeTy7oYHGKYbMZL2QaIz742+mYnMuUi6/9HY7WazFdlmlFlNE
	joizR5rItUuIeWg7/I1Xf0EXUPhmeeSALr0FFBebZDifTODEkZq1nxNNQPMCNtZpuNEI
	mnJEx94Lw43MvDoF4jHZdtEAymfPLrzsmor1NC1Q69VjLRwvV74h0o6QP2Zex4S3LpTb
	AIldfFMlRe2FowtSr+QNbqvyaRx58+fSvjijaASmmBQb52hWazJ21eYbtxwyzZGBNMi0
	P7gQ==
X-Gm-Message-State: AFeK/H0piQ028M/jqQP2ZYwBboK04PwWYM9bAT6y9QTZOpCKif+7dGPyhmX7wXVIUi06NQ==
X-Received: by 10.99.121.78 with SMTP id u75mr1698018pgc.202.1489557510952;
	Tue, 14 Mar 2017 22:58:30 -0700 (PDT)
Received: from [10.161.103.40] ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	z189sm1478075pgb.3.2017.03.14.22.58.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 22:58:30 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=Vji6+uo25xxB0rir_HcCo2UzEcrmsa_q-3kdUJJUF5rg@mail.gmail.com>
	<42b3cca7-a268-ea8c-2e35-02c1624bf290@gmail.com>
	<CAJ86T=Ubzmt=qDickvWDCvUwpf1T9iGTTiSVQAZcqvpCsPN15A@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f45203ef-5c5b-95a1-5ce1-4a479f31ecb4@gmail.com>
Date: Tue, 14 Mar 2017 22:58:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Ubzmt=qDickvWDCvUwpf1T9iGTTiSVQAZcqvpCsPN15A@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2][morty] Backport image dependency chain fixes
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
X-List-Received-Date: Wed, 15 Mar 2017 05:58:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/14/2017 08:13 PM, Andre McCurdy wrote:
> On Tue, Mar 14, 2017 at 8:08 PM, akuster808 <akuster808@gmail.com> wrote:
>> On 03/14/2017 07:14 PM, Andre McCurdy wrote:
>>> On Tue, Feb 21, 2017 at 10:04 AM, Andre McCurdy <armccurdy@gmail.com>
>>> wrote:
>>>> Andre McCurdy (1):
>>>>     image_types.bbclass: fix image dependency chain collection
>>>>
>>>> Randy Witt (1):
>>>>     image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types
>> I tried applying these changes and they fail. maybe I can grabbing the wrong
>> changes.
> You can't cherry-pick the original commits directly from master due to
> missing getVar() True's. The patches sent to the list were manually
> fixed up to apply correctly though.
ok. found them thank. they apply fine.
will be in stagging soon

- armin
>
>> - armin
>>
>>
>>
>>> Ping (and CC'ing Armin this time...)
>>
>>>>    meta/classes/image_types.bbclass | 16 ++++++++++++----
>>>>    1 file changed, 12 insertions(+), 4 deletions(-)
>>>>
>>>> --
>>>> 1.9.1
>>>>


