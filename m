Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROcmd-0003kr-7f
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 23:07:43 +0100
Received: by bkbzs2 with SMTP id zs2so2917202bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 14:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xkL2oz6DiM2m8BWEcluOL7XUmWb19nlVCAMz8P3ispc=;
	b=ZgEG3LMwyV/YED08Xozp2zFdMUmTJsiEnlHrdqnvYlVYk/FL7JeaBnp9fVRO8vweso
	gSw1aLD9PKA23abSVnRB8qUMW1D9Z84yJ00GLcIhkKdBwrH1cnW3vQiLv6YJ7ZrEhvDv
	o8OF8tkxEAv3/Vm2g3UZ+c+w2zfNa6NMhMoWw=
MIME-Version: 1.0
Received: by 10.204.140.215 with SMTP id j23mr6508876bku.52.1320962485800;
	Thu, 10 Nov 2011 14:01:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.48.208 with HTTP; Thu, 10 Nov 2011 14:01:25 -0800 (PST)
In-Reply-To: <1320961819.21414.0.camel@mattotaupa>
References: <cover.1320961001.git.otavio@ossystems.com.br>
	<021aada776e7f9ee9711f2959d00f98035f53a06.1320961001.git.otavio@ossystems.com.br>
	<1320961819.21414.0.camel@mattotaupa>
Date: Thu, 10 Nov 2011 20:01:25 -0200
X-Google-Sender-Auth: XAKBLzzrkJnTed4PMhRz_TqZN7Y
Message-ID: <CAP9ODKr9qAYHcM-oRyjwpT_TPNcFacW03wY48=z-W6YDwT3tZw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] dhcp: generate initial leases files for server
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
X-List-Received-Date: Thu, 10 Nov 2011 22:07:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2011 at 19:50, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Donnerstag, den 10.11.2011, 21:37 +0000 schrieb Otavio Salvador:
>
> What is the error message you are getting?
>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> =A0meta/recipes-connectivity/dhcp/dhcp.inc =A0 =A0 =A0| =A0 =A09 +++++++=
+-
>> =A0meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb | =A0 =A02 +-
>> =A02 files changed, 9 insertions(+), 2 deletions(-)
>
> [=85]

if not using the init script it fails as the leases are created by it.
I am using it using systemd and this fails without the leases thus
this allows it to work out of box.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


