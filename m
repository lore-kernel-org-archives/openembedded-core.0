Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SV94V-0007LS-Og
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 00:21:23 +0200
Received: by vbbfr13 with SMTP id fr13so2279349vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 15:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=aCJ32fW/tsolKaP2ocy5oonuOyjIQeQpmCq45tlPMxw=;
	b=IFbraXP7fEX7n6Rqpu76Y/FskZF/3TJdHlFR0VAGVYyzLjPnDL0+bclCFfGasFJfJ2
	ruGHiRNSemyi+9z8Fj6apAhod3hJrQEumVSuAgLEXvs7Z+lBTtYnFXDUvu4fpaXn+En7
	MoSbFv2UZQ/GLpBq0y6HEVzAKaagYZEVtnIEn2BR+k6e8/CyFCFneVeV1RmQ8i1mevTs
	pC3tSy/n0zLsw71DnzL9pipn4GHkfPLf+CnJm/b+bjI8gsbdqC53za4GTNLeXc1VeLZu
	Z8REhZD2ufBJ2x+57MXT5bY3jOM62/NLkDYgSZnF73hnrudeAHTlU7ojXeT84Gs12R/q
	AGrw==
MIME-Version: 1.0
Received: by 10.52.34.73 with SMTP id x9mr4686477vdi.27.1337292680477; Thu, 17
	May 2012 15:11:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Thu, 17 May 2012 15:11:20 -0700 (PDT)
In-Reply-To: <30398737.cYKCjogiDH@helios>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<2398024.EpgDMcMvMx@helios>
	<CAP9ODKqc5eubLWKrbPowvunHaUX0Fhbk-XLFgH=b+pr8m+tGcQ@mail.gmail.com>
	<30398737.cYKCjogiDH@helios>
Date: Thu, 17 May 2012 19:11:20 -0300
X-Google-Sender-Auth: 02PoST7fD0ginYu8tWYjVdkyPV0
Message-ID: <CAP9ODKoV-pZTPrn5HrLR5b4soceeN+81e3HWYQ_OxdbVfDiQvg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Thu, 17 May 2012 22:21:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 7:01 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 17 May 2012 18:51:05 Otavio Salvador wrote:
>> It is important to state that if OE-Core breaks Meta-OE this is
>> crticial. It is not Yocto that people use and many active contributors
>> use Meta-OE so it is important and critical to that people. Seems more
>> health to the project to give the deserved value to Meta-OE instead of
>> badmouth it...
>
> The sooner people can start using it without fear of it doing unexpected
> things, the sooner people will be able to have more confidence in it and =
stop
> making negative comments about it. As it stands the way a lot of people t=
reat
> meta-oe is a source of recipes to be copied elsewhere because they feel t=
hey
> cannot use the layer as a whole. I think that's a big shame.

Agreed; the nice thing about Free Software is that we can do something
about it; do negative comments help nothing.

Most people on Yocto do not contribute actively to Meta-OE. As
example, you did 12 commits in total to it...

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


