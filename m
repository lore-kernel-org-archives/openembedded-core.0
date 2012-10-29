Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSmZU-0000Kx-Aj for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 11:27:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TAEG0L002813;
	Mon, 29 Oct 2012 10:14:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22738-04; Mon, 29 Oct 2012 10:14:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TAE8Ee002805
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2012 10:14:09 GMT
Message-ID: <1351505648.2828.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Mon, 29 Oct 2012 10:14:08 +0000
In-Reply-To: <CAOHjBZswZPW6f_4ugCJcJ9w4=y9bt6ADvVd0gjtEnFuiXB-1kw@mail.gmail.com>
References: <CAOHjBZsdfnhLumBym4ZO+wxxzAyCq0yONSbRDc4XZS3TH_mJ=Q@mail.gmail.com>
	<CAMKF1spobVWMY=F9X45930GmYJZ9fWCCak=zdxKNKab7ZD4x2w@mail.gmail.com>
	<CAOHjBZswZPW6f_4ugCJcJ9w4=y9bt6ADvVd0gjtEnFuiXB-1kw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: uclibc sdk issue
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
X-List-Received-Date: Mon, 29 Oct 2012 10:27:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-29 at 09:48 +0100, Giuseppe Condorelli wrote:
> Hi Khem,
>  
> what I want to build is the meta-toolchain (uclibc) and looking at the
> build I can see system tries to build also eglibc packages.
> Maybe I'm wrong in something.
> Welcome advice.

So that the toolchain can be used on many different systems the
toolchain binaries themselves link against their own libc which ships as
part of meta-toolchain. We use eglibc for this and uclibc is not
supported. 

The target libc that ships with the toolchain can be uclibc though, that
is perfectly fine. Build it and have a look at the result as I think it
will be fine.

Cheers,

Richard




