Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UaTbv-0002ok-7I
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 18:22:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r49G4MuL020468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 May 2013 09:04:22 -0700 (PDT)
Received: from msp-dhcp6.wrs.com (172.25.34.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 9 May 2013 09:04:22 -0700
Message-ID: <518BC905.3090508@windriver.com>
Date: Thu, 9 May 2013 11:04:21 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
	<A023E370-E7BD-47E2-B779-335B4ADE7819@gmail.com>
	<518BC02E.8010909@windriver.com>
	<1368114004.14512.417.camel@phil-desktop.brightsign>
In-Reply-To: <1368114004.14512.417.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
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
X-List-Received-Date: Thu, 09 May 2013 16:22:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/13 10:40 AM, Phil Blundell wrote:
> On Thu, 2013-05-09 at 10:26 -0500, Mark Hatle wrote:
>> This would be my suggestion.  I'd also want to make sure there is a
>> libpthread-dev (which for some reason I think there already is) because the
>> links in there are required for on-target thread debugging...
>
> Really?  If those links are needed for thread debugging then it sounds
> like they should be in libthread-db, not in any -dev package.

I'm pretty sure I'm misremembering the issue.  It's the libthread-db that needs 
the link for debugging.  Last time I was playing with this was pre-Denzil and it 
didn't quite work right.  (gdb on the target debugging threads would say "hey I 
need the ....so to debug".)

If nobody has seen that recently, then ignore that.. it's been resolved.

--Mark

> p.
>
>



