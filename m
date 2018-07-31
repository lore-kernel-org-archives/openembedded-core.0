Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC9E6004D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 15:22:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6VFMAYt011634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 31 Jul 2018 16:22:11 +0100
Message-ID: <86a14d593b662d9d9f10248343e515d16afdb8b3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 16:22:10 +0100
In-Reply-To: <1533046545-18047-1-git-send-email-maxin.john@intel.com>
References: <1533046545-18047-1-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] machine: remove kernel-modules from RRECOMMENDS
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
X-List-Received-Date: Tue, 31 Jul 2018 15:22:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-07-31 at 17:15 +0300, Maxin B. John wrote:
> qemumips,qemumips64 and x86 based machines include kernel-modules by
> default. Remove the kernel modules from RRECOMMENDS to make it
> consistent
> across the machines.
> 
> Tested using core-image-sato on qemumips, qemumips64, qemux86 and
> qemux86-64
> 
> [YOCTO #12383]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/conf/machine/include/x86-base.inc | 2 --
>  meta/conf/machine/qemumips.conf        | 2 --
>  meta/conf/machine/qemumips64.conf      | 2 --
>  3 files changed, 6 deletions(-)

Looks good, do we need to add this to genericx86 or anything in meta-
intel given its changing x86-base.inc?

Cheers,

Richard

