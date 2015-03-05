Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C24865C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 16:05:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Mar 2015 08:05:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,347,1422950400"; d="scan'208";a="675647350"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.51])
	([10.218.99.51])
	by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2015 08:05:09 -0800
Message-ID: <1425571500.2831.8.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Thu, 05 Mar 2015 13:05:00 -0300
In-Reply-To: <54F86D09.5060501@opendreambox.org>
References: <bruno.bottazzini@intel.com>
	<1425504462-6979-1-git-send-email-bruno.bottazzini@intel.com>
	<1425504462-6979-2-git-send-email-bruno.bottazzini@intel.com>
	<54F83775.5040604@opendreambox.org>
	<1425561390.2707.29.camel@bottazzini-ThinkPad-T430>
	<54F863AC.1050204@opendreambox.org>
	<1425565747.2831.4.camel@bottazzini-ThinkPad-T430>
	<54F86D09.5060501@opendreambox.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus: split tools package.
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
X-List-Received-Date: Thu, 05 Mar 2015 16:05:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Qui, 2015-03-05 at 15:49 +0100, Andreas Oberritter wrote:
> On 05.03.2015 15:29, Bottazzini, Bruno wrote:
> > I receive the following problem:
> > ERROR: Nothing RPROVIDES 'dbus-native-tools-native' (but
> > virtual:native:PATH/poky/meta/recipes-core/dbus/dbus_1.8.10.bb RDEPENDS
> > on or otherwise requires it
> > 
> > Any suggestion of how to fix it?
> 
> Try setting RRECOMMENDS_${PN}_class-native = "".

Nice! it worked perfectly and looks better, indeed.
As soon as we review the patch set, I will send a V2 with this
correction.

> 
> I still wonder why "-native" appears twice inside this dependency, but I
> fail to spot the cause inside the dbus recipe.

You are right, it is strange.

> 
> Regards,
> Andreas



