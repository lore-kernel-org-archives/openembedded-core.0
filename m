Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 32CE971E51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:47:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 20 Jan 2017 03:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,258,1477983600"; d="scan'208";a="215648282"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2017 03:47:54 -0800
To: Patrick Ohly <patrick.ohly@intel.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
References: <1484866006-25611-1-git-send-email-anibal.limon@linux.intel.com>
	<1484912118.23233.113.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a40ee70f-311e-c0db-e672-3a66bf1af5b6@linux.intel.com>
Date: Fri, 20 Jan 2017 13:48:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1484912118.23233.113.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: Upgrade to 2.7.1
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
X-List-Received-Date: Fri, 20 Jan 2017 11:47:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/20/2017 01:35 PM, Patrick Ohly wrote:
> On Thu, 2017-01-19 at 16:46 -0600, Aníbal Limón wrote:
>>  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>> -SRC_URI[md5sum] = "08d4d06d1cb598efecd796137f4844ab"
>> -SRC_URI[sha256sum] = "326e739506ba690daf69fc17bd3913a6c313d9928d743bd8eddb82f403f81e53"
>> +SRC_URI[md5sum] = "a315bc51ed443a08d2cf1416d76b9ab4"
>> +SRC_URI[sha256sum] = "68636788eb69bcb0b44ba220b32b50495d6bd5712a934c282217831c4822958f"
>
> _prepend without trailing space is broken. It just happens to work
> because the SRC_URI it prepends to usually has a leading space.
>
> I just ran into a situation where it didn't (due to some _remove
> operation being interposed, which did a split/join, see YOCTO #10945).
>
> I was about to send a fix, but it would just conflict with your version
> update. Can you include a fix by revising your proposal, perhaps by
> turning it into a patch series with two changes?
>
> IMHO SRC_URI =+ "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
> should be fine. There's no need for the more complex _prepend.

Actually, this line should be simply moved to qemu.inc and placed 
together with other SRC_URI entries. There is nothing version-specific 
in it. All these prepends, appends and +='s are best avoided if possible.

Alex


