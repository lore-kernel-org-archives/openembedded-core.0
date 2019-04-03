Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 911BE7D2CD;
	Wed,  3 Apr 2019 11:39:00 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 9so8006692pfj.13;
	Wed, 03 Apr 2019 04:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/MoTr0o8ua98tSYMqSK861i+FxTX4FFgN04nsS/Vv4I=;
	b=Zq2ac5YCmWw7Mrha4+J133DnUso+1xBXxYfyGSCLJcV7ym6CJDmFXbr5wFYGbbTVvA
	XTJwmXp8KhKJ6gHDCEJ8llzSQX85jzXMag0ZO4HwrPo449ONltT8LGJEBAVa6zrQP9dh
	ZYz67juek9dMeRJ5ptgL27W/KBD51ADUXcJ13tnYh52ETPLDqmFeU/rTINODklkjtI6G
	mgl1UctkX2hWawwMQDrPygSHk/9T/+nkjNj75GMCc55i+nqoLxIbnjGwToBYaoh4BuNG
	CnICYTlRSB0/yAd+KPcM10FvXPHpML85ua724wXv1jiTlVmEf0wH2F0FA0WX/NYJf0sp
	S8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=/MoTr0o8ua98tSYMqSK861i+FxTX4FFgN04nsS/Vv4I=;
	b=NZeynbnSkJtGMAHdZp/ZJ/x6WRfrhekEbzQnD3B9VhYCEeFDvkYfJ2JGWWwKIh3WE4
	n4r2EeNUTzjuX8cboxSntZjXwA6Id1t7i5xyCWiDBGBavYbHT7tAeIpjRt/gVvWzRe7z
	PFFbhetLJO19XjND9EuOTgBE2gDMkoo3JVZmPA+w53btxahjAoBBx5rH/jW6kTDa88AI
	EJPSmOtWdN6dCOXvGjQ//HbYf1rGHBBpiFXl/RmouZ5QvJLVlqgrf9UYkZlIieImX/mw
	KUapEaRYk6MtLve34tDE1lXOMJ/CvL0libebM6EhSU4Q/CbE6BKr59PCLfz2gSy/oLhD
	TTXQ==
X-Gm-Message-State: APjAAAWXJ/cLZ37fjbYH40PaUDGfTKsJRnTQDk/FffT7Ra9gSyCsTdYW
	haUSiKwblAjBy5JEXeTVS20=
X-Google-Smtp-Source: APXvYqwwAUk0OFJ8xu8MVGN5QFSJOYwr8VLl7dtPwOCN5828SETHcA2FGAhYNsn9h5xEa0Jqnw1Hjw==
X-Received: by 2002:a62:e412:: with SMTP id r18mr23042192pfh.207.1554291541546;
	Wed, 03 Apr 2019 04:39:01 -0700 (PDT)
Received: from [172.16.50.58] ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id
	d25sm21856961pfn.154.2019.04.03.04.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 04:39:01 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<20190402065121.GA31468@localhost> <20190402194614.GY4664@bill-the-cat>
	<CAJTo0LZ5qeDA+rQ5Eh3_LCbGtQyo732LrDkiZ=O4sh52cjXU=w@mail.gmail.com>
	<CANNYZj9u4uYCnAAT5rrTWv9VvECb5GWq122NPz49qnoUeLTFDw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b0a36f6a-0a8f-7938-e1c6-226bf69e4a9c@gmail.com>
Date: Wed, 3 Apr 2019 04:38:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj9u4uYCnAAT5rrTWv9VvECb5GWq122NPz49qnoUeLTFDw@mail.gmail.com>
Cc: Tom Rini <trini@konsulko.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [yocto] [oe] Git commit process question.
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
X-List-Received-Date: Wed, 03 Apr 2019 11:39:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 4/3/19 3:38 AM, Alexander Kanavin wrote:
> Just to make clear, the AUH workflow does require the maintainer to
> sign off and edit a commit message via 'git commit -s --reset-author
> --amend' for every commit,=20
Not sure if this a requirement anymore. Most of my packages got updated
by other folks this time around.=C2=A0 Hard to say if the AUH played a pa=
rt
or are folks now using the devtool check.
> so AUH does not get in the way of useful
> commit messages.
There was talk of using the AUH to fast track updates that pass the
process so in that case the message would be whatever the AUH provides

- armin
>
> Alex
>
> On Wed, 3 Apr 2019 at 12:31, Burton, Ross <ross.burton@intel.com> wrote=
:
>> On Tue, 2 Apr 2019 at 20:46, Tom Rini <trini@konsulko.com> wrote:
>> pr
>>>> The kernel does not have "upgrade foo to the latest upstream version=
" commits.
>>>>
>>>> With the Automatic Upgrade Helper this is a semi-automatic task, and=

>>>> most of the time there is no specific motivation other than upgradin=
g
>>>> to the latest upstream version.
>>> But since that's just filling in a template the body can also be a
>>> template perhaps with useful AUH data (run at ... by ... ?) ?
>> Apart from making the commit message longer what does this achieve?
>> The commit already has a timestamp and author.
>>
>> Ross
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



