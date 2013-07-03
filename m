Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 51C31618B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 22:13:35 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Jul 2013 15:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,991,1363158000"; d="scan'208";a="263826029"
Received: from unknown (HELO helios.localnet) ([10.252.121.252])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Jul 2013 15:13:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 03 Jul 2013 23:13:26 +0100
Message-ID: <23272091.y20nHRCnfc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <51D49B7A.1070906@linux.intel.com>
References: <1372845322-12862-1-git-send-email-net147@gmail.com>
	<51D49B7A.1070906@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4: upgrade to 4.8.5
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
X-List-Received-Date: Wed, 03 Jul 2013 22:13:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 July 2013 14:45:30 Saul Wold wrote:
> On 07/03/2013 02:55 AM, Jonathan Liu wrote:
> > Removed patches integrated upstream.
> 
> Jonathan,
> 
> I am seeing the following failures on a world build:
> > Found library in wrong location:
> > /usr/bin/qtopia/examples/declarative/cppextensions/plugins/.debug/libqmlq
> > widgetsplugin.so Found library in wrong location:
> > /usr/bin/qtopia/examples/declarative/cppextensions/plugins/com/nokia/Time
> > Example/libqmlqtimeexampleplugin.so Found library in wrong location:
> > /usr/bin/qtopia/examples/declarative/cppextensions/plugins/com/nokia/Time
> > Example/.debug/libqmlqtimeexampleplugin.so ERROR: QA run found fatal
> > errors. Please consider fixing them.
> > ERROR: Function failed: do_package_qa
> > ERROR: Logfile of failure stored in:
> > /srv/hdd/builds/world/tmp/work/mips32-poky-linux/qt4-embedded/4.8.5-r52.4
> > /temp/log.do_package.29418 ERROR: Task 1259
> > (/srv/hdd/poky/meta/recipes-qt/qt4/qt4-embedded_4.8.5.bb, do_package)
> > failed with exit code '1' ERROR: QA Issue: Found library in wrong
> > location:
> > /usr/bin/qt4/examples/tools/styleplugin/styles/libsimplestyleplugin.so
> > Found library in wrong location:
> > /usr/bin/qt4/examples/tools/styleplugin/styles/.debug/libsimplestyleplugi
> > n.so Found library in wrong location:
> > /usr/bin/qt4/examples/tools/echoplugin/plugin/libechoplugin.so Found
> > library in wrong location:
> > /usr/bin/qt4/examples/tools/echoplugin/plugin/.debug/libechoplugin.so
> > Found library in wrong location:
> > /usr/bin/qt4/examples/tools/plugandpaint/plugins/libpnp_extrafilters.so
> > Found library in wrong location:
> > /usr/bin/qt4/examples/tools/plugandpaint/plugins/.debug/libpnp_extrafilte
> > rs.so Found library in wrong location:
> > /usr/bin/qt4/examples/declarative/cppextensions/imageprovider/ImageProvid
> > erCore/libqmlimageproviderplugin.so Found library in wrong location:
> > /usr/bin/qt4/examples/declarative/cppextensions/imageprovider/ImageProvid
> > erCore/.debug/libqmlimageproviderplugin.so Found library in wrong
> > location:
> > /usr/bin/qt4/examples/declarative/cppextensions/qwidgets/QWidgets/libqmlq
> > widgetsplugin.so Found library in wrong location:
> > /usr/bin/qt4/examples/declarative/cppextensions/qwidgets/QWidgets/.debug/
> > libqmlqwidgetsplugin.so Found library in wrong location:
> > /usr/bin/qt4/examples/declarative/cppextensions/plugins/libqmlqwidgetsplu
> > gin.so Found library in wrong location:
> > /usr/bin/qt4/examples/declarative/cppextensions/plugins/.debug/libqmlqwid
> > getsplugin.so Found library in wrong location:
> > /usr/bin/qt4/examples/declarative/cppextensions/plugins/com/nokia/TimeExa
> > mple/libqmlqtimeexampleplugin.so Found library in wrong location:
> > /usr/bin/qt4/examples/declarative/cppextensions/plugins/com/nokia/TimeExa
> > mple/.debug/libqmlqtimeexampleplugin.so ERROR: QA run found fatal errors.
> > Please consider fixing them.
> > ERROR: Function failed: do_package_qa
> > ERROR: Logfile of failure stored in:
> > /srv/hdd/builds/world/tmp/work/mips32-poky-linux/qt4-x11-free/4.8.5-r50.4
> > /temp/log.do_package.29597 ERROR: Task 2733
> > (/srv/hdd/poky/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb, do_package)
> > failed with exit code '1' NOTE: Tasks Summary: Attempted 11487 tasks of
> > which 6160 didn't need to be rerun and 3 failed. No currently running
> > tasks (11487 of 11561)

I wonder if this check is being a little bit overzealous... perhaps we should 
switch it back to WARN_QA for now.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

