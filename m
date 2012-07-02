Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SlnYM-0004Xr-Ps
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:49:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q62KbuGl010451
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 13:37:56 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 2 Jul 2012 13:37:56 -0700
Message-ID: <4FF206A3.6000108@windriver.com>
Date: Mon, 2 Jul 2012 15:37:55 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341015667.git.mark.hatle@windriver.com>
	<3112d19714501de42e197c3e05247065bbfea57a.1341015667.git.mark.hatle@windriver.com>
	<1341260763.2886.34.camel@x121e.pbcl.net>
In-Reply-To: <1341260763.2886.34.camel@x121e.pbcl.net>
Subject: Re: [PATCH 1/2] libc-common: Allow debug package to append, not set depends
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
X-List-Received-Date: Mon, 02 Jul 2012 20:49:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/12 3:26 PM, Phil Blundell wrote:
> On Fri, 2012-06-29 at 19:22 -0500, Mark Hatle wrote:
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>
> This patch has no checkin message (other than the subject line) which is
> contrary to our fine guidelines.  What bug is this fixing?

Exactly what the subject is.  The libc-common.bbclass needs to be able to append 
the RPROVIDES, RCONFLICT_, RREPLACES_ and not just -set- them.

The guidelines say that if the subject and code explain what is being changed, 
then repeating the subject is frowned upon.

> Also, the subject line talks about "depends" but the patch actually
> modifies the way that RPROVIDES/RCONFLICTS/RREPLACES are set and I'm not
> sure that most people would class those as "depends".

Sorry, terminology then.. I consider these all depends.

I can reword it, but it was clear to me when I wrote it that the subject and 
patch itself explained what was happening.

--Mark

> p.
>
>> ---
>>   meta/classes/libc-common.bbclass |    6 +++---
>>   1 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
>> index 9b91f0a..8145d64 100644
>> --- a/meta/classes/libc-common.bbclass
>> +++ b/meta/classes/libc-common.bbclass
>> @@ -29,7 +29,7 @@ python populate_packages_prepend () {
>>   		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
>>   		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
>>   		# For backward compatibility with old -dbg package
>> -		d.setVar('RPROVIDES_' + bpn + '-dbg', 'libc-dbg')
>> -		d.setVar('RCONFLICTS_' + bpn + '-dbg', 'libc-dbg')
>> -		d.setVar('RREPLACES_' + bpn + '-dbg', 'libc-dbg')
>> +		d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
>> +		d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
>> +		d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
>>   }
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>




