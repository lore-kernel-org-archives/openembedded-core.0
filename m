Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U8fhw-00085T-A5
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 00:37:46 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so30298eek.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 15:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=ZhlGAgnhtm5EiKmc/FtRk0PtlQd1ZFMIWHI9FupGvoc=;
	b=O8y5q8yIBD7joXMCip2YtG07XEJC7j9nGXNpJbnHNVxpc/b+pdvdfCBicwTf+bV2N2
	/tiR+z7NsncMIU65EbQK8GPD5K+nA//jiRVyUh1ggLcTasOk6OKUyd0LGk//DLa5Myi8
	++dxmt8+e9gXBd7Mfg7xNTl+CvQvYjwImUhlRYixUvob4dLq2Spkc6+6MRfpSEEoA9wZ
	kh11neDFPHUE5ZXjssUZmS/V8UH51mI3xG76rm6QDd5iQE5JbWRcv5FlWA3usaR5Smr/
	GRJNlBOXBfnltOYgFk3UGxZ+2/qZV5U2z/O1q4v4rA4UTZ/8nwQZJbff6/SA9nk9JtcU
	mpkw==
X-Received: by 10.14.220.135 with SMTP id o7mr86433559eep.3.1361488891663;
	Thu, 21 Feb 2013 15:21:31 -0800 (PST)
Received: from [46.75.29.213] (046075029213.atmpu0009.highway.a1.net.
	[46.75.29.213])
	by mx.google.com with ESMTPS id 44sm370544eek.5.2013.02.21.15.21.28
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 Feb 2013 15:21:30 -0800 (PST)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>,
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Feb 2013 00:23:48 +0100
Message-ID: <13cff11cfb1.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <13cff0cc5c1.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
References: <cover.1361468282.git.peter.seebach@windriver.com>
	<da66b07f031b6522b25dc353724b3c656d7511e1.1361468282.git.peter.seebach@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.2 (build:
	2100209)
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] More n32 fixups
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
X-List-Received-Date: Thu, 21 Feb 2013 23:37:49 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 21 February 2013 18:40:22 Peter Seebach <peter.seebach@windriver.com> wrote:
> For perfectly sound reasons, n32 MIPS is a mips64 subset denoted by an
> ABI change, thus, "mips64-vendor-linux-gnun32" rather than
> "mips-vendor-linux-gnu". A previous change had fixed up insane.bbclass
> to recognize these, which mostly worked, but left SITEINFO_BITS set to
> 64.
>
> Since bit-32 is processed first, and there are specific checks for
> linux-gnun32, modify the mips64-linux-gnun32 lines to specify "bit-32",
> so things that check SITEINFO_BITS get the right answer. Also, drop
> the mips{,el}-linux-gnun32 lines, because that's not a valid combination;
> n32 only makes sense for mips64.
>
> Also, the insane.bbclass change spelled "mips64el" as "mipsel64", which
> no one noticed because no one's using little-endian n32, apparently.

Would be great if you could have a look at the FIXME in 
meta/recipes-core/uclibc/uclibc-config.inc for the correct setting of 
the respective mips ABI.

Cheers,


Sent with AquaMail for Android
http://www.aqua-mail.com




