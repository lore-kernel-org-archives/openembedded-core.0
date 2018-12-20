Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA187C0C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 01:17:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBK1HAdp013718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Dec 2018 17:17:21 -0800
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Dec 2018 17:17:02 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1545204865.git.kai.kang@windriver.com>
	<922e1e9572f10bfe3d8d08f2e79f3d6505aa5b28.1545204865.git.kai.kang@windriver.com>
	<CAJTo0LZpHKrEmYA3y__V7F=S8zM7UdOWu1BUZLGrta_g_48OVQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <85099b1e-e61c-89ce-2a30-1d41eab5e34c@windriver.com>
Date: Thu, 20 Dec 2018 09:14:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZpHKrEmYA3y__V7F=S8zM7UdOWu1BUZLGrta_g_48OVQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] grub-efi-native: workaround for fedora 29
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
X-List-Received-Date: Thu, 20 Dec 2018 01:17:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/12/19 下午6:43, Burton, Ross wrote:
> On Wed, 19 Dec 2018 at 07:43, <kai.kang@windriver.com> wrote:
>> +Upstream-Status: Inappropriate [native]
> If we're going to mark this as inappropriate then please make it clear
> in the patch that its a workaround for a specific binutils and when
> that stops being used we can remove it.

binutils version has been addressed in the patch. I'll update with 
workaround info.


> However isn't this a problem
> when building grub on F29, even outside of Yocto?  If so then it's not
> inappropriate, it's an upstream bug and they should have the fix.


It is native build related, so grub is not affected that no grub-native 
is provided. I have created a defect on RedHat bugzilla:

https://bugzilla.redhat.com/show_bug.cgi?id=1660279


Regards,
Kai


>
> Ross
>

-- 
Kai Kang


