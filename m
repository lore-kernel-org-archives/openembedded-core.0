Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SkKnD-0003Qj-JR
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 21:54:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5SJhNsO013722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 12:43:23 -0700 (PDT)
Received: from msp-dhcp14.wrs.com (172.25.34.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 28 Jun 2012 12:43:23 -0700
Message-ID: <4FECB3E0.1080503@windriver.com>
Date: Thu, 28 Jun 2012 14:43:28 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20120530110534.15D7110219@opal>
	<20120628191246.GA5532@localhost.jama.net>
In-Reply-To: <20120628191246.GA5532@localhost.jama.net>
Subject: Re: [oe-commits] Mark Hatle : util-linux: use new update-alternatives
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
X-List-Received-Date: Thu, 28 Jun 2012 19:54:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/12 2:12 PM, Martin Jansa wrote:
> On Wed, May 30, 2012 at 11:05:32AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 55c01de28a28a4cfe16d36663c190a874ef2e85d
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=55c01de28a28a4cfe16d36663c190a874ef2e85d
>>
>> Author: Mark Hatle <mark.hatle@windriver.com>
>> Date:   Mon May 21 12:42:34 2012 -0500
>>
>> util-linux: use new update-alternatives
>>
>> In addition to switching to the new update-alternatives, it was discovered
>> that the sln, shutdown, halt, reboot and related commands were never generated.
>> Remove these from the list.  (These appear to have been removed from util-linux
>> some time ago.)
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>
> This seems to break u-a for reset while upgrading from older image:
>
> update-alternatives: Error: cannot register alternative reset to
> /bin/reset since it is already registered to /usr/bin/reset

Can you figure out what registered it as /usr/bin/reset?  As far as I'm aware 
the reset command should be in /bin...  (Sounds like this may simply be an 
ordering thing.)

--Mark

> anyone seen it too?
>
> Cheers,
>
>>
>> ---
>>
>>   meta/recipes-core/util-linux/util-linux.inc       |  212 +++++----------------
>>   meta/recipes-core/util-linux/util-linux_2.21.1.bb |    2 +-
>>   2 files changed, 45 insertions(+), 169 deletions(-)
>>
>> Diff:   http://git.openembedded.org/?p=openembedded-core.git/?a=commitdiff;h=55c01de28a28a4cfe16d36663c190a874ef2e85d
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




