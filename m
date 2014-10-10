Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 603376FBB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 00:41:14 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id q9so1194230ykb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Oct 2014 17:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=RYq12XOqaHIiMT82m63CsxQ2Ys6voQ9DCL/riiqOFbk=;
	b=QKd0QvIRrUMUm/iDClKTfeuNbto7zboE2UecdBeadcEUQgylQIGf9cRU8pALsLAb/z
	p8RHPX0sBFT9Llw2Anpw/bb9iewWIZ1eah/czH7WsTPufwpaSGZEoLlI4vqk6/cb2HSB
	J0talDzw0e3sR3l3spVktDXchi80cnIfAlb29u9Ak1jb28S9WzVitvwabJsCDtGL8pw/
	nZpukpBUGaKAhxeaC48++Th44YrJ1zBMpGPPmkIpwDpSKOab6EMo0IbKstD5tZMZSIxq
	4Ila4MeBoaiFFXpV6fYNe/bCHiCNUv5Vu9P5hoGf+2JU23ZXoUV3nEgg8HgRprBH38Nc
	1EzA==
MIME-Version: 1.0
X-Received: by 10.236.160.100 with SMTP id t64mr2031798yhk.7.1412901675465;
	Thu, 09 Oct 2014 17:41:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Thu, 9 Oct 2014 17:41:15 -0700 (PDT)
In-Reply-To: <543719D4.9080308@windriver.com>
References: <1412891594-9608-1-git-send-email-otavio@ossystems.com.br>
	<543719D4.9080308@windriver.com>
Date: Thu, 9 Oct 2014 21:41:15 -0300
X-Google-Sender-Auth: lUoQiC9DHtQ7KYV1RAQSP63SxtQ
Message-ID: <CAP9ODKqHaOc6W0+WpyrdhQjXWaD++MdfMiUFWh0aKZVC0uJq8Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] toolchain-scripts.bbclass: Allow sourcing of subscript for environment
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
X-List-Received-Date: Fri, 10 Oct 2014 00:41:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 9, 2014 at 8:27 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 10/9/14, 4:53 PM, Otavio Salvador wrote:
>>
>> Sometimes we require extra environment settings to be available on the
>> environment for proper SDK work. This were done, in past, using
>> '_append' tasks however with the split of the environment in a
>> canadian package this has been broken.
>>
>> The easier and more flexible solution is to use environment subscripts
>> which are sources by the main script. These are now looked at:
>>
>>   $OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh
>>
>> and sourced.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
>
> I really like this approach.  However, is there any way for the subscripts
> to be arch specific?

I think we can plan on that but this would be 1.8 material IMO. This
is enough for what we need today and can easily be improved in future
work. What do you think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

