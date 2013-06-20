Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D5C646A901
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 11:14:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5KBKtwL001121; Thu, 20 Jun 2013 12:20:55 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l5dZqqueVYj0; Thu, 20 Jun 2013 12:20:55 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5KBKmHb001107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 20 Jun 2013 12:20:50 +0100
Message-ID: <1371726864.20823.227.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 12:14:24 +0100
In-Reply-To: <CAJTo0LY5v4n-8NCJmGNWh11dLMi4uYv5TN4u_f7FnuQvxAS55Q@mail.gmail.com>
References: <cover.1371724384.git.jackie.huang@windriver.com>
	<d3c4311cd7b6a3082fee8fe0fffb8dfadc061deb.1371724384.git.jackie.huang@windriver.com>
	<CAJTo0LY5v4n-8NCJmGNWh11dLMi4uYv5TN4u_f7FnuQvxAS55Q@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] dbus: move libdbus-1.so* to base_libdir
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
X-List-Received-Date: Thu, 20 Jun 2013 11:14:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-20 at 11:39 +0100, Burton, Ross wrote:
> On 20 June 2013 11:36,  <jackie.huang@windriver.com> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > move libdbus-1.so* to base_libdir to kill a warning:
> >
> >     WARNING: QA Issue: lib32-consolekit: /lib/security/
> >     pam_ck_connector.so, installed in the base_prefix,
> >     requires a shared library under exec_prefix (/usr):
> >     libdbus-1.so.3 => /usr/lib/libdbus-1.so.3 (0xdead3000)
> >
> > Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> 
> More and more and more libraries move.  Do we *really* need to support
> split-usr?  Have you audited all of the udev helpers yet?

I have to admit I'm not happy with the piece by piece approach this is
taking. We're going to end up with nearly everything moving to
base_libdir at this rate. If we're going to do this, I want someone to
come up with a definitive list of what needs to move before any more of
these merge.

Cheers,

Richard




