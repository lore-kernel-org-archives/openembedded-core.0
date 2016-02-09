Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A60BE60588
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 10:40:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 09 Feb 2016 02:40:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,420,1449561600"; d="scan'208";a="742956942"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 09 Feb 2016 02:40:09 -0800
To: openembedded-core@lists.openembedded.org
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
	<CAJTo0LYW=LbsM8kaaqUnukH_p7U1i-EpXcPsekjbjwFooxXW9g@mail.gmail.com>
	<DUB130-W6784E5708A3084D22AA513DAD60@phx.gbl>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56B9C154.2030002@linux.intel.com>
Date: Tue, 9 Feb 2016 12:37:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <DUB130-W6784E5708A3084D22AA513DAD60@phx.gbl>
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
X-List-Received-Date: Tue, 09 Feb 2016 10:40:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2016 12:30 PM, Chris Trobridge wrote:
> One thing I failed to mention when I reported on this previously is that
> I needed to patch polkit_0.113.bb:
>
> -DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub mozjs"
> +DEPENDS = "expat glib-2.0 intltool-native gobject-introspection mozjs"
>
> This seems quite obvious, so I am sure you're aware of it.  That was all
> I needed but there are other references to gobject-introspection-stub in:
>
> meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
> meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
> meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
> meta-oe/recipes-support/upower/upower_0.9.14.bb

Those recipes are all in meta-oe - fixing them is not in scope at the 
moment. For now the introspection patchset is strictly for oe-core.

You are welcome to develop and maintain a companion meta-oe patchset though.

Alex


