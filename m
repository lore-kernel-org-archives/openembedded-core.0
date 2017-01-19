Return-Path: <ross.burton@intel.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id B00F871A18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 12:01:22 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id w194so14883248ybe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 04:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jALXN9HTwASHIqlRupOYtHCIwSgPwdcUjT1INwK+kt8=;
	b=OfI/ZtWiGgHUqw2oCcjUcdHfZABd4Iqho8kYXBejfgaA6rE/Wbh2kV/ncRiKOgFvnn
	L55UC3e/u3vCXtoG3vvlk7jPHZm51RdAUx9DZqaIN/lVhsTORT1eUk63IS7+08xQPEuE
	s6RnjMcaXqGp/WnZh4HkiTe2qmQrv///kux2HnX3XLRu4Gjaf1o2UyLPolYnEE++Qomr
	IhzAPtd4J8wLQe+6IhGt/X3CHr2oJl+JT1vhsyqto0wPOhmRE+84sP3qGigm3RUmVUFn
	/xQfDCUO3ns8Bh4a6lH38uqjcSFoGIARhgel8bZuMDtNVsjwjKfKmVDLAPDOr6yVYFeW
	ysEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jALXN9HTwASHIqlRupOYtHCIwSgPwdcUjT1INwK+kt8=;
	b=DueDG9Bdl2l3Q3zmU+E73rZmqtzRljBOknOWwKiaB5DwK00r6tjVUwvjl5i4ghE7nN
	4NoyFwqzdMPSm2aIbPiLZiVPoIfWLlGhMnI8qcjHx66rLukw+Rt7b6EAH0F9f+ikNq4v
	Zh3I2sebBYJnYWSuWEuy7qZDo7F1vRDZYDXAgRjQ/5yUPEkQ6d7WderUTB/1cJOLS0R1
	r4BFFqLe4yv5o//W+p3aq/5d6YxYcM+WhI4b+dP6u4HzuWpsZc6hgAhdRJ+MDB04EpDZ
	YgW/KAqyed/R7c5jJsmz/ytOTyNvLFZGTRB6Tia3YXAo02On37GK3w/XKJZvkqVg4G5S
	SVYQ==
X-Gm-Message-State: AIkVDXIVp/PcRvGunPXr/bDWjh66okgUcLSGz1lfgg8PyzwhBehgtuum56C2FQlBAnfrGcasqNBL9c+ufiv8h0YP
X-Received: by 10.237.54.1 with SMTP id e1mr6929511qtb.68.1484827282968; Thu,
	19 Jan 2017 04:01:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 19 Jan 2017 04:01:02 -0800 (PST)
In-Reply-To: <cc6a7fcca781a3a153ba5cfbfe7a45282a55f917.1484764234.git.randy.e.witt@linux.intel.com>
References: <cover.1484764234.git.randy.e.witt@linux.intel.com>
	<cc6a7fcca781a3a153ba5cfbfe7a45282a55f917.1484764234.git.randy.e.witt@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Jan 2017 12:01:02 +0000
Message-ID: <CAJTo0LZ3u-+2SGOL=SgHG=14xSJn_9koEyCoOMDStXUmDsuDLg@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] selftest/containerimage.py: Add container IMAGE_FSTYPES test
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
X-List-Received-Date: Thu, 19 Jan 2017 12:01:26 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf0c138f40546714acf

--001a1142dcf0c138f40546714acf
Content-Type: text/plain; charset=UTF-8

On 18 January 2017 at 18:31, Randy Witt <randy.e.witt@linux.intel.com>
wrote:

> +        expected_files = [
> +                    './',
> +                    './bin/',
> +                    './bin/theapp',
> +                    './etc/',
> +                    './etc/default/',
> +                    './etc/default/postinst',
> +                    './etc/ld.so.cache',
> +                    './etc/timestamp',
> +                    './etc/version',
> +                    './run/',
> +                    './var/',
> +                    './var/cache/',
> +                    './var/cache/ldconfig/',
> +                    './var/cache/ldconfig/aux-cache',
> +                    './var/cache/opkg/',
> +                    './var/lib/',
> +                    './var/lib/opkg/'
> +                ]
>
> These should use ${bindir} etc so they're resilient to distros changing
the paths (please use get_bb_vars() to only invoke bitbake once).

+        image = os.path.join(self.builddir, "tmp/deploy/images/qemux86/
> container-test-image-qemux86.tar.bz2")
>

Don't hardcode this path, use ${DEPLOY_DIR_IMAGE} (fetch it with the paths
above for speed) which will get you to tmp/deploy/images/[machine].  Again,
these paths can change (poky sets TMPDIR to tmp, nodistro uses
tmp-${TCLIBC}).

Ross

--001a1142dcf0c138f40546714acf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 January 2017 at 18:31, Randy Witt <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@linux.int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
2ne" class=3D"a3s aXjCH m159b2db3be1e4392">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exp=
ected_files =3D [<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./bin/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./bin/theapp&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./etc/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./etc/default/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./etc/default/postinst&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./etc/ld.so.cache&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./etc/timestamp&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./etc/version&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./run/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./var/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./var/cache/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./var/cache/ldconfig/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./var/cache/ldconfig/aux-<wbr>cache&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./var/cache/opkg/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./var/lib/&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39=
;./var/lib/opkg/&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br><br></div></b=
lockquote><div>These should use ${bindir} etc so they&#39;re resilient to d=
istros changing the paths (please use get_bb_vars() to only invoke bitbake =
once).</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ne" =
class=3D"a3s aXjCH m159b2db3be1e4392">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image =
=3D os.path.join(self.builddir, &quot;tmp/deploy/images/qemux86/<wbr>contai=
ner-test-image-qemux86.<wbr>tar.bz2&quot;)<br></div></blockquote></div><br>=
Don&#39;t hardcode this path, use ${DEPLOY_DIR_IMAGE} (fetch it with the pa=
ths above for speed) which will get you to tmp/deploy/images/[machine].=C2=
=A0 Again, these paths can change (poky sets TMPDIR to tmp, nodistro uses t=
mp-${TCLIBC}).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a1142dcf0c138f40546714acf--
