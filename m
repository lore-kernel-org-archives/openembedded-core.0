Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0jr7-0001IK-4x
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 02:21:53 +0100
Received: by daln34 with SMTP id n34so1640116dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 17:13:30 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.68.217.42 as permitted sender) client-ip=10.68.217.42; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.68.217.42 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.68.217.42])
	by 10.68.217.42 with SMTP id ov10mr1172480pbc.85.1330046010564
	(num_hops = 1); Thu, 23 Feb 2012 17:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gasIyCyYHp/E+96YzjSV4vhNfLkJ/BJCDzLnCjBdMIM=;
	b=lGKcbGd9QqFMRjCy4l8jq5jkEdl/8Eklv0tFSjrv2uGivjyZdccWmDpsc7ibzJLg1w
	2Nn5DdcdpYtp7AAKfNK+dEcUVrfIR7RqF9cwpSBNpA/e+1+F5FVvA3UgGdNeHc6yxe3B
	O7NKeQ90BUkQB9/J7mZv7rWFY6pCicRQNWbK0=
MIME-Version: 1.0
Received: by 10.68.217.42 with SMTP id ov10mr967005pbc.85.1330046010386; Thu,
	23 Feb 2012 17:13:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.231.36 with HTTP; Thu, 23 Feb 2012 17:13:30 -0800 (PST)
In-Reply-To: <4F46CD3A.9030603@opendreambox.org>
References: <4F46CD3A.9030603@opendreambox.org>
Date: Thu, 23 Feb 2012 23:13:30 -0200
X-Google-Sender-Auth: 4-xqseAPtbzU7HV9iGSr59GSjFU
Message-ID: <CAP9ODKofTGnhn8N2n5ekQbuKOwhaAg_SrPu9F1MjGcOcsJGRUg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: package version went backwards
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
X-List-Received-Date: Fri, 24 Feb 2012 01:21:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 21:35, Andreas Oberritter <obi@opendreambox.org> wr=
ote:
> ERROR: Package version for package sysvinit-inittab went backwards which
> would break package feeds from (0:2.88dsf-r6 to 0:2.88dsf-r6-dream1)

This is indeed a bug in the versioning code. :-(

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


