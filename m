Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjEzG-0005eM-Sl
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 21:30:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jun 2012 12:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169844260"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2012 12:19:22 -0700
Message-ID: <4FE8B9BA.6060605@linux.intel.com>
Date: Mon, 25 Jun 2012 12:19:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Wade Farnsworth <wade_farnsworth@mentor.com>
References: <4FE37C14.6060301@mentor.com> <4FE89BFA.9080406@linux.intel.com>
	<4FE8B928.1000808@mentor.com>
In-Reply-To: <4FE8B928.1000808@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemtap: update to version 1.8
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
X-List-Received-Date: Mon, 25 Jun 2012 19:30:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/25/2012 12:16 PM, Wade Farnsworth wrote:
> Saul Wold wrote:
>> On 06/21/2012 12:55 PM, Wade Farnsworth wrote:
>>> Update the systemtap recipes to the recently released version 1.8.
>>> Remove a
>>> couple of patches whose changes are already present in the new version.
>>>
>>> Signed-off-by: Wade Farnsworth<wade_farnsworth@mentor.com>
>>> ---
>>> ...prun-configure.ac-support-without-nss-for.patch | 50
>>> --------------------
>>> .../systemtap_fix_for_automake_1.12.patch | 23 ---------
>>> meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
>>> meta/recipes-kernel/systemtap/systemtap_git.inc | 6 +--
>>> 4 files changed, 3 insertions(+), 78 deletions(-)
>>> delete mode 100644
>>> meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
>>>
>>> delete mode 100644
>>> meta/recipes-kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
>>>
>>>
>> Wade,
>>
>> This patch is not applying cleanly with git am on the lastest master,
>> would you check it and possibly re-base/re-send.
>>
>> Thanks
>> Sau!
>>
>>
>
> Hi Saul,
>
> It looks like the umlaut characters in the deleted patches are being munged by my
> mailer.  As a workaround, I've set up a github repo containing my change.  Do you mind
> pulling this directly?
>
Not at all, sometimes this can be easier for me, especially if there is 
a series of commits.

Thanks, will get this in the next day or so.

Sau!

> Thanks,
>
> Wade
>
>
> The following changes since commit f4b5afe46ff018570c1949653eb6995428827f6f:
>    Richard Purdie (1):
>          sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change
>
> are available in the git repository at:
>
>    https://github.com/wfarnsworth/oe-core.git stap
>
> Wade Farnsworth (1):
>        systemtap: update to version 1.8
>
>   ...prun-configure.ac-support-without-nss-for.patch |   50 --------------------
>   .../systemtap_fix_for_automake_1.12.patch          |   23 ---------
>   meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
>   meta/recipes-kernel/systemtap/systemtap_git.inc    |    6 +--
>   4 files changed, 3 insertions(+), 78 deletions(-)
>
>
>
>
>
>


