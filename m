Received: from mx2.ll.mit.edu ([129.55.12.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=6188cc0d54=jmitchell@ll.mit.edu>)
	id 1QlqWK-0001BV-Lo for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 00:54:36 +0200
Received: from LLE2K7-HUB02.mitll.ad.local (LLE2K7-HUB02.mitll.ad.local) by
	mx2.ll.mit.edu (unknown) with ESMTP id p6QMoLhq025427;
	Tue, 26 Jul 2011 18:50:21 -0400
Message-ID: <4E2F44AC.4040803@ll.mit.edu>
Date: Tue, 26 Jul 2011 18:50:20 -0400
From: Jeff Mitchell <jmitchell@ll.mit.edu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110721 Thunderbird/5.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <4E2F384F.6060907@ll.mit.edu> <4E2F429E.5030607@linux.intel.com>
In-Reply-To: <4E2F429E.5030607@linux.intel.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.4.6813, 1.0.211,
	0.0.0000
	definitions=2011-07-26_07:2011-07-27, 2011-07-26,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=2
	phishscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0
	reason=mlx
	scancount=1 engine=6.0.2-1012030000 definitions=main-1107260218
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bb-matrix.sh: check for the existence of time
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
X-List-Received-Date: Tue, 26 Jul 2011 22:54:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2011 06:41 PM, Darren Hart wrote:
>
> Hi Jeff,
>
> Thanks for the patch. A couple points of feedback below:
>
> On 07/26/2011 02:57 PM, Jeff Mitchell wrote:
>> What an existential subject. The patch is quite self-explanatory.
>
> Well, there is almost always a need for commit log beyond just the
> subject. The only exception might be "whitespace fixes only" or
> "spelling fixes only".

I did write a commit log, but git-format-patch turned it into the 
subject of the attached patch. No, I haven't used git-format-patch 
before :-)  (I've been fortunate to have been able to avoid it for many 
years now.)

> Also, while it is tempting to squeeze in typo fixes and such with a
> functional patch, unless they are in the code you are changing anyway,
> they should be sent as separate patches.

Given the triviality of both changes I didn't think this would be an issue.

--Jeff



