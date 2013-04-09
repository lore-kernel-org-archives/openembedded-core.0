Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPdsO-00046h-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 21:06:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2013 11:47:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,441,1363158000"; d="scan'208";a="315527946"
Received: from unknown (HELO helios.localnet) ([10.255.13.195])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2013 11:49:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 09 Apr 2013 19:49:16 +0100
Message-ID: <40166419.ZmzGKcoy4K@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-26-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAHUNapSj6UYDFxZVruTQ3jByxuoV_kHKZY046Cc8CE+Y6jB63Q@mail.gmail.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
	<1491180.EIgD7lcAzZ@helios>
	<CAHUNapSj6UYDFxZVruTQ3jByxuoV_kHKZY046Cc8CE+Y6jB63Q@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Minor comment/doc fixes
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
X-List-Received-Date: Tue, 09 Apr 2013 19:06:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 April 2013 14:40:32 Trevor Woerner wrote:
> On Tue, Apr 9, 2013 at 2:02 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > The openembedded-core-contrib and poky-contrib repos are entirely
> > separate.
> 
> D'oh!
> 
> Retrying:
> 
> $ git remote add contrib
> git://git.openembedded.org/meta-openembedded-contrib
> 
> $ git remote -v
> contrib git://git.openembedded.org/meta-openembedded-contrib (fetch)
> contrib git://git.openembedded.org/meta-openembedded-contrib (push)
> origin  git://git.openembedded.org/meta-openembedded (fetch)
> origin  git://git.openembedded.org/meta-openembedded (push)
> 
> $ git fetch contrib
> remote: Counting objects: 1288, done.
> remote: Compressing objects: 100% (554/554), done.
> remote: Total 903 (delta 491), reused 592 (delta 296)
> Receiving objects: 100% (903/903), 155.45 KiB | 55 KiB/s, done.
> Resolving deltas: 100% (491/491), completed with 119 local objects.
> From git://git.openembedded.org/meta-openembedded-contrib
>  * [new branch]      gnutoo/gpsd-3.4 -> contrib/gnutoo/gpsd-3.4
>  * [new branch]      gnutoo/gpsd-3.7 -> contrib/gnutoo/gpsd-3.7
>  * [new branch]      gnutoo/libsdl -> contrib/gnutoo/libsdl
>  * [new branch]      gnutoo/vala-0.16.0 -> contrib/gnutoo/vala-0.16.0
>  * [new branch]      hrw/aarch64-support -> contrib/hrw/aarch64-support
>  * [new branch]      hrw/world-cleanups -> contrib/hrw/world-cleanups
>  * [new branch]      jansa/for-danny -> contrib/jansa/for-danny
>  * [new branch]      jansa/for-danny2 -> contrib/jansa/for-danny2
>  * [new branch]      jansa/for-danny3 -> contrib/jansa/for-danny3
>  * [new branch]      jansa/in-test -> contrib/jansa/in-test
>  * [new branch]      jansa/in-test-cbrake -> contrib/jansa/in-test-cbrake
>  * [new branch]      jansa/in-test-felipe -> contrib/jansa/in-test-felipe
>  * [new branch]      jansa/in-test-hrw -> contrib/jansa/in-test-hrw
>  * [new branch]      jansa/in-test-khem -> contrib/jansa/in-test-khem
>  * [new branch]      jansa/in-test-koen -> contrib/jansa/in-test-koen
>  * [new branch]      jansa/in-test-ross -> contrib/jansa/in-test-ross
>  * [new branch]      jansa/test -> contrib/jansa/test
>  * [new branch]      jansa/world -> contrib/jansa/world
>  * [new branch]      kraj/updates -> contrib/kraj/updates
>  * [new branch]      master     -> contrib/master
>  * [new branch]      obi/denzil -> contrib/obi/denzil
>  * [new branch]      obi/master -> contrib/obi/master
>  * [new branch]      paule/ajenti -> contrib/paule/ajenti
>  * [new branch]      paule/cleanup6 -> contrib/paule/cleanup6
>  * [new branch]      paule/collectd -> contrib/paule/collectd
>  * [new branch]      ross/danny -> contrib/ross/danny
>  * [new branch]      ross/gtk   -> contrib/ross/gtk
>  * [new branch]      ross/master -> contrib/ross/master
>  * [new branch]      ross/piglit -> contrib/ross/piglit
>  * [new branch]      ross/pinpoint -> contrib/ross/pinpoint
>  * [new branch]      ross/xorg  -> contrib/ross/xorg
>  * [new branch]      shr        -> contrib/shr
>  * [new branch]      trini/misc-v2 -> contrib/trini/misc-v2
> 
> I still don't see a paule/layer-tweaks-core :-(

Now you're looking at meta-openembedded-contrib as opposed to openembedded-
core-contrib.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


