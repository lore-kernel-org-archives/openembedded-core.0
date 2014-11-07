Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C4F6C65C87
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 09:33:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 07 Nov 2014 01:26:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,330,1413270000"; d="scan'208";a="618753110"
Received: from moyraecc-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.2])
	by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2014 01:33:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 07 Nov 2014 09:33:03 +0000
Message-ID: <5468684.VLqs9Mf4f5@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.7-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <FDB6E297-1CE7-499E-ACF8-CDC20BF3AD86@dominion.thruhere.net>
References: <1415259476-3411-1-git-send-email-koen@dominion.thruhere.net>
	<2205188.KeVNzL1xBI@peggleto-mobl5.ger.corp.intel.com>
	<FDB6E297-1CE7-499E-ACF8-CDC20BF3AD86@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gptfdisk: add 0.8.10+git version
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
X-List-Received-Date: Fri, 07 Nov 2014 09:33:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 November 2014 14:28:49 Koen Kooi wrote:
> Op 6 nov. 2014, om 12:27 heeft Paul Eggleton <paul.eggleton@linux.intel.com> 
het volgende geschreven:
> > Hi Koen,
> > 
> > On Thursday 06 November 2014 08:37:56 Koen Kooi wrote:
> >> Besides from being useful as fdisk replacement this gives us 'sgdisk'
> >> which can be used to set the GUID for partitions, e.g.
> >> 
> >> 	sgdisk -t 1:C12A7328-F81F-11D2-BA4B-00A0C93EC93B /dev/mmcblk0p1
> >> 
> >> To mark it as ESP in scripts like mkefidisk.sh.
> >> 
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> meta/recipes-devtools/fdisk/gptfdisk_git.bb | 22 ++++++++++++++++++++++
> >> 1 file changed, 22 insertions(+)
> >> create mode 100644 meta/recipes-devtools/fdisk/gptfdisk_git.bb
> >> 
> >> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb
> >> b/meta/recipes-devtools/fdisk/gptfdisk_git.bb new file mode 100644
> >> index 0000000..62c32c3
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/fdisk/gptfdisk_git.bb
> >> @@ -0,0 +1,22 @@
> >> ...
> >> +S = "${WORKDIR}/git"
> >> +
> >> +do_install() {
> >> +    install -d ${D}${bindir}
> >> +    install -m 0755 cgdisk ${D}${bindir}
> >> +    install -m 0755 gdisk ${D}${bindir}
> >> +    install -m 0755 sgdisk ${D}${bindir}
> >> +    install -m 0755 fixparts ${D}${bindir}
> > 
> > Technically shouldn't these be in ${sbindir} ?
> 
> Personally I think sbindir is a misguided idea, PATH is a very easy to get
> around security measure. Having said that, I have no objection to
> installing these things in $sbindir if it's requiered to get this into
> OE-core.

I wouldn't have thought it to be required, I was just wondering if this was 
something we wanted to stick to.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

