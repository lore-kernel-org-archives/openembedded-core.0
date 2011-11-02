Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RLOzq-00048u-Oj
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:48:02 +0100
Received: by wwf4 with SMTP id 4so3230145wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 17:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=NnsS86cwjnkNhd3PfGTcaIxP/lJjfQJVjzMmYmj1xXA=;
	b=N7OUpSxa9AExLZxgepSNJDb/W8gi+SUFHx0/G/LjV5OnsMWz2+sixtz2Lnf363/GvL
	znR/S1WTj/Mhw2ocu0tMW3GVN2MX/xf2BkV+Lf31/8KcY0HKhBXJa8zQdVktKFU8Q/q4
	ZnoYGr115XvcpbrOvOr1oDfxR4PXmg6Xr3FiY=
MIME-Version: 1.0
Received: by 10.227.59.213 with SMTP id m21mr2334351wbh.19.1320194516275; Tue,
	01 Nov 2011 17:41:56 -0700 (PDT)
Received: by 10.180.96.169 with HTTP; Tue, 1 Nov 2011 17:41:56 -0700 (PDT)
In-Reply-To: <cover.1319725711.git.bruce.ashfield@windriver.com>
References: <cover.1319725711.git.bruce.ashfield@windriver.com>
Date: Tue, 1 Nov 2011 20:41:56 -0400
Message-ID: <CADkTA4NcNdQVFXuVXC5r7u64ZX9bEZp6VW-dHxPd=EhB7sXX-w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] RFC v3: provide 3.0.x and 3.1 libc headers
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
X-List-Received-Date: Wed, 02 Nov 2011 00:48:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 27, 2011 at 10:32 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard,
>
> Here's v3 of the series, the details are below.

I see no comments on v3. So I'm just bumping the thread. Should I send
a separate
pull request for this, or is this sufficient ?

Bruce

p.s. yes, I realize that everyone is catching up, I just didn't want
to forget myself that
this is out, but not merged or in a known state.

>
> Changes since v2:
>
> =A0- moved more code into the .inc file
> =A0- modifed the python code to not import unnecessary functions and
> =A0 to use d.get/setVar.
> =A0- Included an optional patch 3/3 to remove 2.6 based header recipes.
> =A0 Whether you want this or not .. is up to you!
>
> Changes since v1:
>
> =A0- factored common code out into the .inc file. Captured in patch 1/2
> =A0- patch 2/2 is the introduction of the new headers
>
> v1 Email is included below:
>
> Here's a RFC patch for updating the toolchain linux-libc headers to 3.x
> variants.
>
> The reason I'm calling it a RFC is:
>
> =A0- I wrote some anonymous python code (and I'm no python coder) to
> =A0 =A0deal with 2.6 / 3.0 tgz location differences. This could have
> =A0 =A0also been done with a variable set in the recipes and used by
> =A0 =A0the .inc. I wasn't sure of the preferred approach, hence the RFC.
> =A0 =A0I'll take no offense corrections here.
>
> =A0- I changed the .inc, but didn't bump the PR of the existing recipes
> =A0 =A0and didn't remove the existing 2.6 variants. If either of these
> =A0 =A0should have been done, let me know and I'll respin.
>
> =A0- I bumped the default to be 3.1. If that's too agressive for the
> =A0 =A0default, and we'd prefer 3.0.8, let me know and I'll respin.
>
> I built and booted all the qemu machines with the 3.1 kernel headers. =A0=
So
> from the testing I was able to do, this looks to be safe and ready to go.
>
> This is based on my yocto repo, I also did the changes in my oe-core
> repository, but I don't have a oe-core contrib branch that I could push t=
o,
> so I chose to send the yocto variant. If someone points me to who I email=
 for
> an oe-core contrib branch, I can push that variant as well.
>
> Cheers,
>
> Bruce
>
>
> The following changes since commit fc94f925e848684244a38dcffe15cb1192dfbe=
d8:
> =A0Martin Jansa (1):
> =A0 =A0 =A0 =A0libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-nat=
ive, git: bump PR to rebuild after perl upgrade
>
> are available in the git repository at:
>
> =A0git://git.pokylinux.org/poky-contrib zedd/libc-headers-v3
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/libc-head=
ers-v3
>
> Bruce Ashfield (3):
> =A0linux-libc-headers: factor common code into linux-libc-headers.inc
> =A0linux-libc-headers: provide 3.0.x and 3.1 headers
> =A0linux-libc-headers: remove older recipes
>
> =A0meta/conf/distro/include/tcmode-default.inc =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0.../linux-libc-headers/linux-libc-headers.inc =A0 =A0 =A0| =A0 62 ++++=
+++++++++++++++-
> =A0.../linux-libc-headers_2.6.37.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 53 -----------------
> =A0.../linux-libc-headers_2.6.39.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 54 -----------------
> =A0.../linux-libc-headers/linux-libc-headers_3.0.8.bb | =A0 =A07 ++
> =A0.../linux-libc-headers/linux-libc-headers_3.1.bb =A0 | =A0 =A07 ++
> =A06 files changed, 74 insertions(+), 111 deletions(-)
> =A0delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_2.6.37.2.bb
> =A0delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_2.6.39.bb
> =A0create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_3.0.8.bb
> =A0create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_3.1.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


