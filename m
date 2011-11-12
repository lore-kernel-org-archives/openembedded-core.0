Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RPG3T-0003FZ-Lb
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 17:03:43 +0100
Received: by bkbzs2 with SMTP id zs2so4416329bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 07:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=mc2smP2m/VvnIUKrCTYghZKqxhLm5TJAwTolgUpB6k8=;
	b=UcUWMC6VnXA7gyhK1T2ZKpmwrr3tnxqUmswRPKkzDOv8Z/m3ShuC0Q7cuktadG+p2M
	a312BzFQnDTtOqMh6nI527yA4/Svlv9awnXUaMzw7D9IVFhe9FC4UrIKqXjrUNi7N1vI
	reyXxtCY5VzlgqfOvDYgcwFKu1SqCgyXwkc1Q=
MIME-Version: 1.0
Received: by 10.205.131.3 with SMTP id ho3mr1069489bkc.11.1321113441236; Sat,
	12 Nov 2011 07:57:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Sat, 12 Nov 2011 07:57:21 -0800 (PST)
In-Reply-To: <1321087015.26881.15.camel@ted>
References: <1321087015.26881.15.camel@ted>
Date: Sat, 12 Nov 2011 13:57:21 -0200
X-Google-Sender-Auth: ThKicswFLNbpX4IRx-KUGG2aQyo
Message-ID: <CAP9ODKpCZDJb_Cp7uOtXMmfRsfv5dS=nDFTCTk5JA4oPqOEtFA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk.bbclass: Ensure bad recommendations persist in the status file
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
X-List-Received-Date: Sat, 12 Nov 2011 16:03:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 12, 2011 at 06:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Currently bad recommendations are added to the status file with status
> "ok". After a single opkg command, whilst it will ignore the recommendati=
on,
> the status changes to "installed" even if the recommended package was not
> installed. Whilst this is likely a glitch in opkg's logic, the correct
> way to persist the information in the status file is to set the status
> to "hold" as deinstall packages with that status remain. With this change
> the bad recommendations persist accross multiple opkg runs and the system
> behaves as expected.

I personally dislike fixing it in rootfs_ipk instead of opkg ... opkg
has change its behaviour behind the scenes and this needs to be fixed
IMO.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


