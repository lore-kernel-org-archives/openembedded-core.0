Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <seba.dos1@gmail.com>) id 1TUmwa-0007b5-4I
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Nov 2012 00:16:00 +0100
Received: by mail-vb0-f47.google.com with SMTP id ez10so4909441vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Nov 2012 16:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=k1rbaZVMrGfSSzgez8tSTD4+W1wyjxkBA9/2wluBq7s=;
	b=CWqbzOediuhR29ldvMduMhCmJWnLC0vfw/Avpc4YIfJ4sTkUYIGhmUT4mCz7q2NAXc
	P7e7SFpnpVco5u1PWB3KcifQZsmXcCWtTEchPSSUvHMNzu0tnFiPB/0AvRXin3NaGx58
	9Tk6qcd5jwbQXMGqiaP9IYBsyrGHbepsmVu/l4bd2pgJbanim2vQXz0/8HxVxBn2nLJk
	WrwB8afI/7OvF9CnHc1b7+NqsFc8nxqwv1vDltN5V5wbgNz9OMW9JFzOkcvVwVopUWSf
	sLjIMNtGTVy+Nq2p+4AYridyuoybsssl5uONOZXGxJSV5u6NTbWLPSiBUPWg12QqSZS/
	OQOw==
Received: by 10.220.220.5 with SMTP id hw5mr5388407vcb.53.1351983738458; Sat,
	03 Nov 2012 16:02:18 -0700 (PDT)
MIME-Version: 1.0
Sender: seba.dos1@gmail.com
Received: by 10.58.116.131 with HTTP; Sat, 3 Nov 2012 16:01:58 -0700 (PDT)
In-Reply-To: <CABnTX73jsT2yd74jkBzob4S8U_LdP_ju4VuLK+UiE-yvEOrP4g@mail.gmail.com>
References: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
	<CABnTX73jsT2yd74jkBzob4S8U_LdP_ju4VuLK+UiE-yvEOrP4g@mail.gmail.com>
From: Sebastian Krzyszkowiak <dos@dosowisko.net>
Date: Sun, 4 Nov 2012 00:01:58 +0100
X-Google-Sender-Auth: cAhr2vwG5qrrTHfFi0EvanIc-Lw
Message-ID: <CAMkzfpZ-VBmrE2s8D9c329VmnmfvmwZGPVK=sD1VCH8_WJ1W6A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PING v3] [PATCH 0/2] Support additional user-defined package metadata
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
X-List-Received-Date: Sat, 03 Nov 2012 23:16:00 -0000
Content-Type: text/plain; charset=UTF-8

Has it got rejected, applied, forgotten or what?

I think it would make sense to support it. There was just one answer
asking if RDEPENDS won't be enough and Ive had good point in my
opinion. It's a shame that patch, even after few pings, goes without
proper reply...

On Wed, Jun 6, 2012 at 9:28 AM, Ive Found <ive.found@gmail.com> wrote:
>
> Please, apply patches. They are small, atomic, tested and doesn't ruin
> anything, just adding the feature.
>
> It is essential feature for us, so we've put efforts into implementing
> it. We'd like to see it merged into upstream. We are small group of
> enthusiasts, it will be very hard for us to maintain fork of OE (it
> will be impossible in fact).
>
> On Sun, May 13, 2012 at 4:28 PM, Leonid Borisenko <ive.found@gmail.com> wrote:
> > I'm an owner of Kindle Touch. It's basically a computer with ARM
> > Cortex-A8 based CPU and Linux. There is a [small] community of
> > enthuasists developing homebrew modifications for stock software. For
> > distributing of these modifications .ipk package format had been chosen
> > with OE as build infrastructure.
> >
> > There are already several firmware versions for device and some more are
> > expected. Every firmware can introduce unpredictable changes, so
> > modifications for previous firmware versions could stop working.
> >
> > Custom metadata field with supported firmware version(s) could be
> > included into package control file for preventing of installing packaged
> > modifications onto unsupported firmware.
> >
> > But OE currently doesn't allow to define additional package metadata in
> > recipes. Patch fixes it.
> >
> > There is already RPMSPEC_PREAMBLE variable used in package_rpm.bbclass.
> > I think, it is still useful for defining custom macros in header of spec
> > file (while additional user-defined metadata is placed somewhere between
> > common tags).
> >
> > I didn't found any way to define newline character inside variable value
> > and it is needed to allow multiple [one-line] metadata fields/tags. So
> > I've used ability of OE to split list-typed variables (and re-joined
> > splitted value with real newline character).
> >
> > The following changes since commit cab85fd0b481cdbf36477348de75352be3f38ca2:
> >
> >  gdk-pixbuf: Drop unneeded RPROVIDES (2012-05-12 11:23:27 +0100)
> >
> > up to 052d78ed7f986e76afb1ce6ef02e94ba1bbc9719:
> >
> >  package_{ipk, deb, rpm}.bbclass: support additional user-defined metadata (2012-05-13 14:51:26 +0300)
> >
> > ----------------------------------------------------------------
> > Leonid Borisenko (2):
> >      package.bbclass: add getter of additional metadata
> >      package_{ipk, deb, rpm}.bbclass: support additional user-defined metadata
> >
> >  meta/classes/package.bbclass     |   11 +++++++++++
> >  meta/classes/package_deb.bbclass |    5 +++++
> >  meta/classes/package_ipk.bbclass |    5 +++++
> >  meta/classes/package_rpm.bbclass |    7 +++++++
> >  4 files changed, 28 insertions(+)
> >

--
Sebastian Krzyszkowiak
dos


