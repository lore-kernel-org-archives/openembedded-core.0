Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id D108A6A463
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 12:04:54 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id s9so6740683iec.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 05:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VguJYeJzXfryetyxJGYzXGBjOr1UAInF5mqfxnWdQb4=;
	b=oxRfAg/89drd0pvLyOy3wX+XWw95CTpHhanNvxSGD+gyYq0Jnky8HkB2faMuzgOWHj
	GdpjCDxsAQEMULgi/CuO9cT5jqgdp+bpBGx3ioz0v7lIlbW78wmKyuqmfxzWaQ7Ukkj7
	KAzRt+X1C/OHPc+x/P3EbqlUShBwam+2wtkWO3uhvixcMd7vsstm62X6/eiac9k42R0n
	01L5MPbz1pnVLJxICzC+u5wuaG4g6V8qEM6IxfAAORHLzpBTN08GJZhYT7Dh3KEYzzHN
	Kp9OvlJp0tN+tRRHv+ko1sMLsVOU0TnEutFYcHEXX7JYlze/xHey7KaSBamwnfmle1tI
	K6TA==
MIME-Version: 1.0
X-Received: by 10.50.119.42 with SMTP id kr10mr322448igb.20.1374149095294;
	Thu, 18 Jul 2013 05:04:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.9.113 with HTTP; Thu, 18 Jul 2013 05:04:55 -0700 (PDT)
In-Reply-To: <3464105.VeimZdSK2P@helios>
References: <cover.1374128654.git.sgw@linux.intel.com>
	<3464105.VeimZdSK2P@helios>
Date: Thu, 18 Jul 2013 09:04:55 -0300
X-Google-Sender-Auth: RFoy2BKsCqMWjrR7SGc48OXNdmk
Message-ID: <CAP9ODKrfU6qeRCNkJGoCyXf_wfimuM6DpjcrCOH4pmycpLTAmQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/40] Review and ACK
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
X-List-Received-Date: Thu, 18 Jul 2013 12:04:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 18, 2013 at 6:43 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 17 July 2013 23:34:31 Saul Wold wrote:
..
>> Roy.Li (1):
>>   dpkg: backport a patch to support mipsn32el and mips64el
>
> Not sure if case is a big issue for Upstream-Status values but this one has
> "Upstream-Status: BackPort".

Please fix it otherwise automatic tracking of this will be harder in future.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

