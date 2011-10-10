Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RD4Mr-0007rF-2y
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 03:09:21 +0200
Received: by bke11 with SMTP id 11so7918574bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 18:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ZTiz7sirLHAk7tbl3yybM8hQpr8AM4d/FEt4+4zcRZM=;
	b=WlxZeNrwx9oXaW2sjOGW4pMKRC1vqCEjphT1cEakQr3EHWgTDVfesRt1jhkXyaXKZZ
	yF0HQdcCDjHmgKmMbKXK4gA8JhDJV0L2Wz3IXUCZdX1qKDEtbn3ybIHycHHuX7dNfu9f
	oIBsY8JtzmBTCMizykQD56OeaO1J5eZ8N9PVQ=
MIME-Version: 1.0
Received: by 10.204.131.217 with SMTP id y25mr4340966bks.98.1318208620922;
	Sun, 09 Oct 2011 18:03:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Sun, 9 Oct 2011 18:03:40 -0700 (PDT)
In-Reply-To: <1318154801-28945-1-git-send-email-koen@dominion.thruhere.net>
References: <1318154801-28945-1-git-send-email-koen@dominion.thruhere.net>
Date: Sun, 9 Oct 2011 22:03:40 -0300
X-Google-Sender-Auth: 8epj4g5SbA3YDCLNotr6C0CxEB4
Message-ID: <CAP9ODKoiKeOMs1bJLcmOQeSR4XDL8Wi_oa=a7jANS78Ouwx-Bw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC][PATCH] linux-firmware: update, merge in OE classic updates, fix packaging
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
X-List-Received-Date: Mon, 10 Oct 2011 01:09:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 9, 2011 at 07:06, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Update: move to latest SRCREV, use non-kernel.org URI
> Merge: wl12xx symlink + packaging, install all firmwares
> Fix: * all entries in PACKAGES are in PROVIDES already
> =A0 =A0 * A package always RPROVIDES itself
> =A0 =A0 * A file can only get packaged *once* so only one rtlwifi package=
 will get the license

I dislike the idea of one single package with all firmwares. I prefer
to have many small packages but one meta that depends on it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


