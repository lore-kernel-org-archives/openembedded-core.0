Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S8XdU-00059S-0S
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 14:56:04 +0100
Received: by vcbfl13 with SMTP id fl13so4845871vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 06:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=naf9f7CmmjLpyJLSzNEOgqUsh6WaTUgj5B7n5Ov7sAg=;
	b=duPiz+Lf8i2D4I70sgesnVzYKFPAdst6F4qZzvQ+GhShiViioeIzMlvw4ZjK16Oxix
	kbE4jFTukxqvujTT2l5vjRvalCrrk0vIN4WZXjGA7DdBjg6kRyNkZd966tvJ6vXc6ajt
	fI+pZl7C+qVfhUdFMztX2nHTFZbXaAp4OIzL+ChUuoJLDlVGbwkO9VD0V5Lb31T/NoO3
	Qj69/ctTvvAc9SqVYo34H0pdSxLhoiBMzrwYqBy/YDyxtgDeJkRd5asqujMO9b72O9k4
	MXzGihteQbeUoo3ClVZPt5d82gZeqftafdzh4wsayb4tBJE5V4oYah54lXnXE3WEvkU7
	vvrA==
MIME-Version: 1.0
Received: by 10.52.68.241 with SMTP id z17mr1473010vdt.97.1331905635850; Fri,
	16 Mar 2012 06:47:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Fri, 16 Mar 2012 06:47:15 -0700 (PDT)
In-Reply-To: <3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
	<F29B7771-8017-4CB4-AFCF-19CB857CAAD1@dominion.thruhere.net>
	<3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
Date: Fri, 16 Mar 2012 10:47:15 -0300
X-Google-Sender-Auth: -7GSDkY0zUTMCZdcTTLnBnWm_MM
Message-ID: <CAP9ODKrhrWvsXMLwz6GCcrNNWJVWzbVxOn55WS6fkN1O4AnFJw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/60] Package Upgrade
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
X-List-Received-Date: Fri, 16 Mar 2012 13:56:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 16, 2012 at 10:45, Wang, Shane <shane.wang@intel.com> wrote:
> I built those recipes separately, built core-image-sato on qemux86 and qe=
muarm, and launched the image in the emulator and ran some applications.

What Koen is concerned about is files being removed, huge size changes
and so on. All those might affect the use of the referred application
and ought to be check individually for validness.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


