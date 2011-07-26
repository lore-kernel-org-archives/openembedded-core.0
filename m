Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1QllSe-00025F-BY; Tue, 26 Jul 2011 19:30:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2011 10:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,270,1309762800"; d="scan'208";a="30320407"
Received: from unknown (HELO helios.localnet) ([10.255.17.235])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2011 10:20:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jul 2011 18:20:01 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <CAMKF1spOJJP=qdDbYpcnArUR1rjvJznXXiB7KAqQNT5R7J8N_Q@mail.gmail.com>
	<1310822738895594500@rkmorris.us>
In-Reply-To: <1310822738895594500@rkmorris.us>
MIME-Version: 1.0
Message-Id: <201107261820.01424.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Russell Morris <openembedded@rkmorris.us>
Subject: Re: [oe] Populating meta-oe with new patches on oe.dev
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
X-List-Received-Date: Tue, 26 Jul 2011 17:30:28 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 16 July 2011 14:25:38 Russell Morris wrote:
> Can someone explain the differences between oe-core and OpenEmbedded, and
> in particular the various git repositories? 

Well, as I just mentioned in my reply to Paul I have produced a document 
describing OE-core here:

 http://www.openembedded.org/index.php/OpenEmbedded-Core

I don't know that it explicitly describes all the repositories but it does 
give some idea of the motivations.

> I ask because I'm struggling to get OE running on my h1940 (using
> openembedded), but I have a feeling that this may be the wrong repository to
> use ... but I just don't know ...

OE-dev provides support for h1940, yes, but I wouldn't expect that to be 
maintained in future. However, read on...

> I'm also not sure which ones are being worked on going forward (as I
> would like to submit changes once I get things working, but again don't
> know which repository is the right one).

So most of the new development should happen either in OE-core or some layer 
on top. Hopefully I will soon be able to release a layer called "meta-
handheld" that I have been working on which will provide machine support for 
h1940 amongst other handheld devices. If you're using OE-dev now that's OK, if 
you have any patches against OE-dev they will be easy to re-apply to meta-
handheld or whereever is appropriate.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre


