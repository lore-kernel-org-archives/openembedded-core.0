Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EB2E165CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 20:06:43 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 02 Aug 2016 13:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,462,1464678000"; 
	d="scan'208,217";a="1018477800"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.8.236])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2016 13:06:30 -0700
Message-ID: <1470168389.2984.24.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Dengke Du <dengke.du@windriver.com>
Date: Tue, 02 Aug 2016 21:06:29 +0100
In-Reply-To: <CAJTo0LaevDthmEf=w4Z0CE3C4d3G4-FUxOu8yJaFX8NjdzZDCg@mail.gmail.com>
References: <cover.1469595557.git.dengke.du@windriver.com>
	<63d457eb9aeb264ae65e31c1e78f8024609a38c3.1469595557.git.dengke.du@windriver.com>
	<CAJTo0LaevDthmEf=w4Z0CE3C4d3G4-FUxOu8yJaFX8NjdzZDCg@mail.gmail.com>
X-Mailer: Evolution 3.20.4 (3.20.4-1.fc24) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] perf: enable man pages for 'help' functionality
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
X-List-Received-Date: Tue, 02 Aug 2016 20:06:46 -0000
Content-Type: multipart/alternative; boundary="=-PG2Qk/wZMwniuGQwcsEv"

--=-PG2Qk/wZMwniuGQwcsEv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-08-02 at 17:56 +0100, Burton, Ross wrote:
> Hi,
> 
> > On 27 July 2016 at 06:02, Dengke Du <dengke.du@windriver.com> wrote:
> > > > When using 'perf help <subcommand>', it can't find 'man' command
and pages for
> > perf.
> > 
> > > > The perf man pages depends on the xmlto-native and asciidoc-native, 
so we just
> > 
> > > > need to add the two packages to the DEPENDS variable and add
'man'to
> > 
> > RDEPENDS_perf-doc.
> > 
> 
> > > > Whilst I like the idea of supporting more documentation, and have
long wanted to integrate doxygen/gtk-doc/etc into Yocto for building
SDKs with API documentation, I'm not sure we should be making random
packages depend on tooling to always generate documentation.
> 
> > > > > > What do people think of a distro feature / global environment
variable for "recipe should build the documentation"?  For perf this
would mean adding asciidoc so it can build the man pages, for GLib it
would mean depending on gtk-doc so the API docs can be generated, and
so on.  But if they're not needed then they can be disabled to
improve build speeds.
> 
> 

I like the idea. I've had a similar one in mind for a while now as it
would be a nice feature to be able to provide the documentation for an
image as an output of the system.

Regards,

Joshua

--=-PG2Qk/wZMwniuGQwcsEv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Tue, 2016-08-02 at 17:56 +0100, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra">Hi,</div><div class="gmail_extra"><br><div class="gmail_quote">On 27 July 2016 at 06:02, Dengke Du <span dir="ltr">&lt;<a href="mailto:dengke.du@windriver.com" target="_blank">dengke.du@windriver.com</a>&gt;</span> wrote:<br><blockquote type="cite"><div>When using '<span>perf</span> help &lt;subcommand&gt;', it can't find 'man' command and pages for<br>
<span>perf</span>.<br>
The <span>perf</span> man pages depends on the xmlto-native and asciidoc-native, so we just<br>
need to add the two packages to the DEPENDS variable and add 'man'to<br>
RDEPENDS_perf-doc.</div><br></blockquote></div><br>Whilst I like the idea of supporting more documentation, and have long wanted to integrate doxygen/gtk-doc/etc into Yocto for building SDKs with API documentation, I'm not sure we should be making random packages depend on tooling to always generate documentation.</div><div class="gmail_extra"><br></div><div>What do people think of a distro feature / global environment variable for "recipe should build the documentation"?&nbsp; For perf this would mean adding asciidoc so it can build the man pages, for GLib it would mean depending on gtk-doc so the API docs can be generated, and so on.&nbsp; But if they're not needed then they can be disabled to improve build speeds.</div></div>
</blockquote><div><br></div><div>I like the idea. I've had a similar one in mind for a while now as it would be a nice feature to be able to provide the documentation for an image as an output of the system.</div><div><br></div><div>Regards,</div><div><br></div><div>Joshua</div></body></html>

--=-PG2Qk/wZMwniuGQwcsEv--
