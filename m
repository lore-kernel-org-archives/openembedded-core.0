Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpMlc-0003tQ-BQ for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:56:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75FqXc8013578
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 16:52:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13123-05 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 16:52:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75FqSkM013572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 16:52:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E3B28D7.8030208@gmail.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<4E3B28D7.8030208@gmail.com>
Date: Fri, 05 Aug 2011 16:52:05 +0100
Message-ID: <1312559525.14274.118.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
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
X-List-Received-Date: Fri, 05 Aug 2011 15:56:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 16:18 -0700, Khem Raj wrote:
> On 08/04/2011 08:01 AM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >   meta/conf/distro/include/tclibc-glibc.inc   |   32 +++++++++++++++++++++++++++
> >   meta/conf/distro/include/tcmode-default.inc |    5 ++++
> >   2 files changed, 37 insertions(+), 0 deletions(-)
> >   create mode 100644 meta/conf/distro/include/tclibc-glibc.inc
> >
> > diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
> > new file mode 100644
> > index 0000000..823195c
> > --- /dev/null
> > +++ b/meta/conf/distro/include/tclibc-glibc.inc
> > @@ -0,0 +1,32 @@
> > +#
> > +# glibc specific configuration
> > +#
> > +
> > +LIBCEXTENSION = "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or '') != '']}"
> 
> why is this specific to glibc and not eglibc ?

eglibc has the same code.

> since glibc is deleted from metadata this file should go away too
> if its for external toolchains then they could use tclibc-eglibc.inc
> or tclibc-uclibc.inc as needed.
> 
> I am in favour of generally using linux-gnu extention for eglibc/glibc
> based systems.

I think it should be up to the user. We've ensured the recent changes
don't change the defaults, you can certainly use linux-gnu if you want
(but it will cause issues as not everything accepts that format as
things stand iirc).

Cheers,

Richard





