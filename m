Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 36E4C605F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 12:36:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5LCg2Ew025131; Fri, 21 Jun 2013 13:42:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HDQLCe58v1CE; Fri, 21 Jun 2013 13:42:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5LCgmJh025195
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 21 Jun 2013 13:42:50 +0100
Message-ID: <1371818179.20823.303.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jhuang0 <jackie.huang@windriver.com>
Date: Fri, 21 Jun 2013 13:36:19 +0100
In-Reply-To: <51C3B43C.8040707@windriver.com>
References: <cover.1371724384.git.jackie.huang@windriver.com>
	<d3c4311cd7b6a3082fee8fe0fffb8dfadc061deb.1371724384.git.jackie.huang@windriver.com>
	<CAJTo0LY5v4n-8NCJmGNWh11dLMi4uYv5TN4u_f7FnuQvxAS55Q@mail.gmail.com>
	<1371726864.20823.227.camel@ted> <51C2EBA0.8070804@linux.intel.com>
	<51C3B43C.8040707@windriver.com>
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
X-List-Received-Date: Fri, 21 Jun 2013 12:36:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-21 at 10:02 +0800, jhuang0 wrote:
> 
> On 6/20/2013 7:46 PM, Saul Wold wrote:
> > On 06/20/2013 04:14 AM, Richard Purdie wrote:
> >> On Thu, 2013-06-20 at 11:39 +0100, Burton, Ross wrote:
> >>> On 20 June 2013 11:36,  <jackie.huang@windriver.com> wrote:
> >>>> From: Jackie Huang <jackie.huang@windriver.com>
> >>>>
> >>>> move libdbus-1.so* to base_libdir to kill a warning:
> >>>>
> >>>>      WARNING: QA Issue: lib32-consolekit: /lib/security/
> >>>>      pam_ck_connector.so, installed in the base_prefix,
> >>>>      requires a shared library under exec_prefix (/usr):
> >>>>      libdbus-1.so.3 => /usr/lib/libdbus-1.so.3 (0xdead3000)
> >>>>
> >>>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> >>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> >>>
> >>> More and more and more libraries move.  Do we *really* need to support
> >>> split-usr?  Have you audited all of the udev helpers yet?
> >>
> >> I have to admit I'm not happy with the piece by piece approach this is
> >> taking. We're going to end up with nearly everything moving to
> >> base_libdir at this rate. If we're going to do this, I want someone to
> >> come up with a definitive list of what needs to move before any more of
> >> these merge.
> >>
> > And this should be checked with various DISTRO_FEATURES such as pam
> > (enabled/disabled) and systemd (enabled/disabled), not just one
> > variation, please be sure to list what your testing matrix is.
> 
> I tested with DISTRO_FEATURES 'pam' (enabled/disabled) and 'systemd' 
> (enabled/disabled) and WARN_QA = "unsafe-references-in-binaries 
> unsafe-references-in-scripts", and I have sent a v3. If you are agree to 
> merge, please merge the v3 one, thanks!

As I said, I'm not taking any more of these moves until there is a well
thought out analysis/plan. Sorry.

Cheers,

Richard


