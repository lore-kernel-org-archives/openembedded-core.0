Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 20F926BC92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:29:43 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id l6so1942784oag.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=iLtyEatamDMjUObEI2tU4xpBJqi51wDefaIEDUGU2I0=;
	b=Cn9xSAntta87rroeS4R48fZ1j4fUsoii6/oNqDEkvaDO25c9RnIKExqdWXCCkcP8fM
	kWhY7TOmb+Tt3HiZEVSt9p6LVPzLmtDoKqKjq8ow05aS+pv8Yst6KOqrKqb6B9d5osd7
	YG1UT8Rbxrlm/ADpzSr5qfH44Te8kKNZkG0bk4o2s/D/e6E3ocS8Jt09HKTCkXJjNFam
	tkO86hTCIV8dACL+muGHpEFdfrjoZL2GCO6OJb03ntFxBnf5sRm2eKlen6pANKDvcvJW
	O+vfdtL1AjCi6E5wqjLF5VOomzRpX9CuKwudCmxZzPggKlDjIAG2QlBrswXSgzez79GP
	rQhQ==
MIME-Version: 1.0
X-Received: by 10.60.56.70 with SMTP id y6mr2333165oep.32.1390476584149; Thu,
	23 Jan 2014 03:29:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 23 Jan 2014 03:29:44 -0800 (PST)
In-Reply-To: <52E0C33B.3090605@windriver.com>
References: <1390459548-21038-1-git-send-email-ming.liu@windriver.com>
	<1390461261.24755.12.camel@e130.pbcl.net>
	<52E0C33B.3090605@windriver.com>
Date: Thu, 23 Jan 2014 09:29:44 -0200
X-Google-Sender-Auth: 4T6Aw5y7ClyE4F8YF2QxhRdm6xw
Message-ID: <CAP9ODKp4T5ouY1y8GqnRVFy1SdA9BajmDxOjMkGR0gFzteGuSQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ming Liu <ming.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] quilt: add ac_cv_path_BASH to CACHED_CONFIGUREVARS also for native
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
X-List-Received-Date: Thu, 23 Jan 2014 11:29:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 23, 2014 at 5:22 AM, Ming Liu <ming.liu@windriver.com> wrote:
> On 01/23/2014 03:14 PM, Phil Blundell wrote:
>>
>> On Thu, 2014-01-23 at 14:45 +0800, Ming Liu wrote:
>>>
>>>   +CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
>>>   -CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
>>
>> Why did you change this from ${base_bindir} to a hardcoded path?
>
> Because base_bindir would be expanded as '${base_prefix}/bin' for native
> recipe, then it has to set DEPENDS on bash-native which I think is not what
> it supposed to be, the change would let it locate bash from host
> environment.

I don't think so.

% git grep base_prefix meta/conf/bitbake.conf
meta/conf/bitbake.conf:export base_prefix = ""
meta/conf/bitbake.conf:export base_bindir = "${base_prefix}/bin"
...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

