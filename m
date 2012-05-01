Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPH1t-0002Uh-UH
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 19:38:26 +0200
Received: by lagw12 with SMTP id w12so2629842lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 10:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=c9WNGKV3XD7OnTRzTRqwxxlXrlI1mwnh3SGDMaMkPtk=;
	b=cka9oFLkgkUyjFTExmtL9yxpFqJh0SyOcAleVTERZ2NK5BSYCVLeHV1Np2E8f+wKGd
	kYDXyBM9+Ywvd4BHHquFnylhGYCyVPvniBf6iz/nJVsGpdOv4fNCIYszRIgYmMcYbdZe
	5T53m6kA9QM9GlQ82aqoPk6tT/rhrzCrKrXxT4y2yDv1vCyfOzJF4M/lgvNp4BjMHqli
	expVRVTG5Dh2TRlAtW7DJv5D0l6ztTL93NhmkEqyWYBuGOLTAOrLwwoo1UmZ9HoHpMkW
	sw92UyErjAoLUdUVNramJX/58jbAEfpqXPZafd0U6SGH9KlhYjiYrhntx9QBTbrjjzh3
	VX/A==
Received: by 10.112.100.170 with SMTP id ez10mr12316765lbb.15.1335893322387;
	Tue, 01 May 2012 10:28:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Tue, 1 May 2012 10:28:12 -0700 (PDT)
In-Reply-To: <118912916f6c04b157345bbcb1c722a575769859.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
	<118912916f6c04b157345bbcb1c722a575769859.1335887732.git.kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 May 2012 10:28:12 -0700
Message-ID: <CAMKF1spq7z3nOUEESunkUmfbTVg2T3LHpD6A3AFMh7zovkWq3w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] tcmode-external-csl: use the existing precompiled locale files
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
X-List-Received-Date: Tue, 01 May 2012 17:38:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 1, 2012 at 8:58 AM, Christopher Larson <kergoth@gmail.com> wrote:
> +# No need to re-compile the locale files
> +GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
> +ENABLE_BINARY_LOCALE_GENERATION = ""

should this be 0


