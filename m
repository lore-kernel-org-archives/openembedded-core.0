Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ruk2C-0003Jq-9N
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 13:20:32 +0100
Received: by werc1 with SMTP id c1so5555287wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 04:12:30 -0800 (PST)
Received: by 10.216.137.166 with SMTP id y38mr8418001wei.16.1328616750086;
	Tue, 07 Feb 2012 04:12:30 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s2sm42877838wix.3.2012.02.07.04.12.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 04:12:29 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1328613869-19250-1-git-send-email-andrei@gherzan.ro>
Date: Tue, 7 Feb 2012 13:12:22 +0100
Message-Id: <F229F287-890C-429C-BE74-8E38AB5E0C25@dominion.thruhere.net>
References: <1328613869-19250-1-git-send-email-andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/3] nspr: Integrate version 4.8.9
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
X-List-Received-Date: Tue, 07 Feb 2012 12:20:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 feb. 2012, om 12:24 heeft Andrei Gherzan het volgende geschreven:

> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> Signed-off-by: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
> ---
> meta/recipes-support/nspr/files/nspr.pc |   11 +++++++++
> meta/recipes-support/nspr/nspr_4.8.9.bb |   36 =
+++++++++++++++++++++++++++++++
> 2 files changed, 47 insertions(+), 0 deletions(-)
> create mode 100644 meta/recipes-support/nspr/files/nspr.pc
> create mode 100644 meta/recipes-support/nspr/nspr_4.8.9.bb
>=20
> diff --git a/meta/recipes-support/nspr/files/nspr.pc =
b/meta/recipes-support/nspr/files/nspr.pc
> new file mode 100644
> index 0000000..c3aed84
> --- /dev/null
> +++ b/meta/recipes-support/nspr/files/nspr.pc
> @@ -0,0 +1,11 @@
> +os_libs=3D-lpthread -ldl
> +prefix=3D/usr
> +exec_prefix=3D/usr
> +libdir=3D/usr/lib
> +includedir=3D/usr/include

The above hardcodes an fs layout that isn't true for e.g. micro

> +
> +Name: NSPR
> +Description: The Netscape Portable Runtime
> +Version: 4.8.9
> +Libs: -L${libdir} -lplds4 -lplc4 -lnspr4 -lpthread -ldl
> +Cflags:=20
> diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb =
b/meta/recipes-support/nspr/nspr_4.8.9.bb
> new file mode 100644
> index 0000000..a2fcc64
> --- /dev/null
> +++ b/meta/recipes-support/nspr/nspr_4.8.9.bb

Does nspr belong in OE-core?

regards,

Koen=


