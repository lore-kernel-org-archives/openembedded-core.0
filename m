Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXqD8-0002gc-9k
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 11:53:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 02 May 2013 02:36:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,595,1363158000"; d="scan'208";a="327588588"
Received: from unknown (HELO helios.localnet) ([10.255.12.165])
	by fmsmga001.fm.intel.com with ESMTP; 02 May 2013 02:36:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stuart Yoder <b08248@gmail.com>
Date: Thu, 02 May 2013 10:36:02 +0100
Message-ID: <2887547.jBA5alvWfN@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAJTo0LYk3yyh3dXk5hmvbvpiv9fWNmgoZpYzUb_U9Kc6CsMELA@mail.gmail.com>
References: <CALRxmdD5r1MGDuDjBKHYcB9eLQ1FL9BZM5_QQxLNpQOcyOHvVA@mail.gmail.com>
	<CAJTo0LYk3yyh3dXk5hmvbvpiv9fWNmgoZpYzUb_U9Kc6CsMELA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: yajl: Installed (but unpackaged) file(s) found
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
X-List-Received-Date: Thu, 02 May 2013 09:54:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 May 2013 10:24:10 Burton, Ross wrote:
> On 1 May 2013 20:11, Stuart Yoder <b08248@gmail.com> wrote:
> >    FILES_yajl="/usr/bin/* /usr/sbin/* /usr/lib64/yajl/* ...
> > 
> > Ho do I get the yajl recipe to either a) build the files in lib64 or
> > b) package them from lib.
> 
> Don't hard-code paths, instead use the symbols available in bitbake.conf:
> 
> FILES_yajl = "${bindir}/* ${sbindir}/* ${libdir}/yajl/*"

You should also use FILES_${PN} rather than FILES_yajl.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


