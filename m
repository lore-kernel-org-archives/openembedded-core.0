Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1R4l8z-0005oO-LZ
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Sep 2011 05:00:41 +0200
Received: by wyh21 with SMTP id 21so4614368wyh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 19:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=T7NC9oVCSaTlVOeWPYc+P4nsRzV1PatjulXL5va59+w=;
	b=yENkQkVTL1FE1A1wjyDPhN1ihvhwkAr8+0htPjNcHrys0GG38zmttVsduCQE1BaEQD
	d+1SdbmoE4KqVsINUBa3C2doTFa7fiK+EwTQHxhJMTrK38kBPbzt71FuJECbLAeRSz+i
	CBBA/E9UxGg4I7hp6Zn89TRY5XaRjhcISwJKA=
Received: by 10.216.137.94 with SMTP id x72mr140430wei.9.1316228128116; Fri,
	16 Sep 2011 19:55:28 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.184.7 with HTTP; Fri, 16 Sep 2011 19:55:08 -0700 (PDT)
In-Reply-To: <4E73A769.9070903@windriver.com>
References: <1316177653.20858.23.camel@ted>
	<201109161816.28057.paul.eggleton@linux.intel.com>
	<CAP9ODKoVOSsDOKtiv-LExuKbeGciGp4hfC=V5j-zCY8wDNwr3A@mail.gmail.com>
	<201109161849.52647.paul.eggleton@linux.intel.com>
	<CAP9ODKpqO4zN=gjOsod6UtTku6xZmRen63VBKs+_MOdjF1AAFA@mail.gmail.com>
	<4E73A769.9070903@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 16 Sep 2011 19:55:08 -0700
X-Google-Sender-Auth: 3BO8x2R__Pd2qxbue-nmcrbkZOs
Message-ID: <CABcZANnuV39P8kgBY0=cy6nvVMKbDKZVg2NTOQAn8f_wij7+_g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core release process
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
X-List-Received-Date: Sat, 17 Sep 2011 03:00:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 12:45 PM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
>> Yes I know but wouldn't be better if you could base your work on
>> oe-core and avoid doing this?
>
> For submitting to oe-core for pull requests, basing work off of oe-core i=
s "best
> practice". =C2=A0However, forcing people who are working on a specific di=
stribution
> to do this isn't reasonable. =C2=A0It can be requested of them, but IMHO =
thats as far
> as it will go.
>

I don't see why it isn't reasonable. If they need a change done sooner
than can be done by pushing it upstream, they can put it into a local
layer until it makes it into oe-core. Seems simple enough to me.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


