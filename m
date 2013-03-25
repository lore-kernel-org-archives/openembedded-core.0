Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UKDOb-0003W2-JD
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 20:49:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2PJWTq6024750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Mar 2013 12:32:29 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 25 Mar 2013 12:32:29 -0700
Message-ID: <5150A649.8090409@windriver.com>
Date: Mon, 25 Mar 2013 14:32:25 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
	<1364231993-31670-2-git-send-email-mark.hatle@windriver.com>
	<1364230955.25692.138.camel@phil-desktop.brightsign>
	<51508505.5080706@windriver.com>
	<1364233524.25692.139.camel@phil-desktop.brightsign>
In-Reply-To: <1364233524.25692.139.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 RFC] rpm: Add workaround for debugedit-segv
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
X-List-Received-Date: Mon, 25 Mar 2013 19:49:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/13 12:45 PM, Phil Blundell wrote:
> On Mon, 2013-03-25 at 12:10 -0500, Mark Hatle wrote:
>> I'm going to look into identifying if the section is a NOBITS and skipping the
>> whole operation if it is.
>
> That would mean that a change in the size of the .bss wouldn't have any
> impact on the hash.  Maybe that's fine for your application though, I
> dunno.

I'm not completely familiar with how the buildid is calculated, other then an 
md5 hash over the sections themselves.  I can't think of a case where the 
contents of the sections wouldn't change along with the .bss and .plt size.

(buildid is supposed to be used by gdb to find/verify that the debuginfo matches 
the binary actually being debugged...)

Through my google search, I never found a full spec of what the buildid was 
supposed to contain, only a high-level description from an old Fedora 8 work 
item.  (Note, as long the buildid is consistent it really doesn't appear to 
matter how it was generated, just that both the app and debuginfo contain it.)

--Mark


> p.
>
>



