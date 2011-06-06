Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QTdgy-0004jt-OW
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 19:34:20 +0200
Received: by bwz5 with SMTP id 5so4110788bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2011 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nemlO6pXwgEr0BpnLflEdWAXgVEMErzcJZ/0NxofS9Q=;
	b=Tj3fMRRIFMZN1urKAP5PRlhjxH3L0uNu6Byu61kJgpCCt6SVSceFWjD4lbDC9KY97D
	oW+kw2WeefbbQS+F4BenQa8Gfq5Y+V7ZlgYT9aig+LzWOkTlsNim+gpYBWKYCF/hTduF
	gDHU0p1385T24Mk2z9+0hX0hNpssYW2p6uuk0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Ucb0IQlCIaA4YlJ5gnDz1sw5PKYnSx0wkHrWKHBxZ+lYxykUnOQE1eV91foH9uF/qw
	hfh7vKJ+V5r4KcRjvCbahnmgBaXkqPr0smVRhg5nWoroIVmN99c4UsLQlvfp1APA9SW8
	6IMACRiAtm8Wv51/+GiwISJJJR2tg+DcoeQj4=
MIME-Version: 1.0
Received: by 10.204.126.14 with SMTP id a14mr5236671bks.157.1307381464402;
	Mon, 06 Jun 2011 10:31:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Mon, 6 Jun 2011 10:31:04 -0700 (PDT)
In-Reply-To: <4DED055A.8010200@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
	<1307343323.3131.1.camel@lenovo.internal.reciva.com>
	<1307357430.7672.7.camel@rex> <4DED055A.8010200@linux.intel.com>
Date: Mon, 6 Jun 2011 17:31:04 +0000
X-Google-Sender-Auth: Lwd8ilFqjKZJTlkSWqYZkcogBJo
Message-ID: <BANLkTi=5YeR0kkX+9TwkaJXe=azKdwxxwA@mail.gmail.com>
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
X-List-Received-Date: Mon, 06 Jun 2011 17:34:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 6, 2011 at 16:50, Saul Wold <sgw@linux.intel.com> wrote:
...
> As was pointed out earlier Fedora packages static libraries in a "-static=
"
> package, but this had other implications for OE due to -static already be=
ing
> in use (for busybox and mplayer), I am not sure that this is not a proble=
m
> for OE-Core, I would need to investigate. =A0Meego also seems to use the
> Fedora standard with "-static".
...

I personally prefer -static. -staticlib seems redundant for me since
we can end with libfoo-staticlib

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


