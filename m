Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QcJqY-0001v8-7d
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 18:12:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5UG8Ljo024296
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 09:08:21 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 30 Jun 2011 09:08:21 -0700
Message-ID: <4E0C9F74.9040301@windriver.com>
Date: Thu, 30 Jun 2011 11:08:20 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
	<4E0C9D43.6020504@mentor.com>
In-Reply-To: <4E0C9D43.6020504@mentor.com>
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal	errors
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
X-List-Received-Date: Thu, 30 Jun 2011 16:12:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/30/11 10:58 AM, Tom Rini wrote:
> On 06/30/2011 08:11 AM, Koen Kooi wrote:
>> These were turned off by:
>>
>> 	commit fae8d5e985e9b05ce90f1eca434ad4dbf2259725
>> 	Author: Richard Purdie <rpurdie@linux.intel.com>
>> 	Date:   Thu Jul 8 23:51:06 2010 +0100
>>
>> 		insane.bbclass: Relax fatal errors for now until we get have time to work through the backlog
>>
>> The current metadata triggers so many of these that they need to be made fatal so people will actually fix them.
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> Given that a number of them can probably just be pulled from oe.dev as
> fixes too:
> 
> Acked-by: Tom Rini <tom_rini@mentor.com>

I'm really worried about the current warnings/QA issues that keep coming up.. so
I agree we really need to do this.. (note, we also really need to tell people to
expect some breakage as we go and fix the mess!)

Acked-by: Mark Hatle <mark.hatle@windriver.com>

>> ---
>>  meta/classes/insane.bbclass |    1 -
>>  1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index f7e5524..e06d2b2 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -115,7 +115,6 @@ def package_qa_make_fatal_error(error_class, name, path,d):
>>  
>>      TODO: Load a whitelist of known errors
>>      """
>> -    return False
>>      return not error_class in [0, 5, 7, 8, 9]
>>  
>>  def package_qa_write_error(error_class, name, path, d):
> 
> 



