Received: from mail-ob0-f172.google.com ([209.85.214.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TsbCp-0002a3-J6
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:35:12 +0100
Received: by mail-ob0-f172.google.com with SMTP id za17so475186obc.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 07:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZweBXSp1Wl1bFmK1o6zRB5lRGjaPUhOVuVINyPcUVsU=;
	b=Ztr8nSRLyhv8sjV9mFfylNyEqdXZXEJ8i3qjnS8xioOfaQoq55fRWKxd5gqh+yqIBy
	SPPu6TyFf9AeMtdOqxBd93J7FgZl7OO1uiPaJSS6r4gxaCXgY69LLvUZACyT1RSgx7QU
	C+bnTqnvEiKXc6PVXmeiZEGxBzhFamAskfey3abg40VeO0448f4VOeRFJp6U10b+yXL2
	AZsZ50roZTeOJpMjxxyPA9hFxz3YS9los0fEv/ntM3Ns9vscgeVhiid0Ye/Hge5iWm5a
	Ojkxsp/m/KFUTeSRYHafIjkt/3gWfWEZctAkxnhQHCqdmSy1y21wxerTUPtQJXaCt951
	+4Bg==
MIME-Version: 1.0
Received: by 10.60.31.8 with SMTP id w8mr36457012oeh.55.1357658400393; Tue, 08
	Jan 2013 07:20:00 -0800 (PST)
Received: by 10.60.54.34 with HTTP; Tue, 8 Jan 2013 07:20:00 -0800 (PST)
In-Reply-To: <50EC3725.2060604@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<50EC34AF.5010303@intel.com>
	<CAJTo0LbEV2STP5gYz77rRT5dOXMJ+yMYivzuyHkD7YkpeXH6Hg@mail.gmail.com>
	<50EC3725.2060604@intel.com>
Date: Tue, 8 Jan 2013 16:20:00 +0100
Message-ID: <CAGiJk9f0Oy5-goE8kmnJt5BCiOYZ32tLsNHUvdjZVos_ReBXEQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 15:35:13 -0000
Content-Type: text/plain; charset=UTF-8

2013/1/8 Radu Moisan <radu.moisan@intel.com>:
>
> On 01/08/2013 04:57 PM, Burton, Ross wrote:
>>
>> On 8 January 2013 15:01, Radu Moisan <radu.moisan@intel.com> wrote:
>>>
>>> I am pretty sure that I added a 'Signed-off-by:' field to my patch but
>>> it is missing in the commit.  Other patches don't have the signed-off-by
>>> of the original author neither.
>>>
>>> Was this removal done on purpose?
>>>
>>>
>>> I had to port the patch manually so I guess it got lost then. Do we want
>>> to
>>> have Sign-off-by from author as well?
>>
>> By the time the patches land in oe-core there'll have been a lot of
>> rebasing and merging as I don't intend to see a series that contains
>> fixes in oe-core.  We should ensure that everyone who contributed to
>> meta-oe gets a credit in the series.
>>
> No question about that, the question was whether to add Sign-off-by from the
> author itself. I know that we are doing it like that right now, but I don't
> understand it's reasoning. Being the author of a patch what would be the
> point in adding a Sign-off-by with the same name? I can agree either way, no
> question about that, just want it to get it clear why we do it like we do
> it.
>
> Radu

This is part of the Linux Kernel patch workflow:

"To improve tracking of who did what, especially with patches that can
percolate to their final resting place in the kernel through several
layers of maintainers, we've introduced a "sign-off" procedure on
patches that are being emailed around."


see: http://kerneltrap.org/files/Jeremy/DCO.txt


--
Regards
Samuel


