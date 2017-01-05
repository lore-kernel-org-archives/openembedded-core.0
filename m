Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 61BEC60620
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 01:29:59 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id d5so31106294uag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 17:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8hDvkRWzUCWvp/vp/PWVAcbydzase9gAbd8DVbO7THw=;
	b=b2qrrpC7OgNPvX4tQFQiw5uyLcc6n+lrFrmi5ZavQzDwmLsBe+TJM7A/jS6vb3cx8L
	GZsWDQOOs65SQFG91pi4FPbTXrQoEvU2TR7vaCBwYUEaWlc8VhuqDMhWdOBs/WBXHe4X
	PS9gHuIGs8/SMKcS7eKa/82Mcc+Z2ME8np0rNJZEvFsiNqEBKVzNDlRUUIdg+uy28+TL
	QrkZKbTepqA7hpyWoa+tvqmTyvCUi/Y3GBt+pC/zZINZJF8nI+BrKI4PE81O8SGrQntT
	ii6rPr8jLwuZtsCNecA8jV9ut+cyEri70/nOkChMsYGOC5K7vlManZ+93wulqvdh1cJQ
	ICPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8hDvkRWzUCWvp/vp/PWVAcbydzase9gAbd8DVbO7THw=;
	b=sQcCaars98GFbpiHLyfHt4YPntd9GvCR/TyffAB7L1HNILYtVsvUdaG4PSe6We0+L9
	dTpCYaVLIiVI5J3Hz6UUSSQPoOeMvNiz97s254LKi1GmvcitSITflfqrLbAEqJMCdlJZ
	806fnRWojZL+aXAXjeBK7Wfs/eoBHc18rkv5eBKdR1Ks5gzthKPLW3ncE4Ktjy5KrdsJ
	TIZrYbKEcb9piK7rd7ZomPV2K6aOCRDnumNEHA0xTFXtOuSbosqItb0ROm9JM5zW7AN6
	X4G3V37/GxTLcgCSSOf5KeKZQq9dMlD2c3KtM/6wvzaQdGbPx8/nV7Wr8L3n/EJKy2AU
	1nVA==
X-Gm-Message-State: AIkVDXJuWXir1JaDGGk+pYfk088KrEbHWJmc49tbhyq6zWG3pFBrkX8hzThxjxw8JnXZ7tKm+wtWzieGpKgQgg==
X-Received: by 10.176.1.17 with SMTP id 17mr42963390uak.143.1483579799617;
	Wed, 04 Jan 2017 17:29:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 4 Jan 2017 17:29:29 -0800 (PST)
In-Reply-To: <CAJTo0Lah1nRgbaVcFokUQZEr1zbDgyACrfvxP50vo9y8dv5DBw@mail.gmail.com>
References: <1483512355-27961-1-git-send-email-moritz.fischer@ettus.com>
	<740a7531-d635-8191-d901-ffaa0deffae4@linux.intel.com>
	<CAAtXAHe=ob8N-Z6OzVPm_Fbc91Z3Ve+=K4Mubp79PJhik8a+bA@mail.gmail.com>
	<CAJTo0Lah1nRgbaVcFokUQZEr1zbDgyACrfvxP50vo9y8dv5DBw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2017 17:29:29 -0800
Message-ID: <CAMKF1spFejnAugO6tVUjRS49QA2-PNHzNmDLLFK9akQsKoGbxA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Thu, 05 Jan 2017 01:29:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2017 at 12:39 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 4 January 2017 at 20:25, Moritz Fischer <moritz.fischer@ettus.com> wrote:
>>
>> Good catch, thanks. I submitted it upstream. I'll just wait for that
>> to resubmit my v4 here, maybe by then I don't need the patch anymore
>> then.
>
>
> Is there a good rationale to put this in oe-core, instead of a BSP layer or
> meta-oe?  How widespread are boards that use this tool?

it should be in meta-oe imo

>
> Ross
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

