Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3C064731A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 20:42:38 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id e6so74354285vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=QMQ26crpwmqm3Lr8ZRMG8Q5Vzhd6cpagBIaXsATTd7k=;
	b=AeF+w/h4poFUiFp9OWv3gDMwlMKg568mfpViRv7TEhzjH5w8apQ3IukYnInKhLbn0E
	9lsHPJAhRNcDGypSAsKtOrfNT15N1BoX/3uXBlldftQ6+syPjbKqyaXtdnJvB/Qel+uk
	fJkR36xPYyygjDTfwDvheZSKkTFFrQxRFsooyAtHuGP4uBTESs4ihbLTGr+drziwcWeA
	G+ZCjluwSESaOH0fZUg03RM9TvcaP3bLLbzvdpYkT6Rc337QL7HW+sWpN6gSTeMGPFjt
	OH32BGSTwfiyPJ+NwA6cwenfhmpPK2sZf3IT7kJnGcZnPYf5IfCS1+bxFqdqDzl7xBEN
	JcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=QMQ26crpwmqm3Lr8ZRMG8Q5Vzhd6cpagBIaXsATTd7k=;
	b=UzQ/MP6Hd2W31Pn7WBjWXyHHxSGH78snMRD8Z9RyKr5utOn5WW2ClDLFlu+wY1k8mZ
	Yulw21qgR/Ktvf8D5f94J64h+QqafG56JzHqMxVDvhEAbsiIOCs15lBeSktmNz8FHJ5v
	YRDrxtC21QTo2gqb6OHhX20K5wFPzjhMpjDMfxz+SeJGuQ05bAHWkXAMKBaHdUCtAqua
	bb8y5LrdJ3RPGV5EcqvWj89iX9SPoayeD/t6H4fB8axXVMXcbC6TDuPibvAdX8+ByWHE
	bMBJ6CJ2Be19+gisY7m4neM77eZXyY5dRWytxwOU1RR1PFy542KAlAFKevgy36pCxANg
	E8sQ==
X-Gm-Message-State: AD7BkJINc1YZuZLU/JR0/WdWwYjId3udujfiRnLgNMJM06uU4/OXomxv+0bhWDFeWKCtf1UXv8HFzST97OTLeg==
MIME-Version: 1.0
X-Received: by 10.159.36.208 with SMTP id 74mr5996044uar.133.1458852158666;
	Thu, 24 Mar 2016 13:42:38 -0700 (PDT)
Received: by 10.103.94.196 with HTTP; Thu, 24 Mar 2016 13:42:38 -0700 (PDT)
In-Reply-To: <1458768152.3073.26.camel@linuxfoundation.org>
References: <1458680136-5455-1-git-send-email-ross.burton@intel.com>
	<56F29A68.5030905@linux.intel.com>
	<1458742435.3073.7.camel@linuxfoundation.org>
	<CAJTo0LYz6ufXJZyc0TFviL=oih7RBuOym1VwiQrmn3Cz4RJVnQ@mail.gmail.com>
	<1458768152.3073.26.camel@linuxfoundation.org>
Date: Thu, 24 Mar 2016 14:42:38 -0600
Message-ID: <CACS+7ZT7Oo3CgXPsDr_qSXuo2MXFoK5bRbzaTOuj_QLr4AH=0w@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Python 3 as oe-core default?
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
X-List-Received-Date: Thu, 24 Mar 2016 20:42:38 -0000
Content-Type: text/plain; charset=UTF-8

On 23 March 2016 at 15:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2016-03-23 at 14:35 +0000, Burton, Ross wrote:
>>
>> On 23 March 2016 at 14:13, Richard Purdie <
>> richard.purdie@linuxfoundation.org> wrote:
>> > In 2.2, switching the bulk of things over to python 3 is one of the
>> > things I'd like to see happen.
>> >
>> Including bitbake itself?
>
> Yes!
>
> Its about time we got this sorted out...
>

Looking forward to that one...


> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

