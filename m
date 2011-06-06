Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QTfCH-0006KM-H3
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 21:10:45 +0200
Received: by bwz5 with SMTP id 5so4196725bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2011 12:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Q+bJkDAzxBkJgKe5YiF9roQFAFlxtC1KLgFdjZl7yxA=;
	b=WSX0fmt4TY2Tro23jPdc3H8cwTL+h0igL8vRbACY/jk3aWKTRh1yEXppLUb9AWEjm3
	PJNI1SXobKMGcjregnKNTv59MIFBIAdrbY3fm9xWsuMGjGPxwB/29180FbZwT+lEnqyL
	txHKOxruIlKQ5qEZ4P4GrNEgZpcFx2Vz9r6FE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=qfLd0f35N4YNtPbzC2v8iCyeJjlquVlYKWLdGq/aCI3BH3KDmqL+b4bESHXiua4Ehr
	7bT8n0dtF2gvk77zKvlgFzPM9LQIQQRzJoViA8e8G5/xFALjmp2a+UwmxLe7p4ipzZNZ
	KUigYq/NZVU3R9qaYDCAAWvVD1UK26X22f9HI=
MIME-Version: 1.0
Received: by 10.204.74.68 with SMTP id t4mr5173949bkj.22.1307387248612; Mon,
	06 Jun 2011 12:07:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Mon, 6 Jun 2011 12:07:28 -0700 (PDT)
In-Reply-To: <1307386818.7672.31.camel@rex>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
	<1307343323.3131.1.camel@lenovo.internal.reciva.com>
	<1307357430.7672.7.camel@rex> <4DED055A.8010200@linux.intel.com>
	<BANLkTi=5YeR0kkX+9TwkaJXe=azKdwxxwA@mail.gmail.com>
	<1307386818.7672.31.camel@rex>
Date: Mon, 6 Jun 2011 19:07:28 +0000
X-Google-Sender-Auth: 5yV3dWZ3OIVERYLVHGanYXQ9p-g
Message-ID: <BANLkTinnB+Z5T6HLzjQrpSyDvjxbjKqz5Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 01/20] bitbake.conf: Create staticlibs pacakge for static libraries
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
X-List-Received-Date: Mon, 06 Jun 2011 19:10:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 6, 2011 at 19:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-06-06 at 17:31 +0000, Otavio Salvador wrote:
>> I personally prefer -static. -staticlib seems redundant for me since
>> we can end with libfoo-staticlib
>
> -static doesn't really work well given we already have -static packages
> meaning something else (e.g. the busybox case).

Aren't we changing the wrong name? In my opinion then busybox ought to
be renamed. Like busybox-staticlinked or busybox-nolibs.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


