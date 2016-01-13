Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3C70E600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 13:10:19 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id h5so108720826igh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 05:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Np+t7xDvLPl6ijCCwB/a/JVM5oK0ZhpHx2CHQSgERc4=;
	b=R5ugAki2POOdGze9nt6eJK/LEYfU6RtOj/gHyOihpER7Uz3VxtBwEg+AEoV4ehhg1e
	3BHRXDlGYIxKmgaLqaGz0EtwQ847bz4qEzRRbi5JxrEGs18UkochL3AiRyB37BVEkBvw
	vGaREYmZ7XlGRuGLTse9xr0enhIgvzd6/tjBRIzu1bOFf2Aq9FMYWqYni6KijUkMZUsl
	HWqu3+ElkRUj8rbOLHm2Dl+KsBalc56lYeDxbJvcgQTxWBzocNzLfmFjIDHOrMr0LMz8
	GGS39lTiK6tO3Ec6lB0Mdgv4OMCsJDa2RBum+WHkG0vJ0C4dTbwbBddpWNtRZFu+Gl8I
	EsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Np+t7xDvLPl6ijCCwB/a/JVM5oK0ZhpHx2CHQSgERc4=;
	b=eV0RTYXGZqxjnGQhfUiEGCT5OJLEqEEE3huOPADc2YXx0HEEm/bNZLdvIiZGAmpUN6
	bdiM9Z/zcUD7yHcVwgT1E+yhPOXM4kWIBnLxfr+7gRzlHyyqp5jN5m+xykQOYpEGRkye
	8bai7XByT0VCHdE6XDZF57nG38hTsGVizwJL09VorSrPgm6GWPKtBQJdrJYY+XswS+Tk
	LjxXK+M9G1RFH0fBfY/KRQ6DhKtDn/Kr2QSpeyye4irmODlQln23hlcxjW/1zWmZsp1d
	P6gy+pcOA405XIuJn0usGlMQn51zMcceooBnJkNr5wdDG72svWmy4eJKADfDJMZAXNcw
	++Bg==
X-Gm-Message-State: ALoCoQnfmOgrn7fLNQbxzUkYRhZlWTwHiLnCJhTx+IpuNeDtPQljn4pzDZYYR9gBOpzoqnPOpoUlsKsn442dnGtKrYHaP5UMaurN53dBfeNgtKQITkMRZUA=
X-Received: by 10.50.55.4 with SMTP id n4mr21825126igp.64.1452690620532; Wed,
	13 Jan 2016 05:10:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 13 Jan 2016 05:10:01 -0800 (PST)
In-Reply-To: <1452647111-3884-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1452598345.28375.12.camel@linuxfoundation.org>
	<1452647111-3884-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jan 2016 13:10:01 +0000
Message-ID: <CAJTo0LaNFs_vV9Q6xLM4Qh2YT==8U263F79f0hdET1nK2a_JXw@mail.gmail.com>
To: Li Xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] net-tools_1.60-26.bb: Error fix
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
X-List-Received-Date: Wed, 13 Jan 2016 13:10:23 -0000
Content-Type: multipart/alternative; boundary=e89a8f3b9b4967e623052936e479

--e89a8f3b9b4967e623052936e479
Content-Type: text/plain; charset=UTF-8

On 13 January 2016 at 01:05, Li Xin <lixin.fnst@cn.fujitsu.com> wrote:

> -       quilt pop -a || true
> +       ${STAGING_BINDIR_NATIVE}/quilt pop -a || true
>

Isn't this in PATH already?

Ross

--e89a8f3b9b4967e623052936e479
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2016 at 01:05, Li Xin <span dir=3D"ltr">&lt;<a href=3D"mailto=
:lixin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">-=C2=
=A0 =C2=A0 =C2=A0 =C2=A0quilt pop -a || true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_BINDIR_NATIVE}/quilt pop -a || true<b=
r></div></blockquote></div><br>Isn&#39;t this in PATH already?</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--e89a8f3b9b4967e623052936e479--
