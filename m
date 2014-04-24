Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9765165D71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:01:44 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4J00GYHRE0ENQ0@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 24 Apr 2014 13:01:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A65B52011D; Thu,
	24 Apr 2014 14:01:12 -0400 (EDT)
Date: Thu, 24 Apr 2014 14:01:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-id: <20140424180112.GW11339@denix.org>
References: <1382459830-15683-1-git-send-email-trini@ti.com>
	<20131031112730.GU19303@bill-the-cat>
	<20140423234156.GV11339@denix.org>
	<1425117.VHBJzLZIOr@peggleto-mobl5.ger.corp.intel.com>
MIME-version: 1.0
In-reply-to: <1425117.VHBJzLZIOr@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: Update touchscreen rule for ID_INPUT_TOUCHSCREEN
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
X-List-Received-Date: Thu, 24 Apr 2014 18:01:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 24, 2014 at 09:56:20AM +0100, Paul Eggleton wrote:
> On Wednesday 23 April 2014 19:41:56 Denys Dmytriyenko wrote:
> > On Thu, Oct 31, 2013 at 07:27:30AM -0400, Tom Rini wrote:
> > > On Tue, Oct 22, 2013 at 12:37:10PM -0400, Tom Rini wrote:
> > > > Since udev 174 udev has been running input_id as a built-in command and
> > > > setting this value in the environment for touchscreens.  Use this logic
> > > > to detect when to make a touchscreen0 symlink.
> > > > 
> > > > Signed-off-by: Tom Rini <trini@ti.com>
> > > > ---
> > > > 
> > > >  meta/recipes-core/udev/udev/local.rules |    2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/recipes-core/udev/udev/local.rules
> > > > b/meta/recipes-core/udev/udev/local.rules index 72d92ef..d0b0216 100644
> > > > --- a/meta/recipes-core/udev/udev/local.rules
> > > > +++ b/meta/recipes-core/udev/udev/local.rules
> > > > @@ -17,5 +17,5 @@
> > > > 
> > > >  ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*",
> > > >  RUN+="/sbin/modprobe $env{MODALIAS}"
> > > >  
> > > >  # Create a symlink to any touchscreen input device
> > > > 
> > > > -SUBSYSTEM=="input", KERNEL=="event[0-9]*",
> > > > ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*",
> > > > SYMLINK+="input/touchscreen0" +SUBSYSTEM=="input",
> > > > KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1",
> > > > SYMLINK+="input/touchscreen0"> 
> > > Ping
> > 
> > Was it ever reviewed? Ping^2
> 
> Sorry, what do you mean? It was reviewed and merged:
> 
> http://cgit.openembedded.org/openembedded-core/commit/?id=5abcfcd4380aacafc45d776f557738fb18089113

Oops, I guess I looked in Dora and it was merged after the release. Sorry for 
the noise.

-- 
Denys

