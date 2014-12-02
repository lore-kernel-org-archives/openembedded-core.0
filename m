Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 11BDE60673
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 14:36:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Dec 2014 06:32:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,501,1413270000"; d="scan'208";a="641371642"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.148])
	([10.219.4.148])
	by fmsmga002.fm.intel.com with ESMTP; 02 Dec 2014 06:32:54 -0800
Message-ID: <547DCD9A.6070609@linux.intel.com>
Date: Tue, 02 Dec 2014 08:32:58 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<77c054ff36774c9013ea046024489cabca8102e7.1417466738.git.anibal.limon@linux.intel.com>
	<CAP71WjxaCpKBUOadPKxJCwZb6qAUrs_3icwqxOQDNkb9VN_9WQ@mail.gmail.com>
In-Reply-To: <CAP71WjxaCpKBUOadPKxJCwZb6qAUrs_3icwqxOQDNkb9VN_9WQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] mesa: Upgrade to 10.3.3
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
X-List-Received-Date: Tue, 02 Dec 2014 14:36:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02/12/14 04:07, Nicolas Dechesne wrote:
> On Mon, Dec 1, 2014 at 11:36 PM, Aníbal Limón
> <anibal.limon@linux.intel.com> wrote:
>> -SRCREV = "0028eb1083e6adc110a23a5f02c993cda217067a"
>> -PV = "10.1.3+git${SRCPV}"
>> +SRCREV = "9cc26056ee13f25c5785fef81b31487f1429baa4"
>> +PV = "10.3.3+git${SRCPV}"
> 10.3.4 has been ~2 weeks ago, can't we use this one instead?
I reviewed the site http://mesa3d.sourceforge.net/ and not see 10.3.4 but
is available at ftp://ftp.freedesktop.org/pub/mesa/10.3.4/ i think it's ok.
I'll update to 10.3.4.
>
> in the mean time, I am going to test this series on a non Intel
> platform (ARM based Snapdragon using Mesa/gallium freedreno driver)
Sounds good.
>
>> -SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.1 \
>> -           file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
>> -           file://0006-fix-out-of-tree-egl.patch \
>> -           "
> awesome to get rid of those , and finally use a vanilla upstream..
>
>> +SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.3"
>>
>>   S = "${WORKDIR}/git"


