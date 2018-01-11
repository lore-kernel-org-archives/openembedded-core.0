Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 27F9478830
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 17:49:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0BHnG5k007842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 11 Jan 2018 17:49:17 GMT
Message-ID: <1515692956.29722.122.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Martin Kelly
	<mkelly@xevo.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jan 2018 17:49:16 +0000
In-Reply-To: <83efbf54-dde5-2a84-00a0-6db5fc9e7ee5@linux.intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
	<20180104131238.21452-2-alexander.kanavin@linux.intel.com>
	<CAJTo0Lb4YRsAknNGhzc_dqGS7wJgFzxL_siyqQAGJ=9Wy7Cm+g@mail.gmail.com>
	<0ff515da-6221-7074-11c9-96b1cb8380ba@linux.intel.com>
	<64c07649-f0df-9acc-fbf3-e8f6a52db9f1@xevo.com>
	<1515610131.29722.112.camel@linuxfoundation.org>
	<9a261bf7-62c9-2aa9-9fa2-d27bb6ff7653@xevo.com>
	<83efbf54-dde5-2a84-00a0-6db5fc9e7ee5@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] gnomebase-meson.bbclass: add a meson-specific version
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
X-List-Received-Date: Thu, 11 Jan 2018 17:49:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-11 at 13:35 +0200, Alexander Kanavin wrote:
> On 01/10/2018 09:11 PM, Martin Kelly wrote:
> > 
> > Yes, to be clear, I'm not griping, as I'm very happy meson landed
> > in 
> > OE-core, and I'm working on SDK support now. I have an OE-core
> > thread 
> > going with meson upstream to get the issue fixed.
> > 
> > To be clear though, I'm not sure it even regressed. AFAICT, it
> > never 
> > quite worked.
> > 
> > Where would I add SDK tests for this?
> meta/lib/oeqa/selftest/cases is the place. Not sure what existing
> SDK 
> tests are already there.

Actually, no. See:

$ ls meta/lib/oeqa/sdk/cases/
buildcpio.py
buildgalculator.py
buildlzip.py
gcc.py
perl.py
python.py

There is also "sdkext" for the eSDK.

You'd run these with:

INHERIT += "testimage"

and then

bitbake <sdk-target> -c testsdk

Cheers,

Richard


