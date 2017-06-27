Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB3A7803F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:00:09 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id l21so2978217ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8aLrcsgQLvTUySGaUz+3PS8RRwp8/+3hFAEBM1EVxiA=;
	b=fUFREZPS2pMVQiCjBnq9/LcI9MEfP+iHj8Z8pKBv4eEdLnU6m6+M5Fhr2SxS9b+xiU
	hLOMGf3X9KDhjM+OqmVwh9ypa/1mI2zNu5QCsl2tN1/zEMiQ/e7zSKv1uPdFgc8XmxXE
	hs2jYmFKVWa1lFldoiRFgwX0N9ngtB2eYb3GCp7DvfcXviaLvlmeLtricCA9iFNRis8O
	ag0NrQr8OQ8B+Q9CogEWZrY5VGtghaPrHwVjgjbjxy3KkX8liyeJ0zSmzyLF2DksUTtT
	GTI0WQ4pZvQL/zp2af7a8EpljDXZmTz16fz1vK6AnSrQM0GCFmgzVBfNZrEkh0VzYwh5
	jtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8aLrcsgQLvTUySGaUz+3PS8RRwp8/+3hFAEBM1EVxiA=;
	b=far2OwrxcI070CgM+1FggUprEum7UJmmoGOcJdOOwsSD7NXdTbDTFGysLVoTz150O6
	ONG3E5MEQtSCmKxMnNGw69x5eNy3pT+62EALmA2Fp8xifAI7zBMBx9vdZE47IVq7J9VW
	EWHX5js56ng8YqONQR9xah5tIv1POG6VYZlz811MzmrPM8IAcTEJfhteJJEoZ5Ub2Dkz
	1WYNA+hyXWCUve3d5016oMX/oS2naM4GWrADXhKXk+dVTlkMvZkVQbBp88LECMurebtK
	aG5Qug70k3HuxMAulibwR/9l7rcai5Io56P8mpblDMi5liMDAGqiS0qZXDXjubJgefUK
	ZHmQ==
X-Gm-Message-State: AKS2vOxOBt9ga7Ku72ql/Z2lyNyavc+jUdWt3VQEPL0s/24FiIGRdNuk
	4Lf+SkP0SV/h2kYLLKMldB/Q4bwsrA==
X-Received: by 10.129.98.68 with SMTP id w65mr3673189ywb.130.1498568410704;
	Tue, 27 Jun 2017 06:00:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Tue, 27 Jun 2017 06:00:10 -0700 (PDT)
In-Reply-To: <1498556273.3124.6.camel@linuxfoundation.org>
References: <CA+chaQcmksz0eGEwb9RZ9B_7JFaB7e97iNCoWCp84zJEkqpHoA@mail.gmail.com>
	<1498550932.7464.29.camel@intel.com>
	<CA+chaQf=qedEY+V7b8WUG=YNKwANzTSabaY4DNZMa81V7-MiPQ@mail.gmail.com>
	<1498551943.3124.4.camel@linuxfoundation.org>
	<1498555300.7464.35.camel@intel.com>
	<1498556273.3124.6.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Jun 2017 15:00:10 +0200
Message-ID: <CA+chaQeRUR+dnyUGwPBj2U-Hw_eQPtc7xrX1Rt8JMkS2hJxwVw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Never ending stream of bitbake exceptions when the builder runs out of disk space
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
X-List-Received-Date: Tue, 27 Jun 2017 13:00:10 -0000
Content-Type: multipart/alternative; boundary="001a11470834cab1fb0552f0a5d2"

--001a11470834cab1fb0552f0a5d2
Content-Type: text/plain; charset="UTF-8"

OK, I've updated my jenkins job for build setup to enable BB_DISKMON_DIRS
to prevent such issues in future

https://github.com/shr-project/jenkins-jobs/commit/a8c06243d6296d294d5e79abd7d25d3b8a56d040

once verified that it works as expected I'll update all the builds I
maintain.

On Tue, Jun 27, 2017 at 11:37 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2017-06-27 at 11:21 +0200, Patrick Ohly wrote:
> > On Tue, 2017-06-27 at 09:25 +0100, Richard Purdie wrote:
> > >
> > > So if its not default, we should make it default and I'd encourage
> > > people to use it.
> > It's not the default at the moment because it's only in
> > local.conf.sample, which people might not use.
> >
> > So should a default for BB_DISKMON_DIRS be set in bitbake.conf?
>
> No, I don't think this belongs in bitbake.conf.
>
> If you use a nodistro setup you do get a reasonable default value for
> this, you're right and it is in the default local.conf.sample. Its up
> to distros and users to select the pieces they need/want beyond that.
> Whilst Martin is close to nodistro it sounds like this config was
> missing and I'd suggest using it.
>
> Cheers,
>
> Richard
>
>

--001a11470834cab1fb0552f0a5d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, I&#39;ve updated my jenkins job for build setup to ena=
ble BB_DISKMON_DIRS to prevent such issues in future<div><br></div><div><a =
href=3D"https://github.com/shr-project/jenkins-jobs/commit/a8c06243d6296d29=
4d5e79abd7d25d3b8a56d040">https://github.com/shr-project/jenkins-jobs/commi=
t/a8c06243d6296d294d5e79abd7d25d3b8a56d040</a><br></div><div><br></div><div=
>once verified that it works as expected I&#39;ll update all the builds I m=
aintain.</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Tue, Jun 27, 2017 at 11:37 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Tue, 2017-06-27 at 11:21 +0200, Patrick O=
hly wrote:<br>
&gt; On Tue, 2017-06-27 at 09:25 +0100, Richard Purdie wrote:<br>
&gt; &gt;<br>
&gt; &gt; So if its not default, we should make it default and I&#39;d enco=
urage<br>
&gt; &gt; people to use it.<br>
&gt; It&#39;s not the default at the moment because it&#39;s only in<br>
&gt; local.conf.sample, which people might not use.<br>
&gt;<br>
&gt; So should a default for BB_DISKMON_DIRS be set in bitbake.conf?<br>
<br>
</span>No, I don&#39;t think this belongs in bitbake.conf.<br>
<br>
If you use a nodistro setup you do get a reasonable default value for<br>
this, you&#39;re right and it is in the default local.conf.sample. Its up<b=
r>
to distros and users to select the pieces they need/want beyond that.<br>
Whilst Martin is close to nodistro it sounds like this config was<br>
missing and I&#39;d suggest using it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div>

--001a11470834cab1fb0552f0a5d2--
