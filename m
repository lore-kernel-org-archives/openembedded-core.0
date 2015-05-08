Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2F98C73C7E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 12:41:28 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so79594786pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 05:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=HCf4bC+KgPXTNEX3f1huy2O2xMloAoGI+8iEtp4OFT0=;
	b=PzBrzNrwsDeoojQn9JdQCExISe+J3GYp55fgwmFeHPw7qHbJzBsdCdMLdE2+whtsC9
	hhAKEjLE4txodZgb34MSeO50oYBmBJgIjQzEmxi/lExW1yyuN8JS9JX/KlfU1xEXyqTX
	BBzoub3CUK+u5DNqelQCqys9kg7F4QRUIl4z+yEVLcQwj6S0iHg4YGrgBfRQxrEUuTty
	0zAvCQqGllXheYs55sOTZSMAnQ+FUbLsc0kegWODkm0Jh7CmWYpCi6RwR2Wnlk4TWyCb
	P+1R6HI50JjMbL/ui/vTGxdPCK9Za6VC6PqLHxYK5Iq3lRg8NIm/MnCOLBWWBkrjOr8u
	qd5w==
MIME-Version: 1.0
X-Received: by 10.68.108.65 with SMTP id hi1mr6104353pbb.129.1431088848242;
	Fri, 08 May 2015 05:40:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Fri, 8 May 2015 05:40:48 -0700 (PDT)
In-Reply-To: <2224585.tBn3dhReiF@peggleto-mobl.ger.corp.intel.com>
References: <554C98F7.5090005@dresearch-fe.de>
	<2224585.tBn3dhReiF@peggleto-mobl.ger.corp.intel.com>
Date: Fri, 8 May 2015 09:40:48 -0300
X-Google-Sender-Auth: y2_lG7Yqcfoki4Yc4HkTdZ9SXJA
Message-ID: <CAP9ODKonoGJRGBZdLdZgt8EG+sn79fH_zCy9RgwJpkVEP3Lf2Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: WARNING: The license listed CLOSED was not in the licenses collected for foo
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
X-List-Received-Date: Fri, 08 May 2015 12:41:30 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 8, 2015 at 9:39 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 08 May 2015 13:07:35 Steffen Sledz wrote:
>> Since switching from dizzy to fido we've some warnings related to some of
>> our own closed source packages.
>>
>> WARNING: log_check: There is a warn message in the logfile
>> WARNING: log_check: Matched keyword: [WARNING:]
>> WARNING: log_check: WARNING: The license listed CLOSED was not in the
>> licenses collected for foo
>>
>> The recipes contain lines like this one:
>>
>> LICENSE = "CLOSED"
>>
>> How should we fix the recipe to avoid the warning?
>
> I think the part of the code that produces this warning probably should be
> ignoring the CLOSED value. Can I ask you to please file a bug? Feel free to add
> me on CC.

You can use proprietary.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

