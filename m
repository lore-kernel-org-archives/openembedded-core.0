Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RGsLq-0006ZK-RR
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 15:08:03 +0200
Received: by bkat8 with SMTP id t8so3710064bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aQtn9zz8BJFZK3N7hc/bM8PbA6/+0YJnvulvXuJ0aDw=;
	b=lgVhFsb5oBTP+eSzNl0nHpbeVCJ82q+lDxYZvysUw1bFVP1n3zoRl4plz4D+y6SzrT
	2GjATjD2rZJNPYhURxHyBbdtyCw4cHrSyJKYBHZ8RbzE82pThCQNbI0H8vmc7n/8hIk7
	kPxGXH6SpLLFZGVoyQm3dON99Vp6zReoXOolQ=
MIME-Version: 1.0
Received: by 10.204.157.142 with SMTP id b14mr8053509bkx.44.1319115730630;
	Thu, 20 Oct 2011 06:02:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Thu, 20 Oct 2011 06:02:10 -0700 (PDT)
In-Reply-To: <7D5D6BF3-6F21-4CE5-8A30-F9154CDB9449@dominion.thruhere.net>
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
	<1319114339.2410.5.camel@ted>
	<7D5D6BF3-6F21-4CE5-8A30-F9154CDB9449@dominion.thruhere.net>
Date: Thu, 20 Oct 2011 11:02:10 -0200
X-Google-Sender-Auth: dWeH05tBanPH6sa3htoi05vn0Fc
Message-ID: <CAP9ODKqFfswQ4Y6fJBJMTjrvnu0syiS3rAWxZjhdtwyx_Z_SWQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Oct 2011 13:08:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 10:54, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
...
>> Also, the idea never was to have everyone using bleeding edge for
>> shipping products. This is what stable releases are for?
>
> That's what stable releases are for, but I don't see a release for OE-cor=
e, do you? I see a poky release, but not an OE-core release.

People, let's calm down.

I think since Richard disagree about pushing this patch and more then
one person disagree with Richard, TSC is the way to go.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


