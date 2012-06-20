Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShDmH-00032o-P1
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 07:48:29 +0200
Received: by eekd49 with SMTP id d49so2286612eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 22:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Bc4oblAavQQgni7AbMONaQNnWzuFR4neLA1dPKHJvOo=;
	b=UuRGuI7tMWAjAQMZ6K8cdAxD5JnBmwcrr7QztCpui8xkN6OB5K7qeOtDFfoVIfm1TS
	UoO9Fgwj1P1ajKHyETDDtUWVZSS9lkALmzTKAnFMwO6xfyEplWmgkPYZLlwXU8kHaTP8
	NdR7dLPzzyfoFZM0T9CSWH6X9DLPVqxji5wC64/8bAinpM/a4Vt+dwyfsxfyl3Kk1cdV
	YrNvqT2+nJl6LRId8dsBINf6QEVc632PkU3LAv5M7C1msTggcoyQPbmdI88KKMLqSpor
	bEvUIkT+tLHJkB4omOkeM9oronbWyzYv8vpIZ4RX/58Cyi5IKcDCDG59DEDwEsix+iKe
	8DJg==
Received: by 10.14.97.16 with SMTP id s16mr4531211eef.117.1340170665349; Tue,
	19 Jun 2012 22:37:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Tue, 19 Jun 2012 22:37:15 -0700 (PDT)
In-Reply-To: <CAJy-8bt3YwS1L3Oj=vonPY2Yzar2oGW0PWRbLx18EbHUigszAw@mail.gmail.com>
References: <CAJy-8bt3YwS1L3Oj=vonPY2Yzar2oGW0PWRbLx18EbHUigszAw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jun 2012 22:37:15 -0700
Message-ID: <CAMKF1sq1zLSDH2twH9toheN6nHwzuLFZ=+KZBDWsutckY+F4Qw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to use external tool chain to build opebembedded-core ?
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
X-List-Received-Date: Wed, 20 Jun 2012 05:48:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2012 at 7:41 PM, Michael Zhu <boot2linux@gmail.com> wrote:
> Dears,
> how to use prebuilt external tool chain to build=C2=A0 openembedded-core =
?
> thanks!

Look at meta/conf/distro/include/tcmode-external-sourcery.inc

thats how code sourcery toolchains are hooked in. and you do set
TCMODE =3D "external-sourcery" in your local.conf

and it will use csl toolchains, linaro has something similar look at
linaro layer
look at

git://git.linaro.org/people/kwerner/meta-linaro.git

it calls the TCMODE =3D "external-linaro"

you can set your own following these as examples.

> B.R.
> Michael
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


