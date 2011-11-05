Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMnAU-0006Tb-VC
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 21:48:47 +0100
Received: by bkbzv3 with SMTP id zv3so2943102bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Nov 2011 13:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6MVYAH8iO7GDX+kErV9oJVsyVcfxSD5QiNkEgMGGNyU=;
	b=eU+KxQkfq1XPZL/TvEwopEz9dROmj2xvs01IaYXEK8RbdmbVKKOaidZSjtXYlc96AA
	c5DqOj5BtMyoo1cG6Rgnp3N5fdoEqNIv+PyJoSsUI/mTJhpeRnsWQ+PhFPi5zs6SJGxK
	8uCrsYLpDyLIgwMdjEJTfCEyUq8HXjHb02phM=
MIME-Version: 1.0
Received: by 10.204.10.81 with SMTP id o17mr10014402bko.65.1320525753771; Sat,
	05 Nov 2011 13:42:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Sat, 5 Nov 2011 13:42:33 -0700 (PDT)
In-Reply-To: <1320441432.3137.2.camel@lenovo.internal.reciva.com>
References: <cover.1320430778.git.otavio@ossystems.com.br>
	<7e3c2e21652019ed5dd2d45beff62a855152f0a4.1320430778.git.otavio@ossystems.com.br>
	<1320441432.3137.2.camel@lenovo.internal.reciva.com>
Date: Sat, 5 Nov 2011 18:42:33 -0200
X-Google-Sender-Auth: n529cRTqLzGnmu56R6HEprXQhNo
Message-ID: <CAP9ODKr2nX1j5S+rkd=tD+FNEjJoWCKx5whrRBVbV0B+h_6vYw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] dhcp: rename dhcp4.inc to dhcp.inc
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
X-List-Received-Date: Sat, 05 Nov 2011 20:48:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 4, 2011 at 19:17, Phil Blundell <philb@gnu.org> wrote:
> Why is this patch an improvement? =A0I don't have anything against it
> particularly but it doesn't seem that it buys much either, and there is
> no clue in the commit message as to what it is trying to achieve.

Since we dropped the dhcp3.inc file makes no sense to have it named
dhcp4.inc so I renamed it. Just as simple as that.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


