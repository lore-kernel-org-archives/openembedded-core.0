Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mark.Asselstine@windriver.com>) id 1T6R6e-0004uM-4l
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 21:05:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7SIrQCI012681
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Aug 2012 11:53:26 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 28 Aug 2012 11:53:26 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Phil Blundell <philb@gnu.org>
Date: Tue, 28 Aug 2012 14:53:40 -0400
Message-ID: <14807078.5pTOjMOMpo@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic; KDE/4.8.4; x86_64; ; )
In-Reply-To: <1346179084.4396.6.camel@x121e.pbcl.net>
References: <1346178028-2036-1-git-send-email-mark.asselstine@windriver.com>
	<1346179084.4396.6.camel@x121e.pbcl.net>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] base-files: provide a mechanism to skip creation of the hostname file
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
X-List-Received-Date: Tue, 28 Aug 2012 19:05:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On August 28, 2012 19:38:04 Phil Blundell wrote:
> On Tue, 2012-08-28 at 14:20 -0400, Mark Asselstine wrote:
> > +	if [ "${hostname}" != "none" ]; then
> 
> This magic string value seems a bit unwholesome.  Can't you just check
> against the empty string?

The 'none' was suggested by a colleague and I just ran with it, but yes an 
empty string would work just fine and be less 'unwholesome' as you say.

> 
> Also, if the problem is that the static hostname set here is overriding
> the one from dhcp or the command line, I wonder whether this just
> indicates that the priority of them is wrong and the scripting should be
> adjusted so that the static file has lower priority than the other two
> things.


hostname.sh doesn't leave much room for priority

---snip---
if test -f /etc/hostname
then
        hostname -F /etc/hostname
fi
---snip---

looking at this you can see my logic, don't create the /etc/hostname file get 
rid of the overwrite.

Mark

> 
> p.


