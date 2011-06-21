Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QZ2v6-0005YC-8H
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 17:31:16 +0200
Received: by bwz5 with SMTP id 5so26576bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=3Ticvr0ZncHovVCb5ojoF/jMFyV1eevZ0ENAdSfNNak=;
	b=JBkfQZhgaGVJmtNTE7Eu7E08zbdBcu3eix9Al3NhC93VTFZOENnlAQ4oDjiFiQxWrO
	ztlrF5XnVr4h0C+g+Zctr1sc4Vi3w9zwbQqlBaV5j3h3sfuAPIsBubA7Eu5duhjQoZCG
	0gLXaDOkoU2CZNdnqX8WepgRA8VxUBmSN0oh0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=mVi4FFOnsqNOaLu3J68OfaQhlaJfMUGT+6uyiAYaq6M5tAx0Yq2knNjGAXqDfsM3pk
	dKqtxHe+xeJIfTSX+xuR51M8oOtCGnk7DtBMJmUyGbTbJxj5Wrx98uyXpCRg9ye/MSw6
	CvaoyhBb1kW7BOoEmCHFEmuyp7geB5QLs/goM=
MIME-Version: 1.0
Received: by 10.204.114.144 with SMTP id e16mr1200937bkq.119.1308670062834;
	Tue, 21 Jun 2011 08:27:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.73.70 with HTTP; Tue, 21 Jun 2011 08:27:42 -0700 (PDT)
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6997B5E7679@shsmsx502.ccr.corp.intel.com>
References: <BANLkTin20ZXvBnT9phab1KZcZ1iCkO8RaQ@mail.gmail.com>
	<4DFD379B.8010701@mentor.com>
	<BANLkTimkH5e4ViO7aNP9typLSBvBKrSNxw@mail.gmail.com>
	<1865303E0DED764181A9D882DEF65FB6997B5E766E@shsmsx502.ccr.corp.intel.com>
	<BANLkTikJq-eeWNEAdAeZ7O3+qm7OZiH+zA@mail.gmail.com>
	<1865303E0DED764181A9D882DEF65FB6997B5E7679@shsmsx502.ccr.corp.intel.com>
Date: Tue, 21 Jun 2011 12:27:42 -0300
X-Google-Sender-Auth: aIa-MRYbAvhlkECIn45rl7_Rsf8
Message-ID: <BANLkTikWr=QrC4X5OSf8UhiYv=4VZa1EFg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: BUG: intltool depends on libxml-parser-perl to be installed on host
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
X-List-Received-Date: Tue, 21 Jun 2011 15:31:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2011 at 12:20, Cui, Dexuan <dexuan.cui@intel.com> wrote:
> I think I can reproduce the issue with the same steps on a Ubuntu 10.10 h=
ost.
> I'm going to further look into this.
> Please report a bug on the bugzilla, so we can better track it. :-)

Sorry but I don't have an account on the tracking system and prefer if
you do it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


