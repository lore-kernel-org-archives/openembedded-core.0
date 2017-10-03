Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 180D5602D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 16:16:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2017 09:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,474,1500966000"; d="scan'208";a="158874322"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 03 Oct 2017 09:16:30 -0700
To: Jef.Driesen@niko.eu, ross.burton@intel.com
References: <FAB9E48578194042BE5C63B8BE47610339682897@MBX.NIKO.LAN>
	<d0e88e18-0540-2d7f-abe4-11f677d5af4e@linux.intel.com>
	<FAB9E48578194042BE5C63B8BE4761033969175B@MBX.NIKO.LAN>
	<CAJTo0LY6UW=G2pfVPSQH3bMdU03FDMRFACpzsXJYoW1255rPRg@mail.gmail.com>
	<FAB9E48578194042BE5C63B8BE47610339692797@MBX.NIKO.LAN>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <238e8a7d-59e1-309a-6f96-6be7261646a2@linux.intel.com>
Date: Tue, 3 Oct 2017 19:12:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <FAB9E48578194042BE5C63B8BE47610339692797@MBX.NIKO.LAN>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Small improvement for the initscripts package
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
X-List-Received-Date: Tue, 03 Oct 2017 16:16:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/03/2017 06:03 PM, Jef.Driesen@niko.eu wrote:
> Burton, Ross [ross.burton@intel.com]
>> On 3 October 2017 at 11:03, <Jef.Driesen@niko.eu> wrote:
>>> Note: base-files-emperor is the package with the custom init scripts. I added:
>>>
>>> PROVIDES = "initscripts"
>>>
>>> And in conf/machine/emperor.conf, I added:
>>>
>>> PREFERRED_PROVIDER_initscripts = "base-files-emperor"
>>>
>>   If your initscripts package is a replacement for the oe-core initscripts package, then also set RPROVIDES_${PN} += "initscripts".
> 
> I tried your suggest, but I still get the error:
> 
> "The recipe base-files-emperor is trying to install files into a shared area when those files already exist." error
> 
> With base-files-emperor.bb containing:
> 
> PROVIDES += "initscripts"
> RPROVIDES_${PN} += "initscripts"
> 
> What am I still doing wrong?
> 
> (I'll try to re-build after wiping the tmp directory tonight. A simple "bitbake -c cleanall initscripts base-files-emperor" didn't help.)

I might be reading it wrong, but the full error message seems to 
indicate you also have a recipe called emperor-intscripts that provides 
(some of) the same files as base-files-emperor, and they clash?

Alex

