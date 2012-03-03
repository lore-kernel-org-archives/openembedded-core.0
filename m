Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3tI3-0001GN-Ah
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 19:02:43 +0100
Received: by vbbfr13 with SMTP id fr13so2490206vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2012 09:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.71.80 as permitted sender) client-ip=10.52.71.80; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.71.80 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.71.80])
	by 10.52.71.80 with SMTP id s16mr24496355vdu.131.1330797250709
	(num_hops = 1); Sat, 03 Mar 2012 09:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lFKZVErBDrOoanOdWocsxUnqC4Tbmzu8xts5YfzM1SM=;
	b=Wfk9SBziGbF3goezldnlfQSpckPBizCrscCriDm8jvYUDLdPccGth5mdn+W3oX0BsM
	CZiZpTTR/q7MsjIN+/pe1ndikco+3NmGtKQR7zdH+pCgyyH9E3HcB/WlnCSvVUSS7JGl
	yFdultuU1taCD2pS/qVEv7JxZ74M3wzaHra/0Oo9ICDDoBKgbOtpHToj/Xxfm/zn2AVm
	Yk+i6itDJHtorYqrizrq1H0R9WyeXWaTm2kdSCFoHYLKeF2PrEwDcGXUAwLrfIiHkNmA
	VJI6dPA2DETtjEJOe+M2H+v4UGMxR/VbeiyhnAQCIGogAT7SNbGJnCwGvuhDFEEBu3i1
	eOkw==
MIME-Version: 1.0
Received: by 10.52.71.80 with SMTP id s16mr20973044vdu.131.1330797250647; Sat,
	03 Mar 2012 09:54:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Sat, 3 Mar 2012 09:54:10 -0800 (PST)
In-Reply-To: <cover.1330796256.git.otavio@ossystems.com.br>
References: <cover.1330796256.git.otavio@ossystems.com.br>
Date: Sat, 3 Mar 2012 14:54:10 -0300
X-Google-Sender-Auth: pz_DPvpPsHE-zepXk6ba0EwfiwE
Message-ID: <CAP9ODKpN3X=k=654p1G6_X6rvp26_HQeifyNeQM4ZowsnFygQg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Postinst trigger improvements for images
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
X-List-Received-Date: Sat, 03 Mar 2012 18:02:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 3, 2012 at 14:39, Otavio Salvador <otavio@ossystems.com.br> wro=
te:
> Otavio Salvador (4):
> =A0run-postinsts: fix opkg data path
> =A0image.bbclass: fix rootfs generation without package management tools
> =A0rootfs_rpm.bbclass: rename postinst trigger script
> =A0opkg: rename postinst trigger script

I pushed the dpkg patch for my branch doing the same as opkg. I forgot
pushing it before doing the pull request.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


