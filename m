Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RGr0O-0001co-LU
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 13:41:48 +0200
Received: by bkat8 with SMTP id t8so3622200bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 04:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XvcwHx5QAcxKK1H28F6PxMKIR4IhW80SduV10k+ra8o=;
	b=QrnPKzyA37nveQi/R8JPeGCeoQurceXAySsSiJhpf9UgiqtJR11yb40rI9gKasXjHt
	4uatuV1eRY/0S4GyqRY/yKCCKCBbwpxVyY05iRz2LtV5+XqhUSjYI4qb90JLwBFJ3sHa
	4YVBS4HWyeYKJ68FaK+sqXn1S9bpr/c0AwD8c=
MIME-Version: 1.0
Received: by 10.204.135.24 with SMTP id l24mr7752933bkt.57.1319110556461; Thu,
	20 Oct 2011 04:35:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Thu, 20 Oct 2011 04:35:56 -0700 (PDT)
In-Reply-To: <46567209-1B97-42F5-B5DF-E34B823F6BF7@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
	<1317221697.12332.13.camel@ted>
	<89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
	<1317239461.12332.55.camel@ted>
	<CAP9ODKopjm-bJY3WJriMiQDtwZcsOWeqZkqnm7F2PwiZvWY0bg@mail.gmail.com>
	<67E90C92-F94E-4FF2-ADA5-A5295C4F1279@dominion.thruhere.net>
	<1319109715.16061.4.camel@ted>
	<46567209-1B97-42F5-B5DF-E34B823F6BF7@dominion.thruhere.net>
Date: Thu, 20 Oct 2011 09:35:56 -0200
X-Google-Sender-Auth: pPLDFnybp_17dcroqaAZs1h-eew
Message-ID: <CAP9ODKpZYJkP_GWuzmvVwL=boy4C+y8CsPQam525H8=-49wiPA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
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
X-List-Received-Date: Thu, 20 Oct 2011 11:41:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 09:29, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
...
>> So I'm drawing a line here and no, we can't take this. If its fine to
>> expect people to bump PR values manually for lib* changes, its fine for
>> kernels too. I'd suggest you do drop this from meta-oe and we start
>> building up pressure for the problem to get fixed properly rather than
>> letting people wallpaper over the cracks.
>
> I have products to ship, so treating meta-oe as a plaything and break thi=
s for the sake of breaking it is unacceptable. I'll let oe-core have the mo=
nopoly on high-qualitily, but broken metadata.

Richard,

It makes no sense to don't accept this as it reduces delta between
oe-core and meta-oe and makes easier for other people to move from
oe-classic to oe-core. Once the auto-PR arrives this can be deprecated
but delaying it with no ETA is no sense.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


