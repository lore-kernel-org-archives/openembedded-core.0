Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R2noj-0008Pr-FV
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Sep 2011 19:27:41 +0200
Received: from localhost (85.231.30.150) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Sun, 11 Sep 2011
	19:22:34 +0200
Date: Sun, 11 Sep 2011 19:22:48 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110911172241.GA3674@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1315685266-16987-1-git-send-email-eric@eukrea.com>
	<1315685266-16987-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1315685266-16987-2-git-send-email-eric@eukrea.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 2/2] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Sun, 11 Sep 2011 17:27:41 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Eric B=E9nard <eric@eukrea.com> [110910 22:08]:
> - 4.7.4 was release on the 1st of september, the changelog is available
> here : http://qt.gitorious.org/+qt-developers/qt/releases/blobs/v4.7.4/di=
st/changes-4.7.4
> and mostly contains bug fix.
>=20
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    8 +++
>  meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb          |   12 ----
>  meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |   12 ++++
>  19 files changed, 326 insertions(+), 326 deletions(-)
>  delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3.inc
>  delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3/0001-Added-Openembedded-=
crossarch-option.patch
>  delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3/g++.conf
>  delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch
>  delete mode 100644 meta/recipes-qt/qt4/qt-4.7.3/linux.conf
>  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4.inc
>  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-=
crossarch-option.patch
>  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/g++.conf
>  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
>  create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/linux.conf
>  delete mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
>  create mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
>  delete mode 100644 meta/recipes-qt/qt4/qt4-native_4.7.3.bb
>  create mode 100644 meta/recipes-qt/qt4/qt4-native_4.7.4.bb
>  delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
>  create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
>  delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
>  create mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb

Could you redo the patch, and try to make git detect renames? I'd guess
that a lot of the changes above are only a rename, possibly with a few
lines modified. That would make the review of the patch a lot easier...

The create-pull-request script ought to have found most, if not all, of
the renames in this patch. Otherwise, please, modify that -M option to
some suitable value.=20

Regards,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB


