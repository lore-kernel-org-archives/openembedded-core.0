Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id C2B7665DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 17:59:35 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id j107so9086490qga.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 09:59:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zsah8tulGNMEv6lnAY9SO4JQj574Sx9Q52tARlbHGuM=;
	b=YhXZU76fnpRAP6bqka8UMdlfSwlbqHGe7qLwOiOdFbExqcnkTnc0Z8y3Az6dsFO5bL
	3+tAt/22Wqr3pIlKnyNv+gd8eH4MbDEvoRSqUbivMmSrHVbTe5zMy/2YyToSbRZYprku
	m+9iVRwIpiQcQpQlfas72jEp6sxNH1Q8q2sJl2GucuqNM2TmcSPhpHJq455w/UiwcoCP
	6+ApyFfJBGfmSbd+zHRbQRSUqekRdgzELoJ+QZSTXCYXc/kBQ2+84+F0K8lYhxlqtQqF
	t1OAj65BKv6i2lDLH4v3Bgz9YoOkOKLDmiZwpdAO8ohaEMevFYFN0qksjZ+B1FgJ0Y4E
	RScA==
X-Gm-Message-State: ALoCoQmmiXxutIaj2VEJjURjsNK/HJByQdZKQMH20aRjpCbo5TFUO2ATL+T5+16PEmeYVkwI45u2
X-Received: by 10.140.96.101 with SMTP id j92mr60187675qge.87.1415815175733;
	Wed, 12 Nov 2014 09:59:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Wed, 12 Nov 2014 09:59:15 -0800 (PST)
In-Reply-To: <1415793612-12055-1-git-send-email-adrian.calianu@enea.com>
References: <1415793612-12055-1-git-send-email-adrian.calianu@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Nov 2014 17:59:15 +0000
Message-ID: <CAJTo0LZzVmxMcTNhtKpJrmROKxRj9-vtdFNdCwyZkG_ycgEzRQ@mail.gmail.com>
To: Adrian Calianu <adrian.calianu@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] automake: set test-driver path relative to top_builddir
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
X-List-Received-Date: Wed, 12 Nov 2014 17:59:38 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8a9e1a1d0507ad28d4

--001a113a9d8a9e1a1d0507ad28d4
Content-Type: text/plain; charset=UTF-8

On 12 November 2014 12:00, Adrian Calianu <adrian.calianu@enea.com> wrote:

> +Set the path relative to $top_build for test-driver to be accesible at
> runtime
> +
> +Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
>

This patch needs an upstream-status - in particular is this something
upstream can handle so we don't have to carry this patch forever?

Ross

--001a113a9d8a9e1a1d0507ad28d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 November 2014 12:00, Adrian Calianu <span dir=3D"ltr">&lt;<a href=3D"=
mailto:adrian.calianu@enea.com" target=3D"_blank">adrian.calianu@enea.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1xb" cla=
ss=3D"a3s" style=3D"overflow:hidden">+Set the path relative to $top_build f=
or test-driver to be accesible at runtime<br>
+<br>
+Signed-off-by: Adrian Calianu &lt;<a href=3D"mailto:adrian.calianu@enea.co=
m">adrian.calianu@enea.com</a>&gt;</div></blockquote></div><br>This patch n=
eeds an upstream-status - in particular is this something upstream can hand=
le so we don&#39;t have to carry this patch forever?</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a9d8a9e1a1d0507ad28d4--
