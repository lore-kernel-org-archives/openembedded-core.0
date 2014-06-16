Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9E06FED1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:31:58 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id hw13so6210328qab.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 06:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=n1Wovrh2DNgXtIS/kiu8cYETDqCS9D9lwG3d0IGwkkc=;
	b=Gp5W/Lj5iyfwZ+5H3e+0qMAc5hx/BelAFccMtRXglyNusaE3HzrmzUr46IoOUrr03I
	JWfReDr0YPhfa8XtZnNxyTahLFda7Alu+a5CYURtE0doJjv1NRWkBkTDcm4Zsgzfl4uY
	v+RvHHHcFF89+Xr+Rok+6LidoOB6Wf8LJ1xsCIr71nv7rgRODmxhHgkGrAACo8dQ87zD
	PL3iaM0QeGsJ5wX8ToRWPnYPwgvlYMcDqrJKMzsREfnEbqDnRmoj+c88NiCrgizezcJ3
	QYD3f0D8qFnR4wj7IDlfmbixV1tiPh4DZ21YgxtAojQEAW6rjQOJkt15Ie1oi7mVXdTY
	aBWQ==
X-Gm-Message-State: ALoCoQljQc29cU6G2tmwet3hlcTfuoSiUkYcC4umVANATcGoc8tI3Ii2ciWCCJLcFv0i3t1VarQG
X-Received: by 10.140.89.201 with SMTP id v67mr25469937qgd.71.1402925519303;
	Mon, 16 Jun 2014 06:31:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Mon, 16 Jun 2014 06:31:39 -0700 (PDT)
In-Reply-To: <539EDD51.9060508@digi.com>
References: <cover.1396927648.git.Chong.Lu@windriver.com>
	<539EDD51.9060508@digi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jun 2014 14:31:39 +0100
Message-ID: <CAJTo0LbcPqL+E78x1jUX6JH_BBc-uuEV8KDjELap9OJidPtYqA@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [backport to Daisy] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Mon, 16 Jun 2014 13:32:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

If you'd be willing to backport the patch, verify that it works, and
send it to the list, then that would be much appreciated and speed
integration.

Ross

On 16 June 2014 13:04, Javier Viguera <javier.viguera@digi.com> wrote:
> Hi all,
>
> I see this was finally included in oe-core *master*, but the problem is
> still affecting Daisy.
>
> Creating a basic command-line image with dbus pulls in the dbus-ptest-pte=
st
> package (37MB installed):
>
> # du -sh /usr/lib/dbus-ptest/ptest
> 37.6M   /usr/lib/dbus-ptest/ptest
>
> Could the fix be backported to Daisy?
>
> -
> Thanks,
>
> Javier Viguera
> Software Engineer
> Digi International=C2=AE Spain S.A.U.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

