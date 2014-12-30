Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 12FCC60167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 03:51:22 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id w7so11888227lbi.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 19:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wYU7cYC6MDu6KrSWlwpZQ8SyhggvpBe9dBEHyjWW0T0=;
	b=V2IQd0c/F12IpRDNvehj3fUqPejJXB7rebXkZWPggs/T0An0XIxpbMSX1oAsfMuLbb
	JEmFIQxwaiuS/Gd6oGxkgKSb9tS7om8MxI+OdYEoI65CfOzP+x/6Je32ckSBOM2RS/rZ
	6O6dhjXAwEwNUBeIliQIMlvETD6kWFbSUQdqoM8JnY2gMWHBviL07GsumCW8ZbsOHNsX
	kXPOhe+89UO02r5kSK4rfqjEgC1aCJnnct3eL6LDLZkgxnFWnKEUdP4NMLibjwEOuBFP
	FregO+WBpSjwtFlioQztMZaIrnGU381m+r0NJ4wxa9A9tCEQH8wNWh518NmOSmrfbEKn
	BIkA==
MIME-Version: 1.0
X-Received: by 10.112.181.106 with SMTP id dv10mr55182947lbc.88.1419911481485; 
	Mon, 29 Dec 2014 19:51:21 -0800 (PST)
Received: by 10.25.32.65 with HTTP; Mon, 29 Dec 2014 19:51:21 -0800 (PST)
In-Reply-To: <86CCE002-9D54-49D0-9E1C-88C4E7775CD1@gmail.com>
References: <1412737213-4248-1-git-send-email-TicoTimo@gmail.com>
	<86CCE002-9D54-49D0-9E1C-88C4E7775CD1@gmail.com>
Date: Mon, 29 Dec 2014 19:51:21 -0800
Message-ID: <CANx9H-DHRZfG=D=Wc-PRey0uaE9kKCZbeyVQxDON6bvdV2RWeA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] clutter-1.0: upgrade to v1.20.0
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
X-List-Received-Date: Tue, 30 Dec 2014 03:51:29 -0000
Content-Type: multipart/alternative; boundary=001a11c36d42776f64050b66e7cf

--001a11c36d42776f64050b66e7cf
Content-Type: text/plain; charset=UTF-8

And again, PING.

On Friday, November 28, 2014, Tim Orling <ticotimo@gmail.com> wrote:

> Ping.
>
> > On Oct 7, 2014, at 8:00 PM, Tim Orling <ticotimo@gmail.com
> <javascript:;>> wrote:
> >
> > * The 1.19.x series were "snapshots" and not stable releases.
> > * This is the first stable release beyond the 1.18.x series.
> > * Tested on nuc with core-image-weston.
> >
> > ANNOUNCEMENT:
> >
> https://mail.gnome.org/archives/clutter-list/2014-September/msg00007.html
> >
> > Signed-off-by: Tim Orling <TicoTimo@gmail.com <javascript:;>>
> > ---
> > meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb | 8 --------
> > meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb | 8 ++++++++
> > 2 files changed, 8 insertions(+), 8 deletions(-)
> > delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
> > create mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
> >
> > diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
> b/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
> > deleted file mode 100644
> > index 452e7ee..0000000
> > --- a/meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
> > +++ /dev/null
> > @@ -1,8 +0,0 @@
> > -require clutter-1.0.inc
> > -
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> > -
> > -SRC_URI[archive.md5sum] = "471f5ea423e20d4140c7771873daef29"
> > -SRC_URI[archive.sha256sum] =
> "f9fe12e6148426063c90e67dfaeb56013bf1aea224ef502223d13eab6c1add63"
> > -
> > -SRC_URI += "file://install-examples.patch"
> > diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
> b/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
> > new file mode 100644
> > index 0000000..7898810
> > --- /dev/null
> > +++ b/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
> > @@ -0,0 +1,8 @@
> > +require clutter-1.0.inc
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> > +
> > +SRC_URI[archive.md5sum] = "a8a33a57a944c6d7c7c013ce9aa3222b"
> > +SRC_URI[archive.sha256sum] =
> "cc940809e6e1469ce349c4bddb0cbcc2c13c087d4fc15cda9278d855ee2d1293"
> > +
> > +SRC_URI += "file://install-examples.patch"
> > --
> > 1.9.3
> >
>

--001a11c36d42776f64050b66e7cf
Content-Type: text/html; charset=UTF-8

And again, PING.<br><br>On Friday, November 28, 2014, Tim Orling &lt;<a href="mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping.<br>
<br>
&gt; On Oct 7, 2014, at 8:00 PM, Tim Orling &lt;<a href="javascript:;" onclick="_e(event, &#39;cvml&#39;, &#39;ticotimo@gmail.com&#39;)">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * The 1.19.x series were &quot;snapshots&quot; and not stable releases.<br>
&gt; * This is the first stable release beyond the 1.18.x series.<br>
&gt; * Tested on nuc with core-image-weston.<br>
&gt;<br>
&gt; ANNOUNCEMENT:<br>
&gt; <a href="https://mail.gnome.org/archives/clutter-list/2014-September/msg00007.html" target="_blank">https://mail.gnome.org/archives/clutter-list/2014-September/msg00007.html</a><br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href="javascript:;" onclick="_e(event, &#39;cvml&#39;, &#39;TicoTimo@gmail.com&#39;)">TicoTimo@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.18.2.bb" target="_blank">clutter-1.0_1.18.2.bb</a> | 8 --------<br>
&gt; meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.20.0.bb" target="_blank">clutter-1.0_1.20.0.bb</a> | 8 ++++++++<br>
&gt; 2 files changed, 8 insertions(+), 8 deletions(-)<br>
&gt; delete mode 100644 meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.18.2.bb" target="_blank">clutter-1.0_1.18.2.bb</a><br>
&gt; create mode 100644 meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.20.0.bb" target="_blank">clutter-1.0_1.20.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.18.2.bb" target="_blank">clutter-1.0_1.18.2.bb</a> b/meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.18.2.bb" target="_blank">clutter-1.0_1.18.2.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 452e7ee..0000000<br>
&gt; --- a/meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.18.2.bb" target="_blank">clutter-1.0_1.18.2.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,8 +0,0 @@<br>
&gt; -require clutter-1.0.inc<br>
&gt; -<br>
&gt; -LIC_FILES_CHKSUM = &quot;file://COPYING;md5=4fbd65380cdd255951079008b364516c&quot;<br>
&gt; -<br>
&gt; -SRC_URI[archive.md5sum] = &quot;471f5ea423e20d4140c7771873daef29&quot;<br>
&gt; -SRC_URI[archive.sha256sum] = &quot;f9fe12e6148426063c90e67dfaeb56013bf1aea224ef502223d13eab6c1add63&quot;<br>
&gt; -<br>
&gt; -SRC_URI += &quot;file://install-examples.patch&quot;<br>
&gt; diff --git a/meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.20.0.bb" target="_blank">clutter-1.0_1.20.0.bb</a> b/meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.20.0.bb" target="_blank">clutter-1.0_1.20.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..7898810<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/clutter/<a href="http://clutter-1.0_1.20.0.bb" target="_blank">clutter-1.0_1.20.0.bb</a><br>
&gt; @@ -0,0 +1,8 @@<br>
&gt; +require clutter-1.0.inc<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM = &quot;file://COPYING;md5=4fbd65380cdd255951079008b364516c&quot;<br>
&gt; +<br>
&gt; +SRC_URI[archive.md5sum] = &quot;a8a33a57a944c6d7c7c013ce9aa3222b&quot;<br>
&gt; +SRC_URI[archive.sha256sum] = &quot;cc940809e6e1469ce349c4bddb0cbcc2c13c087d4fc15cda9278d855ee2d1293&quot;<br>
&gt; +<br>
&gt; +SRC_URI += &quot;file://install-examples.patch&quot;<br>
&gt; --<br>
&gt; 1.9.3<br>
&gt;<br>
</blockquote>

--001a11c36d42776f64050b66e7cf--
