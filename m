Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U9yjF-0003AY-AI for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 15:08:44 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1PDx9lA017344; Mon, 25 Feb 2013 13:59:09 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W8Ki8fN0KT-V; Mon, 25 Feb 2013 13:59:09 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1PDwwfX017330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Feb 2013 13:59:03 GMT
Message-ID: <1361800303.25338.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 25 Feb 2013 05:51:43 -0800
In-Reply-To: <5125C921.2030407@linux.intel.com>
References: <1361394588-30527-1-git-send-email-farrah.rashid@windriver.com>
	<5125C921.2030407@linux.intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Fix tcp-wrappers for sshd
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
X-List-Received-Date: Mon, 25 Feb 2013 14:09:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-20 at 23:13 -0800, Saul Wold wrote:
> On 02/20/2013 01:09 PM, farrah rashid wrote:
> > farrah rashid (2):
> >    tcp-wrappers: remove size_t.patch
> >    tcp-wrappers: add socklen_t.patch
> >
> >   .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |   44 ---------------
> >   .../tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch  |   59 ++++++++++++++++++++
> >   .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +-
> >   3 files changed, 61 insertions(+), 46 deletions(-)
> >   delete mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
> >   create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/socklen_t.patch
> >
> 
> This must be for Danny, please mark that in the patch in the future.

This is a bit of a mess since we have the first patch in master but not
the second. I've added it...

Cheers,

Richard



