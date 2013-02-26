Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAOap-0001R8-A2
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:45:32 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Feb 2013 09:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,742,1355126400"; d="scan'208";a="206512424"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Feb 2013 09:29:08 -0800
Message-ID: <512CF0E1.9040101@linux.intel.com>
Date: Tue, 26 Feb 2013 09:29:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Javier Viguera <javier.viguera@digi.com>
References: <1361372957-38860-1-git-send-email-javier.viguera@digi.com>
	<512CEFBE.4010901@digi.com>
In-Reply-To: <512CEFBE.4010901@digi.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: fix 'dash' expanding '\n'
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
X-List-Received-Date: Tue, 26 Feb 2013 17:45:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/26/2013 09:24 AM, Javier Viguera wrote:
> Hi all,
>
> I just saw this patch i sent last week was pushed to
> openembedded-core/poky *master* branches. Thanks for that.
>
> But in my development i am using stable 'danny' branches.
>
> Any chance that this patch gets cherry-picked to 'danny' on
> openembedded-core and poky repos?
>
In the future, patches for Stable releases should mention that in the 
patch request.  We are spinning the rc1 of Danny Update (1.3.1) now, so 
it will not make this release, but could be considered for the next one.

Thanks for your contribution

	Sau!

> -
> Javier Viguera
> Software Engineer
> Digi International® Spain S.A.U.
>
>
> On 02/20/2013 04:09 PM, Javier Viguera wrote:
>> Dash's 'echo' command expands '\n' by default, so the '\n' is not
>> included in the '/etc/issue' file.
>>
>> Use 'printf' for portability between different shells.
>>
>> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
>> ---
>>
>> Probably also worth to be cherry-picked to 'danny' branch.
>>
>>   meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index 6a3db50..e7a9d82 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -129,7 +129,7 @@ do_install_basefilesissue () {
>>               printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
>>               printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
>>           fi
>> -        echo "\n \l" >> ${D}${sysconfdir}/issue
>> +        printf "\\\n \\\l\n" >> ${D}${sysconfdir}/issue
>>           echo >> ${D}${sysconfdir}/issue
>>           echo "%h"    >> ${D}${sysconfdir}/issue.net
>>           echo >> ${D}${sysconfdir}/issue.net
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


