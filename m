Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EF3C3609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 08:49:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 01:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,426,1427785200"; d="scan'208";a="710043031"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by fmsmga001.fm.intel.com with ESMTP; 14 May 2015 01:49:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Date: Thu, 14 May 2015 09:49:46 +0100
Message-ID: <2514335.muUPAEFR2j@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48258F1A57@sestoex09.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48258ED362@sestoex09.enea.se>
	<20150508162311.GA20977@bang.betafive.co.uk>
	<3230301C09DEF9499B442BBE162C5E48258F1A57@sestoex09.enea.se>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: opkg and gpg signed ipk packages
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
X-List-Received-Date: Thu, 14 May 2015 08:49:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sona,

On Wednesday 13 May 2015 20:20:51 Sona Sarmadi wrote:
> > SHA256 is also supported. In OpenEmbedded, use the PACKAGECONFIG
> > 'sha256' then ensure that your Packages file contains a 'SHA256sum: ...'
> > line for each package.
> 
> Does anyone know where do I specify this PACKAGECONFIG configuration? I want
> all ipk packages to be checksummed using sha256 (in the Packages file that
> describes the ipk  packages). The default seems to be md5:
> 
> tmp/deploy/ipk/ppce500v2/Packages
> Package: acl-dbg
> Version: 2.2.52-r0
> Recommends: libc6-dbg, libattr-dbg, libacl-dbg
> Section: devel
> Architecture: ppce500v2
> Maintainer: Poky <poky@yoctoproject.org>
> MD5Sum: 0903a158d6c7acc825bf7e71b255d7fc     <<<<<

I'm guessing you would want something like this in your custom distro config 
(or local.conf if you must):

PACKAGECONFIG_append_pn-opkg = " sha256"
PACKAGECONFIG_append_pn-opkg-native = " sha256"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

