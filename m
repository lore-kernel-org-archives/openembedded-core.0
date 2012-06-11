Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8yB-00018d-3q
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:04:03 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:53:28 -0700
Received: by lbbgh12 with SMTP id gh12so2575552lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=PJDJnpiSZTOu6JZYdwcinAmV6JXumypnh80wi7v0frI=;
	b=CT5scd5YdD2DhwrHLDUzfNPz9WgMIDxTDpM9b9VFLT6G9lFHHFpzTx3K2tmp3yoLWk
	XaAaGn3Wdj+z/fQU51LG2c7F7vJMMS/4VDRuUH0ob4Fe4hRu6/1QFqw9UVAjiA4flIAx
	QYzsPnOZ0ibxY0FVuYhAW9Dd2i/KqxT8q0XHuo4QpApDa4+6AoaujhztKcPIQZc/ovRY
	791nTrT5tDTJGp5tq0qczNgx9+jPGudU4IMHhcKRASW/AXRaXghKFXcJ8ab25qkwRDKe
	eaHsOX4qSUzWDDau+vCP2fVrE6i4G3Jm7DwIiQ1HcbzWnpWJtuAHkLO6Z2uDioCbt5N/
	4LYg==
MIME-Version: 1.0
Received: by 10.152.125.236 with SMTP id mt12mr17954622lab.12.1339437206342;
	Mon, 11 Jun 2012 10:53:26 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:53:26 -0700 (PDT)
In-Reply-To: <cover.1338541462.git.xiaofeng.yan@windriver.com>
References: <cover.1338541462.git.xiaofeng.yan@windriver.com>
Date: Mon, 11 Jun 2012 10:53:26 -0700
Message-ID: <CAPhnLPALtKFsmCz3V2av7x+=GcmzuVKPn-0fgSOPPzeC_6js+g@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkqBUd8m4I3jnA/7yQqgM83Lc2AuSxKSO+NgbtG339PP8I64t8Gfg6LOX/oj3oj4RghWS49
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/3 V2]lsb: Add initscripts to enhance init functions in an lsb image
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
X-List-Received-Date: Mon, 11 Jun 2012 18:04:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2012 at 2:13 AM,  <xiaofeng.yan@windriver.com> wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>
> This is V2. The modification is as follows by comparison with V1:
> - Add extra description in section "DESCRIPTION"
> - Use bbclass update-alternatives instead of command method.
>
> The following changes since commit de4cdfd6bc1280ac7ac0559b87734d26294ef7=
73:
> =A0Scott Rifenbark (1):
> =A0 =A0 =A0 =A0documentation/kernel-manual/kernel-how-to.xml: Updated to =
kernel 3.4
>
> are available in the git repository at:
>
> =A0git://git.pokylinux.org/poky-contrib xiaofeng/2133
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofeng/2133
>
> Xiaofeng Yan (3):
> =A0lsbinitscripts: Add initscripts to enhance init functions in an lsb
> =A0 =A0image
> =A0lsbinitscripts: Patch file functions for confirming to an lsb image
> =A0task-core-lsb: Add another initscripts to an lsb image
>
> =A0.../lsb/lsbinitscripts/functions.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
1 ++++++++
> =A0meta/recipes-extended/lsb/lsbinitscripts_9.03.bb =A0 | =A0 26 ++++++++=
++++++++++++
> =A0meta/recipes-extended/tasks/task-core-lsb.bb =A0 =A0 =A0 | =A0 =A03 +-
> =A03 files changed, 39 insertions(+), 1 deletions(-)
> =A0create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/functions.=
patch
> =A0create mode 100644 meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Merged into OE-Core

Thanks

-b


--=20
Elizabeth Flanagan
Yocto Project
Build and Release


