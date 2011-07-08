Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDtU-0003JC-FN for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:27:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GNHR6021751
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:23:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21380-05 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 17:23:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GNBLw021745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:23:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201107081708.20895.paul.eggleton@linux.intel.com>
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<1310138939.20015.883.camel@rex>
	<CAP9ODKpcSZcKOjgBa3LEZTXEtizBUe219dzLNn_tvb6Pk=3K+A@mail.gmail.com>
	<201107081708.20895.paul.eggleton@linux.intel.com>
Date: Fri, 08 Jul 2011 17:22:31 +0100
Message-ID: <1310142151.20015.902.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 6/8] cmake: add nativesdk and target versions
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
X-List-Received-Date: Fri, 08 Jul 2011 16:27:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 17:08 +0100, Paul Eggleton wrote:
> On Friday 08 July 2011 16:49:12 Otavio Salvador wrote:
> > >> +# FIXME: Hack due gcc-crosssdk not being able to detect those
> > >> automatically +CXXFLAGS_virtclass-nativesdk += " \
> > >> +   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
> > >> +   -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++/${TARGET_SYS}
> > >> \ +   "
> > > 
> > > I get worried when I see things like this :(
> > > 
> > > Has anyone attempted to work out why gcc-crosssdk can't locate c++
> > > include files?
> > 
> > Not sure why but this is the same things as done on qt4-tools-nativesdk.
> 
> Yes, and I don't like it there either. Suggestions on fixing this would be 
> welcome - in the time I spent trying to figure out why it wasn't working (some 
> months ago) I couldn't find the cause.

Ok, I'm not happy but I guess this can go as is for now.

Paul: Can you open a bug against that being needed please?

So I'll merge libarchive and the cmake updates...

Cheers,

Richard



