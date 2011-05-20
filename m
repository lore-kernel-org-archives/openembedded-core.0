Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNUb5-0003BY-4n
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 20:38:51 +0200
Received: by ewy5 with SMTP id 5so1312000ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 11:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=pYLw6zFQc6LpsV1mZS/ut7zOUS0RUrNwU1j0gxVtdyA=;
	b=fqNO5TaGG2YXGWmBFRV1gkFppNc8DeLJRx2RH3OEq5LuYxx+Ut0JHcWXzAs+R4IaG5
	E+9g4U4DVBhCYUpkERUfkHm3jhXnrRueLuBh2K+vhD5jJwtVEppWXuTAq+M4NaJRFP5n
	KM9DCT7wirmMN4vNMA+EQYtIl/IA1IckGV+7I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=OzQaPC+1fhfFnSJ86svLerYuufXPoMQR94VBkI/G8Zs+QtJ0ZpGOTkWW8JFq4ZbSbd
	QX3yfVadhIN1h1vUlsmrjeffMeasfkYhmLmJSnvEmonHL/Mm3OL4XpbYTCj+TiwHmoKf
	tkoAZYaPcu9EH7KDeJFUvbuh4+6tW7vJm2myA=
Received: by 10.14.10.18 with SMTP id 18mr1748542eeu.172.1305916551215; Fri,
	20 May 2011 11:35:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Fri, 20 May 2011 11:35:21 -0700 (PDT)
In-Reply-To: <4DD69167.1010703@opendreambox.org>
References: <cover.1305839225.git.raj.khem@gmail.com>
	<836208067c345a911ddb3a266ac398b435054798.1305839225.git.raj.khem@gmail.com>
	<1305873952.18415.249.camel@lenovo.internal.reciva.com>
	<1305903707.2525.29.camel@phil-desktop>
	<4DD69167.1010703@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 May 2011 11:35:21 -0700
Message-ID: <BANLkTi=HYrwcpdTRFwT0X6ei+Np=uYVDnQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] opkg-utils: Allow uppercase lettlers in package names
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
X-List-Received-Date: Fri, 20 May 2011 18:38:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 20, 2011 at 9:05 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> http://patches.openembedded.org/patch/2255/ should solve the problem. I
> was waiting for a second ack.
>
> Khem, if this fixes the problem for you, please send an ack or push this
> patch.
>

yes it does thanks. I meant to look for this before I butchered opkg-utils
but my memory did not serve me well.


