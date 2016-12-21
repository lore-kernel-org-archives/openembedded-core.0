Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8CD772F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:27:52 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id o3so2831271wjo.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 05:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pgaFpl2BFUegz2OJHV8uPf1+1++FcA9Kg98+Czxd82A=;
	b=KlNoffd7QTl7uzRIQnp925rwCSb8GO9NOCO01+6sk7/nbGN7w+ZEJ1qlq5EO9Nw6oV
	LqrNnPShGp7PlMRjfZ8zoXwmzhfH/NCa3dyWb4oQCm65+wRqNKMHsAnyC25p7SM74/mY
	8C5e1AUiC+to5U1Uy/tY7W/gWM7UExPmHrsJo2Q/8y5pM08HtJ6LyGopwGeQQfiDl2Ex
	klYzqWDlYBNhlpnMQvJ6ocpVOr65hUnpjFEZmmdEEaZou3qrdcWSf+JGEG+eBC6u+7Tx
	siPCZAs4QnvKZ2NeiRvGWYayj2fmk8UyIefMweY+E0GOCz7du80984DC/otLCpX8QZQd
	Npgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pgaFpl2BFUegz2OJHV8uPf1+1++FcA9Kg98+Czxd82A=;
	b=dHXrSYmbQZ1qE1/qpsIY/ekeys4xAg0ldvHvSiwQhiQgGaT53bqCPAbpdb/7pm7Rm0
	F/gWPygsfklVITMHWoGyGXm3G1VfNgDJ9l1o9y0kui7lHhLFsQn+Lvq7Ws3BCbyDWWAu
	jgQ3UP3RYEGZMnJLVoO4fxDhlSiqrdXDQEXFkMTbKcz9DyXvb61jD7HNNxf7HHzWuvMa
	l+MnXZQi+UBK+lhoZbp9knKxfNj368W21E4aiKeWva5gm2xmcHBYAayCqDwGtF0c9XiU
	YDC0Z3r0zViXl/GSXimhTYxrMQ+mrBUgTjwLldlmkCIE9bFNHb3K/D13JH+Ohrgykz4e
	OiqQ==
X-Gm-Message-State: AIkVDXJkNoGx9+/hDzSi4E+Tt8YhjsPtygaaIMUYqeSl7Ka1/KOeCFKpekGQJRqaqYFfzS0UxHxj0EEXQ0ciow==
X-Received: by 10.194.112.170 with SMTP id ir10mr4183879wjb.190.1482326873288; 
	Wed, 21 Dec 2016 05:27:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Wed, 21 Dec 2016 05:27:52 -0800 (PST)
In-Reply-To: <6efb8d002491cd1e736b9126e09a5a63b4acd4d1.1482300982.git.liezhi.yang@windriver.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
	<6efb8d002491cd1e736b9126e09a5a63b4acd4d1.1482300982.git.liezhi.yang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 21 Dec 2016 05:27:52 -0800
Message-ID: <CAJ86T=X_cPiiTWb_mdrcWre=XmAkB=kk7QE0kJ-SKu9Z1B1Fxw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] hdparm: 9.48 -> 9.50
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
X-List-Received-Date: Wed, 21 Dec 2016 13:28:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2016 at 10:17 PM, Robert Yang <liezhi.yang@windriver.com> w=
rote:
> Add 0001-Makefile-use-weak-assignment-for-LDFALGS.patch to fix issues lik=
e:
> ERROR: hdparm-9.50-r0 do_package: QA Issue: File '/sbin/hdparm.hdparm' fr=
om hdparm was already stripped, this will prevent future debugging! [alread=
y-stripped]
> ERROR: hdparm-9.50-r0 do_package: Fatal QA errors found, failing task.

Passing LDFLAGS on the make command line might be a cleaner solution
than patching the Makefile.

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...-Makefile-use-weak-assignment-for-LDFALGS.patch | 30 ++++++++++++++++=
++++++
>  .../hdparm/{hdparm_9.48.bb =3D> hdparm_9.50.bb}      |  8 +++---
>  2 files changed, 35 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-extended/hdparm/hdparm/0001-Makefile-use=
-weak-assignment-for-LDFALGS.patch
>  rename meta/recipes-extended/hdparm/{hdparm_9.48.bb =3D> hdparm_9.50.bb}=
 (80%)
>
> diff --git a/meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-a=
ssignment-for-LDFALGS.patch b/meta/recipes-extended/hdparm/hdparm/0001-Make=
file-use-weak-assignment-for-LDFALGS.patch
> new file mode 100644
> index 00000000000..f74da5f18c9
> --- /dev/null
> +++ b/meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignme=
nt-for-LDFALGS.patch
> @@ -0,0 +1,30 @@
> +From 9532fbaade3b08cef936723a6a5adf191881edbf Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Mon, 19 Dec 2016 22:36:16 -0800
> +Subject: [PATCH] Makefile: use weak assignment for LDFALGS
> +
> +So that it can use LDFLAGS from env vars.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 05a1f78..60b67d9 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -15,7 +15,7 @@ STRIP ?=3D strip
> +
> + CFLAGS :=3D -O2 -W -Wall -Wbad-function-cast -Wcast-align -Wpointer-ari=
th -Wcast-qual -Wshadow -Wstrict-prototypes -Wmissing-prototypes -Wmissing-=
declarations -fkeep-inline-functions -Wwrite-strings -Waggregate-return -Wn=
ested-externs -Wtrigraphs $(CFLAGS)
> +
> +-LDFLAGS =3D -s
> ++LDFLAGS ?=3D -s
> + #LDFLAGS =3D -s -static
> + INSTALL =3D install
> + INSTALL_DATA =3D $(INSTALL) -m 644
> +--
> +2.10.2
> +

