Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDLNu-0007nK-LL
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 21:51:50 +0200
Received: by qcso7 with SMTP id o7so1617555qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bEJyHcpD6lTfB2lrfuJTwgIBoR1hlf94XcpmQzflVkA=;
	b=pXo6baOjZSgN/V8/4ZKJvFpq6E2Fyg3ZdvdFgcXkAJi26BkUnumXDV8XTOaTZMdxCC
	YVwufguGRptuFqQnHvQNX8x4BEFyTloyyd7sCnpXyLJW6mWtrqAfdjVlsCQVY8SbVKMw
	ud1gQLX9iL7xl24SvETW3wWgLe2u+ZYwI7xuvXkuG4cBTLmWIZy1/B1RhaSghimXGTWt
	GyvPB6Fd8HL0K4ovOlgFUl68U3ffOZtJhR8yVsaWPU6s20EL51ddI4KDnr1NZpgyjerd
	iDzt1VWFt7WHzWpsO2Gsf/GzhM4KrI7/BB49SWkZjjDTHFpexodu/74ywLbphlde7ecG
	7kNQ==
Received: by 10.224.182.201 with SMTP id cd9mr1832649qab.92.1333050166624;
	Thu, 29 Mar 2012 12:42:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Thu, 29 Mar 2012 12:42:26 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1203291533390.5968@oneiric>
References: <alpine.DEB.2.02.1203291505580.4586@oneiric>
	<20120329212924.5d01d792@eb-e6520>
	<alpine.DEB.2.02.1203291533390.5968@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 29 Mar 2012 12:42:26 -0700
X-Google-Sender-Auth: ANwQPbUy1e21aGBQ_0e0Rf3jqrM
Message-ID: <CABcZANk4VfaVaSD=rLc8RjdcyaCUnN8oK3=oDXpBxZk_pSGfbA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: argh ... "_append" versus "+=" and IMAGE_INSTALL confusion
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
X-List-Received-Date: Thu, 29 Mar 2012 19:51:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 29, 2012 at 12:35 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> On Thu, 29 Mar 2012, Eric B=C3=A9nard wrote:
>
>> Le Thu, 29 Mar 2012 15:23:20 -0400 (EDT),
>> "Robert P. J. Day" <rpjday@crashcourse.ca> a =C3=A9crit :
>> > =C2=A0 so what is best practise here?
>> >
>> for this one you have an answer on OE's wiki :
>> http://www.openembedded.org/wiki/I_want_an_image_with_package_XYZ_instal=
led
>
> =C2=A0despite the fact that the current reference manual *explicitly*
> says this?
>
> "Using IMAGE_INSTALL with the +=3D operator from the /conf/local.conf
> file or from within an image recipe is not recommended as it can cause
> ordering issues."
>
> =C2=A0i actually did my research before i asked that question, you know.

The two aren't conflicting. The wiki page talks about creating an
image or using bbappend, where +=3D works fine. You have to use _append
in local.conf because it's postponed, occurs at the end of the parse.
If you use +=3D there, the recipe will then set IMAGE_INSTALL, blowing
away the global value you +=3D'd to.
--=20
Christopher Larson


