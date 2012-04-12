Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SIPiQ-0008Pa-Kc
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 21:29:58 +0200
Received: by vbbfr13 with SMTP id fr13so1809566vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 12:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=V3Cf2VCsVKNJKguO6ZnSYM/yWptnBA8wEATpc1AU6vA=;
	b=xqIP9f6bEw8VJcx6YIO/RoxTeYRloi+sl/F/PVzE+VsEtQNsUiuNP6AwAM0uoJ9c7E
	7KonOrMFzXwDxvzTaIAYOBjezBooOfr3o3oosxlL6P930P2QNeLdGgTiV9IukGRWlWNU
	qlEBXeBX/yunjPdrgZLQXOFcuYSJ2i+hNiHrpGhfDgHF7m+i9mvD3ySY5tHEak4OqiHs
	F9di7kM0hH/5q59Y+GDoNUm5zVK36uyKrSxJk4gJHGMwi7OSwOWO8AHPsh+ebk5fqKx3
	0t8JWvNHdm1AzFkNFpyYj9pTW+m/3lFq22jgGI2PJciFfZyjYemTEgIvzAwnVQzVN2aV
	nSBg==
MIME-Version: 1.0
Received: by 10.220.228.200 with SMTP id jf8mr1923956vcb.0.1334258437802; Thu,
	12 Apr 2012 12:20:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Thu, 12 Apr 2012 12:20:37 -0700 (PDT)
In-Reply-To: <1334256020.7309.45.camel@ted>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
	<D08D0BD0-4C47-4062-9B08-F44FD1683EED@dominion.thruhere.net>
	<CAP9ODKraSBuER3diXxFR8sFW4xN=UKHi=76fTNBm=isJTban8g@mail.gmail.com>
	<1334256020.7309.45.camel@ted>
Date: Thu, 12 Apr 2012 16:20:37 -0300
X-Google-Sender-Auth: T9VZp1Y6l12R35QLbfuOdFgmC3M
Message-ID: <CAP9ODKrs-w8zQHP6KMDj3ZAzMYuLxQ1=KKQgS+uirC+1h2n5Ng@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 19:29:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 15:40, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> I think layers ought to have tags for both ...
>>
>> <layer>-oe-core-<tag>
>> <layer>-yocto-<tag>
>
> This would be rather sad if it were necessary. The whole point is we're
> trying to build things which are compatible with each other. If that
> turns out not to be the case I want to fix it, not encourage it.

They will be compatible but users wouldn't be asking: Does layer X
works with OE-Core Y and Yocto W?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


