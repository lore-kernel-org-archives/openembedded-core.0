Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <azarnasab@gmail.com>) id 1RBjYX-0001ju-Cx
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 10:43:53 +0200
Received: by bke11 with SMTP id 11so3322437bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2011 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7qeyTlpBdm+m9NUSumw8+0sWzark8ahUO6aBmhv4oC4=;
	b=rAcgs7H3qcqB2IB9uzscq1PHb2RfzlQYtYNp8g22Xk/kQ+a3mu3mFZIwJNtsrpQ6Q8
	xJxsfbJD9MAnenqSV4gYWd+3pVj73JlObXwBDkGBDlF+i83vIlTOweSP7Rfza36TJ7hd
	DUK/ViYoVxDiUZaTBlarKPxmL+/52mqhE0Mlk=
MIME-Version: 1.0
Received: by 10.204.151.84 with SMTP id b20mr330848bkw.262.1317890294488; Thu,
	06 Oct 2011 01:38:14 -0700 (PDT)
Sender: azarnasab@gmail.com
Received: by 10.204.142.154 with HTTP; Thu, 6 Oct 2011 01:38:14 -0700 (PDT)
In-Reply-To: <1317809123.14671.127.camel@ted>
References: <CADWjqk4pPWNYzO7Cua7xYXa55g=BWqwAY8taHhLwV=xaesDWPA@mail.gmail.com>
	<1317808871.14671.126.camel@ted> <1317809123.14671.127.camel@ted>
Date: Thu, 6 Oct 2011 02:38:14 -0600
X-Google-Sender-Auth: FvtUNda4pwkfk8PSZgxFOgKazhM
Message-ID: <CADWjqk4vMeDa12__Ckg=v_eYb38hQkrx9JQfi25wh58eE5G7YA@mail.gmail.com>
From: dashesy <dashesy@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pkg-config bug crashes 'bitbake glib-2.0-native' in FC15.x86_64
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
X-List-Received-Date: Thu, 06 Oct 2011 08:43:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 4:05 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-10-05 at 11:01 +0100, Richard Purdie wrote:
>> On Wed, 2011-10-05 at 03:21 -0600, dashesy wrote:
>> > Hi,
>> >
>> > I am using these in my local.conf with master branch of oe-core:
>> > DISTRO=3D"angstrom-2010.x"
>> > MACHINE=3D"beagleboard"
>> >
>> > The build for 'bitbake glib-2.0-native' (or actually 'bitbake
>> > meta-toolchain') will finally reach a run.do_configure for 'package
>> > glib-2.0-native-1_2.28.8-r5: task do_configure: Started'
>> > which runs the "oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin=
/pkg-config"
>> > =A0for auto build
>> > This leads to the following chain
>> > pkg-config(cross)->gnome-config->pkg-config->glib-config->pkg-config->=
...
>> >
>> > dashesy =A021266 21265 21266 =A00 =A0 =A01 01:56 pts/0 =A0 =A000:00:00=
 /bin/sh -e
>> > /home/dashesy/buildroot/oe-core/build/tmp-eglibc/work/x86_64-linux/gli=
b-2.0-native-1_2.28.8-r5/temp/run.do_configure.21265
>> > root =A0 =A0 21870 =A0 935 21870 =A00 =A0 =A01 01:56 ? =A0 =A0 =A0 =A0=
00:00:00 sleep 60
>> > dashesy =A022246 21266 22246 =A00 =A0 =A01 01:56 pts/0 =A0 =A000:00:00=
 /bin/sh
>> > /home/dashesy/buildroot/oe-core/build/tmp-eglibc/work/x86_64-linux/gli=
b-2.0-native-1_2.28.8-r5/glib-2.28.8/configure
>> > --build=3Dx86_64-linux --host=3Dx86_64-linux --target=3Dx86_64-linux
>> > --prefix=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x=
86_64-linux/usr
>> > --exec_prefix=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysro=
ots/x86_64-linux/usr
>> > --bindir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x=
86_64-linux/usr/bin
>> > --sbindir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/=
x86_64-linux/usr/sbin
>> > --libexecdir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroo=
ts/x86_64-linux/usr/libexec
>> > --datadir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/=
x86_64-linux/usr/share
>> > --sysconfdir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroo=
ts/x86_64-linux/etc
>> > --sharedstatedir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sy=
sroots/x86_64-linux/com
>> > --localstatedir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sys=
roots/x86_64-linux/var
>> > --libdir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x=
86_64-linux/usr/lib
>> > --includedir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroo=
ts/x86_64-linux/usr/include
>> > --oldincludedir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/include
>> > --infodir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/=
x86_64-linux/usr/share/info
>> > --mandir=3D/home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x=
86_64-linux/usr/share/man
>> > --disable-silent-rules --disable-dependency-tracking --disable-dtrace
>> > --disable-systemtap --enable-nls --enable-dtrace=3Dno
>> > dashesy =A022671 22246 22671 =A00 =A0 =A01 01:56 pts/0 =A0 =A000:00:00
>> > /home/dashesy/buildroot/oe-core/build/tmp-eglibc/sysroots/x86_64-linux=
/usr/bin/pkg-config
>> > --exists --print-errors zlib
>> > dashesy =A022672 22671 22672 =A00 =A0 =A01 01:56 pts/0 =A0 =A000:00:00=
 sh -c
>> > gnome-config --libs zlib > /dev/null 2>&1
>>
>> Something odd is happening here. We have a patch in OE-Core against
>> pkg-config which should disable "leagacy" pkg-config functionality.
>>
>> I took a look and it somehow looks like the patch got broken. Could you
>> try again with
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/wi=
p8&id=3Dde51d6ffae1d6a4f594687d5bdef25e731f44dfa
>>
>> applied please? I think this should fix this problem.
>
> Sorry, this should be:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/wip=
8&id=3D8d04d67271e5698ede8c08d3b6e3d4d7e38ffb0c
>

The patch worked, no more recursive calls and bitbake succeeds too, thanks!

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Regards,
dashesy


