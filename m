Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RPwOD-00048Q-U5
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 14:15:57 +0100
Received: by bkbzs2 with SMTP id zs2so6040075bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 05:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WVcV3QVZRd9x1X64M7q6hYfEzIkIKWr4SzbUYERXD1M=;
	b=UG2W7jhoxbafOEHns6Fi2TO3zvXcjg6mViz8rP2eDSwydaC0WS4No24flAZNxHdBfo
	jigZ6czWIccLhmKOUPJLvJDcdfUDjnHmEbUFjpaWVnZtEGu66y+75VSM0ZXADqbJ06ZP
	19iVkEgPamLammZNJ1mV99E+SI5fGGwmacaH0=
MIME-Version: 1.0
Received: by 10.205.117.10 with SMTP id fk10mr19292021bkc.29.1321275815005;
	Mon, 14 Nov 2011 05:03:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Mon, 14 Nov 2011 05:03:34 -0800 (PST)
In-Reply-To: <1321275166.29435.21.camel@phil-desktop>
References: <1321274982.26881.55.camel@ted>
	<1321275166.29435.21.camel@phil-desktop>
Date: Mon, 14 Nov 2011 11:03:34 -0200
X-Google-Sender-Auth: habsIIbxv3jKmJAx-Jy7JTo33m0
Message-ID: <CAP9ODKpXHBFJRvH0TLdmfS2yyiQ_cPXrqi1mdNdsEaUrRsG_Jw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-passwd: Fix the broken preinst/postinstall
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
X-List-Received-Date: Mon, 14 Nov 2011 13:15:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

+1 :D

On Mon, Nov 14, 2011 at 10:52, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-11-14 at 12:49 +0000, Richard Purdie wrote:
>> The preinst accesses file which may not yet have been unpacked.
>> The postinst is too late for the creation of these files
>> for at least the opkg backend.
>>
>> This patch therefore encodes the file contents into the preinst,
>> resolving the various issues once and for all.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> If you're going to do that (which does look reasonable) then you might
> as well stop the package from shipping passwd.master and group.master at
> all. =A0I don't think anything else uses those files so they're just
> wasting space at the moment.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


