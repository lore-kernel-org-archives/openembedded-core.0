Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9A971AEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 21:09:13 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id y43so46640329wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 14:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i0FDHVyWa4Vsa3616jhMYPiUhwFq5vfwXcN4qfKbtVs=;
	b=Bg8EfbzUU6FAN+xkPiKnFd2EitFpzPK0vKpNjICGcbb4j0Cp6mijvlTsZc1CzKXwy2
	PWh6V00gBdF88rWKQA8Z6yfSro5fKmJPBSRpKVjJVQm7PLMazDz2U1141QavRGP4QI96
	IzMo2aGuqnDzSrycxCLaP/Xh1CQrFmfl+VJ9ypXjXQyVTguTzoHvUbuYoOT38T4hHuT9
	9GE2RChSRXf3jT8j56UhNUt5KDvTH6ySr8UK2n5oprXJcC5QCtnWJSAT8fq33RQPjJVW
	OezJEbmjAp9P+Y8y2YSXb3WpdymiBm42TpWJFXYLb4xjc66jxA5ccdeT5W/6mI5l7hOW
	QbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i0FDHVyWa4Vsa3616jhMYPiUhwFq5vfwXcN4qfKbtVs=;
	b=ApeelBgyQs+rUVVHroVZbzrxTW92EdsPR9o+Owvzwi4VgC891hGdW59T1Rdf0byQ6m
	myIpApoYfPzIrF1M6aZOM9PdblvG9F9K7UoXi5QLQlyXgf/x2SHIoMM60cd1Uf5R9QP1
	rbKPrj76luvxZWSToReIFTr+Kf2FJrRjNb0vAeJSjWF5BOmFSQh5/asIRqs+MO8YS/Zx
	cq06AchP3ZIvcaqYRp6ueWW5Q1AOtC0oThA94wJxdbmv8aP25K1t2NL0x6jLVwk06DEp
	8RZcmMb+XqPoR6GG+p1EFWZP01JFiRyV0FhFSH2U0vXE+jDwjBjzg8DLa1WMozWKcLWD
	eJmQ==
X-Gm-Message-State: AIVw110o2c1pJ8VCC1EhRWktH5IVVpx29x3JTnPn/WcIWuVV9S6BVRrP
	2rcjLOHdsCg5wmYVDBUPzd1u3NiigA==
X-Received: by 10.80.164.185 with SMTP id w54mr3463915edb.76.1500412154789;
	Tue, 18 Jul 2017 14:09:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Tue, 18 Jul 2017 14:08:44 -0700 (PDT)
In-Reply-To: <33942952-1dcf-d334-5953-63020d14ef83@linux.intel.com>
References: <cover.1499822461.git.kai.kang@windriver.com>
	<10b67207-e767-0458-c642-20ee38621bd3@windriver.com>
	<e25b7dde-3a9f-5964-8d63-c3cd60785072@linux.intel.com>
	<f136d49e-6409-fb63-0c07-a371392761f2@windriver.com>
	<33942952-1dcf-d334-5953-63020d14ef83@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jul 2017 17:08:44 -0400
Message-ID: <CAMKF1spKp6=VpO=mtGSLph2UF84mnQMra=Roup6cHwZxr+Ct8w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] bind: 9.10..3-P3 -> 9.10.5-P3
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
X-List-Received-Date: Tue, 18 Jul 2017 21:09:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 18, 2017 at 3:14 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 07/18/2017 05:04 AM, Kang Kai wrote:
>>>>>
>>>>>    bind: 9.10..3-P3 -> 9.10.5-P3
>>>
>>>
>>> Why not 9.11.1?
>>
>>
>> If bind 9.11.x is needed, we could add its recipe. But I think the 9.10.x
>> version should be kept for compatibility.
>
>
> The policy in oe-core master is to update to latest stable upstream
> releases, so please provide an update to 9.11.x. If you want to keep 9.10.x,
> you can do that, but please provide a more specific reason.

if there are ABI incompatible changes then we have to scope the impact
and plan the upgrade accordingly, if its backward compatible then yes its
the norm.

