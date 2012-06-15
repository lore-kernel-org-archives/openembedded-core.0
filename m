Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SfRLf-00038J-82
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 09:53:39 +0200
Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 15 Jun 2012 00:42:59 -0700
Received: by vcbfk26 with SMTP id fk26so1403664vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 00:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=SxGjWRCS3BApg7YJDxL+cVLu886TqNhS06uNKjGLIco=;
	b=LYQHsSwvZMyVBxKPI0YjjBYjBzjDZ7J/EbIZ9c0dWQheqbpj3kD1Ty+YMmWdMuLbDD
	NXK+FtDpF8IgN64BqTijqpyKR06ZYd5khdGEmZoMZc3ixsD4tw1TPbgNNHQgVNwv3cPk
	C7cnj6G/uInCyRRHOYk+jK9YQ9G62mc3kdTP5jWrP5Yq9JTNjGXf3GljRHXNBLkKPRsp
	dQiJfXwLlsqGjqOXtE87cXGEQ420opgO8nNEapjwtap1Zw7KWO/FdKX74xrvQZZLO3Jy
	0jqY5phaOGq7ngjbF31nVvf4cTW0003eCvr5mGDM5FuFBgyixjQ/qJb3dxSXRwTtI7D5
	ZJzA==
Received: by 10.52.69.83 with SMTP id c19mr2092157vdu.79.1339746178925; Fri,
	15 Jun 2012 00:42:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.169.200 with HTTP; Fri, 15 Jun 2012 00:42:38 -0700 (PDT)
In-Reply-To: <CAMKF1sqDF9-hGz_H34AP1onxOrbJ5tp2Ds0_SuMfA=bOkL9o6g@mail.gmail.com>
References: <1339487948-30612-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1so7Y_ccRi_RcfjRzzbska1WRbY7N8w=VuN=aFp-U5oYSw@mail.gmail.com>
	<CAMZjud22RrKU8cEAPwu+K4Ze2hPVHo-5z17uu3Zj1cJvk6pNnQ@mail.gmail.com>
	<CAMKF1sqDF9-hGz_H34AP1onxOrbJ5tp2Ds0_SuMfA=bOkL9o6g@mail.gmail.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Fri, 15 Jun 2012 10:42:38 +0300
Message-ID: <CAMZjud2uk23xtx3=nrmEg_uBNYcs_C6YiJ1Xeiz2vcD-LEdxdQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmKdqFsffrKeD3bOcbX77biiA613YGYKxHiTcVqubqLzD/lk5i2o51GT3BaDN146/VWXWSj
Subject: Re: [PATCH] strace: update to 4.7
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
X-List-Received-Date: Fri, 15 Jun 2012 07:53:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 15, 2012 at 12:27 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jun 14, 2012 at 5:42 AM, Marinescu, Bogdan A
> <bogdan.a.marinescu@intel.com> wrote:
>> I was able to build strace 4.7 with uclibc succesfully, but I'm unable
>> to build an uclibc image (even core-image-minimal) to do an actual
>> test due to various compilation errors. Should I keep on trying to
>> compile an Yocto image to test strace+uclibc or is the succesful
>> compilation step enough?
>
> hmmm, it should be ok I guess. Which image were you trying to build.
> btw. only core-image-minimal, core-image-core and core-image-sato,
> meta-toolchain work with uclibc others are not tried.

I tried with core-image-minimal. I added these two lines to my local.conf:

CORE_IMAGE_EXTRA_INSTALL += "strace"
TCLIBC = "uclibc"

The libiconv problem is a minor one, it turns out that gettext and the
kernel also refuse to compile in this configuration.

Thanks,
Bogdan

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


