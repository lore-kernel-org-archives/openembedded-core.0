Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B711A7416A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 21:29:08 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t4FLT7CS016266; Fri, 15 May 2015 16:29:07 -0500
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015051516290790-1563416 ;
	Fri, 15 May 2015 16:29:07 -0500 
Message-ID: <55566523.5060100@ni.com>
Date: Fri, 15 May 2015 16:29:07 -0500
From: Haris Okanovic <haris.okanovic@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1431040791-6559-1-git-send-email-haris.okanovic@ni.com>
	<1431040791-6559-2-git-send-email-haris.okanovic@ni.com>
	<554CDB2B.2090607@ni.com>
	<CAJTo0LbsWDv9ncSn85zjGB3Avx+WfmDVg=TYHQAKQwEmPRCE9w@mail.gmail.com>
In-Reply-To: <CAJTo0LbsWDv9ncSn85zjGB3Avx+WfmDVg=TYHQAKQwEmPRCE9w@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/15/2015 04:29:07 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/15/2015 04:29:08 PM,
	Serialize complete at 05/15/2015 04:29:08 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-15_05:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 15 May 2015 21:29:09 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8; format=flowed

On 05/14/2015 03:39 PM, Burton, Ross wrote:
> Will you be able to port this to master which is currently glibc 2.21?

Sure. I'll post a second patch to oe-core for master (glibc 2.21) once I 
test it out. It'll be the same .patch file for glibc's source, but a 
different change in the bb recipe.

The original patch I sent earlier still applies to other branches that 
use glibc 2.20. E.g. Dizzy.

Haris

