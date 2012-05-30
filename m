Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SZi4F-00028M-QU
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:31:59 +0200
Received: by eekd49 with SMTP id d49so1755665eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 05:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7aYAioqTFzm+CaaJCxvgSdU1jXKnC1yZnJHzcGL43UA=;
	b=IfutV6NGK0cuMsSrtxvuxAApyZIdZ0Z6v/KU/J+Pc6g/ZGf7PFwDK65uI/ZmtSimlJ
	0eX7MpCMRriUJ+KWvAX9lXjKeckZX5u9giSaxtwtuPXrgm46rxqDT6hRSfm9/DmmZ14v
	x2jRpzE3JEanhvxAEM3VQrBdX+x8qgYcc9RZG0oM6iphGXP9XklWwpiBHUaxeInE1/BX
	RJ+esvNrrZegMMjpVa/gd5fmogchmMqglxEFDfTnfq5NAq/ITY23Q3NC9sMNN5sNQDZf
	riRE5nshbDNHwt7wZFiFKFQLFXB7ji6unlIZV6AGg5ucY6eBim67fKmrKU6oJwirEtMJ
	0qgQ==
Received: by 10.14.185.137 with SMTP id u9mr6660581eem.219.1338380501260;
	Wed, 30 May 2012 05:21:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v46sm60010937eef.11.2012.05.30.05.21.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 05:21:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120530120443.GL3138@jama.jama.net>
Date: Wed, 30 May 2012 14:21:38 +0200
Message-Id: <D7D76DF4-C742-4406-A2AA-E206D1D1A00B@dominion.thruhere.net>
References: <20120530110550.04FA710217@opal>
	<20120530120443.GL3138@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl5GiBVvcxBE1TFEYpV8QaD59pQ/mWwM7vYPWB8Wmwj1lWHe6tFgFCUFyL/V8irn3wstaSP
Subject: Re: [oe-commits] Valentin Popa : xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 30 May 2012 12:31:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 mei 2012, om 14:04 heeft Martin Jansa het volgende geschreven:

> On Wed, May 30, 2012 at 11:05:49AM +0000, git@git.openembedded.org =
wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: da98266f3a228cf65f279db9810a5326c8bd5422
>> URL:    =
http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3Dda98=
266f3a228cf65f279db9810a5326c8bd5422
>>=20
>> Author: Valentin Popa <valentin.popa@intel.com>
>> Date:   Wed May 23 14:08:58 2012 +0300
>>=20
>> xz: updated to version 5.1.1alpha
>=20
> this upgrade is causing liblzma package name change
> -liblzma5_5.0.3-r1_armv4te.ipk
> +liblzma_5.1.1alpha-r0_armv4t.ipk
>=20
> so all packages which rdepends on liblzma should get PR bump, e.g.:
> *libsystemd-journal0
> *libpoppler18
> *libsdl-image-1.2-0
> *libpoppler-glib8
> *systemd
> *ethumb
> *libtiff5
> *epdf

I'd advocate fixing the FILES_* variables to put only the liblzma.so.x =
in the liblzma subpackage and bump PR if it's still needed.=


