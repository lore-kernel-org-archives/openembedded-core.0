Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QM1Dd-0003zh-NE
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 19:04:34 +0200
Received: by eye27 with SMTP id 27so1358785eye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 10:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=uSDFUpFOhtwbBMoFheb4xyM9lSkzrOO6rrUk+y1NZak=;
	b=lJoDLU0sRf5XY7mEHuRZ5iWRQlAvk5uQYPA25WEWXF9u07/oEffsCs0WcjStzpktAd
	hS7y1K6eSka6GyZ01vtIK8n1qfesmRYsXOMPKOSeNdw8QyNXt8TCtz2uxXr2MmVmCytg
	Ih/iH67bOVZ3JrEwcrSLjxZjA022kodoGSE4w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=qfPwekVMH8tgCKhoQyIfqUCeYz81JbbkU9AKF06a11t2A4tWP83bVyEWvAnStdQsFF
	8zvU8vNoHZYaJk2xvQTvklMKHc55vxaPupXSF7QGVA5mDy52IvljjCfAwNsqMRxuTWg2
	WG/zdoOwZDp4Wk8ML/Et1YSytUrdkdor3awqk=
Received: by 10.14.95.8 with SMTP id o8mr1523274eef.76.1305565300292; Mon, 16
	May 2011 10:01:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Mon, 16 May 2011 10:01:10 -0700 (PDT)
In-Reply-To: <1305563748.2429.76.camel@phil-desktop>
References: <1305563748.2429.76.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2011 10:01:10 -0700
Message-ID: <BANLkTikh-we7ziQCB5ywApYhw63NOWiUfQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: uclibc?
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
X-List-Received-Date: Mon, 16 May 2011 17:04:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 9:35 AM, Phil Blundell <pb@pbcl.net> wrote:
> I've just been trying to build a uclibc-based system from the current
> head of oe-core but this doesn't seem to be something that works
> entirely smoothly at the moment. =C2=A0Does anybody have a patchset to fi=
x
> the uclibc recipes, or is anybody working on such a thing?
>

I have not fixed uclibc in oe-core yet but if you use
meta-openembedded layer along with oe-core
then the uclibc in that layer should work pretty well on top of
oe-core. Eventually
it should move into oe-core one of these days.

> Issues I've encountered thus far are:
>
> - fatal errors from insane.bbclass due to missing LIC_FILES_CHKSUM in
> uclibc recipes
>
> - a bunch of slightly-bogus-looking bits in tclibc-uclibc.inc causing
> "-uclibc" to get appended to ${STAGING_DIR_HOST} (seemingly twice!),
> which was apparently breaking perl-native in some slightly obscure
> fashion.
>
> - uclibc-initial looks for gcc-initial in the wrong place. =C2=A0I copied=
 the
> ${STAGINGCC} bits from eglibc-initial to fix this.
>
> - uclibc-initial installs itself into the wrong place. =C2=A0I copied the
> setting of do_populate_sysroot[sstate-outputdirs] from eglibc to fix
> this.
>
> - uclibc compile now fails at:
>
> | /home/pb/oe/build-meta-uclibc/tmp/sysroots/x86_64-linux/libexec/i586-li=
nux-uclibc.gcc-cross-intermediate/gcc/i586-linux-uclibc/4.5.1/ld: cannot fi=
nd -lgcc_s
> | collect2: ld returned 1 exit status
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


