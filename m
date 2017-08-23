Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id E8B6071BF0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 02:19:25 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id f8so229514wrf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 19:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c0oBe+thJEQD4fL2XTpuVryutB9Us9eX9yK2F93iuTE=;
	b=FCPtJaJMvMOhd/0MUMcVBCyt6tpb/80c0Ba59iY4WIfUDeMTNbUiJkwHXu4CGrif54
	cUxtrTVYYnkn5EOZeq5uWawu841+nktOY76tUDiVjclvGewugsf91U15pX7fFaBoICeb
	Cld7gAPrfhiw1NfGHRk2hY7ZETtQW/09FdTMXtiXsSUmR9t9lrSctTAtkBDLq77cpcGs
	ak6X5lKzdHe7btYvFZ6EJCNJvXtthOa7FCRgOrxsI6iLAY44CojPGWDQLmoz4TRA0okE
	AExEXcSSnZ3Kmdm2HV67Mu823T53q5XcFO5NFfQh1Hf64PvdUGO72R4oAenzq0jdUfde
	B35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c0oBe+thJEQD4fL2XTpuVryutB9Us9eX9yK2F93iuTE=;
	b=Agpb3bq1WMUjCV/kbzE5QkTupYs8Yx85/72TydQgCLikqaI0cHiJ1iTR4Tt5u9culT
	qKdf1AsATnUI7hvN5bpwzb64yOsqBtPnCr9yfnggdrSEUc3EUi8bXg3cy4sxOAjcHnGu
	eisCi6GkVjnMH5Ri/z9ijcxAxe9oTfmLQMKA8sVRHDpltJadinJ2/tgq8h5r6n+CnRCD
	e6biWJM9dnj1o9kkqduiyxSZA3vTMspmBG5yaednlCP+yPtHCbjgVv2kw7KU49xELdXL
	UJKdDnGE14ltUEFUUg3S44SNcJdAs22LD/eRrvspVF+caTsZp8OdajWmLUxZN1ksa81Z
	L6xw==
X-Gm-Message-State: AHYfb5iugidH6gfs8GjYUWCCgu9iDesX0s/wo4fdKADEazPC5wA2dcdD
	19Asu/DHN26nf7MlvBeUeX8U5o8w4g==
X-Received: by 10.223.150.201 with SMTP id u67mr517416wrb.67.1503454766444;
	Tue, 22 Aug 2017 19:19:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Tue, 22 Aug 2017 19:19:25 -0700 (PDT)
In-Reply-To: <1503315814-27663-1-git-send-email-liu.ming50@gmail.com>
References: <1503315814-27663-1-git-send-email-liu.ming50@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 22 Aug 2017 19:19:25 -0700
Message-ID: <CAJ86T=UGT-LDa_EgR_uBqA0jD8ide90ceJv+qk3Ck1v2cBjgbw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: trim duplicated whitespaces from BUILDCFG_VARS
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
X-List-Received-Date: Wed, 23 Aug 2017 02:19:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 4:43 AM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> To give a example:
> Before the change, in our build console, TUNE_FEATURES looks like:
> ...
> TUNE_FEATURES     = "arm armv7a vfp  neon        cortexa8"
> ...
>
> After the change:
> ...
> TUNE_FEATURES     = "arm armv7a vfp neon cortexa8"
> ...
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/classes/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 8c86977..07734ac 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -206,7 +206,7 @@ def buildcfg_vars(d):
>      for var in statusvars:
>          value = d.getVar(var)
>          if value is not None:
> -            yield '%-17s = "%s"' % (var, value)
> +            yield '%-17s = "%s"' % (var, " ".join(value.split()))

This fix has been rejected once already:

  http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129358.html

The preferred alternative was to remove all duplicated whitespace in
the BUILDCFG_VARS variables:

  http://git.openembedded.org/openembedded-core/commit/?id=5610c6397ee098dd998b7417b343494de77179f9
  http://git.openembedded.org/openembedded-core/commit/?id=971e43270173afb08f21ffac16a4157f7e611b81

>  def buildcfg_neededvars(d):
>      needed_vars = oe.data.typed_value("BUILDCFG_NEEDEDVARS", d)
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

