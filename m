Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C8A21621E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 23:03:52 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 May 2013 16:03:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,730,1363158000"; d="scan'208";a="245897935"
Received: from unknown (HELO [10.255.12.172]) ([10.255.12.172])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2013 16:03:30 -0700
Message-ID: <519EA042.1@linux.intel.com>
Date: Thu, 23 May 2013 16:03:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <cover.1369298825.git.cazfi74@gmail.com>
In-Reply-To: <cover.1369298825.git.cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Update automake to version 1.13.2
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
X-List-Received-Date: Thu, 23 May 2013 23:03:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2013 01:52 AM, Marko Lindqvist wrote:
> New upstream release, 1.13.2, has reverted some of the 1.13.0 backward
> compatibility dropping changes, for the duration of 1.13 series. Unlike
> earlier 1.13 releases, it can be used without breaking huge number of
> packages.
>

I have not dug into it too deeply, but I think this update is causing a 
problem with gtk-engines test Makefile, there is a section that has 
$(patsubst incomplete.

 From the Makefile.in that is generated from Makefile.am

$(patsubst.log: $(patsubst
         @p='$(patsubst'; \
         b='$(patsubst'; \
         $(am__check_pre) $(LOG_DRIVER) --test-name "$$f" \
         --log-file $$b.log --trs-file $$b.trs \
         $(am__common_driver_flags) $(AM_LOG_DRIVER_FLAGS) 
$(LOG_DRIVER_FLAGS) -- $(LOG_COMPILE) \

That does not look right!

Sau!


> The following changes since commit aeb704fee8b4ffeaeddcdb36ae4e1d62c264ce42:
>
>    scripts/bitbake: Handle the case where git isn't installed cleanly (2013-05-21 10:06:11 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib cazfi/am13
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13
>
> Marko Lindqvist (1):
>    automake: update to upstream version 1.13.2
>
>   .../prefer-cpio-over-pax-for-ustar-archives.patch  |   37 ++++++++++----------
>   .../{automake_1.12.6.bb => automake_1.13.2.bb}     |    4 +--
>   2 files changed, 21 insertions(+), 20 deletions(-)
>   rename meta/recipes-devtools/automake/{automake_1.12.6.bb => automake_1.13.2.bb} (90%)
>



