Return-Path: <just.another.mariano@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 568B77D43F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 02:23:53 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id v84so9251837oif.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Apr 2019 19:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=sKyNiy3atXPaqMOStwSMdqxn5oSguhuQ+4HDS2np9CY=;
	b=lGs6/HUhFHHpWGYkICebD4x/kpOsYes6+1Z89IfHhr4XHNJG+R3RLSgOYQK6xMFHr3
	mwwMZ7nr0m5stIZWykrKxMSBmX92hng+8VWz25c4uyjmZwJytC1mX4huiIbznlRGaf2U
	q7j5iy1l4PallYSzVQYEyaV8A5AxM8cfy3dHXfLVqf5lDfuTju7BObIidx68Wbm/UNxL
	U2p5Nrii3YzFM0XcRrMwYm1gTeU/qQjZIPVO+mgXokgspr0XZ0yutqHCa6G3076ZEugo
	m+2nlwS5+1wipOp97p72IrKXSXXjmZuPhtmlZII4JNRdWAow0giNhMQrn6zzzflE6JPe
	QJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=sKyNiy3atXPaqMOStwSMdqxn5oSguhuQ+4HDS2np9CY=;
	b=HmlsIt+jRbeV7Zm4mIZUflyNKUiMQTbMIGsxeKPAiTc/kdTt7cS0rd8wrt/RIceEna
	5Q1fNT/gwwa9ag7yqBHnv7p7/Lv5UhzarTesKM0m3b1Lfqq/ciqfKj0TL5Z07/nuNF26
	AsjsC9GlRD0GeBpo2uUceyveEFZxoWdkX6s17ynxxhu0CPxhq4XlfR2ROkXiEhPCkfkd
	pcqX+F2f1a6aXEJ1ky65uAGXCZ/SpLPlJViuYOeXGVatcwuLt3ZUf99ONLhnbXI8ZaT5
	alc5KvxvLSxtH+FhGG4GrZKnEFxm5xXuipS3O0I8ontbf7sedk0gWFdUAXsNmeAAtt8t
	qwdA==
X-Gm-Message-State: APjAAAU/bRAtl/FpssRmWZVEYGWORRs8EDU88n8/RSmYRI7vAuSFx4sw
	sRY/EdE1btzCEUhR+iWipcP/AlZ9
X-Google-Smtp-Source: APXvYqzw9tN0yh9aT9nEyLI03Xlw/hNHrur5iyPxZhngBpSZuE3FLyyT24YH06X18GmZSApZ+8/sSQ==
X-Received: by 2002:aca:4d4b:: with SMTP id a72mr13707556oib.105.1554690234056;
	Sun, 07 Apr 2019 19:23:54 -0700 (PDT)
Received: from ?IPv6:2605:a601:43d5:f700:c5be:7ada:a7e0:e98c?
	([2605:a601:43d5:f700:c5be:7ada:a7e0:e98c])
	by smtp.gmail.com with ESMTPSA id
	d22sm11053271oti.21.2019.04.07.19.23.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Apr 2019 19:23:53 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <cover.1554656203.git.just.another.mariano@gmail.com>
	<694f59ce48ac5931431cd76f12d7bbe23d279fbd.1554656203.git.just.another.mariano@gmail.com>
	<475418a26ad41bf4dd50386badf97eab3b6004f6.camel@linuxfoundation.org>
From: Mariano Lopez <just.another.mariano@gmail.com>
Message-ID: <b5761ac5-380a-64bf-f3a8-d93cd9aae822@gmail.com>
Date: Sun, 7 Apr 2019 21:23:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <475418a26ad41bf4dd50386badf97eab3b6004f6.camel@linuxfoundation.org>
Subject: Re: [PATCH v2 1/4] update-alternatives.bbclass: Add function to get metadata
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
X-List-Received-Date: Mon, 08 Apr 2019 02:23:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 4/7/19 4:32 PM, Richard Purdie wrote:
> On Sun, 2019-04-07 at 12:15 -0500, Mariano Lopez wrote:
>> -
>> -            # Default to generate shell script.. eventually we may want to change this...
>> -            alt_target = os.path.normpath(alt_target)
>> -
>> -            alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
>> -            alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
>> +        updates = update_alternatives_alt_targets(d, pkg)
>> +        for alt_name, alt_link, alt_target, alt_priority in updates:
>> +           alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
>> +           alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
> I think the above is three whitespaces, not four? I know its minor but
> it jumped out as I was comparing the code before/after!
>
> Cheers,
>
> Richard
>

Good catch! I have sent the the fixed version but I messed up with the 
cover letter, you can find the correct version here:
https://patchwork.openembedded.org/patch/160236/


I think I don't even need to put that link there :)

Thanks,

Mariano


