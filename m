Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RiTv8-0004g9-W0
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:42:35 +0100
Received: by qcqw6 with SMTP id w6so9916480qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=G5vnq3xf0NwsHg4vtOwimUoma9T4WsLETSPRtbpE5bE=;
	b=rd8o62onkzZ7vOmTX0dwz0mJuaeaVGZ3/dfaxmyqrNtjwx8cipzP7u6FOqYB+mfWRn
	RNjHuz8uLgu1fje/Q2AEms1YckQyhgq6iMF2KxipcprvP5FDO3c5Rrb7tWgSxbwX+jLQ
	nEqI2TFU6LkPBGBErNyhZ1dCfYORifVcS993w=
Received: by 10.224.200.197 with SMTP id ex5mr23563273qab.88.1325694912256;
	Wed, 04 Jan 2012 08:35:12 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Wed, 4 Jan 2012 08:34:51 -0800 (PST)
In-Reply-To: <1325694194.20759.23.camel@ted>
References: <1325642890.24646.8.camel@lenny> <1325694194.20759.23.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 4 Jan 2012 09:34:51 -0700
X-Google-Sender-Auth: p6iN4mt9RsTGubeOYrBGcMTyXJM
Message-ID: <CABcZANkD1Dik9YDK82UJ72wMV4jLnczCKtDrPYH9gJchqjH=sQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: poky@yoctoproject.org, Colin Walters <walters@verbum.org>
Subject: Re: [poky] -dev RPM packages Require:ing all of their bitbake build dependences
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
X-List-Received-Date: Wed, 04 Jan 2012 16:42:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2012 at 9:23 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> Another approach would be to stop injecting -dev Requires by default. =
=C2=A0I
>> imagine this was done to handle the case of library A whose headers
>> require library B. =C2=A0However, a saner way to handle this I think is
>> simply to push people to use pkg-config; IIRC a script exists to extract
>> pkg-config dependencies from the .pc files and use that for the RPM
>> auto-dependency phase. =C2=A0That would ensure that e.g. gtk+-dev Requir=
es:
>> glib-dev. =C2=A0This doesn't help non-pkg-config libraries, but those pe=
ople
>> should be shamed anyways =3D)
>
> I think these dependencies are wrong and need revisiting. Currently,
> -dev and -dbg packages share the same code and its tilted more in favour
> of -dbg than it is for -dev.
>
> I think the -dev packages make sense if you want to build X but not
> build something that just depends on X. We should therefore move the
> dependencies to a new package (need a good name) and rethink the -dev
> package dependencies.


I'm inclined to say let the user install the deps needed to build X
themselves, or build it with bitbake, and let -dev work the way it
does in other distros, the bits needed to build against X.
--=20
Christopher Larson


