Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLhy0-0005VD-NN
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 22:31:08 +0200
Received: by bwz5 with SMTP id 5so3650969bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 13:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=b9fQEhQ28W93XT/5AKiQ9jK1gQNPChEwF1GLCJAcI3M=;
	b=lDZ+WRzpht0x1laMWCnFt25P6We5OPM99X8cts3L+V3Bkx55rfJDMUJVje1MibqHGa
	/Hf2k3RJjoQouy9LDnKZbPj8JY/N0BQZNyOrkfAIhH1x9bEp5Ykdb8VZtXq3IkHfw2/U
	S8iG+eDyo9ymwEPeZVzIDUMECMKBMKIeXJqXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=DC7HK5znT9i9bhiXTY37ZaXSzuxO+oXAmtJgT/TSgo03eJMDgvlGK/TPzmGWn+T/F1
	B/y4WxQShwQ3z55TjpfwQunMMxOq0vkXp2qM/apozBUXrczHVv/xyd/AxCvwVasU6tZT
	A40mvbY21J5hjW+DOh7aqKETHYqln45rYpDl4=
MIME-Version: 1.0
Received: by 10.204.138.205 with SMTP id b13mr917054bku.27.1305491278723; Sun,
	15 May 2011 13:27:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 15 May 2011 13:27:58 -0700 (PDT)
In-Reply-To: <1305120614.30391.349.camel@rex>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<1305120614.30391.349.camel@rex>
Date: Sun, 15 May 2011 17:27:58 -0300
X-Google-Sender-Auth: irXOW1PM14duaYa35tOHczz90uc
Message-ID: <BANLkTi=_=Ei4+Gn3HAi=pZrQaXYH_5MwnA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Sun, 15 May 2011 20:31:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2011 at 10:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I've taken feedback on board, tweaked the series and then merged it. My
> reasoning is that whilst this might not be 100% perfect in every way, it
> moves us a lot closer to where we want to be. We were going to start
> seeing patch conflicts if it was out of tree for too long and that
> didn't seem worthwhile.

I have expected at least another review cycle since this is a huge
change and potential to change a lot of stuff for users...

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


