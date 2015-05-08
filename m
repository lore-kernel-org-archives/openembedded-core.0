Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 635F860034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 15:50:02 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t48Fo3Pf004486 for <openembedded-core@lists.openembedded.org>;
	Fri, 8 May 2015 10:50:03 -0500
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015050810500391-1101792 ;
	Fri, 8 May 2015 10:50:03 -0500 
Message-ID: <554CDB2B.2090607@ni.com>
Date: Fri, 08 May 2015 10:50:03 -0500
From: Haris Okanovic <haris.okanovic@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1431040791-6559-1-git-send-email-haris.okanovic@ni.com>
	<1431040791-6559-2-git-send-email-haris.okanovic@ni.com>
In-Reply-To: <1431040791-6559-2-git-send-email-haris.okanovic@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/08/2015 10:50:03 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/08/2015 10:50:04 AM,
	Serialize complete at 05/08/2015 10:50:04 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-08_06:, , signatures=0
Subject: Re: [PATCH 2/2] glibc: CVE-2015-1781: resolv/nss_dns/dns-host.c buffer overflow
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 May 2015 15:50:04 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252; format=flowed

On 05/07/2015 06:19 PM, Haris Okanovic wrote:
> Backport Arjun Shankar's patch for CVE-2015-1781:
>
> A buffer overflow flaw was found in the way glibc's gethostbyname_r() and
> other related functions computed the size of a buffer when passed a
> misaligned buffer as input. An attacker able to make an application call
> any of these functions with a misaligned buffer could use this flaw to
> crash the application or, potentially, execute arbitrary code with the
> permissions of the user running the application.
>
> https://sourceware.org/bugzilla/show_bug.cgi?id=18287
>
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> Signed-off-by: Ken Sharp <ken.sharp@ni.com>
> Reviewed-by: Rich Tollerton <rich.tollerton@ni.com>
> ---

Note that this patch is to apply to the Dizzy branch of 
openembedded-core (glibc 2.20). It might cleanly apply to other branches 
also using glibc 2.20, but I've only tested with Dizzy.

CVE-2015-1781 is fixed in glibc 2.22 and later.

Thanks,
Haris

