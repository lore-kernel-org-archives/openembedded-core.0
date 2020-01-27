Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id EC7A67FC0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:11:32 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id c16so8147562oic.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=51qjy5xGaEikbqZavrOngsYXMwa4mJLd4QWuF+Q1MSU=;
	b=fyKwj+iTT0B+nlDgSGmZyoJ2L9V8JNkg/yJjbnfhiOKqjJbcHcSCZMJEXaxJswWKUd
	MtYovShHoXOL0J9QIM+iXWiFUO7QeBzuiBuartWNX1BW6Bzy+aGG47NOwSywLJCBZE9r
	d23JJrcMBJbjlqOeV2vX+kgSbALLt9mdscGlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=51qjy5xGaEikbqZavrOngsYXMwa4mJLd4QWuF+Q1MSU=;
	b=AspUuRqQYl0opAWBjIFdq1OjtDS7Q6pzzt8rM7zihAhQCGxrzRD/Uh+bCR5rWFhCzH
	EV3CEmXkZg9epQFiGjSPLUj1uxdtzbWdA0Xrq0GZ9lGuuEr8D/NFOzJZ+1pa/LOPzF4X
	DB3lqvZ66KZcUJnlV0mgIsB2t+C5KqCc5McCHinVWSTJMm0gX0hkcJUFBM3vFC+U588z
	8gK69FIiOwxo1CJkja/ITcytPCskQIzSt7Z76dm06VWx7oeJWIz0wrOH7EAmid4mEKkw
	/nL1yILMKYPM6/HD9iQcazpvB+nTKHtcNEIt6cJVcnLwF6d5wgbPhiJSyWqWWndUwDoh
	QRGQ==
X-Gm-Message-State: APjAAAVqnFSmB0Hgn4eRDzTld0T/8dRBUUF3pN2MlRvD1Hb6oQjS7e0d
	/NyIthSnvu19y4cp00UXXwJohaNo9SyFwes3FC2QZQ==
X-Google-Smtp-Source: APXvYqxy4IqVCcdNfxTDmhnI8XiALMeNklQbUlmpRBI+ITOTR5SG5qQ5q6/Wzq+L4wsiqLa57u1O5cvq2GkvV8wRjiQ=
X-Received: by 2002:aca:1b01:: with SMTP id b1mr717128oib.6.1580159493715;
	Mon, 27 Jan 2020 13:11:33 -0800 (PST)
MIME-Version: 1.0
References: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
	<CAM9ZRVvWRcvV3MMZCwr3-Au2KKU2xJcMi=jkLDZtHKTB7822Nw@mail.gmail.com>
	<CAHMutrbgM7To4zg=3R_BaU4PjyuW7hWcgNW0O2ZjM6TOuBNE7Q@mail.gmail.com>
In-Reply-To: <CAHMutrbgM7To4zg=3R_BaU4PjyuW7hWcgNW0O2ZjM6TOuBNE7Q@mail.gmail.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Mon, 27 Jan 2020 21:11:23 +0000
Message-ID: <CAM9ZRVvA-Sz3E0yuG3VnXGNCS9KGgKNWVx6NF-2oA1hbE8S97g@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] baremetal-helloworld: Create recipe for baremetal examples on QEMU
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Jan 2020 21:11:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Jan 2020 at 15:42, Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Hey Paul,
>
>
>
> On Mon, Jan 27, 2020, 2:09 AM Paul Barker <pbarker@konsulko.com> wrote:
>>
>> On Mon, 27 Jan 2020 at 10:00, Alejandro Enedino Hernandez Samaniego
>> <alejandro@enedino.org> wrote:
>> >
>> > Create HelloWorld examples that run on several of the QEMU architectur=
es
>> > supported by the build system.
>> >
>> > This recipe can be used by anyone to understand how baremetal applicat=
ions
>> > can be built using OpenEmbedded and how the wiring to set them up coul=
d be.
>> >
>> > This should also facilitate creating/extending the OE testing infrastr=
ucture
>> > to allow baremetal applications or RTOSs to be tested in the same way =
that
>> > Linux currently is.
>> >
>> > This can easily be extended to work on other MACHINES in the future.
>> >
>> > To run this example:
>> >
>> > # Source the oe environment as usual
>> > $ source oe-init-buildenv
>> >
>> > # Set TCLIBC to either newlib or baremetal
>> > $ echo "TCLIBC =3D \"newlib\"" >> ./conf/local.conf
>> >
>> > # Use one of the supported architectures (qemuarm64, qemuarm or qemuar=
mv5)
>> > $ echo "MACHINE =3D \"qemuarm64\"" >> ./conf/local.conf
>> >
>> > # Build
>> > $ bitbake baremetal-helloworld
>> >
>> > # Launch QEMU
>> > $ runqemu
>> >
>> > runqemu - INFO - Running bitbake -e ...
>> > runqemu - INFO - Continuing with the following parameters:
>> > KERNEL: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bi=
n]
>> > MACHINE: [qemuarm64]
>> > FSTYPE: [bin]
>> > ROOTFS: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bi=
n]
>> > CONFFILE: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.=
qemuboot.conf]
>> >
>> > Hello OpenEmbedded!
>> >
>> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedin=
o.org>
>> > ---
>> >  .../baremetal-examples/baremetal-helloworld_git.bb | 114 ++++++++++++=
+++++++++
>> >  1 file changed, 114 insertions(+)
>> >  create mode 100644 meta/recipes-extended/baremetal-examples/baremetal=
-helloworld_git.bb
>> >
>> > diff --git a/meta/recipes-extended/baremetal-examples/baremetal-hellow=
orld_git.bb b/meta/recipes-extended/baremetal-examples/baremetal-helloworld=
_git.bb
>> > new file mode 100644
>> > index 0000000..aab48b1
>> > --- /dev/null
>> > +++ b/meta/recipes-extended/baremetal-examples/baremetal-helloworld_gi=
t.bb
>> > @@ -0,0 +1,114 @@
>> > +SUMMARY =3D "Baremetal examples to work with the several QEMU archite=
ctures supported on OpenEmbedded"
>> > +HOMEPAGE =3D "https://github.com/aehs29/baremetal-helloqemu"
>> > +LICENSE =3D "CC-BY-SA-4.0"
>>
>> I've raised https://github.com/aehs29/baremetal-helloqemu/issues/1 as
>> CC licenses aren't recommended for software.
>>
>>
>
> I do agree, I originally had it as MIT, although I did base this on the o=
riginal work of someone who made it work for the versatile architecture and=
 they licensed that with CC-BY-SA and as I was reading I have to use the sa=
me license as them.
>
> I thought about it and for the Hello OpenEmbedded examples it would be ok=
 since they should serve mostly as basis for the wiring that users can use =
to build, run and test their baremetal apps on OE, so the license wouldn't =
affect them, but I'm open to suggestions here.

A bad license choice in a sample recipe is just going to encourage
others to use it though. I'd recommend reviewing
https://wiki.creativecommons.org/wiki/ShareAlike_compatibility:_GPLv3
to see if you can use GPLv3 instead if you've got CC-BY-SA inputs. You
could also contact the original author and ask about licensing the
code more cleanly.

Thanks,
Paul

