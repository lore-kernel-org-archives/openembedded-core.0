Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REh8K-0000Fh-7m for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 14:45:04 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9ECjx38013891 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:45:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8dnVGKfGSMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:45:59 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9ECjslX013879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:45:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 13:39:10 +0100
In-Reply-To: <4E95E543.803@gmail.com>
References: <1318426596.23801.160.camel@ted> <4E95E543.803@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318595959.2342.12.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] Import python-setuptools from meta-oe (for glib-2.0)
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
X-List-Received-Date: Fri, 14 Oct 2011 12:45:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-12 at 12:06 -0700, Khem Raj wrote:
> On 10/12/2011 6:36 AM, Richard Purdie wrote:
> > +DEPENDS += "python"
> > +DEPENDS_virtclass-native += "python-native"
> > +
> 
> wouldnt BBCLASSEXTEND convert python into python-native ?

Yes, it should. There must be something else odd going on here but that
can likley be removed...

Cheers,

Richard



