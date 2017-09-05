Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id C314873117
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:42:42 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id e199so5220698pfh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 21:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nBpZYbCby7DRtfU5teFoKEbMjTiJ5TRuWll2TRcqlnM=;
	b=M2F8zbExqAFs3rWcR9TFqMtC/M3KwABRWhia1kKdsg46LcKUUzJ3CPl4ilDKJLJvAL
	PALh3O3wA1gIelPt6bqCwy0tCPWcmmyIw2V7b4wY8/zkcm7h8gBVkL9aYGZ5EYZoAiEe
	KsSvlM+GxHpy0/gcYSYFA0EU74xRYLFcr7jm6NxcmzEeWZ6zisCXrvICjgy/6APxMnr5
	gDpXqmRi9Xb1Vi5RZBV8zgGA+aoWQLEUVzAbtaisATMyut0DW/Dig+fflvg6YGl5Krhc
	TFPCqq3ORMKEFs6u/Bf/6v5KSxbvjGpE9jzDWIplMkHym4ISh287EUckrNCiICLnLlTf
	45Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nBpZYbCby7DRtfU5teFoKEbMjTiJ5TRuWll2TRcqlnM=;
	b=Cc2R0c3yBjwR0YjlvTtBKj1EflxcIKr022lvKwW2F0u9I9vCD/+4jCZUZHfH8GXWG2
	Q+bA19bZDni5UaDsNrG7CKwLHzeOSWSxb4ljMvg0kP8nBsVxoQiRMgRjMA/zKlxROz/U
	JshDCoCXcu/Dco21vPnEJVaOIFRKp6eHlzJUDkgDXfeQgP6MV3SeASFZ/P5TiP6QFVAU
	68TgMZeEB5WTElFdXoXSVerCbAtTN2EdFXaKwmcsVljLyr1/bPZiHsv/5BqnO15oP3Vi
	OCbMH11sSDr/uJMzvpAYXqQPMm+hYsjopIlxu29NHgj3Qwe7b8VBh3tLcQ9cKacbqnJR
	9YNg==
X-Gm-Message-State: AHPjjUhdyX3ek7b0GVUqag4enbYV6O0N0bfgr6szcxDPGJ9LZ08GeYQK
	Daaa85Bnq6vAOnK6iWE6mLUhBNpF5Q==
X-Google-Smtp-Source: ADKCNb5gjXnFxc5guwkRzEh67f+grnHX6h1UAtp7ZtSKln0Spao01c+ieiDkhJw3pa9+m7XiJMWqJVzDuS3ASxmm3AI=
X-Received: by 10.99.110.1 with SMTP id j1mr2653872pgc.329.1504586564009; Mon,
	04 Sep 2017 21:42:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 4 Sep 2017 21:42:13 -0700 (PDT)
In-Reply-To: <CAP9ODKqsTuHMTUPOqERNhTw5WvxhYMw40-PDVfh59LwTWatdCQ@mail.gmail.com>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
	<CAMKF1sruu96Y0ZUsHXDWG08=eayFWMe+p6QQJwk1oOw6qPViUw@mail.gmail.com>
	<CAP9ODKqsTuHMTUPOqERNhTw5WvxhYMw40-PDVfh59LwTWatdCQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Sep 2017 21:42:13 -0700
Message-ID: <CAMKF1spodxS-0gWC9ivUP-amvuzg=68J_2aCCMdpxX0wWHUN0g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Revamp the Go support
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
X-List-Received-Date: Tue, 05 Sep 2017 04:42:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 9:40 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Sep 5, 2017 at 1:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Sep 4, 2017 at 2:06 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> This is not yet complete but does improve some parts of
>>> Go support on OE-Core.
>>>
>>> We are trying to port as much as possible work done by Matt on
>>> meta-golang back to OE-Core and also to avoid carrying old releases as
>>> there is no need to support more versions of Go toolchain.
>>>
>>> The first commits on this serie does fix errors in current
>>> implementation, the others are improvements and clean ups.
>>>
>>
>> these changes look good to me in general.
>>
>>>
>>> Otavio Salvador (7):
>>>   goarch.bbclass: Stop passing True as second argument of d.getVar
>>>   go.bbclass: Fix binary installation path detection
>>>   go: Remove Go 1.6 and 1.7 releases
>>>   goarch.bbclass: Add support for ARMv5
>>
>> Does it work on v5?
>
> Yes; I've been using it in UpdateHub project. I can retest it on imx28
> if you want.

qemuarm should suffice. Thanks for confirming.

