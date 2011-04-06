Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q7YBZ-0002F8-FR for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 21:14:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36JCRCE027191;
	Wed, 6 Apr 2011 20:12:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23821-07; Wed,  6 Apr 2011 20:12:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36JCBo3027154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 6 Apr 2011 20:12:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <46C1DB33-0AC8-486D-9E88-7D33EE44CF93@dominion.thruhere.net>
References: <cover.1302039585.git.sgw@linux.intel.com>
	<23fdb7fffa0e21931f4d6ddd2b02a0a44a450a61.1302039585.git.sgw@linux.intel.com>
	<46C1DB33-0AC8-486D-9E88-7D33EE44CF93@dominion.thruhere.net>
Date: Wed, 06 Apr 2011 11:31:03 -0700
Message-ID: <1302114663.22904.75.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>,
	Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 2/6] gst-meta-base: Support http/https remote streams
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
X-List-Received-Date: Wed, 06 Apr 2011 19:14:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-06 at 09:11 +0200, Koen Kooi wrote:
> Op 5 apr 2011, om 23:48 heeft Saul Wold het volgende geschreven:
> 
> > From: Dongxiao Xu <dongxiao.xu@intel.com>
> > 
> > Add libgstsouphttpsrc library to support remote stream playing via
> > http/https protocols.
> > 
> > This solves the mp4 playing issue by regel from mediatomb file server.
> > 
> > Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> > 
> > -    gst-plugins-good-autodetect"
> > +    gst-plugins-good-autodetect \
> > +    gst-plugins-good-souphttpsrc"
> 
> FWIW, souphttpsrc is quite heavy in dependencies, so in the future we
> should look for something lighter (GIO?).

Sounds like a good plan. Does something already exist or does code need
writing for that?

Cheers,

Richard



