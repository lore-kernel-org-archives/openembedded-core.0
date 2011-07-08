Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfDFH-00020k-69
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:45:35 +0200
Received: by bwf20 with SMTP id 20so2152665bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zTEvf5KZPtOtgLuvH9DN98dRblc0rM993GJ/dKwrg1A=;
	b=pq+atakMlNjOgwOcs2wUoIYBENa1Mfz5eNT0T5U+XHibDWlOsgVmArnkhNTxGJv385
	TqKWu8WJhDmIQwlE+GXHTcGn21rHPYa9JmGWk7598zseF4Fjk3fIKYA2VTk1XzBetPdk
	txbLmJ+UO6m5/ASoa1WPSJJrBo66vnDMGiKZk=
MIME-Version: 1.0
Received: by 10.204.129.66 with SMTP id n2mr419091bks.333.1310139702323; Fri,
	08 Jul 2011 08:41:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.120.75 with HTTP; Fri, 8 Jul 2011 08:41:42 -0700 (PDT)
In-Reply-To: <1310139323.20015.890.camel@rex>
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<d851796fdf475882423cc97929d0242f7fcaf75e.1310132765.git.otavio@ossystems.com.br>
	<1310139323.20015.890.camel@rex>
Date: Fri, 8 Jul 2011 12:41:42 -0300
X-Google-Sender-Auth: m_XTp4QU9t8AKlspEG_KJ6TPudU
Message-ID: <CAP9ODKr9ZyKMyY1B+s+kdSfTyedKTEeWzA52=9NQ6CXqbjnVhA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] cmake: update to 2.8.5-rc3
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
X-List-Received-Date: Fri, 08 Jul 2011 15:45:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 8, 2011 at 12:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-07-08 at 13:47 +0000, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> =A0meta/recipes-devtools/cmake/cmake-native_2.8.3.bb =A0| =A0 =A07 -----=
--
>> =A0meta/recipes-devtools/cmake/cmake-native_2.8.5.bb =A0| =A0 12 +++++++=
+++++
>> =A0.../cmake/cmake/support-oe-qt4-tools-names.patch =A0 | =A0 14 +++++++=
-------
>> =A0.../cmake/{cmake_2.8.3.bb =3D> cmake_2.8.5.bb} =A0 =A0 =A0 | =A0 =A09=
 +++++++--
>> =A04 files changed, 26 insertions(+), 16 deletions(-)
>> =A0delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.3.bb
>> =A0create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.5.bb
>> =A0rename meta/recipes-devtools/cmake/{cmake_2.8.3.bb =3D> cmake_2.8.5.b=
b} (76%)
>
> What is the reason for moving to an -rcX release? When is the main
> release likely to be made?

Saul asked me to update it since the current one has some license
issues that he wants fixed for M2; by the way, this patch has been
fixed in my branch to fix a build failure so take the github one, not
this (I can send an update patch to ml but seems not worth if not
required).

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


