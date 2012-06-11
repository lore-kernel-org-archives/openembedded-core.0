Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8zz-0001KK-Gm
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:05:55 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:53:59 -0700
Received: by mail-lb0-f180.google.com with SMTP id gh12so2575553lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=7D9xq2kpBDxKrdo1wARFsGw71PKRhjFdLgO7RzmbjvY=;
	b=bd6EFZ1C6/nN0U3BBol33j0xXwvxV6JiCy9bPh569p0KuSq9WI6IDik8mYRqBGNRog
	nZmN/KOUUf8czcU4G4sy1ekpmXK0Lm6F0a+x9wgpkoL8fCcppTyYWGrfQFZuLSU3AM/8
	5/cZ8A7PXYWD+HOXWWvpGFgfDizq919k5YczMIsi93Yb7t9jtpwNOV9WhTxdJ5htxdI2
	5UGLOokNPx50gAE89UrVbMKDmRiBVdo0aiLZSjFXSxPl0/ZlTgkI9VCV3sZy9XzYCAHv
	RtKzNf2j3xEkpPhjMVcCuXCyY3BR25gPwM48GIqJiPk5FWrQFWf9j9xd4Z3fZqdeszNm
	FaIQ==
MIME-Version: 1.0
Received: by 10.112.85.225 with SMTP id k1mr3563954lbz.38.1339437238963; Mon,
	11 Jun 2012 10:53:58 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:53:58 -0700 (PDT)
In-Reply-To: <cover.1338443711.git.xiaofeng.yan@windriver.com>
References: <cover.1338443711.git.xiaofeng.yan@windriver.com>
Date: Mon, 11 Jun 2012 10:53:58 -0700
Message-ID: <CAPhnLPCwO3twLRbGMo+bksgTtCjn8HKrm2vSamF6D2F4xe_7Ew@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQklGXBxqVRNmab/r3NOyvHDauF+aTSxkpUH8FCLC7CcApdvp1a1x7SH9WH9dq3zAAHtNdRz
Subject: Re: [PATCH 0/2] archiver.bbclass:Improve the usability for the archiver classes
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
X-List-Received-Date: Mon, 11 Jun 2012 18:05:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 11:02 PM,  <xiaofeng.yan@windriver.com> wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>
> The usability of the archiver classes can be improved, beyond the
> simple addition of default values for the variables.
> A user could well inherit just archiver rather than the individual
> useful classes, and not realize it will do nothing.
>
> The following changes since commit f28209d9d3c67203a2c7a2b25cacfe31643d1b=
fa:
> =A0Kang Kai (1):
> =A0 =A0 =A0 =A0cooker.py: terminate the Parser processes
>
> are available in the git repository at:
>
> =A0git://git.pokylinux.org/poky-contrib xiaofeng/2472
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofeng/2472
>
> Xiaofeng Yan (2):
> =A0archiver.bbclass: Improve the usability for the archiver classes
> =A0local.conf.sample.extended: Change the usage about arhiver.bbclass
>
> =A0meta-yocto/conf/local.conf.sample.extended | =A0 31 ++++++++++++++++--=
---------
> =A0meta/classes/archiver.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A06 ++=
+-
> =A02 files changed, 22 insertions(+), 15 deletions(-)
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


