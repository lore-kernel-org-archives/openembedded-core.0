Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 842B461CAE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 18:36:11 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id mq3so4790159pjb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 11:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=wBhe6v7CodRuLHrkqxV4xKg6v++XYMB0Tlb0mABPbAM=;
	b=YHbc1y1WM+60Tz2uex3Fz359C3WG7J0IQm5TyLjvUS6nwZPpqOx+5F/DYhBNIbMED3
	nAMDGzsbTSpZ/2ExvSFYslDoxGiXPnDbd4kic0Gu8tk79tza5h0zBun3RQdOD0XpX/Ds
	73/OYxueKNSJcrRWH1K3tiuxxFEBDqUSyVdfPoq8Va2pUCsyO7dDSGvGOPXlExeHKGf0
	03K+0Wz4eKk5fC1J1yGrVqO0jFVjVrWbbUyHJC0fTJTV7lUJfC5Mkx8cK336svFFgOvI
	cT+qqIU7rLlYVH7j5nCCw0NH+D2LmKAB5B6HwEPCWe4miBAEJSkObJFbWdLz5e/kalBM
	o1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wBhe6v7CodRuLHrkqxV4xKg6v++XYMB0Tlb0mABPbAM=;
	b=Ryp9m0qstEXuKGQwRCRjNoUWIfOs1VbD4RViG/3DWwhDRZStivC8SbpOSX72hb1yVP
	BEjbNbq1d6L25tnJiNsSXY1JHSzX3kdk7gyB57gUXXLdcCQ7qneuYFjlXIaM0AvY0ORw
	AJdoASvk2ocdFXKOLoJ6Mab8JQYjANXzdxvgdtgC6y8kjWZAvqaIHz3qBe1v6s39z3yx
	rbryGd13Vva/CqU6PMYPQ+1EqjCxANfWfB3e/xGfiMYOIh9j4JxR8tByaw6H4Ta/3jlu
	xNPBrUlk48ihgRkYimDQClPLH7mzEnJoz1nq86uIQga7XzaS7dg6pqYQ4RNGN0jyvZN6
	HKDg==
X-Gm-Message-State: ANhLgQ3Fl+byO7MGJN2dobP8f46zZNbfB5AsLpiLw3kBA8JHOfpEoOMK
	Midtw5F+F4rfx3VMAACjpgwvkRn8Tbw=
X-Google-Smtp-Source: ADFU+vudPWxu6TPuHML6C4kKbmFMVbHeWSCfbz5lc6fTieVlKtl2p0kTYywMsAAMl3e9YBCBYo0zuw==
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr3154490pla.97.1584124571780; 
	Fri, 13 Mar 2020 11:36:11 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0:d558:25ee:538d:b97a?
	([2601:646:9200:4e0:d558:25ee:538d:b97a])
	by smtp.gmail.com with ESMTPSA id
	f3sm49746439pgg.46.2020.03.13.11.36.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 13 Mar 2020 11:36:11 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200312230238.413509-1-raj.khem@gmail.com>
	<0aaac991c5634577b000a3e62f0ec5e59ddf0e1b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <306503fb-9025-42f2-181f-7982b632cf65@gmail.com>
Date: Fri, 13 Mar 2020 11:36:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0aaac991c5634577b000a3e62f0ec5e59ddf0e1b.camel@linuxfoundation.org>
Subject: Re: [PATCH] musl: removes aliases for glibc provided libraries
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
X-List-Received-Date: Fri, 13 Mar 2020 18:36:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/13/20 9:10 AM, Richard Purdie wrote:
> On Thu, 2020-03-12 at 16:02 -0700, Khem Raj wrote:
>> From: Jan Kaisrlik <ja.kaisrlik@gmail.com>
>>
>> Based on the recommendation in musl mailing list[1] All symlinks have
>> been removed from musl recipe.
>>
>> [1]: https://www.openwall.com/lists/musl/2020/03/10/11
>>
>> Signed-off-by: Jan Kaisrlik <ja.kaisrlik@gmail.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-core/musl/musl_git.bb | 15 +--------------
>>   1 file changed, 1 insertion(+), 14 deletions(-)
> 
> Breaks SDK tests:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1697
> 

yeah its failing a simple test to link with -lm but this works ok on my 
end here, so I wonder whats different on AB ?

> Cheers,
> 
> Richard
> 

