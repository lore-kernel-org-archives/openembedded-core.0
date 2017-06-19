Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C312373120
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 11:42:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 19 Jun 2017 04:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,360,1493708400"; d="scan'208";a="1162119471"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2017 04:42:02 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
	<671fa9c476269908cd092f0d033e03ae477119c7.1497615866.git.alexander.kanavin@linux.intel.com>
	<3606dfa4-74a6-d44d-f902-1733cbdf6e1a@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <70c8e1d6-fbb6-a238-8b10-47eecab479a3@linux.intel.com>
Date: Mon, 19 Jun 2017 14:42:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <3606dfa4-74a6-d44d-f902-1733cbdf6e1a@gmail.com>
Subject: Re: [PATCH 28/32] gettext: relocate msgfmt utility for all recipes
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
X-List-Received-Date: Mon, 19 Jun 2017 11:42:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2017 08:57 PM, Khem Raj wrote:
>>  	rm ${D}${datadir}/gettext/po/Makefile.in.in
>>  	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
>> +
>> +        create_wrapper ${D}${bindir}/msgfmt \
>> +                GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-0.19.8/"
>> +
> while here, perhaps it will be worth looking at automating the partial
> PV use here

How about when the next gettext is out :) Then we can maybe just put PV 
in there; 4-number version seems rare in gettext releases.

Alex


