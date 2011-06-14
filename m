Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1QWQFP-0004li-Nj
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 11:49:23 +0200
Received: by fxm19 with SMTP id 19so4212185fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 02:45:58 -0700 (PDT)
Received: by 10.223.54.148 with SMTP id q20mr562719fag.84.1308044758576; Tue,
	14 Jun 2011 02:45:58 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.204.54.80 with HTTP; Tue, 14 Jun 2011 02:25:06 -0700 (PDT)
X-Originating-IP: [93.81.3.157]
In-Reply-To: <BANLkTikkaDK6122A-=H+TS01oTsAtfD2qg@mail.gmail.com>
References: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
	<BANLkTimkU94WYhGGac5P88GMUA6mk7NCKg@mail.gmail.com>
	<BANLkTikkaDK6122A-=H+TS01oTsAtfD2qg@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Tue, 14 Jun 2011 13:25:06 +0400
X-Google-Sender-Auth: YRLbrg0ouDLYZO_IqLdAPYq41hM
Message-ID: <BANLkTi=u8pJ=pkgmWLuPnqKNjRow18X70A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: take TMPDIR from bitbake
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
X-List-Received-Date: Tue, 14 Jun 2011 09:49:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/6/14 Anders Darander <anders@chargestorm.se>:
> On Tue, Jun 14, 2011 at 00:22, Yury Bushmelev <jay4mail@gmail.com> wrote:
>> 2011/6/13 Anders Darander <anders@chargestorm.se>:
>>> + =A0 =A0 =A0 =A0# We have bitbake in PATH, get TMPDIR from bitbake
>>> + =A0 =A0 =A0 =A0TMPDIR=3D`bitbake -e | grep TMPDIR=3D\" | cut -d '=3D'=
 -f2 | cut -d '"' -f2`
>>
>> This change inspired me just another crazy idea.
>> Getting some variable from bitbake is frequently used task. May be our
>> bitbake people will add some special mode to bitbake for this? E.b.
>> like bsd make have (make -V KERNCONF)[1].
>>
>> I would suggest syntax like 'bitbake -V TMPDIR'
>
> That would definitely simplify a few lines in a number of scripts.
>
> I'll put it on my todo-list, although it is getting rather long now
> (with very little time allocated for working on that list)...

Note that user may request more than one variable with single bitbake
invocation. E.g.:

bitbake -V TMPDIR -V DEPLOY_DIR

In this case better to prefix variable value with name, like set does:

TMPDIR=3D/path/to/tmpdir
DEPLOY_DIR=3D/path/to/deploydir

--=20
Yury Bushmelev


