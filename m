Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDB9719B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 13:55:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9UDu0Xb007548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Oct 2017 06:56:00 -0700 (PDT)
Received: from [128.224.20.234] (128.224.20.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 30 Oct 2017 06:55:59 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, ChenQi
	<Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
	<9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
	<0973040A-9027-4FEF-A333-5350D48E02E7@linux.intel.com>
From: Konrad Scherer <Konrad.Scherer@windriver.com>
Message-ID: <8083f668-b00f-1772-805f-eb96a6d69c97@windriver.com>
Date: Mon, 30 Oct 2017 09:55:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <0973040A-9027-4FEF-A333-5350D48E02E7@linux.intel.com>
X-Originating-IP: [128.224.20.234]
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
X-List-Received-Date: Mon, 30 Oct 2017 13:56:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

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

