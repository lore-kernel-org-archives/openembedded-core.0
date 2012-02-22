Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0EzU-0007AZ-47
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:24:28 +0100
Received: by vbbff1 with SMTP id ff1so171142vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 08:16:07 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.176.130 as permitted sender) client-ip=10.52.176.130; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.176.130 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.176.130])
	by 10.52.176.130 with SMTP id ci2mr15058694vdc.33.1329927367572
	(num_hops = 1); Wed, 22 Feb 2012 08:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9ipo6wOx7MOYBeuygvsd561bMx5Rz2pK1vZ4vOH6ywk=;
	b=GAJj3XS+GSzISXumCDfj3mm/dNLbBFGmAe6rWm9UcUKtQv3m6t4xw8qZbMC2LOxDjT
	ivWRmqyxY9aV7WNCiYCwxLQOcB7mYGaA0OHDUMdIb0KdPvzG9evkkt7/V+03/1Bp5cvn
	/cZ7ewC5bLEgbcYhORCzsxqyPgCuLb2R4bPHE=
MIME-Version: 1.0
Received: by 10.52.176.130 with SMTP id ci2mr12312864vdc.33.1329927367503;
	Wed, 22 Feb 2012 08:16:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.149.81 with HTTP; Wed, 22 Feb 2012 08:16:07 -0800 (PST)
In-Reply-To: <1329926977.20261.168.camel@ted>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<1329923198.20261.160.camel@ted>
	<CAP9ODKp9uc7UajJYHNZ_QJ_R+YOXmPt_ZU2phHWFQvG-2CnOng@mail.gmail.com>
	<2032247.UMYq2ztU6u@helios>
	<CAP9ODKo_94H_HkxHbvpe-hXpS6t0=5Dqv5QUSHPW+DsYJ=jncA@mail.gmail.com>
	<1329926977.20261.168.camel@ted>
Date: Wed, 22 Feb 2012 14:16:07 -0200
X-Google-Sender-Auth: y8MxMPPM46Y34x94BbUxjR1EHlo
Message-ID: <CAP9ODKpro7+mBMkCismL6Ac6h8AgT6euH-hWp=cUb=Xhp4UXuQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 16:24:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 14:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-02-22 at 13:56 -0200, Otavio Salvador wrote:
>> On Wed, Feb 22, 2012 at 13:53, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > Except here we are talking about a single patch that adds a single fil=
e, which
>> > is easily downloadable from the web interface. If it were more complic=
ated I
>> > could understand the fuss, but right now this is almost ridiculous.
>>
>> It doesn't seem that easy; it seems Koen tried to apply it and it has fa=
iled.
>>
>> Besides, Robert didn't complain about people asking it to be resend.
>> Who is complaining is Richard and I am just justifying the reasoning
>> why it is more the logical to expect it to be done based on OE-Core.
>
> In this case, Richard is presenting the viewpoint he's heard expressed
> by a number of people in private but who don't want to rock the boat on
> the mailing list. I'd like to see the mailing list be a friendly place
> where people don't get flamed for posting patches. Some of the recent
> responses are less than friendly and I think its reasonable to try and
> resolve this.
>
> I'm going to propose that if trees are poky based, the pull request
> should indicate this. People can then act accordingly. No indication
> means its oe-core derived.

If you look at *my* first reply to this thread I just asked him to
resend it based on OE-Core - as he already did - so I could give it a
test. This seemed quite friendly from my POV and he didn't complain.

If people dislike it, it is better if they show up and don't hide behind yo=
u.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


