Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tqstl-00068Z-CV
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 23:04:25 +0100
Received: by mail-vb0-f53.google.com with SMTP id b23so15946547vbz.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 13:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fDkmM9KUPJ8/eCkH8Zd/ENF5ed/eCIJxWpPKsGQ9LhA=;
	b=T95SnScVGJRRvyuhr/RKsGw8R9xuRpfW1vqmJxqIuC4vaH8lc/mB6N70iT/0vzAlGc
	IIhwyVCTHfAP43a3oqOy/bwHUOWIp14b6OWVcfeNRrCn5qknpj8rlQ2bNOHPdGYCuJ5U
	FHVuGsaX/5jOCyb+SxyQvbE7gYuH67l6pSxvDhlF8rtyi49VqOPSXNOMp+F0PFdmjeu1
	SYHxrwYjvXLiQ2Qr5iIOmis6pOMwspA0cZZCauj/tQ8B8NnvMJof50pi01p5R8An3vFQ
	d2/GuMA3uLBpj8rvt74mgy85FqkJ77L5VQHg2GdCI2yxYG+6x/74fx7norzfq0YwOmfu
	BiUw==
MIME-Version: 1.0
Received: by 10.58.49.130 with SMTP id u2mr77989742ven.0.1357249760881; Thu,
	03 Jan 2013 13:49:20 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Thu, 3 Jan 2013 13:49:20 -0800 (PST)
In-Reply-To: <160EE236CFD44F58901B43D12D55934D@intel.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
	<160EE236CFD44F58901B43D12D55934D@intel.com>
Date: Thu, 3 Jan 2013 23:49:20 +0200
Message-ID: <CAF6bG8eM827RGkAYvV_xwFx7MBy25OLS=kqYwHthNrDHGpRLYQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/15] popt: disable tests
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
X-List-Received-Date: Thu, 03 Jan 2013 22:04:25 -0000
Content-Type: text/plain; charset=UTF-8

On 3 January 2013 23:22, Ross Burton <ross.burton@intel.com> wrote:
> On Thursday, 3 January 2013 at 20:36, Marko Lindqvist wrote:
>> Use of $(top_srcdir) in TESTS is an error causing automake-1.13
>> to abort. Disable the tests completely.
>> +Upstream-status: Not sent
>
> Is the real fix as simple as removing the $(top_srcdir) line, or is there a more complicate reason as to why we can't fix this properly and submit it upstream?
>
> Ross

 No, it's not that simple. Actually need to use $(top_srcdir) just
indicates the real problem, which is that test script lives in
srctree. Given that fix to problems of that category easily take
significant amount of work, and oe does not need the tests, I think
it's ok to leave these to upstream (should file bugreports, of
course).


 - ML


