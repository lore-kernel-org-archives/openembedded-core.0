Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QQO9m-0005RC-4L
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 20:22:39 +0200
Received: by bwz5 with SMTP id 5so2293009bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 11:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5XAubm+rWTnMu/S+mWkqVxRT6L2UcH50KEqWv4MDpeg=;
	b=TlJENuuwjT6kNPABL4ioKZay6gFoBc34XBsaNLCPz65M97JofbaHb7gpiEFLFuz1yD
	ahjAoSappq7fRtdhMHP5qZnbLBIivZWYDrCKONG7UmUYQ8zmtqDXcKkBwUHZ1gkOg/KQ
	bAubWVgtiITTUGigCZ6Pw7/Iw3kzkHm9z7DeI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=j+NuUjpgNE3h6a9TU/iBfkpU2ZokPDEytdxRbD9/XOBuFfUu3ZCXqyqFejT0NEa87J
	QVkW37cW+wazOdxCOiWq5FsL9akD2EKU8+y8TBoE8B7Vq3lK4fYBFMVKpKXKp9DKUOhX
	t8KA/3e5PGPeDBiCfRhgXOqYHuu7/OEDcz5Mg=
MIME-Version: 1.0
Received: by 10.204.154.194 with SMTP id p2mr2782828bkw.58.1306606770751; Sat,
	28 May 2011 11:19:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Sat, 28 May 2011 11:19:30 -0700 (PDT)
In-Reply-To: <4DE02216.1010003@intel.com>
References: <4DE02216.1010003@intel.com>
Date: Sat, 28 May 2011 18:19:30 +0000
X-Google-Sender-Auth: 5CG2_xXuHowSs2Oqz1oregG9zjk
Message-ID: <BANLkTikKMR4FKFF8nr6sW3vmyqrVE5=_mg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1][v3] license.bbclass parsing changes rebased sans debug
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
X-List-Received-Date: Sat, 28 May 2011 18:22:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2011 at 22:13, Elizabeth Flanagan
<elizabeth.flanagan@intel.com> wrote:
...
> Beth Flanagan (1):
> =A0license.bbclass: Sane Parsing of licenses
...

The change itself was OK and really an improvement but please pay some
attention to whitespaces. It is nice to avoid useless whitespaces into
new code.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


