Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 883BE6A9C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:37:12 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id x12so585790ief.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 00:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PlLKIoUp5UqRY9rM+TDBO8u66kJQhnD5ExH/Uzv0bPg=;
	b=IrdOLTrE1WAROH6SJZzyPwAvnpjHGmvqXrbt/dGOKspUJIA/fR7QA0NN6IULNku7rK
	VaOtlf9lbTlrBXpviR0pGKNTJFyS+IzAr6NmjYM6Z1n8XL3TLYdwo1tcQ/LC936qo7d1
	RcusWcJoGAa7zx0vsFrpJGH2/zIlP/J4fwiskD+5ApDcIhZTci4+ALmAxG8GhVRKRjOH
	FEhT8tGM2qrg05VW+WFwp4Vm7c88M1P11+Y7K5NyiAuZ23w51nTE5CF7IbRL/HPphBTX
	+eI+3XG9LuDfXA+4j01/w48df7mfEC5f6nobpAg6DBo3OhkycVErZH602QHBsaV9DU12
	0e3w==
X-Received: by 10.50.44.98 with SMTP id d2mr336605igm.15.1370936233565; Tue,
	11 Jun 2013 00:37:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 00:36:43 -0700 (PDT)
In-Reply-To: <20130607183730.GK22710@jama>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<20130607174252.GI22710@jama>
	<CAGrhNMwW6mbg7WUKbVtjRX1qojb8j6q2krcL9cMVz3JJHaRaSg@mail.gmail.com>
	<CAGrhNMw_82j-RUx7gfdKMqawBQ=JhZ6cusRivSpv=aiU0mHW5Q@mail.gmail.com>
	<20130607183730.GK22710@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 00:36:43 -0700
Message-ID: <CAMKF1so+vopBv1nJX6pRjzcQDLeRGYxY4p_7j1jwHE=SfnEbcg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: added perl dependency
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
X-List-Received-Date: Tue, 11 Jun 2013 07:37:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 7, 2013 at 11:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Jun 07, 2013 at 10:51:14AM -0700, Felipe Tonello wrote:
>> I got this:
>>
>> valgrind/usr/bin/ms_print
>> 1:#! /usr/bin/perl
>>
>> valgrind/usr/bin/cg_diff
>> 1:#! /usr/bin/perl
>>
>> valgrind/usr/bin/cg_annotate
>> 1:#! /usr/bin/perl
>>
>> valgrind/usr/bin/callgrind_annotate
>> 1:#! /usr/bin/perl -w
>>
>> valgrind/usr/bin/callgrind_control
>> 1:#! /usr/bin/perl -w
>>
>> valgrind-doc/usr/share/doc/valgrind/html/manual-core.html
>> 165:<code class="filename">/usr/bin/perl</code>, or whatever interpreter
>>
>> valgrind-doc/usr/share/doc/valgrind/valgrind_manual.ps
>> 55978:(/usr/bin/perl) 77.7083 Tj
>>
>> Do you know if these "binaries" are part of the main package or can be
>> extra? I'm not that familiar with valgrind.
>
> Neither am I, but from filenames I would guess they are not mandatory to
> run valgrind binary, hopefully someone who is using valgrind daily will
> respond soon...
>


they are fine with valgrind package itself. although its a rdepend and
not depend


> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

