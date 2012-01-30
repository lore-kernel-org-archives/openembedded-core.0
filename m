Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rruz1-00025B-F0
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 18:25:35 +0100
Received: by bkaq10 with SMTP id q10so3521923bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 09:17:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.205.141.76 with SMTP id jd12mr9090890bkc.42.1327943862538;
	Mon, 30 Jan 2012 09:17:42 -0800 (PST)
Received: by 10.204.35.135 with HTTP; Mon, 30 Jan 2012 09:17:42 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <1327943665-16402-1-git-send-email-steve@sakoman.com>
References: <1327943665-16402-1-git-send-email-steve@sakoman.com>
Date: Mon, 30 Jan 2012 09:17:42 -0800
Message-ID: <CAOSpxdbF6t5z+GYirR4u3oa41Pd=UrFyQRKT1QSw1dLBRPBeEg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 0/3] *** SUBJECT HERE ***
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
X-List-Received-Date: Mon, 30 Jan 2012 17:25:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Sigh, my morning for screw-ups.  Time for another cup of coffee . . .

The subject should be: 'zypper: support signed repositories' rather
than '***SUBJECT HERE***' :-)

Steve

On Mon, Jan 30, 2012 at 9:14 AM, Steve Sakoman <steve@sakoman.com> wrote:
> The current zypper implementation does not work with signed repositories.
> This patch series adds recipes for the required packages as well as the
> necessary runtime dependencies to zypper.
>
> Tested on Gumstix Overo (OMAP3) with meta-openembedded layer enabled and
> a systemd based console image.
>
> Version 3 incorporates feedback from Koen Kooi and Saul Wold
> =A0- adds runtime dependencies to existing RDEPENDS_${PN}
> =A0- removes duplicate recipe for libassuan
> =A0- moves recipes for gnupg and libksba to recipes-support
>
> Steve Sakoman (3):
> =A0libksba: add recipe for 1.2.0
> =A0gnupg: add recipe for 2.0.18
> =A0zypper: add missing runtime dependences on gzip and gnupg
>
> =A0meta/recipes-extended/zypper/zypper_git.bb =A0 =A0| =A0 =A04 ++--
> =A0meta/recipes-support/gnupg/gnupg_2.0.18.bb =A0 =A0| =A0 24 +++++++++++=
+++++++++++++
> =A0meta/recipes-support/libksba/libksba_1.2.0.bb | =A0 10 ++++++++++
> =A03 files changed, 36 insertions(+), 2 deletions(-)
> =A0create mode 100644 meta/recipes-support/gnupg/gnupg_2.0.18.bb
> =A0create mode 100644 meta/recipes-support/libksba/libksba_1.2.0.bb
>


