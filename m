Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 47585618B5;
	Tue,  9 Jul 2013 08:30:40 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id ar20so11935053iec.21
	for <multiple recipients>; Tue, 09 Jul 2013 01:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=srAmZlKF0W/sr8nLUq262kuJnqpPbLV85lpmUZJSAWA=;
	b=zFfVBH1425ZDNkfgNvATltd4MRg3UXkG+DqhYrF0nnUyPnpiNl6AnmdqamIJmxZ3dN
	Vzw2Suf+cOpsEHQgQFjCP6ZNfZCn7iq6E4+aTbjEp0vyJ/uRRuVvv7lNXiLVuNMIgExQ
	AqJuWrXGLrpD+2Qa8hNMXCfs33biwHC3b48AReT38hwxauY/z7Krt6+WR2Do8IlxZqMM
	7JYgpczUtY/ityv+qEiXbX9w3dK8v9YLYX0XSeWCb9vBpUynpw45dSN4H1u1pgKaPVwI
	i4qcH////LYCNuAkyfgKfzKtZ5p2bqo88ECQ0t0n+vTbGaCjDbFOb7B+6bpPcQARw8NJ
	Kwzg==
MIME-Version: 1.0
X-Received: by 10.50.60.33 with SMTP id e1mr34139092igr.27.1373358641247; Tue,
	09 Jul 2013 01:30:41 -0700 (PDT)
Received: by 10.64.33.12 with HTTP; Tue, 9 Jul 2013 01:30:40 -0700 (PDT)
In-Reply-To: <4D2E4782.3080008@mentor.com>
References: <1294863352-1486-1-git-send-email-rep.dot.nop@gmail.com>
	<4D2E1209.1090805@gmail.com> <4D2E4782.3080008@mentor.com>
Date: Tue, 9 Jul 2013 10:30:40 +0200
Message-ID: <CAC1BbcRQMjivuY-bX1OHJ+9NPbsaEc1jqPimd2Yy72so_ENRHQ@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH 0/3] autotools.bbclass misc trivia
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
X-List-Received-Date: Tue, 09 Jul 2013 08:30:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

It seems to me this was never pushed, or was it reverted in
the meantime (if so, why? who takes care of passing these in nowadays?)

Thanks,

On 13 January 2011 01:29, Tom Rini <tom_rini@mentor.com> wrote:
> On 01/12/2011 01:41 PM, Khem Raj wrote:
>>
>> On 1/12/2011 12:15 PM, Bernhard Reutner-Fischer wrote:
>>>
>>> Hi,
>>>
>>> In an isolated test with dash and busybox ash the AC_CONFIG_MACRO_DIR
>>> patch works as expected. Testers welcome.
>>>
>>> Bernhard Reutner-Fischer (3):
>>> autotools.bbclass: pass distro_imposed_configure_flags
>>> autotools.bblass: mkdir also AC_CONFIG_MACRO_DIR
>>> autotools.bbclass: use grep -q
>>>
>>> classes/autotools.bbclass | 29 ++++++++++++++++++++++++-----
>>> 1 files changed, 24 insertions(+), 5 deletions(-)
>>>
>> Whole series
>>
>> Acked-by: Khem Raj <raj.khem@gmail.com>
>
>
> Acked-by: Tom Rini <tom_rini@mentor.com>
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

