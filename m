Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QJoSO-0001v5-9b
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 17:02:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4AExqSN019155
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:59:52 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 10 May 2011 07:59:52 -0700
Message-ID: <4DC952E7.2020005@windriver.com>
Date: Tue, 10 May 2011 09:59:51 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1305004776.git.sgw@linux.intel.com>	<2a89d3090044d90208c608d5f05511c03a7ca48e.1305004776.git.sgw@linux.intel.com>	<1305017493.30391.253.camel@rex>
	<BANLkTim03bq62TJL9Sj2bLc3VrwTi2KUzg@mail.gmail.com>
In-Reply-To: <BANLkTim03bq62TJL9Sj2bLc3VrwTi2KUzg@mail.gmail.com>
Subject: Re: [PATCH 13/30] readline: update version
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
X-List-Received-Date: Tue, 10 May 2011 15:02:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/10/11 9:53 AM, Adrian Alonso wrote:
> Unaware of delete recipe policy, there is also a recipe of readline version
> 5.2
> should also be removed?
> 
> Send to list a patch that deletes recipe readline-6.1.bb

There are two versions listed.  A GPLv2 and a GPLv3 version.  We're attempting
to preserve the last GPLv2 versions for a base set of recipes to enable people
who have specific license restrictions on their devices.

So updating 6.1 -> 6.2 (and removing 6.1) is definitely policy -- unless there
are components that have hard requirements on 6.1...

The GPLv2 version should remain for the time being.

--Mark

> Regards
> 
> On Tue, May 10, 2011 at 3:51 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
>> On Mon, 2011-05-09 at 22:26 -0700, Saul Wold wrote:
>>> From: Adrian Alonso <aalonso@secretlab.ca>
>>>
>>> * Readline new recipe version 6.2
>>>
>>> Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
>>> ---
>>>  meta/recipes-core/readline/readline_6.2.bb |    6 ++++++
>>>  1 files changed, 6 insertions(+), 0 deletions(-)
>>>  create mode 100644 meta/recipes-core/readline/readline_6.2.bb
>>
>> Why is readline 6.1 being kept?
>>
>> Cheers,
>>
>> Richard
>>
>>
> 
> 



