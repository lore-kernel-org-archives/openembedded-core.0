Return-Path: <denis@denix.org>
X-Greylist: delayed 3600 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 01 Jul 2014 21:01:27 UTC
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 52D7D60169
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 21:01:27 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8100M5PUAFDJB0@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 01 Jul 2014 15:01:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D7EEF201B8; Tue,
	01 Jul 2014 16:01:26 -0400 (EDT)
Date: Tue, 01 Jul 2014 16:01:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20140701200126.GP1580@denix.org>
References: <CAAHuHfzRzh2LhFoc0VrdA+MqJiUOVwv_tNe9y48nOrk13ERHug@mail.gmail.com>
	<53B0DD86.4030402@windriver.com>
	<20140630081507.GA5083@ad.chargestorm.se>
MIME-version: 1.0
In-reply-to: <20140630081507.GA5083@ad.chargestorm.se>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Cape Manager
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
X-List-Received-Date: Tue, 01 Jul 2014 21:01:35 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 30, 2014 at 10:15:07AM +0200, Anders Darander wrote:
> * Robert Yang <liezhi.yang@windriver.com> [140630 05:47]:
> 
> 
> > On 06/30/2014 12:24 AM, Life Life wrote:
> > > Hello,
> 
> > > I'm trying build yocto based linux, My hardware is beaglebone black I
> > > successfull build system image. But I can't see capemanager. Beacuse my lcd is
> > > not work.
> 
> > Hello,
> 
> > The cape manager is in meta-ti layer:
> 
> > http://layers.openembedded.org/layerindex/branch/master/layer/meta-ti/
> 
> > Seems that we'd better add it to meta-yoco-bsp ?
> 
> Unless something has changed since I last looked at this, I don't think
> so. 
> 
> If I remember correctly, capemgr basically consists of a number of
> patches not in the mainline kernel (and also not in TI's staging
> kernel). I haven't checked it, by I doubt that we have them in the
> linux-yocto kernel. (Especially as the last time I checked it, you had
> to revert to a 3.8 (if I rember correctly, it might have been an even
> earlier kernel) kernel to get full capemgr support.
> 
> If this has changed, then it'd be interesting to know!

That is correct - capemgr was a patchset against 3.8. It is not yet available 
in mainline. It was developed and being adopted for the mainline by Pantelis 
Antoniou and the community, but since it's rather a complicated subsystem, it 
went through numerous revisions and changes, still not merged upstream though.

-- 
Denys

