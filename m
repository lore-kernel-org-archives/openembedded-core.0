Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DA629608A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 08:14:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5L8Jafe014581; Fri, 21 Jun 2013 09:20:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yYsIf_ezWMwb; Fri, 21 Jun 2013 09:20:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5L8K73E014761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 21 Jun 2013 09:20:08 +0100
Message-ID: <1371802419.20823.288.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Fri, 21 Jun 2013 09:13:39 +0100
In-Reply-To: <CAPhnLPBBK1=GohMDVCSGseg=DWn_Ac32p+UjjbGff585rWTG_w@mail.gmail.com>
References: <CAPhnLPBBK1=GohMDVCSGseg=DWn_Ac32p+UjjbGff585rWTG_w@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Utilizing LAYERVERSION_ to identify breaking changes to a layer
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
X-List-Received-Date: Fri, 21 Jun 2013 08:14:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-20 at 15:56 -0700, Flanagan, Elizabeth wrote:
> I know I've run into this issue and I'm going to bet that other folks
> have as well.
> 
> When running some sort of continuous integration system (in my case,
> yocto-autobuilder), I need to build to at least two releases back. The
> problem is, sometimes, local.conf and bblayers.conf requirements
> change, for example, a layer needs a BBMASK for the prior release but
> can't have it for the current one or a layer gets split so that I need
> to add two directories to BBLAYERS as opposed to just the one that I
> used a few commits back. I currently have no great way of figuring
> that out and it has causes immense amounts of pain.
> 
> I'd like to propose extending LAYERVERSION (which is already utilized
> in oe-core as LAYERVERSION_core) out to other layers.
> 
> meta-angstrom LAYERVERSION_angstrom
> meta-baryon LAYERVERSION_baryon
> meta-beagleboard LAYERVERSION_beagleboard
> meta-browser LAYERVERSION_browser
> meta-fsl-arm LAYERVERSION_fsl-arm
> meta-fsl-ppc LAYERVERSION_fsl-ppc
> meta-guacamayo LAYERVERSION_guacamayo
> meta-intel LAYERVERSION_intel
> meta-minnow LAYERVERSION_minnow
> meta-ti LAYERVERSION_ti
> meta-xilinx LAYERVERSION_xilinx
> meta-yocto LAYERVERSION_yocto
> 
> For bsp layers with multiple machine layers, like meta-intel or
> meta-xilinx, I'd suggest something like:
>
> LAYERVERSION_layername_machinename

Can we match the name that is added to BBFILE_COLLECTIONS please? This
is then discoverable and matches existing data.

Cheers,

Richard



