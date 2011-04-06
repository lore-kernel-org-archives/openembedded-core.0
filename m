Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7LQg-0002IL-M9
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 07:37:22 +0200
Received: by iwn10 with SMTP id 10so1186477iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 22:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Y7k81Ux+ku939ZQQDPXfYfVu+/fg2xzkrdtQxeHNkro=;
	b=s4UL0LbYf2YRGZvW8xcZz+SamWiKUHhHz+e4u5HIsiYvEKcWvgJmEX4IjByeaawv7K
	yCYWVx+3Go1s7qI/R5j7RJpWkMGbmqczOXpLjjYWPyzFOejDQOimw4ZIQ6RZPz63lXUA
	fDiTtCaxVpvFo+2clOXPoRRTmzP+22i4nyFJQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=PuvCuBXqpRjdrHVsuDSKez30O0nYXPD2NK/Tq2Ug0UpwFz6Zk3b05QmqbN5nuuP2Zp
	lXZLbA/0FRcn90+8AuhhLNZSWrNXLBUE1HmKrhVAxvbT16QPDPz3tj7bH+BZwGwG4W0c
	XKpfGJgxehB3vSP5VAk3pcp74hrhTVU42CPvY=
Received: by 10.42.154.131 with SMTP id q3mr895423icw.465.1302068115151; Tue,
	05 Apr 2011 22:35:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.179.199 with HTTP; Tue, 5 Apr 2011 22:34:55 -0700 (PDT)
In-Reply-To: <cover.1302035800.git.chris_larson@mentor.com>
References: <cover.1302035800.git.chris_larson@mentor.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 5 Apr 2011 22:34:55 -0700
Message-ID: <BANLkTikbjUWORhQaqtAvossVJWMrC29uXQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Add oe.fetch, rework fetch/unpack deps from SRC_URI
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
X-List-Received-Date: Wed, 06 Apr 2011 05:37:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2011 at 1:39 PM, Chris Larson <kergoth@gmail.com> wrote:
> This was intended to clean up and consolidate the code in base.bbclass wh=
ich
> sets up dependencies conditionally based upon the contents of SRC_URI. =
=C2=A0To get
> there, I decided to incorporate and rewrite some Uri handling code I had
> written previously. =C2=A0This is much more convenient to use than urldat=
a and
> SRC_URI, and the caching can be easily re-implemented if we move it into
> bitbake at some point (e.g. create an lru cache decorator, inject its
> construction/sync into the standard caching spots where cache/signature c=
ode
> caching is done, if necessary). =C2=A0Finally, this makes .zip files pull=
 in
> unzip-native.

Ugh, ignore this patch, at least for now.  The url handling code has
some problems with our nonstandard url parameters. *rolls eyes and
mutters*.  Will send the unpack/patch deps cleanup separately.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


