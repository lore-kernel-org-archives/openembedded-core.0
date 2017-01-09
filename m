Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id B9A0860123
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 10:35:25 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id v23so131678119qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 02:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VtkK/OMqf3VFoPlhAxXtbZMscITA6ZFCZ7FWJ7EtgS8=;
	b=Sb7sOnwoGjWJruYBFXeR+F51QvhBhv+bYWqpRF/4g9tgtRcSVj1ITT4KN6Buy4ITHn
	7ypiBHpUBIgYOzs17QWeUhihaaNLV9gqGaqCJaxUUw1a4zTA4xgtCKHl3XUFn+5HJmN7
	b4cb85DC0lx7RZsjoHIeJN+iXdTPSzN8/IdUW+zU2WhAqQBL1i0VKv2GKgfCpIvjprrl
	KfGVYecghXOubuIAMF3UYq2xJAkiBY0OvEc/bBsDLX/ytKrLJy8viXnhxxmVe7A5h2EW
	vlRN3JoCa9YarAtwNBLGhjnCOTsCr6qwqepScjNkckOgT0libfWClzCBfo9EPyGk2XRd
	/ngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VtkK/OMqf3VFoPlhAxXtbZMscITA6ZFCZ7FWJ7EtgS8=;
	b=Gv5sDlUXsTPnxiPylOxmRdzn8q1HyTxF0xS62LJE0LHqpfI0Xc5EbV1w599u7MGDFT
	iVzNuVj0VViTH9alT5xiITdC63Mlu+WTmzfm1xGUr4YlLutGvaMHdrkT4eSKMKelSnHA
	ZmwsyK2/a5LnGTADEKcqbGEchIXBtLWj7gghq0CuolhzzeN6fSBfaA/g1fBvK3GoI/tK
	01+H0VLWzfCkpAru4DRBwjoUYl4k2ooT8lmRgRkc9Ia/mk5SLhHXvwtedw3uV6Uy9jQI
	eG/0aS8CjZAOOOAv53gsI2ixAy1ZqnLa7sV0MJjnR5U9SmwZA1fUMHcvEVXVn3qd7mlr
	qTUQ==
X-Gm-Message-State: AIkVDXL9Qp7K6BXDUgjn7mxQu5ygb6Ry/5kQJr26ulkrBwZ8ChRtf3OPoXC440DhaOV5K8t8092cBeYmNdGEgAnb
X-Received: by 10.200.45.247 with SMTP id q52mr12429068qta.197.1483958125411; 
	Mon, 09 Jan 2017 02:35:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 9 Jan 2017 02:35:05 -0800 (PST)
In-Reply-To: <0925f43d1c572fdcff50db50ba67207d0b0459fc.1483945688.git.Qi.Chen@windriver.com>
References: <cover.1483945688.git.Qi.Chen@windriver.com>
	<0925f43d1c572fdcff50db50ba67207d0b0459fc.1483945688.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jan 2017 10:35:05 +0000
Message-ID: <CAJTo0LZ-Gm0rxEy-6JS7bRRyPXU4J85d+q7xOGcMTZqkvGaAAQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] selftest/bbtests.py: do not hardcode 'tmp' for TMPDIR
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
X-List-Received-Date: Mon, 09 Jan 2017 10:35:26 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf0ed53c20545a6ec70

--001a1139cdf0ed53c20545a6ec70
Content-Type: text/plain; charset=UTF-8

On 9 January 2017 at 07:09, Chen Qi <Qi.Chen@windriver.com> wrote:

> +        tmp_dir = get_bb_var('TMPDIR')
> +        self.assertFalse(os.path.isfile(os.path.join(tmp_dir,
> 'deploy/licenses/readline/generic_GPLv3')))
> +        self.assertTrue(os.path.isfile(os.path.join(tmp_dir,
> 'deploy/licenses/readline/generic_GPLv2')))
>

If we're going to remove path assumptions, then LICENSE_DIRECTORY is
$DEPLOY_DIR/licenses.

Ross

--001a1139cdf0ed53c20545a6ec70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2017 at 07:09, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D"gmail-:ad" class=3D"gmail-a3s gma=
il-aXjCH gmail-m159820f9447af729">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_dir =3D =
get_bb_var(&#39;TMPDIR&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(os.path.<wbr>isfile(os.path.j=
oin(tmp_dir, &#39;deploy/licenses/readline/<wbr>generic_GPLv3&#39;)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(os.path.<wbr>isfile(os.path.jo=
in(tmp_dir, &#39;deploy/licenses/readline/<wbr>generic_GPLv2&#39;)))<br></d=
iv></blockquote></div><br>If we&#39;re going to remove path assumptions, th=
en=C2=A0LICENSE_DIRECTORY is $DEPLOY_DIR/licenses.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1139cdf0ed53c20545a6ec70--
