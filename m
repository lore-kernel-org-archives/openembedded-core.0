Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SuW5J-0005Gx-Oj
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 23:59:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6QLlXuY029187
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:47:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.34) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 26 Jul 2012 14:47:33 -0700
Message-ID: <5011BAF4.7090301@windriver.com>
Date: Thu, 26 Jul 2012 16:47:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343328564-3644-1-git-send-email-sgw@linux.intel.com>
	<1343329086.4470.56.camel@x121e.pbcl.net>
	<CAMKF1so+OJTjN+fRP8DJK2zCNKUyTFYJ==zUMkRm1+-6FkYCvg@mail.gmail.com>
	<1343335085.9574.32.camel@ted>
	<1343335989.4470.75.camel@x121e.pbcl.net>
	<CAMKF1srcDNx6cL42Lu9vyig8nHB14xp2+fapoCxd4kTh9dVGCw@mail.gmail.com>
In-Reply-To: <CAMKF1srcDNx6cL42Lu9vyig8nHB14xp2+fapoCxd4kTh9dVGCw@mail.gmail.com>
Subject: Re: [PATCH] package.bbclass: Let pn be eglibc for eglibc-locale
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
X-List-Received-Date: Thu, 26 Jul 2012 21:59:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/12 4:27 PM, Khem Raj wrote:
> On Thu, Jul 26, 2012 at 1:53 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Thu, 2012-07-26 at 21:38 +0100, Richard Purdie wrote:
>>> the other alternative which comes to mind would be so set a variable
>>> with the name we want used there, defaulting it to PN.
>>
>> That sounds like the most wholesome plan to me.
>
> can we use BPN, unless we generate locale for native and nativesdk
> cross and crosssdk
> class of recipes that should work too. I thought about it  and thought
> it was too
> intrusive.

There are cases for multilibs where locales for specific multilib packages will 
be generated.  We theoretically could generate them for native(sdk) and 
cross(sdk) as well, but I don't believe we do that in the general cases.

--Mark




