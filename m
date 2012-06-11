Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8vd-00013B-9X
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:01:25 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:44:41 -0700
Received: by lbbgh12 with SMTP id gh12so2569838lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=r8a/wVZbqFwXy8eOqg0I3PoSQK/xTEtrFUatjYSmAi0=;
	b=W1JQYKweXWSAvyQGohQkwxLtBtZ4gDw/5w8RaOzzUZBLTYmdJKmzxutIgKW8A13tTo
	JfZ2psZ4mYLSHBqNx3tRIw7jQ/xrEVANG6OHsObn8Kza+mEwlaStBnUkPnjKBMIpcfrs
	VlFep/P+3+zaRHStvElW9UcEINptmdk2K7BbnpXSWz9AMVinCgynjtEEC6byIVGpVHvk
	AFxdzgV5Fg6jb4Er1iAmMd6xoGyXYRrKDC/1vQ8IKyKiCyG3tuxFkpH54y9aFEsv2dN8
	ykWi6M0hkRfsYHHm+7Md2h1i0gUFEgOTV9dX0yFKQ5ljnFB4BmXSFS50YIgvYAw+PFnn
	yNag==
MIME-Version: 1.0
Received: by 10.152.123.244 with SMTP id md20mr18226859lab.0.1339436678658;
	Mon, 11 Jun 2012 10:44:38 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:44:38 -0700 (PDT)
In-Reply-To: <cover.1338420972.git.elizabeth.flanagan@intel.com>
References: <cover.1338420972.git.elizabeth.flanagan@intel.com>
Date: Mon, 11 Jun 2012 10:44:38 -0700
Message-ID: <CAPhnLPCNsDSr87z+pzCQ_G6VeJ1Lcw6hNf2FXQCGG-iS_kefSQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQmw2Pav6Wrr5/nnzeSCzQlnFN01ourPsH35emr9JQ/7qYaAEbkgw5BUdVvsTLiUAyYDQlYa
Subject: Re: [PATCH 0/1] Package version to package manifest
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
X-List-Received-Date: Mon, 11 Jun 2012 18:01:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 4:39 PM, Elizabeth Flanagan
<elizabeth.flanagan@intel.com> wrote:
> [YOCTO #2441]
>
> This was requested and makes sense. Adds the PV to the package manifest.
>
> The following changes since commit 348da93e283b2b8454fd9cde80d4b17378e2a1=
68:
>
> =A0webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-0=
5-30 17:38:02 +0100)
>
> are available in the git repository at:
> =A0git://git.yoctoproject.org/poky-contrib eflanagan/license_pkg
> =A0http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Deflanagan/l=
icense_pkg
>
> Elizabeth Flanagan (1):
> =A0license.bbclass: Adding PV to package.manifest
>
> =A0meta/classes/license.bbclass | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> --
> 1.7.5.4
>

(I'm really not talking to myself here. This is part of Saul's patch
management workflow :) )

Merged into OE-Core

Thanks

-b


--=20
Elizabeth Flanagan
Yocto Project
Build and Release


