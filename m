Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF0D6FD16
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 12:20:32 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id b6so305201yha.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Oct 2014 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=58jq3MSpefcqJss1rhLQCj1fRwjPliCm//k/z7rjrqA=;
	b=ptkK4QRqAwxPzTuntQZdX+++ck8vntp6Jwa29776lvkPWN7gx8KqrHpOdjbnxHo+jE
	eTEKBMT4Zd9MRuCDyD94CFRgn7tNMt15Eu+StS4+ED7rLrBY7xclS0eT5ZngC/YWT6ew
	QxnNJzzqEDEEbQ94lkxChHWhyDQN07PCEgY2aScGxSciC67FHB2lozdg/D9zkaS5stPr
	D24NdmfiLe+RElQW/8+EIVVlGkYh7dwc9WwqdO0C6nh5edhjL8m8VHIJLYYFt+tJqC5Q
	U8DTIV37OHnuRp87zhR0eNCgQo5cAxVnXH8lIfLWJToiZ54o3ZdPd286dGYcz4LIiLF3
	8egw==
MIME-Version: 1.0
X-Received: by 10.236.126.19 with SMTP id a19mr7888699yhi.136.1412338833653;
	Fri, 03 Oct 2014 05:20:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Fri, 3 Oct 2014 05:20:33 -0700 (PDT)
In-Reply-To: <DA8287CC96892A4EB4FCF4FB3FBDA1AB03DB34@dor-sms-xch01.digi.com>
References: <1412237161-48093-1-git-send-email-javier.viguera@digi.com>
	<CAJTo0Lazv8xfBPA51UF_NDz0MJm7tCgjEP9Ya404x0V54q7dAA@mail.gmail.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB03D9B8@dor-sms-xch01.digi.com>
	<CAJTo0LYOkeLawn2TW=8+E=GwsBLEoYJdTM8LQ6LZfu3RpcAzLg@mail.gmail.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB03DAAE@dor-sms-xch01.digi.com>
	<CAP9ODKp9EmiTgaLptOQ5qKYjadJ0zBB00_Gjs1whd-i4PB+bJQ@mail.gmail.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB03DB34@dor-sms-xch01.digi.com>
Date: Fri, 3 Oct 2014 09:20:33 -0300
X-Google-Sender-Auth: lodMREHCLH8k17rZIET32DxdSVw
Message-ID: <CAP9ODKq+GY8aBzjfE3EPbuXQs-6jK4-o4zBjUHK2ro3rUPP1Og@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Viguera, Javier" <Javier.Viguera@digi.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-packagegroup-sdk-host: add nativesdk-u-boot-mkimage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Oct 2014 12:20:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2014 at 3:59 AM, Viguera, Javier <Javier.Viguera@digi.com> w=
rote:
>> -----Original Message-----
>> From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On
>> Ross concern is because we shouldn't force mkimage in every SDK. If
>> someone is using barebox, or grub, it shouldn't be added.
>
> Hi Otavio,
>
> I understand what the concern is, what I don't see yet is how to address =
this *practically*. I put some questions in my previous e-mail, do you have=
 any hints?

Check this:

http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/48084

> I see there is a nativesdk-packagegroup-sdk-host.bbappend in *meta-fsl-ar=
m* that unconditionally adds some tools to the toolchain (elftosb, mxsldr).=
 If my previous patch is not accepted in oe-core, are you willing to accept=
 the same patch in this bbappend in meta-fsl-arm?

Yes; we can work out something there.

The proposal I sent above had no much interest and people didn't
comment much. I still intend to look at it but I been with no free
time lately.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

