Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0EjU-0006OZ-NJ
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:07:57 +0100
Received: by vbbff1 with SMTP id ff1so153524vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 07:59:36 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.176.130 as permitted sender) client-ip=10.52.176.130; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.176.130 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.176.130])
	by 10.52.176.130 with SMTP id ci2mr15005105vdc.33.1329926376210
	(num_hops = 1); Wed, 22 Feb 2012 07:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sSeBLRNbaM3yhx7fobvEwpGZgIb/y8lRv59PzYmqUGU=;
	b=WIcQ97hPNKADPPMINht/tjrAe2tXu+i5G/1OyUqPNkg/V5thtU2KSXV23YZBiDgR3g
	Yv0zx4GOWcIyW+NxRV56h3USTdkg8K+8RM9ukuk2REh5StbRI6CKrz7TDulBfOSrwXvz
	f+7x+Vz6KJPrEL30ZU8qLGvGUOGfCjXZyXEN4=
MIME-Version: 1.0
Received: by 10.52.176.130 with SMTP id ci2mr12264738vdc.33.1329926376143;
	Wed, 22 Feb 2012 07:59:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.149.81 with HTTP; Wed, 22 Feb 2012 07:59:36 -0800 (PST)
In-Reply-To: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
References: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
Date: Wed, 22 Feb 2012 13:59:36 -0200
X-Google-Sender-Auth: 0PCwW9LOzf0Qhb9jfudSckmb0U8
Message-ID: <CAP9ODKpPNJn-PRijKasZnomGOPuQ5ugBadJGxCdtwSu5FxAUJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Linker error while cross compiling, (Qt issue?)
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
X-List-Received-Date: Wed, 22 Feb 2012 16:07:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 13:53, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> This error really puzzles me, usually I would assume that a library
> has no problems to export symbols.

It puzzles me as well;  I have many applications and libraries linking
against Qt without problem is my first advice is to check the build
system of libdbusmenu-qt and check if it has any linking blackmagic or
something like that.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


