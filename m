Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id C5A56726E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 14:10:52 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id a41so1881320yho.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 06:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=H4Rnv3d6Ig97VBeFDQDJjC6orEF/UvyYeTauX3V2+qA=;
	b=0xdARqLNjLvq1EEUeUh0RQkTr1MiM7hBhOYwGge9aC2+5So2SyoHyjZLI4YCPeSzPq
	iPpARd2O8mKc50J9ZIsfkutkJXNDsJbROg9jCWtaGbcY4ln8BjUkUf2I5X6CZCDsrWiM
	HIIAey5vzpJ79TTEEtxGzWgWNnfLhxm1ynylo+3m+4zUNtlHxgdIbn1HAHH6SHhdlfC9
	Jz6k6rG4Z6rLIH3zsfRSV1V704W1LN/wFmWNa+RcRYZiJIpYwZdXJLQCQsDZjiMHadb/
	0TtmvBHgtI7BL68knn9NY7obSjY24OWAW9Q/2oZDWgy5NvV73ftlguE/mJSdCao2+g0G
	vUag==
MIME-Version: 1.0
X-Received: by 10.170.187.213 with SMTP id d204mr1474181yke.99.1423231853331; 
	Fri, 06 Feb 2015 06:10:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Fri, 6 Feb 2015 06:10:53 -0800 (PST)
In-Reply-To: <1423222962.20217.13.camel@linuxfoundation.org>
References: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
	<4479188.gEPuv5Te0O@peggleto-mobl5.ger.corp.intel.com>
	<1423222962.20217.13.camel@linuxfoundation.org>
Date: Fri, 6 Feb 2015 12:10:53 -0200
X-Google-Sender-Auth: 76E2mAqstEZtej4fLpg2m7kQ1zk
Message-ID: <CAP9ODKqxCyd=h0ZdyjjY+eogPumbtY3VMBwvskSBQEcw8+D5+g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"
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
X-List-Received-Date: Fri, 06 Feb 2015 14:10:53 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 6, 2015 at 9:42 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2015-02-06 at 10:41 +0000, Paul Eggleton wrote:
>> On Wednesday 04 February 2015 21:33:36 Ross Burton wrote:
>> > It turns out that changing WARN_QA and ERROR_QA results in do_configure's QA
>> > postfunc re-executing, so changing a QA test results in a complete rebuild.
>>
>> Hmm, shouldn't we be fixing this? (e.g. with vardepsexclude).
>
> Well, either the tests should rerun or they shouldn't. I'm not sure "the
> configure tests don't" would be an improvement?

I think they should re-run. Otherwise we can end having errors and QA
issues unnoticed until a full rebuild.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

