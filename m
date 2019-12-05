Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9224271B99;
	Thu,  5 Dec 2019 02:08:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 18:08:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,279,1571727600"; d="scan'208";a="412795269"
Received: from lokx-mobl1.gar.corp.intel.com (HELO shodan.localnet)
	([10.249.69.245])
	by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2019 18:08:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-architecture@lists.openembedded.org
Date: Thu, 05 Dec 2019 15:08:09 +1300
Message-ID: <9058755.I6fkynWszP@shodan>
Organization: Intel Corporation
In-Reply-To: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core python minimum version requirement
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
X-List-Received-Date: Thu, 05 Dec 2019 02:08:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 5 December 2019 6:45:03 AM NZDT Richard Purdie wrote:
> I just enabled hashequiv's server in local mode by default in poky.
> 
> This causes an unintended side effect of requiring python 3.5 as the
> minimum version.
> 
> We had thought that the servers would be 'rare' and a 3.5 version
> requirement for that was fine. It turns out a local server is also
> extremely useful.
> 
> The code needed the python 3.5 async support and trying to write it any
> other way is a nightmare, we need that performance for the server.
> 
> At this point I think we just give in and require python 3.5 as a
> minimum. Any objections?

Seems reasonable to me. Theoretically this should allow us to complete the  
subprocess cleanups as well (time permitting of course).

FYI I came across repology.org which tells you the version of various packages 
in each distro, though it's not ideal:

  https://repology.org/project/python/versions

That seems to be missing a few distros, here's another entry:

  https://repology.org/project/python3-defaults/versions

For Ubuntu you have to go back to 14.04 to have 3.4; any others other than 
CentOS 7 that are as old we don't really support.

There is also pkgs.org that I could have sworn used to support comparing 
package versions across distros but it doesn't seem to want to do it anymore. 
Distrowatch also tracks this per distro but only allows side-by-side 
comparisons across versions within a distro or only between two distros. I 
think in this instance we have the information we need though.

Cheers,
Paul


-- 

Paul Eggleton
Intel System Software Products



