Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S9hSi-0000Va-L6
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 19:37:44 +0100
Received: by lbbgi4 with SMTP id gi4so3558469lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 11:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=TMl2ozAE3QNiftVDcilk8LCq0Su7rPjezv0rhlHwfBY=;
	b=O+/7YzVW3rKMXm8D9jdcJV1btpLe1g19EYnacW1iyi/6LZ3iLbPWtyNv8LUCN/lm6Q
	AXKWRppSo34q+nqxzbZeLrXBY4B81LkifuEzcSqnW4sx3uJUmF25bmIosDUFttgcW5Kp
	xzcs/hV1ng8HY7xYjVnP9Rt66aC79CDdJR+bXj2rnVkKaHnqXzM3kLUBUX/PyM15PaA8
	Sl+QDceBcFe72E14RYYK/ba8Sl0sxwCBoQDwa7HRaNo0xb91hks9TD7THiv+doEg18f0
	83MCCntjiQqAj4CST6ReNnA1cD3wawo6dnAry9vA6McmLf+a7yWHrAoCC9C4mo21yH8W
	nCWw==
Received: by 10.112.37.73 with SMTP id w9mr4910956lbj.22.1332181733074; Mon,
	19 Mar 2012 11:28:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Mon, 19 Mar 2012 11:28:22 -0700 (PDT)
In-Reply-To: <1332172520.9740.35.camel@ted>
References: <1332172520.9740.35.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Mar 2012 11:28:22 -0700
Message-ID: <CAMKF1srv-HUEGOWG4JiH8F21DUYHf-GBAodo7qsOG-XeBDKSXA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: apt: Fix parallel make race
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
X-List-Received-Date: Mon, 19 Mar 2012 18:37:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 19, 2012 at 8:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I was just going to turn off parallel make but ended up fixing this properly.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Thanks for fixing the underlying problem. I would like to encourage
that we try this all the time I know many times it may not be possible
for us to fix a given package but then we should report it upstream as
a plan b
before we add PARALLE_MAKE = "" to packages


