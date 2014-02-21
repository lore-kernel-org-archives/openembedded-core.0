Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id A58E36EC6B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:45:51 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id pv20so2807199lab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 13:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=3EKpJDCfXgm9w8pCSwlfljJxjoIWfIDjvdOdGcY6HJg=;
	b=yHY2ScJHyNjdIMZ2lePGJWtFwgWiTynHP6a7dz53D9wHoJv5sRrTpM/hz3717Np4ZJ
	YUdlnNf82YbCZR9WXNcXO5Dtmppk5+mKxwMV7DWgEe0+zxjgNA55bGTbFz2M2fAP7rii
	HfaAR5n45E8tkLUCGShTx8pbLO0FlnFhDj+5D4PM3d2ehFnvGHoLRR+wscV3pUkjtcV3
	sC1IVrhb4VTp3YEm5QPyxOLjfZo4IRu/JSYGaRSTaQ5lr3cywJ9Jlp9gRJkl3xrVj7Ub
	qGS7y7Pkb8PONZsK+tXjFp41lYHfGuNL4ENuGy/LvX+C10+GT9y8qfP4iJsBzYhA5tqx
	xwbg==
X-Received: by 10.112.150.6 with SMTP id ue6mr5207887lbb.86.1393019150520;
	Fri, 21 Feb 2014 13:45:50 -0800 (PST)
Received: from [192.168.43.169] (c-5eeaaa31-74736162.cust.telenor.se.
	[94.234.170.49])
	by mx.google.com with ESMTPSA id cu8sm8977061lbb.12.2014.02.21.13.45.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 13:45:49 -0800 (PST)
Message-ID: <5307C90B.3080804@gmail.com>
Date: Fri, 21 Feb 2014 22:45:47 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1392991017-3524-1-git-send-email-david.c.nystrom@gmail.com>	
	<53079ABF.2090204@linux.intel.com>	
	<CAAKB1h2Etg6DixU6fpO79GEhkV1mu5noDuXdzrjE9NmrnmPKvw@mail.gmail.com>
	<1393017641.2640.21.camel@e130.pbcl.net>
In-Reply-To: <1393017641.2640.21.camel@e130.pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: SPE is not compatible with Altivec
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
X-List-Received-Date: Fri, 21 Feb 2014 21:45:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 2014-02-21 22:20, Phil Blundell wrote:
> On Fri, 2014-02-21 at 20:40 +0100, David Nystrom wrote:
>> Perhaps you know this already, but e500v2 is a cpu arch, same as
>> armv5.
> Is that really true?  I thought e500v2 was an actual core and the
> equivalent architecture was Power v2.03 or something.

Yes, good point.
I understand Sauls concern.
>
>> For future reference, should all ppc related CPU-arch specific stuff
>> be directed to the FSL bsp ?
> Since we do ship tune-ppce500.inc in oe-core, I think it makes sense to
> also include the overrides necessary to make compilation work with SPE
> enabled.  It doesn't seem unreasonable that users would expect that the
> recipes in oe-core would work with a configuration that comes as
> standard.
>
> However, adding overrides for e500v2 specifically does seem like a bad
> plan since we will then end up having to duplicate the thing for every
> other non-altivec configuration.  Can you come up with some override
> that will apply to all SPE configurations,
Yep, will return with V2.

> or failing that a patch for
> the configure script that will disable the altivec assembler if it
> notices that ${CC} is configured for SPE?
>
> p.
>
>


