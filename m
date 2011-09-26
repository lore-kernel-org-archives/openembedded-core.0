Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8EkH-0002S8-PF
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 19:13:35 +0200
Received: by gwaa2 with SMTP id a2so5552510gwa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=5CN4nss6hS67cLxtvhNQG+p9jHHXkfzn5EFcJ5i5/C8=;
	b=J19U0krs7ZIIle6N44gMujwWegM8AEFwLedzNnw1t+yK0Kkw1T3+IYSsVZQo++JLnv
	JV2DZc/Vcq3pdh+aUS3FvMTtd9aJdkekQ9T17pHmSxtgDZ/rGYSrE5ITd1xxfp5ICSPa
	8BpuqZNNcxaMov5lHjjmQT2mRWzOPktimmSDY=
Received: by 10.68.19.196 with SMTP id h4mr31146511pbe.39.1317056884097; Mon,
	26 Sep 2011 10:08:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.98 with HTTP; Mon, 26 Sep 2011 10:07:34 -0700 (PDT)
In-Reply-To: <1316971428.8185.34.camel@ted>
References: <1316843665-26137-1-git-send-email-raj.khem@gmail.com>
	<1316971428.8185.34.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Sep 2011 10:07:34 -0700
Message-ID: <CAMKF1sqUF-tGki2ihVLR1j2rRwZnGO4OCzJdTBck9e2NqggHmw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnome-doc-utils: Prepend PKG_CONFIG_SYSROOT_DIR to the path returned from PKG_CONFIG
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
X-List-Received-Date: Mon, 26 Sep 2011 17:13:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2011 at 10:23 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-09-23 at 22:54 -0700, Khem Raj wrote:
>> If we build say gnome based image on a build system which does not have
>> gnome e.g. kubuntu then packages like gedit do not build since it uses
>> gnome files from host system which are non existent on kubuntu
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0.../gnome-doc-utils/sysrooted-pkg-config.patch =C2=A0 =C2=A0 | =C2=
=A0 37 ++++++++++++++++++++
>> =C2=A0meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb | =C2=A0 =C2=A0=
6 ++-
>> =C2=A02 files changed, 41 insertions(+), 2 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/sysroo=
ted-pkg-config.patch
>>
>
> Merged to master, thanks.
>

Richard

It does not appear in the pull I just did moments ago.

> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


