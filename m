Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1YN8-0003cP-BD
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 09:50:34 +0200
Received: by eekb57 with SMTP id b57so309980eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 00:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=SOBwHbevwKveGN6HGtlkcfmZbttgbJV/hxZIR85KV6Y=;
	b=ZkGs5gR/iNAWn1WfsJuKrj/NzMKa7xILBoJd2/4GYCXW6ibDPZxON+qTC9bO3mEkRv
	IW2vlOEyY/bZML+j/RSoO+rv79Yr9PdFZ/XzndPHapbeKJ1ZdMOsRLKyLeZ3UmHcVVG5
	ft2onWLzX7UDeQhzK66O9h3BNubqr/GTrvBQseYkyO/HsMFBQ5TbPLXKi2p1X9CICufN
	3ep5OQDW8Ye0KN1EJ1GHS9LkAnvvX1aGGtGGpic+X4kq0fNEEmEnCyuf6SnVn33YYDMi
	oKbjYoNPQeVYt+Qh96RFHIdu44KJOUHO1RRT7zwAAiAyPa5g/QBxFxzU+4sPJrEdk0JE
	X2Rg==
Received: by 10.14.218.134 with SMTP id k6mr19071122eep.14.1345016318552;
	Wed, 15 Aug 2012 00:38:38 -0700 (PDT)
Received: from ?IPv6:2001:610:612::fdf3:e292:2da4:ca2e?
	([2001:610:612:0:fdf3:e292:2da4:ca2e])
	by mx.google.com with ESMTPS id 9sm1808379eei.12.2012.08.15.00.38.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 00:38:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1344984262-31589-1-git-send-email-andy.ross@windriver.com>
Date: Wed, 15 Aug 2012 09:38:38 +0200
Message-Id: <6F6DFF61-5E17-4374-9624-1904572762C7@dominion.thruhere.net>
References: <1344984262-31589-1-git-send-email-andy.ross@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkkORRk5kXanJkJHKYa7fJPptYQk8Ox0iwsztShWCzw+2ST+C2f+/7Cq3uCsP76L3rTh3sV
Subject: Re: [PATCH] task-core-lsb: Don't pull in eglibc-pic via RDEPENDS
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
X-List-Received-Date: Wed, 15 Aug 2012 07:50:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 aug. 2012, om 00:44 heeft Andy Ross <andy.ross@windriver.com> het =
volgende geschreven:

> The task-core-lsb-runtime-add subpackage includes eglibc-pic as an
> RDEPEND.  That's incorrect, eglibc-pic is nothing but 22MB of static
> libraries and should never appear as a runtime dependency.
>=20
> Signed-off-by: Andy Ross <andy.ross@windriver.com>
> ---
> meta/recipes-extended/tasks/task-core-lsb.bb | 1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb =
b/meta/recipes-extended/tasks/task-core-lsb.bb
> index 553b89e..be9eac2 100644
> --- a/meta/recipes-extended/tasks/task-core-lsb.bb
> +++ b/meta/recipes-extended/tasks/task-core-lsb.bb
> @@ -194,7 +194,6 @@ RDEPENDS_task-core-lsb-runtime-add =3D "\
>     eglibc-localedata-posix \
>     eglibc-extra-nss \
>     eglibc-pcprofile \
> -    eglibc-pic \
>     eglibc-utils \
> "


MIssing PR bump=


