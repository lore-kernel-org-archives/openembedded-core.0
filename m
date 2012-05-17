Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SV8ku-000764-KW
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 00:01:08 +0200
Received: by vbbfr13 with SMTP id fr13so2264105vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 14:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=L4Jdoj1l9rw5duy15EEY4nNmg9ac67+V7Kf/sAmhwxc=;
	b=gvIj6ec2MUIdoVJF1dY3f+DbjSOMt2uLOpqiy60bf7K4954BoNtiY+xQLRbkhiB2kV
	JrOs/FYKpgYQ7kOL9sJQzINi0uCzSU/mTEcooQ8tXRDwDhEDaznX4Ltad2ukFAD84d0E
	Qz7Hh6W7PO0ihGnRkd1FhLD+HoIVKbP51ur/d9yixH7RinghkXyk6c7faTEfa4TsAdp/
	m3dbjO9UkjeTqlC/uHrP3hNeIcLoregGTIvyQCv8+i/nTjGc4S4A0Gq2mCQasGrxBcGx
	05hBEj3zzTpeQeBCnnhK31p1uLml2OuLJkjaSi2gRys4OZnFxBz8yetb47SCKdJdKpEn
	F/gA==
MIME-Version: 1.0
Received: by 10.52.26.232 with SMTP id o8mr4641631vdg.64.1337291465129; Thu,
	17 May 2012 14:51:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Thu, 17 May 2012 14:51:05 -0700 (PDT)
In-Reply-To: <2398024.EpgDMcMvMx@helios>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted>
	<20120517211637.GD23562@bill-the-cat> <2398024.EpgDMcMvMx@helios>
Date: Thu, 17 May 2012 18:51:05 -0300
X-Google-Sender-Auth: Pyv3Aw0DTDVYBWslD1f4yccrhF8
Message-ID: <CAP9ODKqc5eubLWKrbPowvunHaUX0Fhbk-XLFgH=b+pr8m+tGcQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 17 May 2012 22:01:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 6:25 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 17 May 2012 14:16:37 Tom Rini wrote:
>> All that's happened is that meta-oe has been working as intended and put
>> in a newer version of a recipe, before oe-core can move to it, and found
>> problems that need to be addressed.
>
> This is where I disagree - IMHO meta-oe should be split such that you can=
 get
> the additional recipes in it without unexpected surprises like critical s=
ystem
> components (like udev) being up-revved and then breakage resulting. There=
 is
> some work needed to get to this point but we need to keep moving towards =
it I
> think.

From time to time it is easier to avoid to work in OE-Core and work in
meta-oe or another layer; udev is no different. It has been update in
meta-oe long time ago and many people use and depends on it.

It is important to state that if OE-Core breaks Meta-OE this is
crticial. It is not Yocto that people use and many active contributors
use Meta-OE so it is important and critical to that people. Seems more
health to the project to give the deserved value to Meta-OE instead of
badmouth it...

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


