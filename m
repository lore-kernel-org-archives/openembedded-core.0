Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 755CE605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 09:42:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Jun 2016 02:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,536,1459839600"; d="scan'208";a="983953147"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 27 Jun 2016 02:42:31 -0700
To: openembedded-core@lists.openembedded.org
References: <1466765962-23197-1-git-send-email-git@andred.net>
	<CAJTo0La+NmXWrJW4hp9e2JtqB2DTeREfOYhhLi4MJWqkZygc3g@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <40d4fd66-6794-03bd-ee48-20f376483f6a@linux.intel.com>
Date: Mon, 27 Jun 2016 12:42:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La+NmXWrJW4hp9e2JtqB2DTeREfOYhhLi4MJWqkZygc3g@mail.gmail.com>
Subject: Re: [PATCH] security_flags.inc: libidn fails to build w/ -Wformat-security
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
X-List-Received-Date: Mon, 27 Jun 2016 09:42:32 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/27/2016 12:10 PM, Burton, Ross wrote:
>     ../../libidn-1.32/src/idn.c: In function 'main':
>     ../../libidn-1.32/src/idn.c:172:7: error: format not a string
>     literal and no format arguments [-Werror=format-security]
>            error (0, 0, _("only one of -s, -e, -d, -a, -u or -n can be
>     specified"));
>
>
> As libidn will be dealing with data from the network it seems like the
> sort of package that should be built with format-security enabled.
> Wouldn't it be better to fix up the calls to error() instead?

Also, in general the point of adding this check was that we try to fix 
the problems in the code. Adding packages to the list of exceptions is 
missing the point :)

Please write a patch - I'd say we should accept new exceptions only if 
fixing the code is shown to be too difficult.


Alex


