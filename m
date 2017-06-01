Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32DCC6025E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 02:06:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5126T93002345
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 May 2017 19:06:29 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 31 May 2017 19:06:28 -0700
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
References: <CAMKF1spQcs7rHhT=NgHBWhDESzEzbJx4XReBmREtr=rs5c9FjQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <12b1e915-31c9-3258-1013-46854abb78ae@windriver.com>
Date: Wed, 31 May 2017 21:06:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spQcs7rHhT=NgHBWhDESzEzbJx4XReBmREtr=rs5c9FjQ@mail.gmail.com>
Subject: Re: AS_NEEDED and rpm4
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
X-List-Received-Date: Thu, 01 Jun 2017 02:06:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/31/17 8:54 PM, Khem Raj wrote:
> Hi
> 
> We added entry for disabling AS_NEEDED for rpm5, now that  we have move to rpm4
> is that entry sitll required in "conf/distro/include/as-needed.inc"

Unknown, I hadn't realized this was done.  Should be easy to clear it and see if
everything is still working.

--Mark

> Thanks
> -Khem
> 


