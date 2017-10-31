Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8734B60746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 06:33:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9V6Xix1017579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Oct 2017 23:33:44 -0700 (PDT)
Received: from [128.224.163.189] (128.224.163.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 30 Oct 2017 23:33:43 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, Konrad Scherer
	<Konrad.Scherer@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
	<9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
	<0973040A-9027-4FEF-A333-5350D48E02E7@linux.intel.com>
	<8083f668-b00f-1772-805f-eb96a6d69c97@windriver.com>
	<E8F574EB-8489-49D9-8202-7DD5A77875D8@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ed3ef63c-70e9-71d9-c068-509f462e7f95@windriver.com>
Date: Tue, 31 Oct 2017 14:34:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <E8F574EB-8489-49D9-8202-7DD5A77875D8@linux.intel.com>
X-Originating-IP: [128.224.163.189]
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
X-List-Received-Date: Tue, 31 Oct 2017 06:33:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Konrad,

I've sent out a patch to fix the problem you encountered.

Markus,

I kind of understand what you are doing. You are trying to use library 
functions in oeqa. And that requires scp and ip available. Right?
To be clear, I don't have any objection to the any change to HOSTTOOLS. 
Just one thing, we need to keep doc in sync.
And one more thing, I cannot find python-pgo-image.

HOSTTOOLS has its default value set in bitbake.conf, and we could modify 
it in other conf files like distro conf or local.conf. Could this 
possibly be your solution?

Best Regards,
Chen Qi

On 10/30/2017 10:42 PM, Markus Lehtonen wrote:
> Hi,
>
> I do not run any runtime tests, I just use the available library functions to run python profiling task on the device. No changes to local.conf are / should be required.
>
> Cheers,
>    Markus
>
> On 30/10/2017, 15.56, "Konrad Scherer" <Konrad.Scherer@windriver.com> wrote:
>
>      On 10/30/2017 06:51 AM, Markus Lehtonen wrote:
>      > Hi,
>      >
>      > What that tries state is that the image uses facilities written for
>      > runtimetest (i.e. oeqa.targetcontrol) to run binaries on the target
>      > machine. The new image introduced (i.e. python-pgo-image) uses this
>      > to run the profiling task on device.
>      
>      I ran into something very similar. When using 'TEST_IMAGE = 1' (which
>      uses testimage-auto), the conditional in bitbake.conf doesn't work and
>      ip and ping are not available in tmp/hosttools.
>      
>      When using just 'INHERIT += "testimage"' the conditional works but the
>      tests are not run automatically.
>      
>      If I use both 'TEST_IMAGE = 1' and 'INHERIT += "testimage"' together,
>      the hosttools are found and the tests are run successfully.
>      
>      This is unexpected because classes/testimage-auto.bbclass does contain
>      'inherit testimage'.
>      
>      What config options are you putting in local.conf to trigger the tests?
>      
>      --
>      Konrad Scherer, MTS, Linux Products Group, Wind River
>      
>
>
>


