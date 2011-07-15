Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qhjfa-00089q-SK
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 16:47:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6FEh8Jk026371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 07:43:08 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 15 Jul 2011 07:43:08 -0700
Message-ID: <4E2051FB.8080006@windriver.com>
Date: Fri, 15 Jul 2011 09:43:07 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4E1F9F59.5050305@mentor.com> <4E1FAC5A.2090308@windriver.com>
	<1310740753.2350.0.camel@scimitar>
In-Reply-To: <1310740753.2350.0.camel@scimitar>
Subject: Re: Building hg/help2man not relying on them?
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
X-List-Received-Date: Fri, 15 Jul 2011 14:47:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/15/11 9:39 AM, Joshua Lock wrote:
> On Thu, 2011-07-14 at 21:56 -0500, Mark Hatle wrote:
>> On 7/14/11 9:00 PM, Tom Rini wrote:
>>> Hey all,
>>>
>>> As I work on bringing jenkins up on my stripped down builder machines
>>> I've once again run into the "wait, I'm supposed to have installed...?"
>>> problem.  Can we switch to building help2man and mercurial rather than
>>> making the end user install them?  Perhaps some sort of test for if we
>>> find it, ASSUME_PROVIDED it, otherwise build it?
>>>
>>
>> The full sanity list is:
>>
>> patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk hg
>> chrpath wget cpio
>>
>> Of the above, help2man, texi2html, hg, and chrpath seem to be the ones I usually
>> have to find or build myself.
> 
> Originally I built chrpath when I added relocatable.bbclass but then we
> wanted to relocate native packages and it got extremely tricky...

I wonder if we can do something like pseudo and force chrpath to be built -very-
early in the process.. and then have most things have an automatic requirement
on chrpath-native...

(pseudo of course has the advantage it's NOT used for native packages...)

Is the native chrpath usage only in do_package [or later]?  If so, we could
probably put a dependency on do_package of chrpath.. with the affect that
chrpath would have to be built first...

--Mark

> 
> Joshua



