Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8aSV-0002Gc-TW for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 18:24:40 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8RGPYBg027824 for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 17:25:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vrohDUsgLpqU
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 17:25:34 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8RGPSV4027818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 17:25:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 27 Sep 2011 17:19:04 +0100
In-Reply-To: <201109271516.15542.paul.eggleton@linux.intel.com>
References: <cover.1317131040.git.edwin.zhai@intel.com>
	<20110927140224.GA10415@edwin-gen>
	<201109271516.15542.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317140351.26109.166.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] remove gnome-vfs completely
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Sep 2011 16:24:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-27 at 15:16 +0100, Paul Eggleton wrote:
> On Tuesday 27 September 2011 15:02:24 Zhai, Edwin wrote:
> > BTW,
> > I found many recipes in meta-demoapps are not maintained: no
> > LIC_FILES_CHKSUM/SRCREV, no workable SRC_URI, and even no layer.conf under
> > meta-demoapps.
> > 
> > We need more test for demoapps, and require each commit to take care of
> > them, or else remove them completely...
> 
> My personal opinion as far as OE-core is concerned is that the whole of meta-
> demoapps should be removed; perhaps the recipes within it can be provided in 
> another layer (which we can then use within the Yocto project if desired) but 
> they do not belong in OE-core IMHO.

I agree it needs to become a separately layer and some of the components
there might be better in other locations.

Its something we meant to deal with later in the OE-Core development
cycle and basically forgot. Maybe someone could file an enhancement
bug? :)

First step would be to move it whole to its own layer repo.

Cheers,

Richard



