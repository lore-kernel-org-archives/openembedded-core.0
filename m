Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T1iSW-0005Np-G1
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 20:36:48 +0200
Received: by eaad12 with SMTP id d12so462585eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yfohrTWTqgrz86Ru7vYdXwhNpR/IS2nSjA3FpT9Tens=;
	b=ZmaBRVv84qPmWxRU2toerCdTcSnUN36sbTxV+6rNXInCxcltFbvj/Kvyjcz7+fGyXo
	aVVe1HY/vwMNM5XMzw5upPnBYidTHAkJB1Rplku5wFakzJXkSVJTP733mQ02x68QYv4s
	G+lHYNxfKS+DWjTjakksy5iYceK3wpPPnEfyYU8tHa3c7fbluiC8BLhG0Ie1QqzvK84L
	Nbu2J2WOvrd2VdPYHDsnHdowhrmanSIf11tEEKA06sBzzD9vCqiKsPEDnZXhDNZHFJ35
	bohDS5F4aYr66EulKTX1ZXFH6dKigBlAzgefPC0XP3ooa2Kvf1Y9dm4v0+u0DeyW4s5V
	B3AA==
Received: by 10.14.204.200 with SMTP id h48mr21468313eeo.7.1345055092113; Wed,
	15 Aug 2012 11:24:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.225.6 with HTTP; Wed, 15 Aug 2012 11:24:21 -0700 (PDT)
In-Reply-To: <1345036362.538.3.camel@ted>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
	<5824e7f06b2263fc89efa12f2aeee13f6cf76c54.1344946189.git.sgw@linux.intel.com>
	<1345036362.538.3.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Aug 2012 11:24:21 -0700
Message-ID: <CAMKF1so63kpz5x3b1_x4pKnZexbgLrKiySJ=y6gTKMQjVzi3BA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED REQUEST 55/64] chrpath.bbclass: Account for case when ORIGIN is in RPATH
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
X-List-Received-Date: Wed, 15 Aug 2012 18:36:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 15, 2012 at 6:12 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Shouldn't this read:
>
>                 if rpath.find("$ORIGIN") != -1:
>                       new_rpaths.append("%s" % (rpath.strip()))
>                       continue
>
> as the code above would add *all* the old rpaths to the binary as well
> as any relocations?

sorry I sent a wrong patch to ML and was testing a different one. I
will send out the correct one.


