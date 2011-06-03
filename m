Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QSTkz-0007Km-EA
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 14:45:41 +0200
Received: by bwz5 with SMTP id 5so2018192bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2011 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=jg4bAS47QQzyGxdZynX95Ut1DvSew0ZOzDeg00JWvIg=;
	b=dHlOhdhpTw9AjpCJA0hi7C3N/Eanj41ec3CwojdM5XZg5xnL4t2UOff0ubtU1VEPN0
	yUG0PGB2F/2fgL1S6w3Ksneb7fuKWWwNWglN/gAOIV/1XfdgyI0gK1yTBCmcArayFCFx
	OuKAK6Bn0kpPsBhoW8AdGicGJJyHELwyYv8po=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=WPS++4NV5aQxOBuQUkGgutoXJSQ/H/JCTi0671uXD9YR/0s5k24tpl7GH2T8BRtw3r
	4+Le8jJPYqiksYZky4pSRw63rOlxJBoaWSC3959eszcPYAWEdj8fpDcRUMltRvY7C6Qh
	jOIQ/5P17TqjdBJzuKdUldH0Jbrt9S8G4GXP4=
MIME-Version: 1.0
Received: by 10.204.7.211 with SMTP id e19mr1190665bke.139.1307104948572; Fri,
	03 Jun 2011 05:42:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.20 with HTTP; Fri, 3 Jun 2011 05:42:28 -0700 (PDT)
In-Reply-To: <4DE83048.1030100@linux.intel.com>
References: <cover.1307042670.git.otavio@ossystems.com.br>
	<21881aba9031cefb72fcc33cca9d146169f344e9.1307042670.git.otavio@ossystems.com.br>
	<4DE83048.1030100@linux.intel.com>
Date: Fri, 3 Jun 2011 12:42:28 +0000
X-Google-Sender-Auth: A0w7iubI2oHgjYPtUf0b3PVd368
Message-ID: <BANLkTi=543W1GHO7rQXbbDBeOYTzarxCOA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] xf86-driver-common.inc: remove .la files to avoid unpackaged warning
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
X-List-Received-Date: Fri, 03 Jun 2011 12:45:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 3, 2011 at 00:52, Saul Wold <sgw@linux.intel.com> wrote:
> Would it not be better to package them in the -dev package instead of
> throwing them away?

They are not packaged by I remove them to avoid the unshiped warning.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


