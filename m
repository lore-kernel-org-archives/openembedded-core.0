Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TzoTX-0001Vn-TB for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 14:10:21 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SCwFIv030315; Mon, 28 Jan 2013 12:59:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sdm36ynPhNz9; Mon, 28 Jan 2013 12:59:04 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SCwwVE030341
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 28 Jan 2013 12:59:01 GMT
Message-ID: <1359377661.22371.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 28 Jan 2013 12:54:21 +0000
In-Reply-To: <ly1ud9cf34.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <fdad95c5f7fc287a6b173d5c30447ab05fab0778.1359049755.git.ross.burton@intel.com>
	<6d174abd95de70a59f54ca28c965ca72933a3ce7.1359049755.git.ross.burton@intel.com>
	<ly1ud9cf34.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base: make feature backfilling happen earlier
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
X-List-Received-Date: Mon, 28 Jan 2013 13:10:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-25 at 19:06 +0100, Enrico Scholz wrote:
> Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
> 
> > Backfilling DISTRO_FEATURES and MACHINE_FEATURES with _append statements
> > happens too late to use those variables with conditional inherits, like
> > this:
> 
> This causes regressions for setups where DISTRO_FEATURES_BACKFILL uses
> the override mechanism. E.g. I have
> 
> | DISTRO_FEATURES_BACKFILL_mydist = "ld-is-gold ${${PROJECT_FEATURES}"
> | DISTRO_FEATURES_INITMAN_mydist = "systemd"
> 
> Before this commit, DISTRO_FEATURES contained 'ld-is-gold' and the
> project features.  Now, project features + ld-is-gold vanished and
> pulseaudio is in again.

I don't think its possible to make everything work :(

The question is therefore how do we want to proceed? I'll take further
proposed patches but I don't know what the best thing to do here is...

Cheers,

Richard





