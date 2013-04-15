Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1URihw-0007Dz-5O for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 14:40:35 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FCN6gi008634; Mon, 15 Apr 2013 13:23:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0lS4u5l5elLj; Mon, 15 Apr 2013 13:23:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FCMxJV008627
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 15 Apr 2013 13:23:01 +0100
Message-ID: <1366028557.8670.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Colin Walters <walters@verbum.org>
Date: Mon, 15 Apr 2013 13:22:37 +0100
In-Reply-To: <1366027932.32176.4.camel@localhost>
References: <1365848719.16702.74.camel@ted>
	<1365944532.5651.12.camel@localhost>  <1365953596.8670.9.camel@ted>
	<1366020508.2896.16.camel@localhost>  <1366025504.8670.30.camel@ted>
	<1366027932.32176.4.camel@localhost>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Burton, mclasen@redhat.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Fix libpng determinism issues
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
X-List-Received-Date: Mon, 15 Apr 2013 12:40:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-15 at 08:12 -0400, Colin Walters wrote:
> On Mon, 2013-04-15 at 12:31 +0100, Richard Purdie wrote:
> 
> > It will make our builds work again for now until the next time someone
> > upgrades libpng and and then it will potentially silently start using an
> > old version in some builds :(.
> 
> So something like the attached on top of the previous patch?
> 
> If this looks good I'll push both to master.

Looks good to me, thanks!

Richard



