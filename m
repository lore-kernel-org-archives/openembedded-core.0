Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 58832607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 11:17:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 09 Feb 2016 03:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,420,1449561600"; d="scan'208";a="880304673"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Feb 2016 03:11:05 -0800
To: openembedded-core@lists.openembedded.org
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
	<56B9C4E3.6040006@pseudoterminal.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56B9C893.1050705@linux.intel.com>
Date: Tue, 9 Feb 2016 13:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <56B9C4E3.6040006@pseudoterminal.org>
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
X-List-Received-Date: Tue, 09 Feb 2016 11:17:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2016 12:52 PM, Carlos Rafael Giani wrote:
> This is very interesting. Once gobject introspection is in place, vala
> based software like Rygel can finally be compiled directly from the vala
> source, which makes it much easier to apply patches against it.
> Also, I think the GStreamer 1.0 Python bindings need GIR. This recipe
> could then be reintroduced (it was there, but got removed).

Gstreamer Python bindings are not real bindings as such - they are a few 
tweaks and overrides on top of standard Python's support for 
introspection (which provided by pygobject), and they also add support 
for writing gstreamer elements in python.

Generally, nowadays any support for GLib-based software in language 
environments other than C or C++ is provided only through introspection.

If you want to write your software in anything else than C or C++, and 
you want to use gstreamer, webkit, gtk, glib's dbus support, etc., you 
have to have introspection working:
https://wiki.gnome.org/Projects/GObjectIntrospection/Users


Alex

