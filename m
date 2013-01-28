Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TzoH6-00082r-MR for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 13:57:24 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SCkD0M029539; Mon, 28 Jan 2013 12:46:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QsXmJV7aIQSq; Mon, 28 Jan 2013 12:46:13 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0SCk8O1029536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 28 Jan 2013 12:46:11 GMT
Message-ID: <1359376891.22371.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Mon, 28 Jan 2013 12:41:31 +0000
In-Reply-To: <51066766.1020105@windriver.com>
References: <cover.1358735456.git.rongqing.li@windriver.com>
	<51066766.1020105@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: joe.macdonald@windriver.com, martin.jansa@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2 v2] define and use tcp-wrappers DISTRO_FEATURE
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
X-List-Received-Date: Mon, 28 Jan 2013 12:57:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-28 at 19:56 +0800, Rongqing Li wrote:
> ping !
> 
> 
> On 01/21/2013 10:36 AM, rongqing.li@windriver.com wrote:
> > From: "Roy.Li" <rongqing.li@windriver.com>
> >
> > *** BLURB HERE ***
> > The following changes since commit 5892db9a34c188b8a9bdaa86e19ba62a7f4793b5:
> >
> >    oprofile: set correct kernel path (2013-01-20 13:13:54 +0000)
> >
> > are available in the git repository at:
> >
> >    git://git.pokylinux.org/poky-contrib enable_tcp_wrapper_for_xinetd
> >    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=enable_tcp_wrapper_for_xinetd
> >
> > Roy.Li (2):
> >    xinetd: enable tcp-wrappers support by DISTRO_FEATURE
> >    bitbake.conf: add tcp-wrappers to default DISTRO_FEATURES_BACKFILL
> >
> >   meta/conf/bitbake.conf                        |    2 +-
> >   meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    5 ++++-
> >   2 files changed, 5 insertions(+), 2 deletions(-)

I don't see the need to make this a DISTRO_FEATURE at this point. Please
just make it a PACKAGECONFIG options for the package in question.

Cheers,

Richard



