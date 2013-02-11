Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U4rXA-0004Z5-7J for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 12:26:52 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BBGcsQ026231; Mon, 11 Feb 2013 11:16:39 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8NqADqFrc1S7; Mon, 11 Feb 2013 11:16:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BBGWrc026225
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 11 Feb 2013 11:16:36 GMT
Message-ID: <1360581039.6793.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 11 Feb 2013 11:10:39 +0000
In-Reply-To: <CAK18fxFg2a-H5ss43PGNzaK4kEsr0igKpg=3o+xLfiKOPUi+yQ@mail.gmail.com>
References: <CAK18fxFg2a-H5ss43PGNzaK4kEsr0igKpg=3o+xLfiKOPUi+yQ@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [denzil] qt 4.8.0 is not available from source anymore
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
X-List-Received-Date: Mon, 11 Feb 2013 11:26:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-02-11 at 12:50 +0200, Andrei Gherzan wrote:
> In denzil SRC_URI for qt4.8.0 uses:
> http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz
>
> This source seems to be outdated and replaced
> by: http://releases.qt-project.org/qt4/source/
>
> The problem is that the new location doesn't include the 4.8.0
> release. 
> qt-everywhere-opensource-src-4.6.4.tar.gz
> qt-everywhere-opensource-src-4.8.1.tar.gz
> qt-everywhere-opensource-src-4.8.2.tar.gz
> qt-everywhere-opensource-src-4.8.3.tar.gz
> qt-everywhere-opensource-src-4.8.4.tar.gz
>
> So right now qt4 in denzil is not fetch-able anymore.

It should be fetchable from the source mirror at least. Isn't the build
falling back to that?

Cheers,

Richard




