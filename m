Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0EY3-0005fk-TR
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 16:56:08 +0100
Received: by vcqp1 with SMTP id p1so148688vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 07:47:47 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.220.156.201 as permitted sender) client-ip=10.220.156.201; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.220.156.201 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.220.156.201])
	by 10.220.156.201 with SMTP id y9mr12564356vcw.22.1329925667351
	(num_hops = 1); Wed, 22 Feb 2012 07:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FV06mmynMueQqEXVyhKXkHAJblbtOcNhroV+wBTzjdw=;
	b=pklZXAmrjNQoMjZ2zJrAPmEv9zeKxtcAVzUNR1N7dyLJBaJ6QXeaFM/wW5QQFlVvny
	uP1WuSOOyCn5L+AN6MPV9SYcAkL5o+YduZ4adUJkMzhqlhLGPup2TMYkA7IrNw2LJ9Nt
	5vcXIPu1+UmVGzGUts2ksxJPp+4OX1mZz61uY=
MIME-Version: 1.0
Received: by 10.220.156.201 with SMTP id y9mr10120443vcw.22.1329925665552;
	Wed, 22 Feb 2012 07:47:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.149.81 with HTTP; Wed, 22 Feb 2012 07:47:45 -0800 (PST)
In-Reply-To: <1329923198.20261.160.camel@ted>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<287F5295-D8E2-4540-A20D-28D934EAEA88@dominion.thruhere.net>
	<1329920131.20261.148.camel@ted>
	<9FF37BD6-73C7-4056-B38F-BCC8740C5A95@dominion.thruhere.net>
	<1329923198.20261.160.camel@ted>
Date: Wed, 22 Feb 2012 13:47:45 -0200
X-Google-Sender-Auth: fj54k37IszOw3WSMJvDB1N74D8o
Message-ID: <CAP9ODKp9uc7UajJYHNZ_QJ_R+YOXmPt_ZU2phHWFQvG-2CnOng@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 15:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 13:06, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Or why can't people just cherry-pick the patch in, or apply the patch
> manually? The latter is no different to people who just supply the
> patches manually the the list with no corresponding git tree after all.

Because this mean to have and maintain a full clone of the repository
and I don't want and I won't do that.

OE-Core is the base, the mailing list is based on it so it is expected
of it being based on OE-Core.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


