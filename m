Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0aE3-00031n-DX
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:04:55 +0100
Received: by pbbjt11 with SMTP id jt11so721783pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:56:33 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.68.193.136 as permitted sender) client-ip=10.68.193.136; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.68.193.136 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.68.193.136])
	by 10.68.193.136 with SMTP id ho8mr4824663pbc.148.1330008993349
	(num_hops = 1); Thu, 23 Feb 2012 06:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=br4n7DOA06y6lrtdiq0XAPpEF+t4GYWUMFZsDjiQidQ=;
	b=ToLw9y5U63I5Nb4f9GbXT7TqXCVUnPEkqijHVl9V0Ey00AKyAnmeSmh7MjxwknbBqB
	MZt8TyJl8gu9DAlhG2utEqqv0v4dhCMq4LVZdOvZmW830L4f94/Tzxa3afwA9jkxhiGH
	c+oqHJi2QEuN0NMOcNsAyUj0as2dxbVvMjLdg=
MIME-Version: 1.0
Received: by 10.68.193.136 with SMTP id ho8mr4122747pbc.148.1330008993290;
	Thu, 23 Feb 2012 06:56:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 23 Feb 2012 06:56:33 -0800 (PST)
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Date: Thu, 23 Feb 2012 12:56:33 -0200
X-Google-Sender-Auth: huCx_ap-B6R86RjER3_hfQNHXDs
Message-ID: <CAP9ODKp2puQg8KMMHdEApyqkwrEKV3OPLKStLxw3iMFX9C63=Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/16] Various fixes, mostly for WARNING messages
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
X-List-Received-Date: Thu, 23 Feb 2012 15:04:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 11:37, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> These patches mainly fix various warning issues reported by the build but
> there are a couple of other improvements/fixes thrown in.

From looking on the patches seems fine except I'd remove the .la files
instead of adding it on -dev. I didn't build-test it as it is based on
Poky.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


