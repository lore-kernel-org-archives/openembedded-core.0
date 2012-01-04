Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RiU6v-00059L-GE for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:54:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GlOMC021645
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 16:47:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20888-10 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 16:47:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q04GlITV021639
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jan 2012 16:47:18 GMT
Message-ID: <1325695637.20759.32.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jan 2012 16:47:17 +0000
In-Reply-To: <1325695277.28005.76.camel@phil-desktop>
References: <1325689535.28005.59.camel@phil-desktop>
	<1325691189.20759.14.camel@ted>
	<CAEsOVNcsY-dNYBz1Y6BVAQ-N7hVyaxOMcsniev9z455m9GYh5A@mail.gmail.com>
	<CABcZANmEZ6Oy6q7gL2WCCtphSA7fEHJsM0dre0tNpXvPdn2crQ@mail.gmail.com>
	<1325695277.28005.76.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sstate compression
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
X-List-Received-Date: Wed, 04 Jan 2012 16:54:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 16:41 +0000, Phil Blundell wrote:
> On Wed, 2012-01-04 at 09:32 -0700, Chris Larson wrote:
> > Agreed. Sstate can get truly massive, being able to opt-into xz or
> > something would be lovely for us as well.
> 
> Yes, that would be nice.  xz does seem to compress nearly twice as well
> as "gzip -9", though it takes about six times as long to do it.  (16M
> and 55 seconds vs 28M and 9.5 seconds for my webkit testcase.)
> Personally I don't care about the disk space as much as the build time,
> but I can see that sstate could start to become quite unwieldy if you
> have a lot of packages in there.
> 
> Alternatively, maybe we could have sstate.bbclass accept multiple
> compression types when reading (i.e. look for .tar.xz, .tar.gz, .tar.lzo
> etc in turn), make it use the fastest reasonable compression when
> generating the archives in the first place, and then folks who want to
> either put them into long-term storage or send them over slow links can
> post-process the sstate-cache by transcoding them into .xz or whatever
> format.

Just to note that looking for multiple versions can cause a fair bit of
network traffic as for http:// mirror urls it will have to wget each in
turn. Better would be one file name and dynamic detection of the
compression format I guess.

Cheers,

Richard



