Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E2E4B605BB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 15:41:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 02 Dec 2015 07:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,373,1444719600"; d="scan'208";a="698825984"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 02 Dec 2015 07:41:41 -0800
To: openembedded-core@lists.openembedded.org
References: <C9B171200FE9514799693A59F76A8F1501A0949293@AEP-EXCH-UK-01.ULTRA-AEP.COM>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <565F10BA.9060006@linux.intel.com>
Date: Wed, 2 Dec 2015 17:39:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <C9B171200FE9514799693A59F76A8F1501A0949293@AEP-EXCH-UK-01.ULTRA-AEP.COM>
Subject: Re: python3 dbus
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
X-List-Received-Date: Wed, 02 Dec 2015 15:41:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2015 05:26 PM, Chris Trobridge wrote:

> I have a dbus-based service written in python3 that I want run on a
> Yocto system.
>
> I can run python3 and have patched a few python module recipes to
> python3 but the big outstanding issue is dbus, and gi.repository.GObject
> in particular.
>
> I can see various discussions about keeping this up to date on python2
> (meta-gir).
>
> I would like some advice on whether I would be better off back-porting
> the python3 service to 2.7 (which would be disappointing but not a major
> undertaking) or whether it would be reasonable to modify the existing
> python 2.7 dbus/gobject  recipes to python3.
>
> I am tending to back-porting to 2.7 but I am not 100% confident that
> dbus/gobject works with either version of python in Yocto?

Work to integrate gobject introspection directly to oe-core is ongoing 
and we aim to have it in 2.1 release. You can find the current patches here:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/gobject-introspection-experimental

The introduction is here:
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/113390.html

Do give it a try.

Alex

