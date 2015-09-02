Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2421177026
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 15:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t82FMOue031535; Wed, 2 Sep 2015 16:22:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7diDnz7eWjim; Wed,  2 Sep 2015 16:22:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t82FM9xL031527
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 2 Sep 2015 16:22:20 +0100
Message-ID: <1441207329.24871.70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ed.bartosh@linux.intel.com
Date: Wed, 02 Sep 2015 16:22:09 +0100
In-Reply-To: <20150902135445.GA5916@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
	<8c9a985168c6e8d52ac777bc7322c6fda92983c2.1440950164.git.ed.bartosh@linux.intel.com>
	<CAHiDW_EA-=tfahxA7_KXhfmWmOMBjES4_WCTOns3O25odMJTZg@mail.gmail.com>
	<20150902135445.GA5916@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: "markus.Lehtonen" <markus.Lehtonen@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] devtool: make 2 functions public
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
X-List-Received-Date: Wed, 02 Sep 2015 15:22:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-02 at 16:54 +0300, Ed Bartosh wrote:
> On Wed, Sep 02, 2015 at 02:16:58PM +0300, Jussi Kukkonen wrote:
> > On 30 August 2015 at 19:08, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > >
> > > Moved standard.py:_parse_recipe -> __init__.py:parse_recipe and
> > >       standard.py:_get_recipe_file ->  __init__.py:get_recipe_file
> > > to be able to call them from other modules.
> > 
> > Hi Ed,
> > 
> > Can you take a look if the failures in
> > https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/173/steps/Running%20oe-selftest/logs/stdio
> > are related to this patch (there's lots of "NameError: global name
> > '_parse_recipe' is not defined")
> > 
> 
> The autobuilder log looks very strange to me. I don't see any mentioning
> of _parse_recipe in standard.py on master. Moreover, there is no
> _prep_extract_operation function mentioned in traceback.
> 
> I've just run failed test and it passed without any issues.
> 
> 
> It looks like autobuilder messed the code from some old branch and tests
> from master.

Its building master-next:

http://git.yoctoproject.org/cgit.cgi/poky/log/?h=master-next

and its therefore probably the devtool patches from Markus that are at
fault and need rebasing after your changes?

Cheers,

Richard




