Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wmills@ti.com>) id 1QKhpt-0003Xy-9h
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 04:10:37 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p4D23LU2007142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 May 2011 21:03:21 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p4D23KM1015511;
	Thu, 12 May 2011 21:03:20 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p4D23KD5017651;
	Thu, 12 May 2011 21:03:20 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dlee74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 8.3.106.1;
	Thu, 12 May 2011 21:03:20 -0500
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p4D23K2x026235;	Thu, 12 May 2011 21:03:20 -0500
Message-ID: <4DCC9168.1090100@ti.com>
Date: Thu, 12 May 2011 22:03:20 -0400
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <4DCC3BA6.3010406@windriver.com> <4DCC4A51.9010309@linux.intel.com>
	<4DCC4D17.7000600@linux.intel.com> <4DCC59B7.1070309@ti.com>
	<4DCC721D.8000705@linux.intel.com>
In-Reply-To: <4DCC721D.8000705@linux.intel.com>
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Commit and Patch message guidelines - fifth draft
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
X-List-Received-Date: Fri, 13 May 2011 02:10:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 05/12/2011 07:49 PM, Darren Hart wrote:
> There is: http://www.yoctoproject.org/community/mailing-lists
>
> Which needs to be updated to better reflect the oe-core aspect I think.

This might be at least one source of the cross posting as people are not 
sure poky vs oe-core.

>> It seems to me there is a whole bunch of discussion happening on the
>> poky list about making changes that that would effect everyone using
>> openembedded-core.  Do we have two lists for discussion of stuff that
>> effect the oe-core?
>
> No. As I understand it, things that go into poky.git/meta and things
> that go into oe-core should be sent to the openembedded-core list. Patch
> series for poky.git should be isolated in such a way so that they do not
> include changes to meta (oe-core) and other areas at the same time.
 >
 > Does anyone have a different view?
 >

This seems logical to me. Thanks.  I also think discussion of a 
potential patch should be done on the list that the patch would go to yes?

Maybe we could drive that definition to ground and get the mailing list 
page updated.

---

So above, perhaps my "whole bunch" was overstated.  Let me retract that 
and say at least some.

I don't mean to pick on you Darren; I really am just trying to 
understand and an example is often helpful.  Earlier you and Richard 
were discussing directdisc images [1] with a suggestion that it might be 
ripe for removal.  Should that have been on oe-core?

[1] https://lists.yoctoproject.org/pipermail/poky/2011-May/006106.htm

Thanks,
Bill


