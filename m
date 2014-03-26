Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id EFC426F9D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:07:13 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id f73so2201088yha.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Ptte4hOeL8XztoqPw+gwXbq7FuWLOMOlx+hAWaWnK3M=;
	b=OnDjmP1jb2F4799X2AvjEQBtu4HAnOAFtf9JWploP/uTyjoVE8yQu57Bmv6Hoa3oAf
	DjPBDQ0qSVYi0AvwuI/yrfOBFTWHYyygx9kmaahiLrl9ga1V2FuEESfG/vvsR2/SQbV+
	jHeKJV5YjsL9zHP7uSJ9BxR8v5dqV4itNAaqNoMQXjSSSub9zvL4dTpZcYjkdnOFXQ7x
	8SdTDXZLJ9zXw++Wqn8PzseuBbiFMZY10yYJkerUJIRG2oZpjiJJI+BO9mnfWOM/MdXQ
	9xq6ct9a8829pn4Dhbyi+opam3grbet6OS1EIXcG7meSXihEp2bbxGXmCSXAg8tWaB9C
	iPAA==
MIME-Version: 1.0
X-Received: by 10.236.230.41 with SMTP id i39mr50844986yhq.14.1395846434035;
	Wed, 26 Mar 2014 08:07:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 26 Mar 2014 08:07:13 -0700 (PDT)
In-Reply-To: <20140326145102.GB3709@jama>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<20140326145102.GB3709@jama>
Date: Wed, 26 Mar 2014 12:07:13 -0300
X-Google-Sender-Auth: f4Bc6BXCbXFgDko7WaOu-if8pwo
Message-ID: <CAP9ODKqkyfGzQROW=QZig2zvh-KrcyRFeKn9FtPndPUXWNDTUw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Change all bluez4 references to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 15:07:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Martin,

On Wed, Mar 26, 2014 at 11:51 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Mar 26, 2014 at 09:27:54AM -0500, Lauren Post wrote:
>> This group of patches support the change of hardcoded bluez4 to
>> virtual/bluez so that the upgrade to bluez5 is easier.
>>
>> This group of patches must be applied together.  Bluez4 is still
>> default provider but it will be easier to override and provide bluez5
>> support in future.
>>
>> Note there is one related patch for openobex in meta-oe.
>
> virtual/* still doesn't work correctly in runtime variables, use
> VIRTUAL-RUNTIME_bluez variable.
...

Those patches are for /depends/. Did I miss any runtime dependency here?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

