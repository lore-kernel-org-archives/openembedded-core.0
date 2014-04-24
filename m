Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8576A65D2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 08:56:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Apr 2014 01:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,917,1389772800"; d="scan'208";a="518683417"
Received: from pauljbro-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.245])
	by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2014 01:56:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Thu, 24 Apr 2014 09:56:20 +0100
Message-ID: <1425117.VHBJzLZIOr@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
In-Reply-To: <20140423234156.GV11339@denix.org>
References: <1382459830-15683-1-git-send-email-trini@ti.com>
	<20131031112730.GU19303@bill-the-cat>
	<20140423234156.GV11339@denix.org>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 24 Apr 2014 08:56:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 23 April 2014 19:41:56 Denys Dmytriyenko wrote:
> On Thu, Oct 31, 2013 at 07:27:30AM -0400, Tom Rini wrote:
> > On Tue, Oct 22, 2013 at 12:37:10PM -0400, Tom Rini wrote:
> > > Since udev 174 udev has been running input_id as a built-in command and
> > > setting this value in the environment for touchscreens.  Use this logic
> > > to detect when to make a touchscreen0 symlink.
> > > 
> > > Signed-off-by: Tom Rini <trini@ti.com>
> > > ---
> > > 
> > >  meta/recipes-core/udev/udev/local.rules |    2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-core/udev/udev/local.rules
> > > b/meta/recipes-core/udev/udev/local.rules index 72d92ef..d0b0216 100644
> > > --- a/meta/recipes-core/udev/udev/local.rules
> > > +++ b/meta/recipes-core/udev/udev/local.rules
> > > @@ -17,5 +17,5 @@
> > > 
> > >  ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*",
> > >  RUN+="/sbin/modprobe $env{MODALIAS}"
> > >  
> > >  # Create a symlink to any touchscreen input device
> > > 
> > > -SUBSYSTEM=="input", KERNEL=="event[0-9]*",
> > > ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*",
> > > SYMLINK+="input/touchscreen0" +SUBSYSTEM=="input",
> > > KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1",
> > > SYMLINK+="input/touchscreen0"> 
> > Ping
> 
> Was it ever reviewed? Ping^2

Sorry, what do you mean? It was reviewed and merged:

http://cgit.openembedded.org/openembedded-core/commit/?id=5abcfcd4380aacafc45d776f557738fb18089113

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

