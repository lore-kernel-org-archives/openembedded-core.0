Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH0Bv-0000cV-9a
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 23:30:19 +0200
Received: by bkat8 with SMTP id t8so4254846bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Hz1XQ9bfLNl+7+C81t6x3/2oHowAJTFHrPb4nCVbSO4=;
	b=ZLLXVeR1DWQfElXanOL9pogfua69w9AxAlKtwEHonP+TDh/fy9rK8El3AK9MMQw9qm
	r/dEnvrn5z3X4LqTM5yY+zV+GNCedzSBg0XIx6y8gK6mJ1XDmA9t1Yir64Hx+KrduF7Z
	jQ4YfbeteuU8OV0NBrs/gHEJ9tvVu5mHxr9Xg=
MIME-Version: 1.0
Received: by 10.204.13.68 with SMTP id b4mr9030142bka.96.1319145865300; Thu,
	20 Oct 2011 14:24:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.205.114.204 with HTTP; Thu, 20 Oct 2011 14:24:25 -0700 (PDT)
In-Reply-To: <CAP9ODKr1gZnmV_gdgJ4_5mPYpZf+SkCZ2-SD4aWr8nFGf6zC_Q@mail.gmail.com>
References: <CAP9ODKp+c9sXx6A7Bw9VnRXOKgNP_3q2uJmJEpvBwWT=dgXdBQ@mail.gmail.com>
	<4EA0485F.3080307@windriver.com>
	<CAP9ODKr1gZnmV_gdgJ4_5mPYpZf+SkCZ2-SD4aWr8nFGf6zC_Q@mail.gmail.com>
Date: Thu, 20 Oct 2011 19:24:25 -0200
X-Google-Sender-Auth: VsauqAEdOYUzQQeS6HOhyZa2FXk
Message-ID: <CAP9ODKqrchFdSdidPnH2Dh_Za664g2q3DBWr9EYdqP8hOjtUHg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, mark.hatle@windriver.com
Subject: Re: useradd class not working
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
X-List-Received-Date: Thu, 20 Oct 2011 21:30:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 15:17, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> On Thu, Oct 20, 2011 at 14:12, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> ...
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-skeleton/recipe=
s-skeleton/useradd/useradd-example.bb
>>
>> That is the recipe that was used when testing this feature. =A0If it no =
longer
>> works properly then something has recently broken in the groupadd functi=
onality.
>
> Yes and I used it and openssh as base to my package but it seem to do not=
hing.
>
> I tried to debug it and changed rootfs_ipk class to use "sh -x" when
> running the preinst scripts of the packages and all seems fine however
> it keeps not adding the group into rootfs/etc/group

I got some more information during today's debug session ...

useradd class is working perfectly for sysroot. I've added it to
systemd package (from meta-oe) and the "lock" group shows in sysroot
as expected. It fails for rootfs only.

After long time researching the reasioning of failure I found it. I am
going to send a patchset tomorrow.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


