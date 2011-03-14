Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1Pz6ze-0006Ay-2t; Mon, 14 Mar 2011 13:35:26 +0100
Received: by bwz10 with SMTP id 10so4078678bwz.6
	for <multiple recipients>; Mon, 14 Mar 2011 05:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=xjGU9BdtKr23yaDe3hlluXUTaC9AcsOyElVVT9Ng2sM=;
	b=jg4YksF5fZd376BgU8RFmIE8wWq2/bhU4e+OVkfpsWl+fgOo53KU45zeFMub+CzozK
	P9nJWRKAA+J7EvYEEgWBuuBeti81FIRQ2VUtZSn7vUyhoAgMpMEBB2VmWZIPxQc507dY
	5DbBC1Cyaw3nbrQ9aA1e3GDbxuOcQYXWh+RXc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=xAMePsJFwEk1L5nX4MWQ3Skq0qHzNFVxAcXc3h3zoFR+nb9+VSS61Ss0f5/E902WD1
	rM73moPRQA1twXIzyeNV9RgddyMG3j9Y4z+x6fdFnDOhFNGpyejM1eF7QV15HnMrfKUt
	ZZICLV4sQA1cAVjSjgqw9y8O11f9Oh5kjIdJA=
MIME-Version: 1.0
Received: by 10.204.75.22 with SMTP id w22mr10742644bkj.65.1300106024498; Mon,
	14 Mar 2011 05:33:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.66.143 with HTTP; Mon, 14 Mar 2011 05:33:44 -0700 (PDT)
In-Reply-To: <EC0F161F-7C09-42FD-929D-67914A54AC25@dominion.thruhere.net>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
	<1299958038-25216-6-git-send-email-otavio@ossystems.com.br>
	<AANLkTimiahf+8xJ_nNePkXzB3Lhton2+5JqquPmruN24@mail.gmail.com>
	<EC0F161F-7C09-42FD-929D-67914A54AC25@dominion.thruhere.net>
Date: Mon, 14 Mar 2011 09:33:44 -0300
X-Google-Sender-Auth: mCK1qtJCcxj9UkjMHH0OINIBG3w
Message-ID: <AANLkTimdtCq5X3j=uMLhgDjM=uEoMPQ4P2fV9Heqh5ay@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Koen Kooi <koen@beagleboard.org>
X-Mailman-Approved-At: Mon, 14 Mar 2011 15:35:49 +0100
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/11] udev (165): move ConsoleKit support to udev-consolekit package
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
X-List-Received-Date: Mon, 14 Mar 2011 12:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 12, 2011 at 19:03, Koen Kooi <koen@beagleboard.org> wrote:
> If someone can quickly explain me what it does then we can see what needs=
 to get changed. Without having looked into it I think adding RRECOMMENDS_$=
{PN} +=3D "udev-consolekit" to the consolekit recipe should fix most possib=
le breakage.

I think it manages to register the 'seat' on consolekit. So I think
this would solve this issue.

> Adding oe-core to CC:
>
> What are the plans in oe-core for udev? There currently is a recipe overl=
ayed in meta-oe because I haven't had time to look into the differences bet=
ween the oe-dev and oe-core version. If we're going to touch udev we might =
as well do it properly :)

I think 165 ought to be our base there.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


