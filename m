Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9AEB16B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 10:31:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 29 Aug 2016 03:31:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="872140600"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 03:31:56 -0700
Date: Mon, 29 Aug 2016 13:31:33 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20160829103132.GA5724@mbabyjoh-desk.ger.corp.intel.com>
References: <48a58ad6-9d18-2443-22f2-3eb07f6aa7b8@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <48a58ad6-9d18-2443-22f2-3eb07f6aa7b8@mlbassoc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pointercal-xinput?
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
X-List-Received-Date: Mon, 29 Aug 2016 10:31:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Gary,

On Sat, Aug 27, 2016 at 12:30:23PM +0200, Gary Thomas wrote:
> Is this recipe relevant any more (since pointercal was removed)?
>   ${Poky}/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb

Yes, it is still used by the xinput_calibrator binary. 

If there is a  pointercal file (/etc/pointercal.xinput) defined for the device,
xinput_calibrator use it. Otherwise, the startup script runs the calibrator
and save the ‘xinput’ commands printed on stdout in the pointercal file.

https://github.com/tias/xinput_calibrator/wiki/Making-calibration-values-permanent

Have tried a core-image-sato build with meta-fsl-arm for imx28evk to locate the
obvious failures. Build was successful. 

> It, along with a .bbappend in meta-fsl-arm, is giving me runtime
> errors:
>   Using calibration data stored in /etc/pointercal.xinput
>   Invalid format 42060
>   unable to find device EETI eGalax Touch Screen
>   Warning: error parsing geometry string - using defaults.
>   Using calibration data stored in /etc/pointercal.xinput
>   Invalid format 42060
>   unable to find device EETI eGalax Touch Screen
>   Warning: error parsing geometry string - using defaults.

Are you using this specific touch screen in your device? 

Most probably, we should fix the pointercal.xinput file in meta-fsl-arm for the
latest xinput_calibrator, for your machine. Please do file a bug.

Best Regards,
Maxin

