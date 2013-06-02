Return-Path: <gmc@sonologic.nl>
Received: from mx1.sonologic.nl (mx1.sonologic.nl [82.94.245.21])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC5660912
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Jun 2013 14:30:44 +0000 (UTC)
Received: from monk.sonologic.nl ([82.94.245.59]) (authenticated bits=0)
	by mx1.sonologic.nl (8.14.5/8.14.5) with ESMTP id r52EUdCx090361;
	Sun, 2 Jun 2013 14:30:40 GMT (envelope-from gmc@sonologic.nl)
Date: Sun, 2 Jun 2013 16:30:39 +0200
From: Koen Martens <gmc@sonologic.nl>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20130602143039.GC26506@monk.dh.sono>
References: <20130516152515.GB25740@monk.dh.sono>
	<5194FE20.6000505@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5194FE20.6000505@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Helo-Milter-Authen: gmc@mx1.sonologic.nl, gmc@sonologic.nl, mx1
Received-SPF: pass (mx1.sonologic.nl: 82.94.245.59 is authenticated by a
	trusted mechanism)
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.2.6
	(mx1.sonologic.nl [82.94.245.21]);
	Sun, 02 Jun 2013 14:30:40 +0000 (UTC)
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: adding kernel headers to sysroot
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
X-List-Received-Date: Sun, 02 Jun 2013 14:30:44 -0000
Content-Type: text/plain; charset=us-ascii; x-action=pgp-signed

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Bruce,

On Thu, May 16, 2013 at 11:41:20AM -0400, Bruce Ashfield wrote:
> On 13-05-16 11:25 AM, Koen Martens wrote:
> >I have added a kernel header file to the linux kernel for my project, that
> >exposes a public API for new kernel functionality I have implemented. This
> >header file is needed to compile certain user-space programs. I have been
> >trying to get this include file in the sysroot used to compile the user-
> >space programs (as well as in the SDK i build for the project).
> 
>  - point your application at the STAGING_KERNEL_DIR and include the
>    header from there. You are already coupled to the kernel, since
>    you need this header, so it isn't as evil as it seems. This will
>    also get you SDK support.
> 
>  - Install the header file to another location in the sysroot and
>    include it from there. You can do this via an append to the
>    kernel install. Assuming you don't collide with existing headers,
>    you could use this to install into a standard location as well,
>    but things start to get a bit more risk. You can also arrange

I went with the latter option, but i'm still curious as to what part of
oe magic installs the standard kernel headers?

> How often does the header file change ? If it really is static there's
> another option, and that is to capture the header in the applications
> themselves and simply use it that way. iptables, and other user application
> have done this in the past, and will do it again in the future.

Yep, i'm aware of the way ipfilter does it, from personal experience with the
insanity that causes :)

Thanks!

Koen

- -- 
https://ohm2013.org/            - outdoor hacker conference, August 2013, NL
http://www.sonologic.nl/        - hosting and DBA
http://koenmartens.nl/          - curriculum vitae
https://www.revspace.nl/        - hackerspace in Den Haag, NL
http://signal.hackerspaces.org/ - hackerspace radio
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGrVw8ACgkQktDgRrkFPpa0rQCfWUXPWJEUKKn5Ngc8MOdSzlt+
clcAoIoGA7jIiVBvZXQz2MpiXHD6/6Tj
=zYrm
-----END PGP SIGNATURE-----

