Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by mail.openembedded.org (Postfix) with ESMTP id B4DF46CE9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:24:51 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUO00FC52WPGP90@vms173013.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 14 Oct 2013 11:24:35 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DE0C9200A9; Mon,
	14 Oct 2013 12:24:23 -0400 (EDT)
Date: Mon, 14 Oct 2013 12:24:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20131014162423.GF27046@denix.org>
References: <1381573062-29065-1-git-send-email-fathi.boudra@linaro.org>
	<CAP9ODKoO7xmkw0X39a7J2gQdzsjneBHLbV6hyF2JKKrvCaKDVA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKoO7xmkw0X39a7J2gQdzsjneBHLbV6hyF2JKKrvCaKDVA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssl: add Aarch64 bie-endian support
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
X-List-Received-Date: Mon, 14 Oct 2013 16:24:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Oct 12, 2013 at 02:59:19PM -0300, Otavio Salvador wrote:
> On Sat, Oct 12, 2013 at 7:17 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> > Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ...
> > --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> > @@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
> >
> >  CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
> >
> > -PR = "${INC_PR}.0"
> > +PR = "${INC_PR}.1"
> >
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
> 
> Please don't change PR here; this is not need anymore for general use
> (but exceptions).

And please correct the typo in the subject - it's big-endian, not bie-endian. 
Or did you mean bi-endian?

-- 
Denys

