Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1TgdC9-0006ad-0p
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 16:17:01 +0100
Received: from [192.168.0.2] (host86-137-76-236.range86-137.btcentralplus.com
	[86.137.76.236]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 984B89BE3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2012 15:02:37 +0000 (GMT)
Message-ID: <50C0B38C.2050608@r-finger.com>
Date: Thu, 06 Dec 2012 15:02:36 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1354746794-24290-1-git-send-email-cazfi74@gmail.com>
	<CAJTo0LaEnxc5GwZbxP2iqy943LSbE0AonKYaJkRBkciCVs4g9Q@mail.gmail.com>
	<CAF6bG8eaPKiBWELJG+7DcVPiiah1v626hcix0XN0Eh8tk3EDJw@mail.gmail.com>
In-Reply-To: <CAF6bG8eaPKiBWELJG+7DcVPiiah1v626hcix0XN0Eh8tk3EDJw@mail.gmail.com>
Subject: Re: [PATCH] libmatchbox: fix build against libpng15
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
X-List-Received-Date: Thu, 06 Dec 2012 15:17:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/12 08:30, Marko Lindqvist wrote:
> On 6 December 2012 00:44, Burton, Ross <ross.burton@intel.com> wrote:
>> Hi Marko,
>>
>> Is this backwards compatible with libpng12, or should libmatchbox
>> check it has libpng15?
>>
>> Ross
> 
>  This is backwards compatible. Those functions exist in libpng12.

This should go directly into matchbox rather than being an OE patch I think.

Tomas

-- 
http://sleepfive.com


