Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R2KNN-0001jJ-P5
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 12:01:29 +0200
Received: by bke11 with SMTP id 11so1022401bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=McS6iPYDtwLIBrG4aon07TnR4Ujx+xpt4B5HfAjUKNE=;
	b=g+DHR6WutNPTYQHOfiNzVg/iHK/MjLX4z3hYhtCUf1p68DbfZYquaVjlNfPLKeYX1K
	cD+Y33ar6aMiaC4vApaR+1wLjO1eqXh8eRd0lEpH9+9FI+r9+8pOECOiA3kGMo5ewmMA
	3VUI+DvCLPZITeKc9psRJYmlRpFhgytudpreQ=
MIME-Version: 1.0
Received: by 10.204.129.214 with SMTP id p22mr230696bks.93.1315648584050; Sat,
	10 Sep 2011 02:56:24 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Sat, 10 Sep 2011 02:56:24 -0700 (PDT)
In-Reply-To: <1315646701-28916-1-git-send-email-eric@eukrea.com>
References: <1315646701-28916-1-git-send-email-eric@eukrea.com>
Date: Sat, 10 Sep 2011 06:56:24 -0300
X-Google-Sender-Auth: Cw-BpJ3Z1n5XcGCr7Z54VLBuB30
Message-ID: <CAP9ODKoUZfRLHDv7p=wJAczZ_nh-7LeETabwzM8X_Hp_EyqN7g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: fix generated sdk
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
X-List-Received-Date: Sat, 10 Sep 2011 10:01:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2011 at 06:25, Eric B=E9nard <eric@eukrea.com> wrote:
> - qt4-tools-nativesdk : actually the qmkae binary which gets installed
> comes from the native recipe. This patch fix this problem by laucnhing
> configure twice : once to compile qmake using the right toolchain for
> nativesdk, and a second time using the native qmake to compile all the
> other tools for the nativesdk. Then we install the right qmake.
...
> - toolchain_create_sdk_env_script_append : we need to add OE_QMAKE_CFLAGS=
,
> OE_QMAKE_CXXFLAGS and OE_QMAKE_LDFLAGS else the sdk won't find these
> variables that are inserted by qmake in the Makefiles.
>
> - with this patch, oe-core generates a working meta-toolchain-qte which
> can compile a small example and is properly recognized by qtcreator (this
> brings oe-core's meta-toolchain-qte to oe-dev's functional state).
...

In this case we most probably can drop the qt.conf file from the SDK
directory, don't we?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


