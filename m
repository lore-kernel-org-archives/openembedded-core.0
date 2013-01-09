Received: from mail-ia0-f182.google.com ([209.85.210.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TssHE-0002xQ-0q
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 10:48:52 +0100
Received: by mail-ia0-f182.google.com with SMTP id x2so1267973iad.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 01:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=hXv7mH9Hh5RCpYIvefe5ARz9ieLKOlDTgj6eROv/Yxk=;
	b=D5h1Xcy0g3XPGZpI0FljDIU3nqGdYEnbAI0/0Pt7WbdHolD9+aCZCiKiir+Zy7alxy
	zOALeIFASDN0pPjK7222r/LrRobcW00qgrVlv2h8wHsFDGX4eWzUoStbg/Niu5VhLc00
	2q+32hRrE0RdIlrXgEmA1RPhV5k+x8SGQ2n92aBR/4CNh+OWQV/k0QBMN9r7dFnc4/is
	7YqRmbKyd2+58MWbqcCkB/7ajpyazjAG/5eF67mY4zs2eH5TSJZPY6J5xywfUuhTcmLi
	JEWNaKPI8TvxtVyVhBdGmiHPXmlO9XcmeUuIt5maf99eMXfk3U5Xc+Se3Sc75Vhxe9oR
	lI/g==
MIME-Version: 1.0
X-Received: by 10.50.40.225 with SMTP id a1mr879838igl.7.1357724019759; Wed,
	09 Jan 2013 01:33:39 -0800 (PST)
Received: by 10.42.167.196 with HTTP; Wed, 9 Jan 2013 01:33:39 -0800 (PST)
In-Reply-To: <20130109091303.GC3722@jama.palm1.palmone.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
	<50E8FDBB.5080500@linux.intel.com>
	<CAF6bG8fBgAP_No6RkckjvEQ2XquwKagbyn-Rh01CY7Hi+8MfFw@mail.gmail.com>
	<CAF6bG8cuLp7nGzKUZscUrRoa1Z5_mrSduvWQ4r4YbvtZx2rFdg@mail.gmail.com>
	<20130109091303.GC3722@jama.palm1.palmone.com>
Date: Wed, 9 Jan 2013 11:33:39 +0200
Message-ID: <CAF6bG8dULrN_qQZWjvM2mJgQbyn0UvqzhcjV7e6Rzfj3h9GX4g@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Wed, 09 Jan 2013 09:48:52 -0000
Content-Type: text/plain; charset=UTF-8

On 9 January 2013 11:13, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jan 09, 2013 at 09:46:57AM +0200, Marko Lindqvist wrote:
>>  What I'm envisioning is that maybe bitbake should provide us with new
>> variable PM or PMV (major version) that's basically PV with last dot
>> and everything after it removed. That would allow us to easily make
>> many such SRC_URIs dynamic, e.g., ".../gtk+/${PM}/gtk+-${PV}.tar.xz".
>> This would be more worthsome if it's something
>> packages.yoctoproject.org too could benefit from.
>
> That looks like SHRT_VER used in some recipes.

 Exactly, except that it would be provided by bitbake, and not
constructed by each recipe itself - less recipe writing work + you
could count on it to always mean same thing.


 - ML


