Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB777705F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 01:27:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1Q1RAg6016647
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Feb 2016 17:27:10 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 17:27:10 -0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <56CED925.5090700@windriver.com>
	<CAJTo0La3R6rUxvNvvPCrXje-QYLtV6LH2wnLnL2gc6iMhLFV5A@mail.gmail.com>
	<CADkTA4NrW5QdDyibfDeDmv313-w=p_NkxKjJq_eUpZVogug_SA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56CFA9EC.7040108@windriver.com>
Date: Fri, 26 Feb 2016 09:27:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4NrW5QdDyibfDeDmv313-w=p_NkxKjJq_eUpZVogug_SA@mail.gmail.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu needs target kernel sets CONFIG_SCSI_VIRTIO=y to boot vmdk qcow2 and vdi
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
X-List-Received-Date: Fri, 26 Feb 2016 01:27:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/25/2016 08:42 PM, Bruce Ashfield wrote:
>
>
> On Thu, Feb 25, 2016 at 7:10 AM, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>
>     On 25 February 2016 at 10:36, Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>> wrote:
>
>         We need enable target kernel's CONFIG_SCSI_VIRTIO=y to make native qemu
>         can boot hdddirect, vmdk, qcow2 and vdi, otherwise, the scsi drive can't
>         work in qemu since our vm image's root default to /dev/sda2, or we can
>         change it default to /dev/hda2, then we don't have to make any changes
>         on kernel, but I prefer scsi since ide is going to be out of date.
>
>
>     Are there any other virtio drivers that we really should be enabling in the
>     qemu kernels?
>
>
> We already have a fragment for this, and a set of virtio drivers enabled .. which

Yes, others are fine AFAIK.

// Robert

> is why I find this entire thread confusing :)
>
> Bruce
>
>
>     Ross
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its
> end"

