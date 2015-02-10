Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 33C636E593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 16:26:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2015 08:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,551,1418112000"; d="scan'208";a="452653080"
Received: from flopezex-desk.amr.corp.intel.com (HELO [10.219.4.140])
	([10.219.4.140])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2015 08:11:52 -0800
Message-ID: <54DA3148.9010401@linux.intel.com>
Date: Tue, 10 Feb 2015 10:26:48 -0600
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1423583089.git.anibal.limon@linux.intel.com>
	<a4615dc0eee370013a8948a093a730f3233d5888.1423583089.git.anibal.limon@linux.intel.com>
	<CAJTo0LbzAFYpQ6jD4djPCdMzAMRxCZhQ2rBTTLuGeft9uPDHzQ@mail.gmail.com>
	<54DA2A79.3020002@linux.intel.com>
	<CAJTo0LZmMbNb+5hwbG-WYWEcd_LQF_0FxBLmr3hYYSMN6GFqgw@mail.gmail.com>
In-Reply-To: <CAJTo0LZmMbNb+5hwbG-WYWEcd_LQF_0FxBLmr3hYYSMN6GFqgw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] xserver-xorg: Update to 1.16.3
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
X-List-Received-Date: Tue, 10 Feb 2015 16:26:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/02/15 09:58, Burton, Ross wrote:
> On 10 February 2015 at 15:57, Aníbal Limón <anibal.limon@linux.intel.com>
> wrote:
>
>> When you enable systemd-logind xserver automatically links to dbus causing
>> a QA issue that is the reason of
>> add this dependency.
>>
>> systemd uses dbus for all the communications with applications.
>>
> That explains the third option (additional build dependency of "dbus") but
> not the fourth (additional runtime dependency of dbus-lib).\
That's right, sending v2.

     alimon
>
> Ross
>


