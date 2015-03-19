Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 31C0365CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 15:55:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 19 Mar 2015 08:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,430,1422950400"; d="scan'208";a="543283227"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.155])
	([10.219.4.155])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2015 08:55:13 -0700
Message-ID: <550AF162.9000800@linux.intel.com>
Date: Thu, 19 Mar 2015 09:55:14 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1426695976.git.anibal.limon@linux.intel.com>	<21a24c032ec5e2f5feffc593f7995fc086d14556.1426695976.git.anibal.limon@linux.intel.com>
	<CAP9ODKrSS_+1TUVG0WGU_75cGvOZrQk9J1X4yGrdipn+pFE6Bw@mail.gmail.com>
In-Reply-To: <CAP9ODKrSS_+1TUVG0WGU_75cGvOZrQk9J1X4yGrdipn+pFE6Bw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] initscripts: Add changetodefaultvt for 2, 3, 4 runlevels
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
X-List-Received-Date: Thu, 19 Mar 2015 15:55:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/03/15 18:43, Otavio Salvador wrote:
> On Wed, Mar 18, 2015 at 1:31 PM, Aníbal Limón
> <anibal.limon@linux.intel.com> wrote:
>> When change between runlevel 5 to another non-graphic runlevel
>> the console stays in the tty where X was launched.
>>
>> This patchs add a default switch to tty1.
>>
>> [YOCTO #5336]
>>
>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> If not using X this is pointless. Make this dependant of X distro
> feature please.
Makes sense, sending v2...

     alimon
>


