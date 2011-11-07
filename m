Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RNPcE-0006pK-JA
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 14:51:58 +0100
Received: by bkbzs2 with SMTP id zs2so373099bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 05:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=UvR/f7pvqcWGq0Nq6/m2vaiz5Y6Z/37N8kq0LBVUur0=;
	b=T4jbK11s4x2mUI8QtakaNM6PDqKHURxWdH8C4aSxd0Hj8ynqY8UHldyEu5tQJ/rMb3
	KRirO0O02UwwFe/FP/+TjsDxR0SQ2M+6kkh/TEILWlAGUzEo9HKVU6kXAjrz4h56IvxD
	htIdrbypfMDmZC1DWnLDkwGFPRBhH8KXqzx0g=
MIME-Version: 1.0
Received: by 10.204.140.215 with SMTP id j23mr9626445bku.52.1320673543406;
	Mon, 07 Nov 2011 05:45:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Mon, 7 Nov 2011 05:45:43 -0800 (PST)
Date: Mon, 7 Nov 2011 11:45:43 -0200
X-Google-Sender-Auth: 7eTLiL7Q6cQeffu2N6OJrk13-GA
Message-ID: <CAP9ODKp-5oZ3Fr=5EWbm7F1vR3ZFGXw9ezkPj-Ciui12SczM6A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Broken BAD_RECOMMENDATIONS support
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
X-List-Received-Date: Mon, 07 Nov 2011 13:51:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

It seems BAD_RECOMMENDATIONS support, in ipk, is broken.

I checked and the rootfs_ipk is writting the contents into the opkg's
status file however it seems opkg when starts to install the packages
it overwrites or ignores it. People at IRC confirmated that this also
happens to them and thus this is indeed broken.

Do someone know how I can debug opkg to see what's going on?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


