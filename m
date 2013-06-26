Return-Path: <eu@felipetonello.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB466A973
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 18:39:30 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md12so14565942pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 11:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=eDoU2tZPff/EELsDGxHtlM2E4BeiyT5Yhrx3wVCdZT4=;
	b=Vp020HyDgPjsDTZOsxtR9JfKvc4YiOpVW6Fqcx4ehoddWm8QBqrbPpY5qhQ0gyPp77
	//TbscisatUv8vxC1Hx0PTgFMS0QQH3+k7jljbzRAIoz5tfwa8yUhfSLsweIO6hIzExf
	ZkT/biy+IW3lRUz6gSb6Rfe+0LtHqPibwJodrGAbuEWhpUaIuYwMrtqy+RNOZ2lPD5NB
	9gUC82P+0CT9JK7PmkbSjh6MqxeKjtowTd4GY3bXvQir9oh5rYjgj88SQcTd1dkOCO+i
	IW+sX9//9CkTG1iCFc5bWNRAYc1aBPXAs1/+GBWaqKMN3kBpDUf+0ELmCUD7HtqOvMdQ
	WPmw==
MIME-Version: 1.0
X-Received: by 10.68.218.8 with SMTP id pc8mr2071593pbc.115.1372271971629;
	Wed, 26 Jun 2013 11:39:31 -0700 (PDT)
Received: by 10.66.164.138 with HTTP; Wed, 26 Jun 2013 11:39:31 -0700 (PDT)
In-Reply-To: <CAMKF1so+vopBv1nJX6pRjzcQDLeRGYxY4p_7j1jwHE=SfnEbcg@mail.gmail.com>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<20130607174252.GI22710@jama>
	<CAGrhNMwW6mbg7WUKbVtjRX1qojb8j6q2krcL9cMVz3JJHaRaSg@mail.gmail.com>
	<CAGrhNMw_82j-RUx7gfdKMqawBQ=JhZ6cusRivSpv=aiU0mHW5Q@mail.gmail.com>
	<20130607183730.GK22710@jama>
	<CAMKF1so+vopBv1nJX6pRjzcQDLeRGYxY4p_7j1jwHE=SfnEbcg@mail.gmail.com>
Date: Wed, 26 Jun 2013 11:39:31 -0700
Message-ID: <CAGrhNMzXiTRTt=9wmYH0Bu4TsN3N82nkrERLmXAd-bBWH1U=iQ@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQm8/fa+sG+8Ur2wdIumF2C2VDd0vD1upKgVppyB4e6q6FdBRT4xGjJQvJlqsF+UDmZ8s4oE
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
X-List-Received-Date: Wed, 26 Jun 2013 18:39:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Should I send another patch?

On Tue, Jun 11, 2013 at 12:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jun 7, 2013 at 11:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Fri, Jun 07, 2013 at 10:51:14AM -0700, Felipe Tonello wrote:
>>> I got this:
>>>
>>> valgrind/usr/bin/ms_print
>>> 1:#! /usr/bin/perl
>>>
>>> valgrind/usr/bin/cg_diff
>>> 1:#! /usr/bin/perl
>>>
>>> valgrind/usr/bin/cg_annotate
>>> 1:#! /usr/bin/perl
>>>
>>> valgrind/usr/bin/callgrind_annotate
>>> 1:#! /usr/bin/perl -w
>>>
>>> valgrind/usr/bin/callgrind_control
>>> 1:#! /usr/bin/perl -w
>>>
>>> valgrind-doc/usr/share/doc/valgrind/html/manual-core.html
>>> 165:<code class="filename">/usr/bin/perl</code>, or whatever interpreter
>>>
>>> valgrind-doc/usr/share/doc/valgrind/valgrind_manual.ps
>>> 55978:(/usr/bin/perl) 77.7083 Tj
>>>
>>> Do you know if these "binaries" are part of the main package or can be
>>> extra? I'm not that familiar with valgrind.
>>
>> Neither am I, but from filenames I would guess they are not mandatory to
>> run valgrind binary, hopefully someone who is using valgrind daily will
>> respond soon...
>>
>
>
> they are fine with valgrind package itself. although its a rdepend and
> not depend
>
>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

