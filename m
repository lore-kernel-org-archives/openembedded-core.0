Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id A3F3471B2B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 16:54:50 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 96so37162164uaq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 08:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d92HEFAKGvJXUprZCspUQIvGjrQd9A5OvbzzsH3dzfk=;
	b=ZxWjjTvM0LWrt83DChDsTQx0wdjVQsHfFM+ZcK/14rDvP7to7R9jFGBLdP21sy9ZdQ
	wFt5IycoQFIP+jYJt/lkzHQFHuZktUChKg5IPtcinOIKSKCEZE9wIrroVV0WN/XFUviS
	CLDNzsGApugBcpzOapex6GzIi5HXB6RT8DXJ7bR4kIrfZ2ojAs54RALkrk6vr3n8qGT7
	VcsDXlWb/f8YrB2RJSMN/Rcjllsa2fZjbyYGbeo/W8Rm2FLs+lblnMT9Nqjd4S4ZGn+B
	jQlSkOok3DkKZfyosIyPQnhdeJtGrNxTnzw77CMn4HEsdzhF+NbUIiS91SvgXGLLkp0O
	tL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d92HEFAKGvJXUprZCspUQIvGjrQd9A5OvbzzsH3dzfk=;
	b=L9nVS+NY5mICJUNMHHIArtKun4SabaO2g1K2BZ23Y1ddbR2Y58cPh7VUHIBLUjOECN
	UVMCs7A+YBCltjQB6fncqTMB42CL5tcdnBVTVhU8dxoLEc5YOVun8QFBexi7gZngGRPb
	QliKheOqC2/OW2ZCnZZgIUHHC3qkRslLsTcR0BV2FJ0+LMFw55MdBNrznt2ZYBjOAmYK
	b+3AXH3D5oXdoPYTuStsVpUw6lINNvXT3QvtmfkQAAmNcSQFXBkXPROV+kpViBwvKgjR
	ERDMn2kETnTbFKinme7zS5xe+GQeDfb/bp7Tqit6EcEsmrEtnomlrlla18sB6HoRDOI7
	dvBA==
X-Gm-Message-State: AIkVDXIBBbtxil5TiKkrq7cCbfjlORRc3oLv4eIyYkpON/0b2IotsPmyWXsUs56LqH6y3gtjzST1YLYaJEK3TQ==
X-Received: by 10.176.84.8 with SMTP id n8mr57924689uaa.29.1483721690712; Fri,
	06 Jan 2017 08:54:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Fri, 6 Jan 2017 08:54:20 -0800 (PST)
In-Reply-To: <CAJTo0LYXVGGnC5XtTA-LDE9oRLK0693xvBnE=11ab+KczbE1hw@mail.gmail.com>
References: <20170103015528.29635-1-raj.khem@gmail.com>
	<CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
	<CAMKF1sotQbOB9TMCDqa8cNhiD3QsKdgrQmVzHcw=yCbywzeROQ@mail.gmail.com>
	<CAJTo0LYXVGGnC5XtTA-LDE9oRLK0693xvBnE=11ab+KczbE1hw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jan 2017 08:54:20 -0800
Message-ID: <CAMKF1sp3bgSVF0+1YLMGtOeQNOVs7XxcM=etkckgbN6-kBvNJA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to 1.1.16+ on master
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
X-List-Received-Date: Fri, 06 Jan 2017 16:54:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 6, 2017 at 8:48 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 January 2017 at 16:44, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I think its the kernel 4.9 headers thats causing it not musl. Do you have
>> that
>> patch also staged along with this ?
>
>
> Maybe. ;)

regardless, I posted a patch for ppp for fixing same issue, seee

https://patchwork.openembedded.org/patch/135536/

may be the same or similar patch can be applied to connman as well.

>
> Ross

