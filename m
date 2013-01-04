Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TrFst-0006W0-Sm
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 23:37:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Jan 2013 14:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,412,1355126400"; d="scan'208";a="187836087"
Received: from unknown (HELO [10.255.14.122]) ([10.255.14.122])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Jan 2013 14:21:52 -0800
Message-ID: <50E755FE.90604@linux.intel.com>
Date: Fri, 04 Jan 2013 14:21:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Prepare recipes for automake-1.13 (batch 1)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 22:37:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2013 12:36 PM, Marko Lindqvist wrote:
> In practice there is three categories of changes in automake-1.13
> that cause packages to break. From that follows that virtually all
> problems fall to three categories, and all packages suffering from
> problem of the same category get virtually identical fix.
>
So these need the automake-1.13 update first?  I have the 1.12 version 
but have not seen the 1.13 version yet.

Just want to confirm that.

Thanks
     Sau!

> * Long deprecated macros completely removed from automake-1.13,
>    which errors out upon seeing them. For these I add patch,
>    always called obsolete_automake_macros.patch, that replaces
>    obsolete macro with proper one. Most of the patches are just
>    AM_CONFIG_HEADER -> AC_CONFIG_HEADERS change.
>
> * Trying to run help2man via "missing" when it doesn't exist.
>    Old automake versions allowed "missing" to be used that way,
>    1.13 aborts. I'm just removing the attempt to create manpages
>    that way. Note that it never actually worked anyway -
>    old automake just didn't abort when it failed.
>
> * TESTS list cannot have $(srcdir) or $(top_srcdir) as part
>    of the path. When it does, it's usually bug in the package,
>    but unfortunately automake prevents it also when it's not.
>    Solution applied here is to simply remove TESTS.
>
>
> [PATCH 01/15] pkg-config: replace obsolete automake macros with
> [PATCH 02/15] libtool: remove help2man dependency
> [PATCH 03/15] bison: remove help2man dependency
> [PATCH 04/15] file: replace obsolete automake macros with working
> [PATCH 05/15] popt: disable tests
> [PATCH 06/15] glib-2.0: replace obsolete automake macros with
> [PATCH 07/15] libx11: disable tests
> [PATCH 08/15] libpng: replace obsolete automake macros with working
> [PATCH 09/15] libusb: replace obsolete automake macros with working
> [PATCH 10/15] pixman: replace obsolete automake macros with working
> [PATCH 11/15] libid3tag: replace obsolete automake macros with
> [PATCH 12/15] libgcrypt: replace obsolete automake macros with
> [PATCH 13/15] gnutls: replace obsolete automake macros with working
> [PATCH 14/15] libtasn1: remove help2man dependency
> [PATCH 15/15] flac: replace obsolete automake macros with working
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


