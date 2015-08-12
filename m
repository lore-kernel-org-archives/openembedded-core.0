Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 21480734DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 16:46:56 +0000 (UTC)
Received: by qged69 with SMTP id d69so14294037qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 09:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hHG7c8pXIlQXAVEUHn4L6euicRp3s1BaVHeWNqUGvJI=;
	b=E3/emeGWCDIvaShrNhrazNDiIdM99r/G6EHOafvFc+xFemihtT8ezEM+NvLJHFaNOI
	r6twFQ/EhJbC8K+wxgJW/vYYAxvMEbPa9gw2llyXmxjaZULDr6laP4odOUs6Uk0zACGU
	N7Dm7aQMV6M4o9DaOsMPCdo6eykwoKm0GAU23JVRDcCH7fugjxf4Yt9u6LT0PXQarlKi
	B39UFg8eveYw0ReCqZueS7v0uN2lEKmpBj9dMpqc+7AiAWEdI0ODovx5ZWA4RBSu6Ros
	w9ko6gQKUKmaWzp/uq4v/P6EXtXmm4RYyCSVGrieX5YhH4LQECzHxHH5AMP9CrV/+W/l
	Ae1w==
X-Gm-Message-State: ALoCoQnvwqWRLknaMrIyDPSNTzff8b+XeeATPSOvYkEU0+YoUcHc5FEa3hBgiqtvy2aSaxjuD1Zz
X-Received: by 10.140.20.77 with SMTP id 71mr25987406qgi.87.1439398016406;
	Wed, 12 Aug 2015 09:46:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 12 Aug 2015 09:46:37 -0700 (PDT)
In-Reply-To: <AB5F0F40-684B-4A79-B48B-B06D4F32B598@gmail.com>
References: <1437500350-549-1-git-send-email-jslater@windriver.com>
	<AB5F0F40-684B-4A79-B48B-B06D4F32B598@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Aug 2015 17:46:37 +0100
Message-ID: <CAJTo0LbsE_BpLV6MqVH5UuOsMjfRTTFL9EhGvxXGp2G0isrpTA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] common-glibc: define bash_cv_getcwd_malloc
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
X-List-Received-Date: Wed, 12 Aug 2015 16:47:03 -0000
Content-Type: multipart/alternative; boundary=001a11c12458756ad9051d1ff70d

--001a11c12458756ad9051d1ff70d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12 August 2015 at 08:49, Khem Raj <raj.khem@gmail.com> wrote:

> I would suggest to move this to bash recipe as
>
> CACHED_CONFIGUREVARS +=3D =E2=80=9Cbash_cv_getcwd_malloc=3Dyes=E2=80=9D
>
> so other libcs can also benefit.
>

Don't we then have to trust that all libcs are not broken, or is the bash
getcwd implementation *that bad*?

Ross

--001a11c12458756ad9051d1ff70d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 August 2015 at 08:49, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":28g" class=3D"a3s" styl=
e=3D"overflow:hidden">I would suggest to move this to bash recipe as<br>
<br>
CACHED_CONFIGUREVARS +=3D =E2=80=9Cbash_cv_getcwd_malloc=3Dyes=E2=80=9D<br>
<br>
so other libcs can also benefit.<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>Don&#39;t we then =
have to trust that all libcs are not broken, or is the bash getcwd implemen=
tation *that bad*?</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a11c12458756ad9051d1ff70d--
