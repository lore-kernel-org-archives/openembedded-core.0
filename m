Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkJ4J-0007LV-Eh
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 18:31:35 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jan 2012 09:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105133184"
Received: from unknown (HELO [10.255.13.28]) ([10.255.13.28])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2012 09:24:06 -0800
Message-ID: <4F0B22B6.4010907@linux.intel.com>
Date: Mon, 09 Jan 2012 09:24:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326026360-27733-1-git-send-email-andrei@gherzan.ro>
	<4F0A7B43.2050309@linux.intel.com> <4F0B149D.1080105@windriver.com>
In-Reply-To: <4F0B149D.1080105@windriver.com>
Subject: Re: [PATCH] gettext: License modify LICENSE to GPLv3 from GPL-3
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
X-List-Received-Date: Mon, 09 Jan 2012 17:31:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2012 08:23 AM, Mark Hatle wrote:
> On 1/8/12 11:29 PM, Saul Wold wrote:
>> On 01/08/2012 04:39 AM, Andrei Gherzan wrote:
>>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>>
>>> [YOCTO #1884]
>>>
>>> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
>>> ---
>>> meta/recipes-core/gettext/gettext_0.18.1.1.bb | 2 +-
>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>>> b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>>> index 615582e..1e8c952 100644
>>> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>>> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>>> @@ -2,7 +2,7 @@ SUMMARY = "Utilities and libraries for producing
>>> multi-lingual messages."
>>> DESCRIPTION = "Gettext offers to programmers, translators, and even
>>> users, a well integrated set of tools and documentation.
>>> Specifically, the GNU `gettext' utilities are a set of tools that
>>> provides a framework to help other GNU packages produce multi-lingual
>>> messages. These tools include a set of conventions about how programs
>>> should be written to support message catalogs, a directory and file
>>> naming organization for the message catalogs themselves, a runtime
>>> library supporting the retrieval of translated messages, and a few
>>> stand-alone programs to massage in various ways the sets of
>>> translatable strings, or already translated strings."
>>> HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
>>> SECTION = "libs"
>>> -LICENSE = "GPL-3+ & LGPL-2.1+"
>>> +LICENSE = "GPLv3+ & LGPL-2.1+"
>>> LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>>
>> I think the correct fix is to change the INCOMPATIBLE_LICENSE code to
>> detect both GPLv3 and GPL-3, which is the SPDX standard name.
>
> Both GPL-3+ and GPLv3+ are supposed to be equivalent. (There is still on
> going debate which one is "preferred" for oe-core.. the GPL-3+ is the
> SPDX name at least.)
>
> There is a license compatibility table, but for some reason I'm failing
> to current find it in the distribution. It may simply be that the
> INCOMPATIBLE_LICENSE is not using the compatibility table.
>
Mark,

Looks like he addressed this in an updated patch, I am looking at his 
updated change and also looking at what Tom has proposed for LICENSE_FLAGS.

Sau!

> --Mark
>
>> Sau!
>>
>>> PR = "r6"
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


