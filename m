Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E821606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 01:18:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6R1I1bt018657
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 26 Jul 2016 18:18:02 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 26 Jul 2016 18:18:00 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
	<CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57980BC4.80208@windriver.com>
Date: Wed, 27 Jul 2016 09:17:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Wed, 27 Jul 2016 01:18:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/26/2016 07:33 AM, Burton, Ross wrote:
>
> On 24 July 2016 at 06:16, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Fixed:
>     checking for XML::Parser... configure: error: XML::Parser perl module is
>     required for intltool
>
>     The module is installed to sysroot, but need use native perl to find it.
>
>
> This is fixed by [PATCH 2/2] intltool: remove broken XML::Parser detection.

Hi Ross,

I still get the same error after your patch applied:

configure:16513: checking for perl
configure:16531: found /usr/bin/perl
configure:16543: result: /usr/bin/perl
configure:16554: checking for perl >= 5.8.1
configure:16561: result: 5.18.2
configure:16565: checking for XML::Parser
configure:16571: error: XML::Parser perl module is required for intltool

// Robert

>
> Ross

