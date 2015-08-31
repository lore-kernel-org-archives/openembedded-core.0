Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CEF3576DE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 14:09:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 31 Aug 2015 07:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,441,1437462000"; d="scan'208";a="635466503"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga003.jf.intel.com with ESMTP; 31 Aug 2015 07:09:13 -0700
Message-ID: <55E4606C.4080207@linux.intel.com>
Date: Mon, 31 Aug 2015 17:10:52 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>	<cover.1440680489.git.jussi.kukkonen@intel.com>	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>	<1440843517.32588.7.camel@linuxfoundation.org>	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>	<1441029218.26554.21.camel@linuxfoundation.org>
	<CAP9ODKqmnK_RGTQDVjsUppps2c7Tk7paEshLVEHAEOvoDkTD_Q@mail.gmail.com>
In-Reply-To: <CAP9ODKqmnK_RGTQDVjsUppps2c7Tk7paEshLVEHAEOvoDkTD_Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Mon, 31 Aug 2015 14:09:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2015 05:01 PM, Otavio Salvador wrote:

>> By your comment, I should just refuse the old gmp version entirely?
>
> Until proper fixed, yes.

I disagree with this. If gmp isn't working on a specific hardware 
platform, but is just fine on the others, that is not sufficient grounds 
for altogether excluding the recipe from the recipe repository.

The recipe can be disabled in builds for that architecture, until 
someone steps up to fix the problem later. Webkit was broken for a very 
long time on MIPS64, so by your logic, we shouldn't have had webkit at all?


Alex


