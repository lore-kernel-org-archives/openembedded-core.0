Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web11.3543.1592385174675822494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 02:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=Hascp/eP;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id F061C5C0298;
	Wed, 17 Jun 2020 11:12:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1592385171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+hkUNICTtbWkU15oN7uiLO5Mu2rf2KAGFM77fER5FA=;
	b=Hascp/ePZo8fzLAEQzzsutwA/Inic9lPwg9DEHwkgbHqc1cFyG0dCPyVwIH7Z0fU1NvTAQ
	rDTShjOAU8FY3xuGyO3eU4KJ9gXXglWrJebTXOBUD4wRCW8JmYzNsjmEcTLCl4T6TXJxFG
	cCQZ9b5F+9xUhYU/OckA8aYb/6c895g=
MIME-Version: 1.0
Date: Wed, 17 Jun 2020 11:12:50 +0200
From: "Stefan Agner" <stefan@agner.ch>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Khem Raj <raj.khem@gmail.com>, Stefan Agner <stefan.agner@toradex.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] busybox: udhcpc: fix IPv6 support when using udhcpc
In-Reply-To: <20200616095048.im6minhd7qsjc65d@qschulz>
References: <20180514144415.40730-1-stefan@agner.ch>
 <20200113145729.amwegnpvnp2kb3ut@qschulz>
 <20200120123246.o5abx73ehcoqbbim@qschulz>
 <4e98fdb7ff73df6804e58f2f4339c816@agner.ch>
 <059aa62b-1c45-50a3-5d58-40f2646247ad@gmail.com>
 <20200121092341.bgb2elaqey75egjp@qschulz>
 <CAMKF1spxORPSqDJuD2RWLFNXs8pHZSDQtVgzp+xcb3w2tC3htQ@mail.gmail.com>
 <20200122100655.eenl3tcnhj4kkcda@qschulz>
 <20200616095048.im6minhd7qsjc65d@qschulz>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <ff482778962fb62fe8e1612b632e0e67@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2020-06-16 11:50, Quentin Schulz wrote:
> Hi all,
> 
> On Wed, Jan 22, 2020 at 11:06:55AM +0100, Quentin Schulz wrote:
>> > > The reason why I didn't bother to send a patch to busybox before pinging
>> > > on this patch was that we're already different from the upstream simple.script
>> > > so it didn't make sense to me to add the Upstream-Status: pending or
>> > > something on the patch (in some ways, since it's patching the file
>> > > directly and not adding a patch in SRC_URI). Anyway, digressing. Do you
>> > > want a patch to be sent to busybox ML (or PR or whatever they use)
>> > > before taking this patch?
>> > >
>> >
>> > I think the problem this patch fixes is generic and somewhere the
>> > script OE has is also derived from
>> > that example, so while the patch in itself is enough for OE, it would
>> > be better if it was in upstream too
>> > perhaps one less thing to worry about when we cherry pick changes from
>> > upstream script in future.
>> >
>>
>> Agreed, I'll put it on my TODO-list. If I do not send an answer on this
>> mail with the link to the PR or patch in the next week, anyone, please ping me.
>>
> 
> *cough* Took a bit more *cough* than a week *cough*
> 
> http://lists.busybox.net/pipermail/busybox/2020-June/088028.html

Cool, thx for upstreaming!

--
Stefan
