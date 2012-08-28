Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6No2-00016v-SE
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 17:34:18 +0200
Received: by eekb57 with SMTP id b57so1620996eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 08:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=TS5onndQSXjhZN8xYjW3TcCc0lsPl3uirBV0SM47Yrk=;
	b=H4IE1cSTYauLXzlINXdRvJmN0MIqLEG9Nsuj1vOZFQCp5Gdtx2uzYRTtsWCjjGDhrs
	nqiyZYwKAPXqSWmj6afmVDJqwupVcndHTf0tm2enOCdwJzWZjZyYZpKlT6IaFu4qwf3d
	f/PPKjq72y1e94AgdyIGA6yM7YcZSjrc490nLHmRe4nwPvgYDRDzgGK2QRkrOnGRkI6Q
	xqhLuwe7OqGxCAA9xdi5sGXtiaao7Jb6koh2yoTq+3tHorF71z3nFInQxQP6p9ByJM0w
	yTNmD0wRG6exB1q6W7Gsm6Qgmmb0nCoIG1SL00nb6p09ECKXV4sjLfHkvXPM28bNNQmQ
	jx/A==
Received: by 10.14.199.67 with SMTP id w43mr22515465een.33.1346167326016;
	Tue, 28 Aug 2012 08:22:06 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a139:371e:d7dd:fe4d?
	([2001:610:612:0:a139:371e:d7dd:fe4d])
	by mx.google.com with ESMTPS id z3sm62004374eel.15.2012.08.28.08.22.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Aug 2012 08:22:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <acae76c50ae66d8167038782cc623f5de64e1365.1338603853.git.kergoth@gmail.com>
Date: Tue, 28 Aug 2012 17:22:02 +0200
Message-Id: <04FC3EA8-F091-40C2-8106-C288056FB189@dominion.thruhere.net>
References: <cover.1338603853.git.kergoth@gmail.com>
	<acae76c50ae66d8167038782cc623f5de64e1365.1338603853.git.kergoth@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQl16kx9TuYNXmyFBYhmhDgyDKTIbWlBIgP2QJGT0VTPOB/ljs0eaLOtZAAOr/oLSNvCj6ap
Subject: Re: [PATCH 2/2] task-core-basic: drop portmap
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
X-List-Received-Date: Tue, 28 Aug 2012 15:34:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 jun. 2012, om 04:24 heeft Christopher Larson <kergoth@gmail.com> =
het volgende geschreven:

> Both rpcbind and portmap are RPC port mappers. Having both is =
redundant. Chose
> rpcbind over portmap as rpcbind supports ipv6, nfs4, and builds =
without the
> glibc rpc headers, which have been obsoleted in glibc 2.14.
>=20
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
> meta/recipes-extended/tasks/task-core-basic.bb |    1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/tasks/task-core-basic.bb =
b/meta/recipes-extended/tasks/task-core-basic.bb
> index 8bab0db..a810d37 100644
> --- a/meta/recipes-extended/tasks/task-core-basic.bb
> +++ b/meta/recipes-extended/tasks/task-core-basic.bb
> @@ -148,7 +148,6 @@ RDEPENDS_task-core-sys-services =3D "\
>     nfs-utils \
>     pciutils \
>     libpcre \
> -    portmap \
>     rpcbind \
>     sysfsutils \
>     tcp-wrappers \
> --=20

Missing PR bump=


