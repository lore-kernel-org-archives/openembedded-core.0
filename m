Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF09579091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 09:43:04 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7K9h2E4001513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 20 Aug 2018 10:43:03 +0100
Message-ID: <73a419cb40a67f5e2dfa71820c048645583a1d75.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>, Khem Raj
	<raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 10:43:02 +0100
In-Reply-To: <45c972cc-6abf-8df2-e4db-ee84abd49dc9@geanix.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
	<f1c6008db923f577cb03d5461c06ad97d55a57f6.1534699224.git.raj.khem@gmail.com>
	<45c972cc-6abf-8df2-e4db-ee84abd49dc9@geanix.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 4/9] dos2unix.bbclass: Move to oe-core
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
X-List-Received-Date: Mon, 20 Aug 2018 09:43:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-08-20 at 11:23 +0200, Martin Hundebøll wrote:
> Hi Khem,
> 
> On 19/08/2018 19.23, Khem Raj wrote:
> > - Import from meta-oe layer
> > 
> > - This is useful for many packages where CR-LF
> >    needs to be adjusted, many recipes depend on it
> >    e.g. meta-multimedia libebml and so on.
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/classes/dos2unix.bbclass | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >   create mode 100644 meta/classes/dos2unix.bbclass
> > 
> > diff --git a/meta/classes/dos2unix.bbclass
> > b/meta/classes/dos2unix.bbclass
> > new file mode 100644
> > index 0000000000..3fc17e2196
> > --- /dev/null
> > +++ b/meta/classes/dos2unix.bbclass
> > @@ -0,0 +1,14 @@
> > +# Class for use to convert all CRLF line terminators to LF
> > +# provided that some projects are being developed/maintained
> > +# on Windows so they have different line terminators(CRLF) vs
> > +# on Linux(LF), which can cause annoying patching errors during
> > +# git push/checkout processes.
> > +
> > +do_convert_crlf_to_lf[depends] += "dos2unix-
> > native:do_populate_sysroot"
> 
> Shouldn't the dos2unix recipe live in oe-core also, when a class
> depends upon it?

Not necessarily, we do have a number of core classes which aren't
directly used in OE-Core but are needed by many layers and having a
common copy makes sense.

I'd agree it is good to try and have something which tests them though.

Cheers,

Richard

