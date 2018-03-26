Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id BDF64782CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:49:45 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id 91-v6so4271007pld.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=N9sPweyMpmkP0zDe5fchkYQU0SFLtAFDe9icBn1h+ys=;
	b=YVJvDw2gzxq5UcLXpykIICyB8+2Ap16hjnwKRKNcQWK/pM1xlrjDA+DCcM03M8fvP2
	BLOLqtCnfnMEhvCrDvp2JXggf0ANLY+5B79V/giyT66Ez42dJY3iheVF9Sw9uomFMtRJ
	L1xrADAOD3ignJoJuI5mo0sKaatfKhHXvu1r13pfhQ0AzkiMkVE9H0Rn6rOpYYrKyWgo
	Q3aNfr5zduKr8YVZE/s/Im7Rx75LU0AKuX+ln/SeDHWu+LZ8pJ1j4rOsTxaMOsYkL2zt
	Q4XVrQUjovwEe5XWj3/F6o08qct8/Fm6cWKJwqJa0GXeZzkD8RwD4iz5Uom8uHVgsRzM
	/Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=N9sPweyMpmkP0zDe5fchkYQU0SFLtAFDe9icBn1h+ys=;
	b=Y3HJZIMgIqL9Aab0LEdeNuQvkGwhMnK/wu5knUEbu0oDuzZgWk3TNO6ZOBZPw8MISA
	9/mW65GiF9Iq4Jz8T9HLuT1JXKJNFwAGYsCXnNPr5dt1q8GzpdhkKbvGnzmC6aeOGPdk
	TfIFzOP3/1IXsHxJUKKEWyFnhdsZYPnA0emx/SnWz4LEp9NGd/z8Zef6JfX50BwekscA
	VEQpL1MFC6tX8nAbR7n2+h0kVJCl/y/wV5xdz1e/k+6cpvj8QxTGit3W5gotp+Xs1KAD
	eR8Gi3o+m9rVCqHw4X/hdEHnyqxUAF/1yHmjLOZLY6IfmybWxbr7h9uuhHM65EJg7Wks
	KOYQ==
X-Gm-Message-State: AElRT7GcNN4XX3gUqBRLGYYptYF5hqDA31cB+imFQLV+M/XEMpDFYNHz
	CS/20tg838eEZ/KqEI/bYr+DfA==
X-Google-Smtp-Source: AG47ELs1iZ2gQZwhg1aQzowUFr5y2htSerMD26lwyI6OJ2dK+PqeuqE+2NoSV462N/rqVElgunWBaQ==
X-Received: by 2002:a17:902:8349:: with SMTP id
	z9-v6mr41044566pln.163.1522075786831; 
	Mon, 26 Mar 2018 07:49:46 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:203c:a04e:87e9:791b?
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	s17sm1207560pfk.105.2018.03.26.07.49.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Mar 2018 07:49:46 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <62e48d71-f219-2d7d-ea58-b99e1caaaecf@gmail.com>
	<2399974f-8b3a-66ee-5884-969cee6dda20@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f7a3dd48-7850-f72a-eab8-3db9e6419349@gmail.com>
Date: Mon, 26 Mar 2018 07:49:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <2399974f-8b3a-66ee-5884-969cee6dda20@linux.intel.com>
Subject: Re: Bind update
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
X-List-Received-Date: Mon, 26 Mar 2018 14:49:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/26/2018 02:20 AM, Alexander Kanavin wrote:
> On 03/24/2018 05:35 PM, akuster808 wrote:
>> While working on updating the current bind to the next patch level, I
>> noticed our current version 9.10.6 will EOL June 2018. I know we are
>> under feature freeze for the Sumo release.
>>
>> Could we make an exception and allow an update of bind to the ESV
>> version 9.11.3 ?, it EOL's Dec 2021.
>
> I'd say yes. But please do send the updates for your packages in a
> timely manner.
Sorry Mom. I will try better next time ; )

- armin
>
> Alex


