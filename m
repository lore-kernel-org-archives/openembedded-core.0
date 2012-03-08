Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S5f48-0002Rq-AY
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 16:15:40 +0100
Received: by vcbfl13 with SMTP id fl13so439675vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Mar 2012 07:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MjgT7bUR/FNE6H2rRHKay7a6bnRoOOYedj7ivQpchJY=;
	b=sqZRta/xdLsERH9RfJrzDm3o9Vz08xdTBMV2cHmUT7CfbMjavVJU2uWdIZhoAQMbR9
	dcctt1A1CbBXxmEJaWXjvSqQ+dz4MPdAscN3NfpQ0Y/jY3LiTupV1yZA+2pCWQTnzlcM
	7j5ubaTNOmbjixCgYMIdGEzVjKMz6y6i3WwFRq5Spaz2UwzqJ8b3CoTzUA2dFRApR9h2
	h74gvMSxtjzmekZkA5hNrTp9Kw+Tq9rt8XJu2scrSrK65P49L8onsCl9CnoKAXyd35hk
	2cxDXqDX7+jz8iyUeX02Z4lJMSghZ2+Sb+7RmrFoB27c7MCi28OYTdc09pg2C+iKQNa6
	oWyw==
MIME-Version: 1.0
Received: by 10.52.240.177 with SMTP id wb17mr10497178vdc.63.1331219221430;
	Thu, 08 Mar 2012 07:07:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 8 Mar 2012 07:07:01 -0800 (PST)
In-Reply-To: <1331208530-11938-1-git-send-email-obi@opendreambox.org>
References: <1331208530-11938-1-git-send-email-obi@opendreambox.org>
Date: Thu, 8 Mar 2012 12:07:01 -0300
X-Google-Sender-Auth: M2HuxAy9NcSY1RGen1vN7xRkdUU
Message-ID: <CAP9ODKr_z+X5RkbUd3j-7AqYtRs0uKKrCurxzRz-WHF3wbQfNQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev-164: don't hardcode path to pidof
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
X-List-Received-Date: Thu, 08 Mar 2012 15:15:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Mar 8, 2012 at 09:08, Andreas Oberritter <obi@opendreambox.org> wro=
te:
> * pidof lives in /bin, search it in $PATH.
> * Assume pidof's presence.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


