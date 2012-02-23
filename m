Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0WK1-0006U1-3i
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:54:49 +0100
Received: by vcqp1 with SMTP id p1so833805vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:46:27 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.220.156.208 as permitted sender) client-ip=10.220.156.208; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.220.156.208 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.220.156.208])
	by 10.220.156.208 with SMTP id y16mr415378vcw.28.1329993987670
	(num_hops = 1); Thu, 23 Feb 2012 02:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tMa//IESXcqy54wXzR592WxS+/+i1sl8si4dqrWFsQQ=;
	b=japwok+fE0eLMIyKZttlcciDL6ggRMHvmkAPI+X+4pi/HHEmx0PkNsqjnonI1ybs1c
	BYZfZmQJt3/zOrG/+mHFTXblzcpuMlnRouK4AHQ7lgEOYgDVmMp6QA+R+9xhysb7kTnC
	Dowu2zESHunSTKtj9iUxPWnLjbIxUPbSZ0JKM=
MIME-Version: 1.0
Received: by 10.220.156.208 with SMTP id y16mr337989vcw.28.1329993987604; Thu,
	23 Feb 2012 02:46:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.203.74 with HTTP; Thu, 23 Feb 2012 02:46:27 -0800 (PST)
In-Reply-To: <1329992278.32110.54.camel@ted>
References: <1329992278.32110.54.camel@ted>
Date: Thu, 23 Feb 2012 08:46:27 -0200
X-Google-Sender-Auth: mxf_XuIqwGukBrh2nSyyxCfbXho
Message-ID: <CAP9ODKomVXg1Ry=o3ao_yWdiOQK6f2ViG86xHgmsrfML9BvkHg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstatesig.py: Move package exclusion list to the layer config
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
X-List-Received-Date: Thu, 23 Feb 2012 10:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 08:17, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> +SIGGEN_EXCLUDERECIPES_ABISAFE =3D "sysvinit-inittab shadow-securetty opk=
g-config-base netbase formfactor xserver-xf86-config pointercal base-files"

I would prefer one package per line here so it is easier to read a
diff changing this, in future.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


