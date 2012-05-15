Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SUMfG-0002xb-M9
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 20:40:06 +0200
Received: by wibhm14 with SMTP id hm14so4212679wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 11:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=aWUv718iopKxw/gr1RqeldoMJPobQqVnhEjSlVzgNN4=;
	b=Brv4Y/dYNHc+JQiunZtYq8aH/P9r+94jfFHgDy5XgpLbKzZoD++H19K3A4IoBfsTLb
	wQi/ZzN8Vxg57Sp/Gzcaaq1ceqY1dUHEHsXClxzopDQF1rj2OEjCXiYVast5i+Sncg2x
	WAIMZ82NtoXtZgmFORPJAv4I8o0WwiJ3VQ9inXz5YxQPBV7JcOOAeGvYu3PXd3mEKl+b
	Sx++GJ1EoysKXnC1U0C9UFZmel077OhA3QgACDNbG26BIQBMzfy1u9nyXRWGC5jpxDow
	LIYolKXtNZGtmifr2hhT7lrYNTNf06fK55ypiYr1uI7y3aOSle9AEW2Bx8YNAnfI05ig
	In3Q==
Received: by 10.216.54.206 with SMTP id i56mr22932wec.28.1337106606288; Tue,
	15 May 2012 11:30:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.181.16 with HTTP; Tue, 15 May 2012 11:29:45 -0700 (PDT)
In-Reply-To: <cover.1337105658.git.peter.seebach@windriver.com>
References: <cover.1337105658.git.peter.seebach@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 15 May 2012 11:29:45 -0700
X-Google-Sender-Auth: Wkqhzyb0NwfSVqDxTXTQDsNr1oo
Message-ID: <CABcZANnW5LRmadpRqwWpJd-_n=t6vMV-shJJdX4CUaokZ95Emg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] tcmode-external-csl: Allow overriding some key values
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
X-List-Received-Date: Tue, 15 May 2012 18:40:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2012 at 11:16 AM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> This tiny little set of ?=3D changes lets me use a different CS binary
> toolchain than the one being supported by the external-csl feature by
> default, allowing us to share more code.
>
> Also I improved an error message. =C2=A0(Side note: =C2=A0Sorry if it's s=
pammy
> to have a separate patch for it, but I couldn't convince myself that thes=
e
> two changes were doing the same thing.)

Looks good, thanks.
--=20
Christopher Larson


