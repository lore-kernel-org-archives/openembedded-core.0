Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIN7C-00055F-Ja
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 17:38:50 +0200
Received: by bwz5 with SMTP id 5so2936137bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=w3CFVzWp1tZtgxyIn5zeR2UMaNNc6zbHvpXxRbziYuY=;
	b=B2mQgxmp4YVtpa2FIyYJxXx4V2NGBkBsM4cF3xF1QWUvaJCJ+kxHoqa8snbscHR43n
	AXJ2v2Gox5LjbeeudOqpeMMLPqW7vY4ZYnifu38FlRSH5PNiKsk+wgIm1zPHVrdrXXw7
	byGO2C+23IGRuMGeho2Gx27LmszZUEmNW/MxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=xlmFaW0u8JtxKbmQnlPNX7wWWC3tLtY4WWA5393yOFnV1ZMILuB/s0/z+RFgc07KNE
	h19f3Z4ktGpvWGQMPZXvlfWd7ENEAcSGbOabXywU3gVOPV5bcEyq91CBAcEcWjqhZwr9
	52NLuEhXTqLDTTbcKoSSpKB+Q/NnIh8jQwVF4=
MIME-Version: 1.0
Received: by 10.204.136.210 with SMTP id s18mr933279bkt.56.1304696169760; Fri,
	06 May 2011 08:36:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.70.138 with HTTP; Fri, 6 May 2011 08:36:09 -0700 (PDT)
In-Reply-To: <1B7A477C-E4A5-4EBC-A7E3-CAA30A583ADF@dominion.thruhere.net>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
	<1304691622.30391.124.camel@rex>
	<1B7A477C-E4A5-4EBC-A7E3-CAA30A583ADF@dominion.thruhere.net>
Date: Fri, 6 May 2011 12:36:09 -0300
X-Google-Sender-Auth: mefS1eg1XRyxhoyjEndhJmdlhRw
Message-ID: <BANLkTi=yVmeX5xH8qHwOHwoeoXqi5Hs2uA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 15:38:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2011 at 11:51, Koen Kooi <koen@dominion.thruhere.net> wrote:
> So, is having both sets inside ${PN} a dealbreaker?

I think it is not BUT this choice could be a distro choice. So I see as:

USE_INIT=3D(sysv|systemd|both)

Being both the default.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


