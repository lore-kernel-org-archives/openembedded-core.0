Return-Path: <kirgene@gmail.com>
Received: from mail-qe0-f52.google.com (mail-qe0-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6076A566
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 13:36:52 +0000 (UTC)
Received: by mail-qe0-f52.google.com with SMTP id s1so4747338qeb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 05:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lyHMZuycvLk0tholwYBfiPgGz47ZUj8FFZhBwR5Ijv0=;
	b=WzYtFn+UOpir/da4RjT6e/aJXkZzio3dJReoD3J7tANPXkWWByGfYaqpisnZ7UC+xQ
	EBb8cviJFZJ++Ts1ZGU4XUf9MDjqf+nzLaxtLjXNHp2GaRjHcamMLcPeEstElk8WzV/V
	/K6c+Xq24l8HKbu9MlYGj2L/kKwlNPQvuh8mQra9IYzx9H35Z/rRB6pbX3Ifg01XktvJ
	DMbBK8rOYeBxlDpoxmpJk+DAXyd0zfE9FrSgFEzacd+MZ5Hj7yjHVC0gmFlNw3zPAOLv
	pMkWahjSznwSGCHxDdhrXu6Fm13wlK7/cw6ZjWv3wCGXAuVEa9SRC2AUneyTSX33Vl6D
	/DgQ==
MIME-Version: 1.0
X-Received: by 10.224.2.6 with SMTP id 6mr3203398qah.12.1389706613753; Tue, 14
	Jan 2014 05:36:53 -0800 (PST)
Received: by 10.96.177.105 with HTTP; Tue, 14 Jan 2014 05:36:53 -0800 (PST)
In-Reply-To: <CANyK_8cntHRL7rRSUibaCX_1L3zDmYhx_P=pa6S7RA4G_LeG5w@mail.gmail.com>
References: <CADV-EXEygnQGWan8VLtZbieUozXPnfRNytXg9TBv1ALwJ_y3cA@mail.gmail.com>
	<CANyK_8cntHRL7rRSUibaCX_1L3zDmYhx_P=pa6S7RA4G_LeG5w@mail.gmail.com>
Date: Tue, 14 Jan 2014 15:36:53 +0200
Message-ID: <CADV-EXEOb5NrhOG80QmsRE7hBshiSfchL=62qpBHnSKzA8Yt+w@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Failed to build opkg with curl support
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
X-List-Received-Date: Tue, 14 Jan 2014 13:36:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

2014/1/10 Paul Barker <paul@paulbarker.me.uk>:
> On 9 January 2014 12:04, Yevhen Kyriukha <kirgene@gmail.com> wrote:
>> I define "curl" in PACKAGECONFIG for opkg.
>> After that I'm getting circular dependency errors during building opkg.
>>
>> Best regards,
>> Yevhen
>
> Sorry, this is a known problem.
>
> The update-alternatives script needs to be moved out of opkg, either
> to opkg-utils or to its own recipe as it is the use of
> update-alternatives that is causing the circular dependencies. This is
> what I am planning to work on next as soon as I get some time.
>
> This is required for my ongoing development work on opkg so it should
> get sorted out soon. (Future versions of opkg will depend on
> libarchive which also indirectly depends on update-alternatives).
>
> Related to this is the fact that no other providers of
> update-alternatives seem to work, again due to circular dependencies.
>
> See http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/45321
>
> Thanks,
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk

Can you give some estimates on how long the implementation of this
feature will take?

-- 
Best regards,
Yevhen

