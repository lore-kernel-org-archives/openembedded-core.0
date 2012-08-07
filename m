Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SykqJ-0004vi-Vj
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 16:33:08 +0200
Received: by weyr6 with SMTP id r6so2623933wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=vdAOyaUg8mUFHh/PGHMoX9JOl8RCZPYBjnYuBIpupVg=;
	b=VR3XsKtbpHwnoD6pGxjugfJdcr88PG+ouvGBuL1H/0LU5ZhDgcyCwz/BwtULk4Je5c
	JR3LgHIMtk5AbcE/Yq2qdXcJG+i1APCuAPRw86GriTc5anliIK2gQXZXNRhG2309c0TC
	aZ6pgd58230FUcHYZOBMDpo1surDMuNjnTAh2iaY21ixWoAVvYjWDEQYjYTCCull6h13
	rRijk+C2S//cJuJSrZrn/ng31eGxReHNo8eEqHxhSxyeeGJs8nh3dh3/rSXbIyIFWFTP
	QFPx8JvXfQsq3nIk7a1hoefa2qJJ1l9qQuCydkVgXxB6fEZuKCdzQ9bbprdS3bD2aDWb
	h2Bw==
MIME-Version: 1.0
Received: by 10.50.217.163 with SMTP id oz3mr8825436igc.5.1344349281097; Tue,
	07 Aug 2012 07:21:21 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 7 Aug 2012 07:21:21 -0700 (PDT)
In-Reply-To: <CALbNGRTBW1E6N5F0t3qaT+2BzGO9xeaXLLAFkFz6PE5dFy9=dw@mail.gmail.com>
References: <1344258422-32173-1-git-send-email-radu.moisan@intel.com>
	<CALbNGRTBW1E6N5F0t3qaT+2BzGO9xeaXLLAFkFz6PE5dFy9=dw@mail.gmail.com>
Date: Tue, 7 Aug 2012 16:21:21 +0200
Message-ID: <CALbNGRS5mM4mTGsXUw1q+jVxtPZkPjHBGRQqpzaMfH0tx4=1gA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: upgrade to upstream stable 1.30.0
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
X-List-Received-Date: Tue, 07 Aug 2012 14:33:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 7, 2012 at 4:19 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Aug 6, 2012 at 3:07 PM, Radu Moisan <radu.moisan@intel.com> wrote=
:
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>  .../pango/pango-1.28.4/noconst.patch               |  408 -------------=
-------
>>  .../multilib-fix-clean.patch                       |    0
>>  .../{pango-1.28.4 =3D> pango-1.30.0}/no-tests.patch  |   14 +-
>>  .../pango/{pango_1.28.4.bb =3D> pango_1.30.0.bb}     |    9 +-
>>  4 files changed, 10 insertions(+), 421 deletions(-)
>>  delete mode 100644 meta/recipes-graphics/pango/pango-1.28.4/noconst.pat=
ch
>>  rename meta/recipes-graphics/pango/{pango-1.28.4 =3D> pango-1.30.0}/mul=
tilib-fix-clean.patch (100%)
>>  rename meta/recipes-graphics/pango/{pango-1.28.4 =3D> pango-1.30.0}/no-=
tests.patch (33%)
>>  rename meta/recipes-graphics/pango/{pango_1.28.4.bb =3D> pango_1.30.0.b=
b} (49%)
>>
> I don't know if it's supposed to, but it does not fix the pango module
> issue for me {1].
>
> Andreas
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/0269=
19.html
Sorry - I am on the wrong machine forget my previous mail - will test it he=
re.

Andreas


