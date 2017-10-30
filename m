Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D7FAD771F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 14:42:44 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 30 Oct 2017 07:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,320,1505804400"; d="scan'208";a="143885299"
Received: from mlehtone-mac02.fi.intel.com (HELO [10.237.66.46])
	([10.237.66.46])
	by orsmga004.jf.intel.com with ESMTP; 30 Oct 2017 07:42:44 -0700
User-Agent: Microsoft-MacOutlook/f.27.0.171010
Date: Mon, 30 Oct 2017 16:42:43 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Konrad Scherer <Konrad.Scherer@windriver.com>,
	ChenQi <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Message-ID: <E8F574EB-8489-49D9-8202-7DD5A77875D8@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v5 05/10] bitbake.conf: add ip and scp to
	HOSTTOOLS unconditionally
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
	<9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
	<0973040A-9027-4FEF-A333-5350D48E02E7@linux.intel.com>
	<8083f668-b00f-1772-805f-eb96a6d69c97@windriver.com>
In-Reply-To: <8083f668-b00f-1772-805f-eb96a6d69c97@windriver.com>
Mime-version: 1.0
Subject: Re: [PATCH v5 05/10] bitbake.conf: add ip and scp to HOSTTOOLS unconditionally
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
X-List-Received-Date: Mon, 30 Oct 2017 14:42:45 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

Hi,

I do not run any runtime tests, I just use the available library functions to run python profiling task on the device. No changes to local.conf are / should be required.

Cheers,
  Markus

On 30/10/2017, 15.56, "Konrad Scherer" <Konrad.Scherer@windriver.com> wrote:

    On 10/30/2017 06:51 AM, Markus Lehtonen wrote:
    > Hi,
    > 
    > What that tries state is that the image uses facilities written for
    > runtimetest (i.e. oeqa.targetcontrol) to run binaries on the target
    > machine. The new image introduced (i.e. python-pgo-image) uses this
    > to run the profiling task on device.
    
    I ran into something very similar. When using 'TEST_IMAGE = 1' (which
    uses testimage-auto), the conditional in bitbake.conf doesn't work and 
    ip and ping are not available in tmp/hosttools.
    
    When using just 'INHERIT += "testimage"' the conditional works but the 
    tests are not run automatically.
    
    If I use both 'TEST_IMAGE = 1' and 'INHERIT += "testimage"' together,
    the hosttools are found and the tests are run successfully.
    
    This is unexpected because classes/testimage-auto.bbclass does contain
    'inherit testimage'.
    
    What config options are you putting in local.conf to trigger the tests?
    
    -- 
    Konrad Scherer, MTS, Linux Products Group, Wind River
    



