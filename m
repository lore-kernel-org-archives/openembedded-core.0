Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BAEFF782E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 10:54:51 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5EAsoqJ020437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 14 Jun 2017 11:54:51 +0100
Message-ID: <1497437690.3942.46.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 14 Jun 2017 11:54:50 +0100
In-Reply-To: <CAJ86T=UvrqetBfC0_RgJJbiOUYzEatksZb7txh4H5d7RFaoeKQ@mail.gmail.com>
References: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497347392-9776-4-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJ86T=UvrqetBfC0_RgJJbiOUYzEatksZb7txh4H5d7RFaoeKQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 14 Jun 2017 11:54:51 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] sstatetests: Use higher parallelism value
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
X-List-Received-Date: Wed, 14 Jun 2017 10:54:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-13 at 08:55 -0700, Andre McCurdy wrote:
> On Tue, Jun 13, 2017 at 2:49 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > Since the processing code for signature generation is now threaded,
> > use higher thread values as examples in this code for better
> > performance.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/lib/oeqa/selftest/cases/sstatetests.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py
> > b/meta/lib/oeqa/selftest/cases/sstatetests.py
> > index 8d05e30..feadf3c 100644
> > --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> > +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> > @@ -418,7 +418,7 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> > 
> >          self.write_config("""
> >  TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
> > -BB_NUMBER_THREADS = "1"
> > +BB_NUMBER_THREADS = "${@oe.utils.cpu_count()}"
> >  PARALLEL_MAKE = "-j 1"
> >  DL_DIR = "${TOPDIR}/download1"
> >  TIME = "111111"
> > @@ -431,7 +431,7 @@ http_proxy = ""
> >          bitbake("world meta-toolchain -S none")
> >          self.write_config("""
> >  TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
> > -BB_NUMBER_THREADS = "2"
> > +BB_NUMBER_THREADS = "${@oe.utils.cpu_count()-1}"
> What happens here if I have one CPU core?

I'll change it to a +1 :)

Cheers,

Richard

