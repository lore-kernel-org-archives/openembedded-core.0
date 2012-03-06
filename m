Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4y6r-0004Ta-MW
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:23:37 +0100
Received: by vbbfr13 with SMTP id fr13so4852489vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:15:01 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.99.231 as permitted sender) client-ip=10.52.99.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.99.231 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.99.231])
	by 10.52.99.231 with SMTP id et7mr42281192vdb.114.1331054101385
	(num_hops = 1); Tue, 06 Mar 2012 09:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HLF/Kf1O3mAnQS4IKBL/g8GbUCpbrfBuDg13erx7i5E=;
	b=p3QTTjCzVjOlHqTJh0AvC9k/pVFxEZQ2HXniJFj9BNE5Q34w3VLknDeOvWEJgBrA5d
	PNJb8yklWz/CfbftP68mb3BEGWqiI+lGj9siQYXq1tCyfuOASvOxyZeQT92LSAwzpYvt
	x4Mz2p37rKLNAvoP526a2SkBpUotLRfeVNDiSgmfgARXNEFSQYRtnEBh4fFYKqrGMEd7
	ljjZ0H1if/3h1jEXxOS65v5myDneJi/zSq5tnpjB9ZN5hOUZzg9OFSvLGCmEsF849lJs
	y+5PK4U3qaUYzG4LSVwiNcOC4A3lZ01f6QFcQXX2hc9HxRAkTvu5Kson539pYa0U46N/
	XiYg==
MIME-Version: 1.0
Received: by 10.52.99.231 with SMTP id et7mr36233562vdb.114.1331054101284;
	Tue, 06 Mar 2012 09:15:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 6 Mar 2012 09:15:01 -0800 (PST)
In-Reply-To: <de5c29df23ffa4bef8c729377827750a73e01368.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
	<de5c29df23ffa4bef8c729377827750a73e01368.1331053126.git.sgw@linux.intel.com>
Date: Tue, 6 Mar 2012 14:15:01 -0300
X-Google-Sender-Auth: 88wmDEUgDqXvYfoExRTmY84JaWI
Message-ID: <CAP9ODKoHv9CqZWsMyfiNtu6ig56j5b6SthZJOFXeiHQx0DWRPg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 04/20] image.bbclass: fix rootfs generation without package management tools
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
X-List-Received-Date: Tue, 06 Mar 2012 17:23:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 14:03, Saul Wold <sgw@linux.intel.com> wrote:
> When building without package management tools the
> ROOTFS_BOOTSTRAP_INSTALL packages need to be available to provide the
> bare minimal for rootfs unconfigure postinsts to be on first boot.

Please hold it until I fix the issues on the other patches of the same
set as it will break systemd based images without a proper patch in
meta-oe just after it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


