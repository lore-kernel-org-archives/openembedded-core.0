Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 520B671C90
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 01:47:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2R1lMxK028904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 26 Mar 2017 18:47:22 -0700
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 26 Mar 2017 18:47:21 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1490345691.git.liezhi.yang@windriver.com>
	<b72d9b60beb83ee4877df608ada45832bc80e3ed.1490345691.git.liezhi.yang@windriver.com>
	<CAJTo0La40qQRp_a4mfRvHBobtVBhuS1jrAgR0sBArQECO5UZ1g@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <cdcdd2b7-a8f5-ef30-ac9a-ef894ef76df8@windriver.com>
Date: Mon, 27 Mar 2017 09:47:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La40qQRp_a4mfRvHBobtVBhuS1jrAgR0sBArQECO5UZ1g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] apt: fix hardcode of /usr/lib
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
X-List-Received-Date: Mon, 27 Mar 2017 01:47:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/24/2017 08:05 PM, Burton, Ross wrote:
>
> On 24 March 2017 at 08:55, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     -       install -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/
>     +       install -m 0644 ${S}/debian/apt.systemd.daily ${D}${libdir}/apt/
>
>
> $ grep -r apt.systemd.daily
> debian/apt-daily.service:ExecStart=/usr/lib/apt/apt.systemd.daily
> debian/apt.apt-compat.cron.daily:exec /usr/lib/apt/apt.systemd.daily
>
> If you're going to move apt.systemd.daily, then you need to fix the references
> to it aswell.

Thanks, I will send apt's fix in another path since the other 2 patches are
in master-next.

// Robert

>
> Ross

