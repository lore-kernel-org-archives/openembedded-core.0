Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SGENE-0004Z3-RW
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 20:59:04 +0200
Received: by vbbfr13 with SMTP id fr13so1463384vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 11:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QVg1GJXtztSInstd5nVJNCfIWZnB7hCe1bsyqS5h9Cg=;
	b=WHl1uYvvHaExFz5aFkgHjmJsHKWDBXe0q07oXrNBlwWI6tKfDhsBdURystD8o7Aucg
	GYPgDjf9EncBYPChtXCd+FUlAmSPZC1i17ok6dLcphTPUTxV4hvKh6AtN8V6iy0sA48I
	YS2NBP4ZXAdm7DiV3hdkB+QY4F4LvBwj5DX0qbCKDLI5Vrm6yxB07RnwZrORbTDQVbBL
	MzkOsEHMJQr6f0mLAN9IS0lSAKFLh8e7nw61h1NfeF0mh4ds8N3HAWZ7O+hAUu8DqP14
	6MtsL5coGSKMBt/Xuu7GewXymZps4nXCnwotDQRfPxo8aYpYAuLTMNmPlK0DwH2V3Npk
	Hbtg==
MIME-Version: 1.0
Received: by 10.220.228.200 with SMTP id jf8mr467887vcb.0.1333738191240; Fri,
	06 Apr 2012 11:49:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Fri, 6 Apr 2012 11:49:51 -0700 (PDT)
In-Reply-To: <BE831345A714428CA4205A5C517FF2AC@gmail.com>
References: <CAP9ODKodLVh6Njh2eZrckJBk+1qaJ7QbssFmCfty+gowXyrsRA@mail.gmail.com>
	<BE831345A714428CA4205A5C517FF2AC@gmail.com>
Date: Fri, 6 Apr 2012 15:49:51 -0300
X-Google-Sender-Auth: U9cs6DO95fAFOgGhATwMm87aUSY
Message-ID: <CAP9ODKoy9qiWiTYT7=Jz2huPRwvYJjmLs+R27GkFJj6pM7bXrQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems with rebuilds caused by sstate cache changes
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
X-List-Received-Date: Fri, 06 Apr 2012 18:59:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 6, 2012 at 15:48, Christopher Larson <kergoth@gmail.com> wrote:
> Have you seen the other threads on the subject? Further, I don't think
> rm_work is an ideal fix, considering its problematic interactions with
> sstate in the past, unless those have been fixed?

I didn't see. The right fix would be the PRServer but from my last
test it seems not ready for use yet. I had some wierd failures with
git based recipes.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


