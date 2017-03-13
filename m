Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBF0776D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 14:02:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2DE2V17020446
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Mar 2017 07:02:31 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 07:02:30 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<b6d2b654a601d53ea4168c2f8d6438ac7be5e10d.1489144807.git.alexander.kanavin@linux.intel.com>
	<2fbc77bf-fbe0-2673-3af7-e95c0e5e2a4e@windriver.com>
	<a27b3883-7d69-0e61-351a-8b19aaf3255c@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a066af7f-4623-f44f-1a85-afcf35f8bb9d@windriver.com>
Date: Mon, 13 Mar 2017 09:02:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <a27b3883-7d69-0e61-351a-8b19aaf3255c@linux.intel.com>
Subject: Re: [PATCH 30/44] byacc: remove the recipe
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
X-List-Received-Date: Mon, 13 Mar 2017 14:02:31 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/13/17 8:18 AM, Alexander Kanavin wrote:
> On 03/10/2017 06:37 PM, Mark Hatle wrote:
>> byacc, until recently, was required by the LSB / LSB Test Suite.
>>
>> So I'd rather is be kept in oe-core through the 2.3 release.
> 
> I couldn't find it in the LSB 5 standard. Is it something from earlier 
> versions?

It is in the instructions for the LSB Test Suite.  Byacc was required until
fairly recently.  From what I've found it was needed up until about September of
last year.  (There may be people doing CGL certification and such that still
need to use older versions of the LSB Test Suite for the time being.)

I have no objections (at this time) to remove it in 2.4, but I think it's too
later in 2.3 to remove/move it on someone.

--Mark

> Alex
> 


