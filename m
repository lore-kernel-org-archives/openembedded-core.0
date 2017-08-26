Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 29B06784A1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 00:17:27 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id a7so1742382pgn.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 17:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iOrpMYE0E5mzIxoazcRUoOD9/48bm3lWdwGlqXhBlCE=;
	b=O2DDCv0quv0exCQ4mdDCpPPK9Aqly7aw9kuzY61dQArE7Ed286b5gQadoQu4MmimbO
	8+c60uM2793GQTS+qOtu5sC02RXnpt7Ah7C01WkY/bf8DlNM8iah0tlzKX6mys5mJ6uL
	x2cyKrHIC5V2Ik6y6E6X5tnchjorqLyu1XGFRzaWz5KWVfUiP/l3B9kO/JL2Panl5rw5
	VyyJI/Lux6sMOttgGn3wVoeqAmem1wa/kfxtsbXgPEv5g3F+ofY3yYgx3tA064FBnB/B
	QJ65bjPG+sUbpyrYFE+3wZp4gPozVn7rQysk7C2+Rle0BInL3OyjSuBHWfn4jYFTp3bI
	f6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iOrpMYE0E5mzIxoazcRUoOD9/48bm3lWdwGlqXhBlCE=;
	b=MvIkkW1GaQwsjSE1tSNWZxWkBsXT8b6z4ZNxPLgDjQ+kpOH4Dm/Dm3oz/tlDRa01yp
	xkjUxUHKPZ8FW5LQf+Gjk2966LVgrUiOYJRMzYaQ1yZ7T/lJXHltODqnAv86QjkfFYwp
	uinCsSG6+qIhIjb88xhpSZ2oQg8GpqdF6zUwlGepqRm6R1Qik4ZrakRB6Qu154vOfOLm
	VUmz7uke+mDJPattQYx54e9oQbnsk4kzDIAbiLmGTfHfniA2iho5al4GL2XMNsYTZble
	/clnNB3oIvoRCc1+CK7+i5+7VsqHlStem5IRjvuKClrzAmky0bK6SlJfO1Dwlay1pcPj
	6+kg==
X-Gm-Message-State: AHYfb5ipfthUEEpW8e/oGM304DJ5PDao4hVogGbT/ewv2nhvXNlPcs/M
	99H0TCTQYaxLdqzWqgKRa1cGBfqkdQ==
X-Received: by 10.99.179.12 with SMTP id i12mr189498pgf.329.1503706648639;
	Fri, 25 Aug 2017 17:17:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 25 Aug 2017 17:16:58 -0700 (PDT)
In-Reply-To: <CAJ86T=Xrtt5xn+DKO1=aC76cWDgMmpqmXbaArSjemU2rC14-dA@mail.gmail.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
	<17938e56-c1d0-5316-0263-b954006f9015@ge.com>
	<CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
	<1a320d13-7d4a-7412-5377-e64a728afdfc@windriver.com>
	<CA+chaQcvg_rktq4iOazbzJzWGa6m6EdDA=RM-x8yg=4_aMtqyg@mail.gmail.com>
	<CAMKF1sos=AR9916RZgoDMjNYTrOyo8uka6cKfPB2wLujjg3n5Q@mail.gmail.com>
	<CAJ86T=Xrtt5xn+DKO1=aC76cWDgMmpqmXbaArSjemU2rC14-dA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Aug 2017 17:16:58 -0700
Message-ID: <CAMKF1srnsbiCdnoF1tUM8-c-dKGTnv7nsqShKaO_Vqr9Sm0FZg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Sat, 26 Aug 2017 00:17:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2017 at 4:37 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Aug 25, 2017 at 3:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> OE-core minimal kernel has been bumped to 4.4
>> so at this point I think its fine to remove it since there
>> is no reliable way for OE-Core to test out validity of
>> this patch
>
> If that's the official policy then let's bump OLDEST_KERNEL and make
> the point clear to everyone.

its not official policy. However we do try to minimise patches we
carry as much as we can moreover I was thinking from testability point
of view, we don't know what harm it can cause when you dont need this
patch. More clarity on that is desirable.

