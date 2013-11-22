Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 51507612D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 23:23:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMNMldb003205; Fri, 22 Nov 2013 23:22:47 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ocdj8ZEFddcr; Fri, 22 Nov 2013 23:22:46 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMNMdTL003190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Nov 2013 23:22:41 GMT
Message-ID: <1385162556.16887.192.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 22 Nov 2013 23:22:36 +0000
In-Reply-To: <528FA74C.1030500@linux.intel.com>
References: <1385018903-24196-1-git-send-email-mark.hatle@windriver.com>
	<528FA74C.1030500@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][PATCH] openssl: Fix pod2man des.pod error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Nov 2013 23:23:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-22 at 10:49 -0800, Saul Wold wrote:
> On 11/20/2013 11:28 PM, Mark Hatle wrote:
> > From: Baogen Shang <baogen.shang@windriver.com>
> >
> > formatting fix, =back is required before =head1 on Ubuntu 12.04.
> >
> > Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
> > Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> > ---
> >   .../openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch   | 12 ++++++++++++
> >   meta/recipes-connectivity/openssl/openssl_1.0.1e.bb          |  3 ++-
> >   2 files changed, 14 insertions(+), 1 deletion(-)
> >   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
> > new file mode 100644
> > index 0000000..512cde4
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-des.pod-error.patch
> > @@ -0,0 +1,12 @@
> > +diff -urpN a_origin/des.pod b_modify/des.pod
> > +--- a_origin/crypto/des/des.pod	2013-08-15 15:02:56.211674589 +0800
> > ++++ b_modify/crypto/des/des.pod	2013-08-15 15:04:14.439674580 +0800
> > +@@ -181,6 +181,8 @@ the uuencoded file to embed in the begin
> > + output.  If there is no name specified after the B<-u>, the name text.des
> > + will be embedded in the header.
> > +
> > ++=back
> > ++
> > + =head1 SEE ALSO
> > +
> > + ps(1),
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> > index ac27dba..64ec426 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> > @@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
> >
> >   CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> >
> > -PR = "${INC_PR}.0"
> > +PR = "${INC_PR}.1"
> >
> 
> No PR bump please

The patch also needs a patch header/description etc.

Cheers,

Richard


