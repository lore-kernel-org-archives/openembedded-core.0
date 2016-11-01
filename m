Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C6E99719C5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 12:46:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 01 Nov 2016 05:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,579,1473145200"; d="scan'208";a="1078954755"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2016 05:47:00 -0700
To: Andreas Oberritter <obi@opendreambox.org>
References: <20161031132336.16626-1-alexander.kanavin@linux.intel.com>
	<2de2e824-4b57-1adf-5053-6f9fcd518b8d@opendreambox.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ed46ccb7-6c9f-93d2-b3f4-7d6523368349@linux.intel.com>
Date: Tue, 1 Nov 2016 14:44:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <2de2e824-4b57-1adf-5053-6f9fcd518b8d@opendreambox.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: fix the SRC_URI to point to an actual release, and not a master snapshot
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
X-List-Received-Date: Tue, 01 Nov 2016 12:46:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2016 10:44 PM, Andreas Oberritter wrote:

>> -SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
>> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/boost/boost/${PV}/${BOOST_P}.tar.bz2"
>>
>> -SRC_URI[md5sum] = "7ef085456c48c49a7fe8237f07e5f674"
>> -SRC_URI[sha256sum] = "bce80293052e2d6230f1bec9b7524b33412e4fb26e9723460a0f362ac15b7acb"
>> +SRC_URI[md5sum] = "5fb94629535c19e48703bdb2b2e9490f"
>> +SRC_URI[sha256sum] = "36c96b0f6155c98404091d8ceb48319a28279ca0333fba1ad8611eb90afb2ca0"
>> +
>> +PR = "r1"
>
> doesn't the changed SRC_URI (or even the modified checksums alone)
> render the PR bump unnecessary?

Frankly I'm not sure, but I thought bumping PR ensures that anyone using 
package feeds will get an updated package.

Alex


