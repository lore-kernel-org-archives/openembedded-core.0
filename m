Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJsUH-0000vp-Ue
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 21:20:54 +0200
Received: by wwb17 with SMTP id 17so6002555wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lWox98ajG5luM/h0BDIWZFV4QQjx4LbxqVdEqqylwMw=;
	b=qYmEuz+XhirAllhM6M31TfCy4zYE6bOj23P2FVdNJ/IkPD5VBJuxAHe4YwaWRHkFBX
	Zu8zcmfekRfcxakBXA9xYQA5rdDbO1DjSySItUJzt7oiJaVju74sq+xB8ijSTew4GlPh
	FnJFKHTfXSrZy8RE8MQfWHFYwZHtLFjKDRrmg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jpLLtwb8XwoAfKihzVbAKA+MsCclJJBrChvTAz97QoLCk17qFmXKRbLTc3oflOP8ll
	XXIaMY0Mn18uxgpsXTqQcsR4GtQXnNO4PboPGzMXU/NKO2ANBaHktTaUuSLg0e9HBsy5
	RdlKwwO1EzXmI0aAr5GIXFEIdRxtOAGbxA5WY=
MIME-Version: 1.0
Received: by 10.216.230.31 with SMTP id i31mr1461439weq.7.1305055087763; Tue,
	10 May 2011 12:18:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Tue, 10 May 2011 12:18:07 -0700 (PDT)
In-Reply-To: <1305053706-19572-1-git-send-email-tom_rini@mentor.com>
References: <1305053706-19572-1-git-send-email-tom_rini@mentor.com>
Date: Tue, 10 May 2011 16:18:07 -0300
X-Google-Sender-Auth: x4J0UidFfJ0wSHZ7mjNM-gvgrK8
Message-ID: <BANLkTin42LTK6D9ui-C_SXmWiNLAz1T66Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] create-pull-request: Add -l location switch
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
X-List-Received-Date: Tue, 10 May 2011 19:20:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 15:55, Tom Rini <tom_rini@mentor.com> wrote:
> Add a -l switch that takes an argument of either github or gitorious
> and will make the cover letter have a fill-in-the-blank of where the
> changes are on either github or gitorious.

Another possibility would be to use git config interface to store
those. You might have something like:

[oe-core-pull-request]
mode =3D github
user =3D foo

or

[oe-core-pull-request]
mode =3D gitorious
user =3D bar

This could be used to fill the fields in a proper way since those are
predictable.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


