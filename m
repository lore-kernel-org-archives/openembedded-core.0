Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RnHY1-0003qC-Pp
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 23:30:33 +0100
Received: by lami14 with SMTP id i14so2489810lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 14:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=UDJZGL/Tf7SGl8sReBgnMwLu5Urvm9WEnHtblW9ttOU=;
	b=tj7l6RnX5awNSWpdM4Dq3eS8TwwKC4pPlBXhcRxPeZ/KKqsqZ6sTuZ6GhzBG58ef7I
	QX73oBfVlz3O6zcxK8LzNeYIq3EFgy5AE3lCS1yJieHTKiMUPaSY3IsCP7knTmF1ekdk
	HPWYgQ0+H64UDpGvKDsyapX7PBbSGTjsQI/Dg=
Received: by 10.112.101.34 with SMTP id fd2mr4589813lbb.16.1326838976370; Tue,
	17 Jan 2012 14:22:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.21.161 with HTTP; Tue, 17 Jan 2012 14:22:25 -0800 (PST)
In-Reply-To: <1326795583-22661-2-git-send-email-koen@dominion.thruhere.net>
References: <1326795583-22661-1-git-send-email-koen@dominion.thruhere.net>
	<1326795583-22661-2-git-send-email-koen@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jan 2012 14:22:25 -0800
Message-ID: <CAMKF1sqzzNSik_xRj2C82r4nXvHJp27GSsOuK+Fr1HYLtSaxjw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] pango: create /etc/pango in module postinsts if it's missing
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
X-List-Received-Date: Tue, 17 Jan 2012 22:30:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 2:19 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> +if ! [ -e $D${sysconfdir}/pango ] ; then
> + =C2=A0 =C2=A0 =C2=A0 mkdir -p $D${sysconfdir}/pango
> +fi
> =C2=A0}

when you are using mkdir -p then why enclose it in if-fi


