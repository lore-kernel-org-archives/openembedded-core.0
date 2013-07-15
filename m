Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DFD9D60666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 08:48:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2013 01:50:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,667,1367996400"; d="scan'208";a="370325554"
Received: from unknown (HELO helios.localnet) ([10.252.122.64])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2013 01:48:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Date: Mon, 15 Jul 2013 09:48:15 +0100
Message-ID: <3096832.OcaoZJbLJn@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1494076.GQbbvjWTEm@yiqingliang-pc>
References: <1494076.GQbbvjWTEm@yiqingliang-pc>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt 4.8.5 package error
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
X-List-Received-Date: Mon, 15 Jul 2013 08:48:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 July 2013 09:12:23 Yi Qingliang wrote:
> hello,
> 	I'm using latest poky, when packaging qte, got following error, any idea?
> 
> ERROR: QA Issue: Found library in wrong location:
> /usr/bin/qtopia/examples/tools/styleplugin/styles/libsimplestyleplugin.so
> Found library in wrong location:
> /usr/bin/qtopia/examples/tools/styleplugin/styles/.debug/libsimplestyleplugi
> n.so Found library in wrong location:
> /usr/bin/qtopia/examples/tools/echoplugin/plugin/libechoplugin.so
> Found library in wrong location:
> /usr/bin/qtopia/examples/tools/echoplugin/plugin/.debug/libechoplugin.so
> Found library in wrong location:
> /usr/bin/qtopia/examples/tools/plugandpaint/plugins/libpnp_extrafilters.so
> Found library in wrong location:
> /usr/bin/qtopia/examples/tools/plugandpaint/plugins/.debug/libpnp_extrafilte
> rs.so Found library in wrong location:
> /usr/bin/qtopia/examples/declarative/cppextensions/imageprovider/ImageProvid
> erCore/libqmlimageproviderplugin.so Found library in wrong location:
> /usr/bin/qtopia/examples/declarative/cppextensions/imageprovider/ImageProvid
> erCore/.debug/libqmlimageproviderplugin.so Found library in wrong location:
> /usr/bin/qtopia/examples/declarative/cppextensions/qwidgets/QWidgets/libqmlq
> widgetsplugin.so Found library in wrong location:
> /usr/bin/qtopia/examples/declarative/cppextensions/qwidgets/QWidgets/.debug/
> libqmlqwidgetsplugin.so Found library in wrong location:
> /usr/bin/qtopia/examples/declarative/cppextensions/plugins/libqmlqwidgetsplu
> gin.so Found library in wrong location:
> /usr/bin/qtopia/examples/declarative/cppextensions/plugins/com/nokia/TimeExa
> mple/libqmlqtimeexampleplugin.so Found library in wrong location:
> /usr/bin/qtopia/examples/declarative/cppextensions/plugins/com/nokia/TimeExa
> mple/.debug/libqmlqtimeexampleplugin.so Found library in wrong location:
> /usr/bin/qtopia/examples/declarative/cppextensions/plugins/.debug/libqmlqwid
> getsplugin.so ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa

Please pull the latest changes, this has been switched back to a warning.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

