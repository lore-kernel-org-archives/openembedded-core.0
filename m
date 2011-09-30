Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9dPF-0001MB-LT for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 15:45:37 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UDkWAe023178 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 14:46:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SpDB-Udc2BBt
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 14:46:32 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UDkU5g023137
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 14:46:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 14:40:04 +0100
In-Reply-To: <CA+chaQcWqvxDeOMVpdAL_2US3KzAmD_iJCytMfwJRa0rEfG5uA@mail.gmail.com>
References: <cover.1317370299.git.lei.mei@intel.com>
	<b53e13b48897472197f3ab2cb28c85cab089e4a5.1317370299.git.lei.mei@intel.com>
	<CA+chaQcWqvxDeOMVpdAL_2US3KzAmD_iJCytMfwJRa0rEfG5uA@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317390011.12332.193.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] curl: Upgrade from 7.21.7 to 7.22.0
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
X-List-Received-Date: Fri, 30 Sep 2011 13:45:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 14:23 +0200, Martin Jansa wrote:
> On Fri, Sep 30, 2011 at 10:16 AM, Mei Lei <lei.mei@intel.com> wrote:
> > Signed-off-by: Mei Lei <lei.mei@intel.com>
> > ---
> >  .../curl/{curl_7.21.7.bb => curl_7.22.0.bb}        |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-support/curl/{curl_7.21.7.bb => curl_7.22.0.bb} (92%)
> >
> > diff --git a/meta/recipes-support/curl/curl_7.21.7.bb b/meta/recipes-support/curl/curl_7.22.0.bb
> > similarity index 92%
> > rename from meta/recipes-support/curl/curl_7.21.7.bb
> > rename to meta/recipes-support/curl/curl_7.22.0.bb
> > index 2ec4402..d6924be 100644
> > --- a/meta/recipes-support/curl/curl_7.21.7.bb
> > +++ b/meta/recipes-support/curl/curl_7.22.0.bb
> > @@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> >            file://noldlibpath.patch \
> >            file://pkgconfig_fix.patch"
> >
> > -SRC_URI[md5sum] = "5f6d50c4d4ee38c57fe37e3cff75adbd"
> > -SRC_URI[sha256sum] = "1a50dd17400c042090203eef347e946f29c342c32b6c4843c740c80975e8215a"
> > +SRC_URI[md5sum] = "bde820eac53fa3a8d8696667418557ad"
> > +SRC_URI[sha256sum] = "bda0da862322b122784f5a9d7a65efdd99a6061292cfb8e9357e0c67c03e5112"
> 
> md5sum looks wrong (I have the same sha256sum)
> 
> OE @ ~ $ md5sum curl-7.22.0.tar.bz2
> bdb5c226d37c4a6082c70e7ef6f63060  curl-7.22.0.tar.bz2
> OE @ ~ $ sha256sum curl-7.22.0.tar.bz2
> bda0da862322b122784f5a9d7a65efdd99a6061292cfb8e9357e0c67c03e5112
> curl-7.22.0.tar.bz2

My test agrees with you, I've updated master-next with a fix.

Cheers,

Richard



