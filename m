Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDA916010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 08:13:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4I8Dn44026831
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 18 May 2016 01:13:49 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 01:13:48 -0700
To: Joshua G Lock <joshua.g.lock@linux.intel.com>, oe-core
	<openembedded-core@lists.openembedded.org>
References: <573C0726.3040402@windriver.com>
	<1463556849.3966.3.camel@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <573C243A.8060405@windriver.com>
Date: Wed, 18 May 2016 16:13:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1463556849.3966.3.camel@linux.intel.com>
Cc: "Cetola, Stephano" <stephano.cetola@intel.com>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Wed, 18 May 2016 08:13:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joshua,

Thanks, I read packagefeed-stability.bbclass just now. If
we can change PRserver's checksum to consider RDEPENDS only
(or make it optional) I will run a testing on that script.

// Robert

On 05/18/2016 03:34 PM, Joshua G Lock wrote:
> Hi Robert,
>
> On Wed, 2016-05-18 at 14:09 +0800, Robert Yang wrote:
>> The PRServer bumps PR according to do_package's task hash, that
>> causes it bumps *all* packages' PR when recipes like pseudo-native
>> and rpm-native is changed. It is a very bad user experience when we
>> run "smart/opkg upgrade" on running target, for example, when we
>> apply
>> a CVE patch to pseudo-native or rpm-native, or do some slight changes
>> in their do_compile, "smart/opkg upgrade" will download/install *all*
>> the packages since all of the packages' PR are bumped.
>
> Paul began working to address the package feed churn issue some time
> back using the tool build-compare from the openSUSE project.
>
> You can find links to various trees and a summary of the progress so
> far in this bugzilla entry:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8318
>
> It still needs some more work; most notably I'd like to see some tests
> that validates the functionality.
>
> Regards,
>
> Joshua
>

