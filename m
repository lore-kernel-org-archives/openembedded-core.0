Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R2KvV-0002ig-3l
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 12:36:45 +0200
Received: by bke11 with SMTP id 11so1032393bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 03:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QatBCgG2Xu1jFLiGvinj04Td3rgOxMF5uj2fYeJC4Qw=;
	b=DTdlSFA2Er/h3yWuLdXpKj211af8pUSbqiGUuej6q5PQLjOFDVtzxbSifxB6JQp3I2
	ZZ99NddFKSUtuiNkmXwUhEuLS96IKEmHwPx77Kez8ueejAfErWCJE/LNsitjGXV+1nVB
	exY202FbRqMYb+MucdOqBMalz/g0mw3eCKKjQ=
MIME-Version: 1.0
Received: by 10.204.157.8 with SMTP id z8mr673853bkw.145.1315650699559; Sat,
	10 Sep 2011 03:31:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Sat, 10 Sep 2011 03:31:39 -0700 (PDT)
In-Reply-To: <CAP9ODKoAZqdGAFJnyjdLKVCFUd5+wjndcWBPnH=DCrF7S19HRg@mail.gmail.com>
References: <1315646701-28916-1-git-send-email-eric@eukrea.com>
	<CAP9ODKoUZfRLHDv7p=wJAczZ_nh-7LeETabwzM8X_Hp_EyqN7g@mail.gmail.com>
	<4E6B3502.6020702@eukrea.com>
	<CAP9ODKoAZqdGAFJnyjdLKVCFUd5+wjndcWBPnH=DCrF7S19HRg@mail.gmail.com>
Date: Sat, 10 Sep 2011 07:31:39 -0300
X-Google-Sender-Auth: go6fjRs2xL6C713gD0PQTCt3R4Y
Message-ID: <CAP9ODKr8_p-3KfSQjy8DBbeGPDS+JHts9enX-eksW_YOOcFFyw@mail.gmail.com>
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
X-List-Received-Date: Sat, 10 Sep 2011 10:36:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 10, 2011 at 07:03, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> But as qmake is generated for the sdk it has the proper patches and
> thus qmake -query will report the right paths AFAIK making qt.conf a
> duplication of this information. Am I missing something?

Just to let the mailing list posted ...

As we discussed on #oe I will be working at porting the O.S. Systems
qt.conf generation since this is required for CMake to properly work
with Qt applications.

Will post it next week :-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


