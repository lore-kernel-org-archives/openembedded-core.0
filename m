Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SUm94-0002sE-H2
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 23:52:34 +0200
Received: by vbbfr13 with SMTP id fr13so1232751vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=3xX7KS8iN8jxt2BlP8m2L7k4MlGP557trIyrCTUKOXg=;
	b=aTBhEwaMuZVur/pF1Z43vuU/QxhaAHImfUYLtV9+fuco7lJGP12Ak6jznLtOHLS+q3
	VOdljgR7opWm2n3g5JB2QZ+77jeQj2nfDQ5C8ygH6Q2M4CbJCQlYBZIRBeBZFazBeEEE
	5q8mTc9l92XYsxfDQ3+cGzRZj1hvG6RHO/nEPyGgX44q0QQ3CqhOI9XYBZgENlw787RL
	C7AujMd7pwR5wBNf1SBQWvW0O7vRIQbC+f9QjligEFaIPrDtwfI90ECeHWOOkvzMoUhT
	cCPNbvfW6mzE3Bq/ODpZ2ae75up2ZdU3omizSCE4JvGB6sUpBmW4Bv3hCSKUCGA5E5Tq
	fsLg==
MIME-Version: 1.0
Received: by 10.220.141.207 with SMTP id n15mr3533709vcu.68.1337204552332;
	Wed, 16 May 2012 14:42:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Wed, 16 May 2012 14:42:32 -0700 (PDT)
In-Reply-To: <CAMKF1so4jRESbLbG867ehEBRgJjh=nJcoLPsFjNtvC+tnCg=Og@mail.gmail.com>
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
	<A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
	<CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
	<CAMKF1so4jRESbLbG867ehEBRgJjh=nJcoLPsFjNtvC+tnCg=Og@mail.gmail.com>
Date: Wed, 16 May 2012 18:42:32 -0300
X-Google-Sender-Auth: -m4eRWzlCXPI8WCKs4lB0Cu24fE
Message-ID: <CAP9ODKq51+a9UbXP9wdgRnP4_LtX+wPt=ujCL7iZptBQNhq92A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [PATCH] evtest: Add evtest 1.30 support
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
X-List-Received-Date: Wed, 16 May 2012 21:52:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 6:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 16, 2012 at 1:59 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>>
>> Have it in oe-core allow for inclusion of it with other test utilities
>> and easier to use for Yocto people. Why do you object in have it
>> there?
>
> if it can be said that its very common piece then it could go into OE-Cor=
e
> but if its just for usability choosing a proper non OE-Core layer is
> the right thing

Ok; well said but how do you qualify it?

evtest is very nice to have around when debugging stuff and suit very
well for a bring-up image for BSPs and like, It seems like a good
addition for me and that's why I have said to Daiane to send it to
oe-core. It is a debug and test utility and as it is generic and non
architecture or board dependant, oe-core seemed the right place for
it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


