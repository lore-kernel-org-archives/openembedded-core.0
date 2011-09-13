Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3Wdi-0002sQ-08
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 19:19:18 +0200
Received: by bke11 with SMTP id 11so701924bke.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 10:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CBRydu0LHcXtazcpCte1X6snAX+rNBq2VIQv8QsdpGo=;
	b=tO1LJJhUZDUeh0hFzBaDdKu91Es7Uck5c+4PFGqlx8fYgthHW7vxYZYQr3TJS8zzIj
	hC7+v/to2XqE7/f5NBypHxLVv6MbE1cJgpOqB7ZV7SZSXOfG26oeSQ8onN44EhLQ/gNn
	lg9dXQKfOz/N4hlpYb7Qrh3Z9/6u/Rv3UVp1g=
MIME-Version: 1.0
Received: by 10.204.129.214 with SMTP id p22mr16656bks.93.1315934048361; Tue,
	13 Sep 2011 10:14:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Tue, 13 Sep 2011 10:14:08 -0700 (PDT)
In-Reply-To: <1315933706.13526.11.camel@ted>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com> <1315643085.1986.24.camel@ted>
	<1315646891.4368.13.camel@lenovo.internal.reciva.com>
	<1315648440.1986.27.camel@ted>
	<1315655628.4368.14.camel@lenovo.internal.reciva.com>
	<1315933706.13526.11.camel@ted>
Date: Tue, 13 Sep 2011 14:14:08 -0300
X-Google-Sender-Auth: nXstdyuVALDKnpBu2edY1OJn0q4
Message-ID: <CAP9ODKoPuV9de+4C-7sZhACNNutxnmA5XDRT7vavaTGb6zfpqA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Tue, 13 Sep 2011 17:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2011 at 14:08, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> I've therefore taken the decision to revert this since I really want to
> stablise for the release at this point and I'm not filled with
> confidence that there aren't other problems lurking here.

With a close release this seems to be the right decision but I do like
the idea behind the patch and I think we ought to fix those for next
release.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


