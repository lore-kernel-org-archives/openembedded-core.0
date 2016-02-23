Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E7BC36FF5D;
	Tue, 23 Feb 2016 14:03:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 23 Feb 2016 06:03:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="922083963"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2016 06:03:48 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id 43FBF6A4006; Tue, 23 Feb 2016 06:51:37 -0800 (PST)
Received: from 10.252.15.38 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Tue, 23 Feb 2016 16:51:37 +0200 (EET)
Message-ID: <64589.10.252.15.38.1456239097.squirrel@linux.intel.com>
Date: Tue, 23 Feb 2016 16:51:37 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>   
	<CAJTo0LYW=LbsM8kaaqUnukH_p7U1i-EpXcPsekjbjwFooxXW9g@mail.gmail.com> 
	<DUB130-W6784E5708A3084D22AA513DAD60@phx.gbl>   
	<56B9C154.2030002@linux.intel.com>
In-Reply-To: <56B9C154.2030002@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gobject introspection to oe-core
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
X-List-Received-Date: Tue, 23 Feb 2016 14:03:58 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
>> meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
>> meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
>> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
>> meta-oe/recipes-support/upower/upower_0.9.14.bb
>
> Those recipes are all in meta-oe - fixing them is not in scope at the
moment. For now the introspection patchset is strictly for oe-core.
>
> You are welcome to develop and maintain a companion meta-oe patchset
though.

Actually, scratch that. I realized that I'm probably the most qualified to
do this, and if I don't, there will be maintainer fury when introspection
lands in oe-core and dozens of recipes in meta-oe break. So without
further ado, here's the initial introspection patchset for meta-oe, which
you are welcome to try and test:
http://git.openembedded.org/meta-openembedded-contrib/log/?h=akanavin/gobject-introspection-fixes

Cheers,
Alex

