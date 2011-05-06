Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIOMf-0006hP-TQ
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 18:58:53 +0200
Received: by bwz5 with SMTP id 5so3002258bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Zs16Ii7Q+33sy36BpBhZiTPFwg2G4lS+OLhq/gUw+0o=;
	b=LZc625X4pvok0bKlDoNOihlJrUWBe0PPPkoRx4x067l7g1t5LogcFWAco0eSXYc5n3
	xYqVfeLEDq4OyLLX9YNDqLscFKby807Tvimi+ZlXPwrUgFuNpRWYQDWR9CmZ3bJbZK5J
	fi6yql/qEEDQJgSjtazisrZpRAInuaWGtwjyQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=tUbtT0h4aIpLB/iskjOrAlIveyf0lYF7mtBAukC6zJfwyq4AaOCNlkoUnJFl+9JL9r
	ykM0+3M6Wr+CwluqVgxwoUUSuSRJlkaAIBi+Eqh6C4UGDzdj21Goi/iAtU4pHjav7/xw
	gp55lQhv6ZBONwBY7ARFjgOLcB5d++Jr0irwU=
MIME-Version: 1.0
Received: by 10.204.118.211 with SMTP id w19mr884819bkq.83.1304700972875; Fri,
	06 May 2011 09:56:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.70.138 with HTTP; Fri, 6 May 2011 09:56:12 -0700 (PDT)
In-Reply-To: <FC216C43-4A6A-41B8-9565-2462C914D6C7@dominion.thruhere.net>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
	<1304691622.30391.124.camel@rex>
	<1B7A477C-E4A5-4EBC-A7E3-CAA30A583ADF@dominion.thruhere.net>
	<BANLkTi=yVmeX5xH8qHwOHwoeoXqi5Hs2uA@mail.gmail.com>
	<FC216C43-4A6A-41B8-9565-2462C914D6C7@dominion.thruhere.net>
Date: Fri, 6 May 2011 13:56:12 -0300
X-Google-Sender-Auth: 2SBnAm8ylS4C5pZ0_GAWiZzeavs
Message-ID: <BANLkTikm-w75t=E9kzjUjWEvspo_VD_nSw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 16:58:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2011 at 13:06, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 6 mei 2011, om 17:36 heeft Otavio Salvador het volgende geschreven:
>
>> On Fri, May 6, 2011 at 11:51, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>>> So, is having both sets inside ${PN} a dealbreaker?
>>
>> I think it is not BUT this choice could be a distro choice.
>
> Everything can be a distro choice, you can make gtk/qt or even qt-x11/qt-=
e a distro choice. The point is to see what is an image choice and what isn=
't. Defaulting to distro choice is a recipe for disaster (pun intended)
>
> I do *NOT* want to write a new distro.conf for every silly option out the=
re.

Sure and I agree; that's why I said to default to 'both' so most
common case would be fulfill by the image choice of putting sysv or
systemd but giving the option to "disable" sysv or systemd at distro
level allow for minimal and very space contrain systems to be done
without needing to hack too much.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


