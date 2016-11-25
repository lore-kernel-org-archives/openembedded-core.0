Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE32601F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:33:39 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 25 Nov 2016 08:33:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,547,1473145200"; d="scan'208";a="195626295"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 25 Nov 2016 08:33:41 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B8F796A4006;
	Fri, 25 Nov 2016 08:32:57 -0800 (PST)
Date: Fri, 25 Nov 2016 18:33:32 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161125163332.GB4830@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<CAD4b0_KP1V77ny5yP+WVJMSVMojVKFQPa-Gq0-4-cne2e19dDQ@mail.gmail.com>
	<2d3560fa-adce-8c5d-10c1-289d65b28da1@mender.io>
MIME-Version: 1.0
In-Reply-To: <2d3560fa-adce-8c5d-10c1-289d65b28da1@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Fri, 25 Nov 2016 16:33:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 25, 2016 at 01:35:53PM +0100, Kristian Amlie wrote:
> On 25/11/16 13:28, Maciej Borzęcki wrote:
> > On Fri, Nov 25, 2016 at 11:15 AM, Kristian Amlie
> >> +                # Disallow '..', because doing so could be quite disastrous
> >> +                # (we will delete the directory).
> >> +                remaining = path
> >> +                while True:
> >> +                    (head, tail) = os.path.split(remaining)
> >> +                    if tail == '..':
> >> +                        msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
> >> +                    elif head == "":
> >> +                        break
> >> +                    remaining = head
> > 
> > Why not do this instead?
> > 
> >     if '..' in path:
> >         msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
> > 
would "'/..' in path" or something similar work?

--
Regards,
Ed

