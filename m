Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QzzIk-0002Si-Ti
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Sep 2011 01:07:02 +0200
Received: by bkbzu17 with SMTP id zu17so3414469bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2011 16:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yD+s8HhzkrVzYQ/sL88eJU2f8lZXcKFOdjbljUhbw8k=;
	b=GhwVuG66RXYLkukbD7mKYw5OHZlebLyMDySVlMWW0noFfva5GrethGG8o8jftDpkOr
	B4WMz5yHkR6uDeZKuaiFYjgstD0L/rmJ6SS8Kk3eq4Lk/2+GdikeskmbSHSF5HM4xGYX
	hwKv0CwZi1o1l3OuVF4n6kZ5onIDrYCAxC4CQ=
MIME-Version: 1.0
Received: by 10.204.157.8 with SMTP id z8mr1315437bkw.145.1315090923429; Sat,
	03 Sep 2011 16:02:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.131.201 with HTTP; Sat, 3 Sep 2011 16:02:03 -0700 (PDT)
In-Reply-To: <396b96c9583f7a072b27d914a5cef2a7788aa74e.1315090054.git.scott.a.garman@intel.com>
References: <cover.1315090054.git.scott.a.garman@intel.com>
	<396b96c9583f7a072b27d914a5cef2a7788aa74e.1315090054.git.scott.a.garman@intel.com>
Date: Sat, 3 Sep 2011 20:02:03 -0300
X-Google-Sender-Auth: STTDnUVOLLabWPb2b7fMDQKpJ04
Message-ID: <CAP9ODKp52jfZnNkPwBKiQP2oKPKzpNy83RspTpG2W17TUxyBEg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] runqemu: standardize ability to specify custom qemu/kenel boot options
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
X-List-Received-Date: Sat, 03 Sep 2011 23:07:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 3, 2011 at 19:50, Scott Garman <scott.a.garman@intel.com> wrote=
:
> The old manner of specifying custom options to QEMU in this script
> using angle brackets was a frequent source of confusion. Meanwhile,
> Otavio Salvador added a decent method of specifying custom kernel
> boot options to this script. This patch documents the bootparams
> option and adds a similar way of specifying custom QEMU options
> using qemuparams=3D"".
>
> This fixes [YOCTO #1019]
>
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>

This really improves the usability of it. Thanks by work on it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


