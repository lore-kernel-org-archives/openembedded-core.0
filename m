Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UD1sG-0008A4-Hi for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 01:06:25 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25Nusga009254; Tue, 5 Mar 2013 23:57:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i2V71NE7Q-Ct; Tue,  5 Mar 2013 23:57:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r25NvWqM009276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 5 Mar 2013 23:57:36 GMT
Message-ID: <1362527371.11727.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Tue, 05 Mar 2013 23:49:31 +0000
In-Reply-To: <cover.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Don't build gtk+-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2013 00:06:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-04 at 12:52 +0000, Ross Burton wrote:
> We're building gtk+-native (so the X stack, freetype, fontconfig, etc etc) just
> to run gtk-update-icon-cache on the host when building the rootfs.
> 
> This series adds a recipe that builds just that binary from a GTK+ tarball using
> a bit of hackery.
> 
> For a benchmark of building sato-icon-theme from nothing (no sstate or tmp):
> 
> master takes 13:25 to run 1037 tasks.
> ross/gtk takes 9:26 to run 629 tasks.
> 
> So that's a four minute gain and 400 less tasks.

Here, my core-image-sato build from populated DL_DIR time fell by about
2.5 minutes due to this changeset (46:59 to 44:17 mins) so a 5% speedup.
Nice! :)

It would seemingly make around six seconds on "bitbake core-image-sato
-c rootfs" from sstate too (5m25 ish).

Cheers,

Richard



