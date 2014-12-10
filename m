Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6477472332
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 15:46:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2014 07:46:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="496699077"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.60])
	([10.219.4.60])
	by orsmga003.jf.intel.com with ESMTP; 10 Dec 2014 07:42:46 -0800
Message-ID: <54886AE6.1030006@linux.intel.com>
Date: Wed, 10 Dec 2014 09:46:46 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C7CF45250@ORSMSX103.amr.corp.intel.com>
	<54873BE9.9030905@linux.intel.com>
	<CAJTo0LbVEYT9=fo_gKAk0wRSg1H9_-vE5dd5N-SMrMXM38Lbvw@mail.gmail.com>
	<CAP71Wjx+daT278dn2-JF-Epn+WJ8FcE55NMLRXV2dJNSP9wawA@mail.gmail.com>
In-Reply-To: <CAP71Wjx+daT278dn2-JF-Epn+WJ8FcE55NMLRXV2dJNSP9wawA@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Wed, 10 Dec 2014 15:46:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/12/14 02:08, Nicolas Dechesne wrote:
> On Tue, Dec 9, 2014 at 9:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 9 December 2014 at 18:14, Aníbal Limón <anibal.limon@linux.intel.com>
>> wrote:
>>> I don't know, maybe Ross knows?.
>>
>> I ask for Piglit results to verify that approx 95% passes as that's the
>> expected pass rate.  I don't bother tracking the exact count as how it
>> changes as there's almost ten thousand tests and at some point you have to
>> let upstream deal with this.
> are you using the oe-core piglit recipe for testing? i didn't realize
> we had such recipe.. just want to make sure that the one we have is
> ok, then I can run it on my hw as well.

Yes, i added to image with,

CORE_IMAGE_EXTRA_INSTALL += " piglit"

alimon

> thanks


