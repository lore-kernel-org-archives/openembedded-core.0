Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAOWv-0001Ix-Gd
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:41:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2013 09:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,742,1355126400"; d="scan'208";a="290778296"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2013 09:25:08 -0800
Message-ID: <512CEFF4.8030000@linux.intel.com>
Date: Tue, 26 Feb 2013 09:25:08 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1361891080-5035-1-git-send-email-constantinx.musca@intel.com>
	<CAP9ODKqfv-8=MG=ffQQG_DSTxj9=059Z_W4mPznQiwsKKaYM-w@mail.gmail.com>
In-Reply-To: <CAP9ODKqfv-8=MG=ffQQG_DSTxj9=059Z_W4mPznQiwsKKaYM-w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] log_srcrev.bbclass: add a bbclass for logging SRCREVs
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
X-List-Received-Date: Tue, 26 Feb 2013 17:41:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2013 08:56 AM, Otavio Salvador wrote:
> On Tue, Feb 26, 2013 at 12:04 PM, Constantin Musca
> <constantinx.musca@intel.com> wrote:
>> - add a task which creates a file for each package with the following
>> format:
>>
>> ${BB_FILENAME},${SRC_URI},${SRCREV},${FROM_AUTOREV}
>>
>> [YOCTO #3041]
>>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>
> What is the use-case for this?
>
I could reply with see bug #3041!

There is a need to have the actual SRCREVs from AUTOREV'ed package 
version, so a build can be reproduced at a later date or so you know 
what SRCREV went into a given release.

Sau!



