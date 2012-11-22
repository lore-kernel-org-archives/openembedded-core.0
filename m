Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbWWc-0004my-W1
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 14:09:03 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so746871pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 04:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=cADf9reXkcq0RnpylVRYPFu76cON0svDy3W/jabDdMk=;
	b=cQzm8IApIuh/GlBm/NT6p1/Xu0GsymJ2+1t7JHokNsnbyaZNKEHrzbLS227Vp1qSxI
	UjT+0MnaYC2pNAEXxxn9V/LTSMhYCSy9OX5uKeLQpnRsifgyuT+eXz1vTx1C2dp2oQdY
	H//vLxJOq+IOQGB6hHrPJuJ7zR55zea7j1KR2FtlKqg1E4MM6frLPbaD3b5jJlMMP/5c
	C4+O0n/jrcyaPLKkjEPNeilJV4WmlLWEe/nXQf97dZaVstLhKWh4kIBIC+Zxu0p+wCO1
	cV+EY9QljeC64ltw9YY3b0HAd3nsb+b0S0E3Tl4UsxSaZz8oonbZFX5amI7dZJEBK6Me
	y/qA==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr4847187pbc.24.1353588895994; Thu,
	22 Nov 2012 04:54:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 22 Nov 2012 04:54:55 -0800 (PST)
In-Reply-To: <20121122122832.GD11155@sestofb10.enea.se>
References: <1353511391-60570-1-git-send-email-bjst@enea.com>
	<20121122120442.GB11155@sestofb10.enea.se>
	<CAP9ODKrMYinP351hyVNbkW9jZqVj7UNy1GkokXtG-V0rsqAZ4g@mail.gmail.com>
	<20121122122832.GD11155@sestofb10.enea.se>
Date: Thu, 22 Nov 2012 10:54:55 -0200
X-Google-Sender-Auth: JU9SZftszvwPXurVkyUaGYWcZXs
Message-ID: <CAP9ODKpGP0_LxVtrjfrcEKdPvuSMvNyFB3yO_22Q2XsWL-gQcw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?Bj=F6rn_Stenberg?= <bjst@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] RFC: ptest for danny
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Nov 2012 13:09:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 10:28 AM, Bj=F6rn Stenberg <bjst@enea.com> wrote:
> Otavio Salvador wrote:
>> > What do I have to do to take them from "unpacked" to "installed"?
>> Your package postinst needs to be able to be run offline.
>
> But they don't have any postinst. There are no .postinst files installed =
for these packages in /var/lib/opkg/info. run-postinst.awk goes through the=
 motions and prints "Configuring:" for these packages only because the pack=
age status says "unpacked" instead of "installed". Nothing is ever ran.

When first booting it always try to run the post insts; this is need
to finish the configuration for the cases where it cannot be done
offline.

I think something is failing in your rootfs; please check the rootfs log.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


