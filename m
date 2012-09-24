Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGEKq-0007DO-Dq
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 21:28:52 +0200
Received: by eaac1 with SMTP id c1so236560eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 12:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yhN0mJRtslgUwvQMtaiqn9M2Bnd+3GdEcPJCUwaK8zc=;
	b=y09DBO0XW8trDiMNQ+XNwFhLbDmhoQauh12yIkybsKbhzVU653U63SwXJBmsdFRer2
	or6zaSqokX9ejlDE88Zrvck0fpLUPtl022LF2nJi3tjjH6GZtZgfiOP5sBSuG1PoG+mS
	HDII9XYVsdjwo4RhrHg5Sw3CJ8cp2A2hSbkM8RZCgXXtMVMPjRNwQSi68xteUnOgM7vn
	0DiPOmK58BRkrhi3mPY1cw2zEZem5Q3HnZBk8p7TYKIvMadDifKK9La7YWh3xJp9gCp/
	LOu2MJzzYH7+6O45NK4C8+Q+HvNC7Z/lp7osAvBosL/FoMWphQzhxe5sglOPbtATvh0Y
	+Ydg==
Received: by 10.14.218.134 with SMTP id k6mr16020399eep.14.1348514164416; Mon,
	24 Sep 2012 12:16:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Mon, 24 Sep 2012 12:15:34 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6A295A@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348487376.31293.31.camel@phil-desktop>
	<CAMKF1soJZLBPDBH-1rOs3Jk7Su9m76gue1aOWuKKN-598KP0CA@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6A295A@039-SN1MPN1-001.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Sep 2012 12:15:34 -0700
Message-ID: <CAMKF1spJLc_nZ=pZouUxOJD1apifDAQ=zDPGesmuHYgXN_fc4Q@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: Phil Blundell <philb@gnu.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kexec-tools: admit mips as a COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 24 Sep 2012 19:28:52 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 24, 2012 at 12:10 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Mon, Sep 24, 2012 at 1:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Sep 24, 2012 at 4:49 AM, Phil Blundell <philb@gnu.org> wrote:
>>>
>>> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-(linux|freebsd.*)'
>>> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux|freebsd.*)'
>>
>> I wonder if this expression should be removed completely now that mips is added
>> we dont have any supported arch left.
>
> All the powerpc64 target still won't work (the Freescale ones at least).

OK but above expression does not exclude ppc64 so you have a bug here.

>
> -M
>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


