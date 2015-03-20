Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0A91B6AC3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 15:56:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2015 08:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,437,1422950400"; d="scan'208";a="470134726"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.155])
	([10.219.4.155])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Mar 2015 08:56:33 -0700
Message-ID: <550C4334.3010200@linux.intel.com>
Date: Fri, 20 Mar 2015 09:56:36 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1426772606.git.anibal.limon@linux.intel.com>	<72e05501cdcd7edf186d4aea4914c90fcb346327.1426772606.git.anibal.limon@linux.intel.com>
	<CAP9ODKprP=VK68oS0k6XmMAvj+BpXZPEyqYwad=52MthZkpi=Q@mail.gmail.com>
In-Reply-To: <CAP9ODKprP=VK68oS0k6XmMAvj+BpXZPEyqYwad=52MthZkpi=Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4 2/2] xserver-nodm-init: Change to vt1 when stop
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
X-List-Received-Date: Fri, 20 Mar 2015 15:56:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 20/03/15 08:54, Otavio Salvador wrote:
> On Thu, Mar 19, 2015 at 10:45 AM, Aníbal Limón
> <anibal.limon@linux.intel.com> wrote:
>> When X is stopped it remains in the same vt that was launched,
>> change to vt1 instead to avoid manual vt switch.
>>
>> [YOCTO #5336]
>>
>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> Now  I like it :) Thanks for doing those changes :)
Thanks to you for the feedback.

     alimon
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>


