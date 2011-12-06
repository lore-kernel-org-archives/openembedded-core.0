Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RXvvG-0000t7-On
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 15:23:06 +0100
Received: by qabg14 with SMTP id g14so1337015qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2011 06:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=l7dBW7QlGsXF+9S+bxQK+Nt3aBiNlOQLTV+5cw7g9A8=;
	b=Aa1sxL63wBCE/tGjitq5pcr1Kh9J53CENj0bZy+rJ9NXIPHlRnH02n6ITp1eRx+WIm
	+mT6tzXEp3PL1jJMoIxZ19Qnuy2yxkmH0RTJLrABSH2IV4LZgwQljDNkSVO4Hl4i7lGC
	J9mvf2mYmdJcql5sVY81k3vNHNadoS/I4zq14=
Received: by 10.224.187.71 with SMTP id cv7mr12278642qab.59.1323180978707;
	Tue, 06 Dec 2011 06:16:18 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Tue, 6 Dec 2011 06:15:57 -0800 (PST)
In-Reply-To: <1323163736-18065-1-git-send-email-Martin.Jansa@gmail.com>
References: <1323163736-18065-1-git-send-email-Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 6 Dec 2011 07:15:57 -0700
X-Google-Sender-Auth: 7ABly0xmzaVPd970Iy1ouIa7YuU
Message-ID: <CABcZANk4oH-dDHDZHW+ioRi13AXCS3rBNiUeUZGRZisg56fQfw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: change APACHE_MIRROR to use archive site
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
X-List-Received-Date: Tue, 06 Dec 2011 14:23:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2011 at 2:28 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> * there are newest as well as older releases, so the SRC_URIs are valid l=
onger
> * someone with fast line should try to redownload world to see if the
> =C2=A0structure is the same for all projects (checked for subversion)

Would it not be better to do what we do for other projects, and add
the archive URI to either the global MIRRORS for fallback, or prepend
to MIRRORS in the appropriate .inc?
--=20
Christopher Larson
clarson at kergoth dot com
Senior Software Engineer, Mentor Graphics


