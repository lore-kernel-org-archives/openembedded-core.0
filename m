Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RkIo4-0006la-Ue
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 18:14:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q09GNv0i024990
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jan 2012 08:23:57 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Jan 2012 08:23:57 -0800
Message-ID: <4F0B149D.1080105@windriver.com>
Date: Mon, 9 Jan 2012 10:23:57 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1326026360-27733-1-git-send-email-andrei@gherzan.ro>
	<4F0A7B43.2050309@linux.intel.com>
In-Reply-To: <4F0A7B43.2050309@linux.intel.com>
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
X-List-Received-Date: Mon, 09 Jan 2012 17:14:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/12 11:29 PM, Saul Wold wrote:
> On 01/08/2012 04:39 AM, Andrei Gherzan wrote:
>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>
>> [YOCTO #1884]
>>
>> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
>> ---
>>    meta/recipes-core/gettext/gettext_0.18.1.1.bb |    2 +-
>>    1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>> index 615582e..1e8c952 100644
>> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>> @@ -2,7 +2,7 @@ SUMMARY = "Utilities and libraries for producing multi-lingual messages."
>>    DESCRIPTION = "Gettext offers to programmers, translators, and even users, a well integrated set of tools and documentation. Specifically, the GNU `gettext' utilities are a set of tools that provides a framework to help other GNU packages produce multi-lingual messages. These tools include a set of conventions about how programs should be written to support message catalogs, a directory and file naming organization for the message catalogs themselves, a runtime library supporting the retrieval of translated messages, and a few stand-alone programs to massage in various ways the sets of translatable strings, or already translated strings."
>>    HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
>>    SECTION = "libs"
>> -LICENSE = "GPL-3+ & LGPL-2.1+"
>> +LICENSE = "GPLv3+ & LGPL-2.1+"
>>    LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>
> I think the correct fix is to change the INCOMPATIBLE_LICENSE code to
> detect both GPLv3 and GPL-3, which is the SPDX standard name.

Both GPL-3+ and GPLv3+ are supposed to be equivalent.  (There is still on going 
debate which one is "preferred" for oe-core..  the GPL-3+ is the SPDX name at 
least.)

There is a license compatibility table, but for some reason I'm failing to 
current find it in the distribution.  It may simply be that the 
INCOMPATIBLE_LICENSE is not using the compatibility table.

--Mark

> Sau!
>
>>    PR = "r6"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



