Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 640E676FC4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 23:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u15NVaru031241; Fri, 5 Feb 2016 23:31:36 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PU9J3kh7s7OF; Fri,  5 Feb 2016 23:31:36 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u15NVXmA031238
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 5 Feb 2016 23:31:35 GMT
Message-ID: <1454715093.27087.281.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Nicolas Dechesne
	<nicolas.dechesne@linaro.org>
Date: Fri, 05 Feb 2016 23:31:33 +0000
In-Reply-To: <CAJTo0La-U-9vT_PCnbrBvXbS__v9MdwV6sUC93vr7k7s=JewPA@mail.gmail.com>
References: <1454704804-11605-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAMKF1spmN7Y3bQVFhghUG80sYyuwbGAj6MMMm9oPKehhm-s3Sw@mail.gmail.com>
	<CAJTo0LZT0UFrabh1U5LOLF9qcuL7QGoVVXGvo0NWYM4Y5H83tg@mail.gmail.com>
	<CAP71WjxGbyKN5d6+TM35TnhHn9JLksnxuWGgviw+KxCv+3Ka9Q@mail.gmail.com>
	<CAJTo0La-U-9vT_PCnbrBvXbS__v9MdwV6sUC93vr7k7s=JewPA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Fri, 05 Feb 2016 23:31:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-05 at 21:04 +0000, Burton, Ross wrote:
> Hi,
> 
> On 5 February 2016 at 20:55, Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
> > > Agreed - some may not want openssl at all and being able to
> > switch it for
> > > another alternative would be useful.
> > 
> > sure. but, then I have some questions..
> > 
> > 1. which one we default to? openssl?
> > 
> > 2. which one we support, from configure.ac:
> > 
> >         [choose SHA1 implementation])])
> > case "x$with_sha1" in
> > x | xlibc | xlibmd | xlibnettle | xlibgcrypt | xlibcrypto |
> > xlibsha1 |
> > xCommonCrypto | xCryptoAPI)
> >   ;;
> nettle / gcrypt / crypto are all in oe-core.  I presume that's BSD's
> "throw it all in" libc.
> 
> nettle seems nice and low down the stack and modern.
>   
> >  3. is there a good way to handle 'multiple choice' with
> > PACKAGECONFIG?
> > How can we prevent more than 1 PACKAGECONFIG to be set (nicely)?
> With a comment saying "pick one of these", and nothing in the
> disabled case.

You can always put in a small anonymous python fragment which enforces
"only X or Y or Z".

Not exactly neat, but...

Cheers,

Richard



