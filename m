Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UFUNF-0005Rd-8R for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 19:56:33 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2CImDL6003009; Tue, 12 Mar 2013 18:48:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6NcgA0zFR45p; Tue, 12 Mar 2013 18:48:13 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2CIm1x6002996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Mar 2013 18:48:07 GMT
Message-ID: <1363113560.9859.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 12 Mar 2013 18:39:20 +0000
In-Reply-To: <513E6EC3.7090905@linux.intel.com>
References: <4293cea264609a122b9cc05831fe598fcb3ff677.1362702690.git.tom.zanussi@linux.intel.com>
	<957507c1d36185cf5c6a1ac9b5781c3344d5a40d.1362702690.git.tom.zanussi@linux.intel.com>
	<513E6EC3.7090905@linux.intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, tom.zanussi@linux.intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] perf: rename perf_3.4 to perf
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
X-List-Received-Date: Tue, 12 Mar 2013 18:56:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-11 at 16:54 -0700, Saul Wold wrote:
> On 03/07/2013 04:39 PM, tom.zanussi@linux.intel.com wrote:
> > From: Tom Zanussi <tom.zanussi@linux.intel.com>
> >
> > There's nothing kernel-version-specific about the perf_3.4 recipe, so
> > it's actually misnamed and misleading now that it also gets used with
> > the 3.8 kernel.
> >
> > Since the recipe isn't tied to a specific PV, and simply uses
> > whatever's in STAGING_KERNEL_DIR, there's no reason to add anything
> > else either to the bare PN, so just use that as the recipe name.
> >
> This did not quite work out correctly, since the package name has now 
> gone backwards since the default PV for a recipe is 1.0 when nothing is 
> set on the recipe file name.
> 
> Is there a way to sort this out such that it picks up an incrementing PV 
> from the kernel recipe?
> 
> As it stands now, the PV has gone from 3.4 -> 1.0.
> 
> Thanks for looking after this.

As a hint on how to do this we need to read the kernel version and then
set PKGV just prior to or at the start of do_package time.

The logs will show 1.0 as the version but the final packages will have
the kernel version.

Cheers,

Richard



