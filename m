Return-Path: <bruno.bottazzini@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A327A60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 15:48:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2015 07:44:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,481,1418112000"; d="scan'208";a="658080616"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO
	bottazzini-ThinkPad-T430) ([10.218.99.160])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2015 07:48:02 -0800
Date: Wed, 28 Jan 2015 13:47:56 -0200
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>
Message-ID: <20150128134756.1cce32c4@bottazzini-ThinkPad-T430>
In-Reply-To: <1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1421870458-9958-1-git-send-email-bruno.bottazzini@intel.com>
Organization: Intel
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] kmod new packageconfig and dbus split package
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
X-List-Received-Date: Wed, 28 Jan 2015 15:48:04 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2015 18:00:56 -0200
Bruno Bottazzini <bruno.bottazzini@intel.com> wrote:

Guys, were you able to look at this patch ?

> In this patchset we include two changes:
> 
> 1- kmod: new PACKAGECONFIG debug and logging to help reduce binary
> size. 2- dbus: split it into two package. We will be able to choose
> if we want the full version or a smaller one.
> 
> Gustavo Sverzut Barbieri (2):
>   kmod: new PACKAGECONFIG debug and logging to help reduce binary
> size. dbus: split tools package.
> 
>  meta/recipes-core/dbus/dbus.inc   | 13 +++++++------
>  meta/recipes-kernel/kmod/kmod.inc |  5 ++++-
>  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> --
> 1.9.1
> 


