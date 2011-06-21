Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QZ6IM-0003D0-2t
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 21:07:30 +0200
Received: by fxm19 with SMTP id 19so177884fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 12:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=phSJDhE+5cQXs7yiKv7eSVf0pCygsgh8Nr9wiSNNTuQ=;
	b=VisLT5EUATJI03aw0J+ax0g702NjUFyM/q9901rBk6AtUHVHy1LH9NshNxzTNlHl5C
	d1Vitf27SUQEZB0SDMoFCSbZXWBYA4MzWVXih7OkU4nJSpDVUfgLHheUUg8C/BGVfKT7
	TtI5cLd3Coh4elGMlkcxsjKfg4tq/5qk54LU8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=CUrtsi/2P3vKOc0dXMhFbGFgxfnMzeLhgZRIP4wEzSSIplA05stS1P1TSorre6m4NO
	dCII6FvAsMwL2I68cHGBC0minCPIWuTuUCF8iqTrRSJYFbIW5vlZnizXZhKgXflwc9S5
	Jq9PYlKY2PcK5ab/boWksLt0SjoEQ6GaqPYX4=
MIME-Version: 1.0
Received: by 10.223.100.15 with SMTP id w15mr125674fan.11.1308683036609; Tue,
	21 Jun 2011 12:03:56 -0700 (PDT)
Received: by 10.223.114.1 with HTTP; Tue, 21 Jun 2011 12:03:56 -0700 (PDT)
In-Reply-To: <1308682002.3083.12.camel@lenovo.internal.reciva.com>
References: <cover.1308680000.git.anders@chargestorm.se>
	<8e57843c8775752059dc6acacdbd7751b1ed7082.1308680000.git.anders@chargestorm.se>
	<1308682002.3083.12.camel@lenovo.internal.reciva.com>
Date: Tue, 21 Jun 2011 21:03:56 +0200
Message-ID: <BANLkTik3rm8gG9Hik9O0QoVNp7ft2xW-ZQ@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 2/5] module-init-tools-cross: add provides for depmod-3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2011 19:07:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 21, 2011 at 20:46, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2011-06-21 at 20:18 +0200, Anders Darander wrote:
>> -PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6"
>> +PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6 virtual/${TARGET_PREFIX}depmod-3"
>
> Can we not just ditch the versioned virtuals and have all the
> dependencies use plain virtual/depmod now?

Well, when thinking about it, that sounds like a good idea. If we are
ditching 2.4-support, as in my patches, there will only be one module
format, as well as one depmod (or two, if we count the busybox
version).

Lets think about it, and I'll probably address that in v2.

Regards,
Anders


