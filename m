Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RBQeb-0004Ti-Dt
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 14:32:53 +0200
Received: by bke11 with SMTP id 11so2072810bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=YBhTpswLcT0j6hUtquBC1zQLurtQ+H3GkvhFucTdK6E=;
	b=SvwU4fjeq9B8iMgDGah3wNuXvgdJNzxaP5RUwqXfllrLzdsGkWZIlxoFvyjzAnlkPY
	u/Y9S4RKDSltuUYPo3cN43cT0XA68bh333poG1KedORX9QHes0FxxNg7PJdHhMLBkdCv
	R3Y+qnB2zPaKzcgKaVvA4Z+8RwZAjZM86FGeU=
MIME-Version: 1.0
Received: by 10.204.148.18 with SMTP id n18mr1593835bkv.166.1317817638556;
	Wed, 05 Oct 2011 05:27:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Wed, 5 Oct 2011 05:27:18 -0700 (PDT)
In-Reply-To: <11F8FF03-4C38-4D33-9250-66B5C180698C@dominion.thruhere.net>
References: <1317370770-27225-1-git-send-email-Martin.Jansa@gmail.com>
	<1317392122.12332.208.camel@ted>
	<20110930164658.GB7364@jama.jama.net>
	<1317402578.12332.218.camel@ted>
	<CAP9ODKqb8RGLi_5-_+uegLmtZ7Wo-70oDJcF_R6yaSJ2q9mGwg@mail.gmail.com>
	<1317765609.14671.118.camel@ted>
	<CAP9ODKrfDeDMomqeJCeyJBWqD_KqdMO=WBvjVY5d_j+btn3DfQ@mail.gmail.com>
	<11F8FF03-4C38-4D33-9250-66B5C180698C@dominion.thruhere.net>
Date: Wed, 5 Oct 2011 09:27:18 -0300
X-Google-Sender-Auth: scU74e508D0AD_x74EAOxau6JJM
Message-ID: <CAP9ODKp5+nmtPfm+AabX5K9YoGnY_KVE6E1HxP=DJ2c+H2WdcQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] Improve handling of 'all' architecture recipes and their interaction with sstate
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
X-List-Received-Date: Wed, 05 Oct 2011 12:32:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 09:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 5 okt. 2011 om 07:10 heeft Otavio Salvador <otavio@ossystems.com.br> h=
et volgende geschreven:
>> On Tue, Oct 4, 2011 at 19:00, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> Really? hal doesn't really replace udev though, we can just use udev
>>> directly in place of it for many things now?
>>
>> Yes, many moved from hal to udev.
>>
>>> Specifically which applications are people using with dependencies on
>>> hal? As has been pointed out we can fix the xserver and that appears to
>>> be the only thing remaining in OE-Core?
>>
>> OE-Core can be easily hal-less but I just ask for hal to not be
>> removed from meta data as I and probably others hasn't finish the move
>> to udev yet.
>
> Put it in your own layer if you need it. No point in keeping obsolete stu=
ff in oe-core.

I wouldn't call it obsolete as it is still a valid option to Xorg and
maybe others. So people might want to use it. I use it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


