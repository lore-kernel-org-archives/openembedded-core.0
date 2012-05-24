Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXciV-0007xu-SW
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:24:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2012 11:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103919333"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2012 11:14:34 -0700
Message-ID: <4FBE7A8A.9030701@linux.intel.com>
Date: Thu, 24 May 2012 11:14:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337816265.git.josh@linux.intel.com>
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
Subject: Re: [PATCH 0/7] Sanity class clean ups
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
X-List-Received-Date: Thu, 24 May 2012 18:24:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2012 05:02 PM, Joshua Lock wrote:
> My recent change to the sanity class to warn users when they don't have R/W
> permission to their SSTATE_CACHE directory has caused at least a couple of users
> trouble, including the Yocto project autobuilder.
>
> I have been unable to reproduce the issue but after discussionwith Elizabeth and
> Chris on #yocto I came up with the following series.
>
> The series includes a revert my original change as it seems the simple logic has
> severla edge cases. I replace it later in the series with a simple piggy-back
> on the existing check_create_long_filename() call, where I make the suggestion
> of using SSTATE_MIRRORS if that call fails with "Permission denied" when called
> against SSTATE_DIR. This check has been in use for some time and, to the best of
> my knowledge, doesn't trigger invalid failures.
>
> Thanks to Chris and Elizabeth for pointers as to why this was failing.
>
> Cheers,
>
> Joshua
>
> The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:
>
>    tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/sanity
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/sanity
>
> Joshua Lock (7):
>    Revert "sanity.bbclass: check user can read and write to SSTATE_DIR"
>    sanity.bbclass: copy the data store and finalise before running
>      checks
>    sanity.bbclass: data.getVar(VAR, obj, exp) ->  obj.getVar(VAR, exp)
>    sanity.bbclass: add newline to check_create_long_filename failure
>      message
>    sanity.bbclass: add extra information when SSTATE_CACHE unusable
>    sanity.bbclass: catch an extra exception in
>      check_create_long_filename
>    sanity.bbclass: check sanity at BuildStarted rather than ConfigParsed
>
>   meta/classes/sanity.bbclass |  153 ++++++++++++++++++++++---------------------
>   1 files changed, 78 insertions(+), 75 deletions(-)
>

Merged the updated version into OE-Core

Thanks
	Sau!


