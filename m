Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB5D65D35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:45:44 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id x35so39295139qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7lqKxvD3L2nvksvbK6zOnhW8peQhvHbA+BnY+l2l8e0=;
	b=WpYrY8dGr9SsHNo/MRcHb1GQ53KugFbDbma+x9nPt7yFG0XMuovMd9QkKhhkhcvUFF
	9D4E5RheHMHTE6ei1fDCMQYhe18s80EyJF2EMM615f2e+7i+eIkd7OwHQCDgfOUFx2gV
	Etn4KvJ6I0W6l0GMCtb+43ivLCUytkn3pLJY3yHVQ8tBXZHbQm06p8ODpUJQ1ABprTpk
	WRKf1dW8EErSwJR9TRVK55VfGi/mXoYkmnoVEM/zGDg12/lkvAypR94MC3m5VGXnlWv/
	dECzBDTBNDmXKMD3O/gSNzsc/FLG+WZ/l2xDRf42k/cZgTnoABhwVkh/yZHOgOsktphY
	ELSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7lqKxvD3L2nvksvbK6zOnhW8peQhvHbA+BnY+l2l8e0=;
	b=bdCjmolT+ijY6AexaEJrVTEaEDlOHOL/u/TqQT9OG6eKi5QWsTYarr3YEngmmNtLxl
	K3VVf29VXvj6xIxbkHjOIowm6ptXD3AZmcKCl/i6Iu5qSRcTLnaKqmANx6AmkzisQUuA
	P+/CUW0zdIdsaNVJMe6nD9FWq4pPHbwy+F4j2K/xNccMlmpmm/+826K+STX/rx30Zg2F
	bWgwkR3AUGPTIjvKsrSPd+OCQhdkDF3YjxH/EXLENoE7TBRrQSccLxubtEyTslFY/Hwz
	YfoJ6SzblgdT0zbaf/uMqirKD1/P8OqXj2vkfvd/yvB401rs8C0pwuD62UuDuoxyKFf/
	k1Tw==
X-Gm-Message-State: AFeK/H2gZzkqwR1h7lN94Ra6BkU48nQ6LLCRJzHYl+ZvTgZEHcXA0zw8/Hr014ihIKwPOLnxaGXHHTTICYDLxEUc
X-Received: by 10.200.33.182 with SMTP id 51mr3438757qty.65.1489675546136;
	Thu, 16 Mar 2017 07:45:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 16 Mar 2017 07:45:25 -0700 (PDT)
In-Reply-To: <1489675211-20118-1-git-send-email-lnowak.tyco@gmail.com>
References: <1489675211-20118-1-git-send-email-lnowak.tyco@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Mar 2017 14:45:25 +0000
Message-ID: <CAJTo0Lbaa8MpHGf0=CCiirKvYzp3MAKHxu6eds9ib7czWuWRDw@mail.gmail.com>
To: Lukasz Nowak <lnowak.tyco@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: Create git recipe
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
X-List-Received-Date: Thu, 16 Mar 2017 14:45:46 -0000
Content-Type: multipart/alternative; boundary=001a113c6418c229ad054ada1d70

--001a113c6418c229ad054ada1d70
Content-Type: text/plain; charset=UTF-8

On 16 March 2017 at 14:40, Lukasz Nowak <lnowak.tyco@gmail.com> wrote:

> ConnMan has not released in 8 months. There are many improvements
> in git, which may be of use.
>
> Recipe is disabled by default with:
> DEFAULT_PREFERENCE = "-1"
>
> 1.33 backport patch is not included:
> 0003-stats-Fix-bad-file-descriptor-initialisation.patch
>

You could use the awesome new devupstream class.

Alternatively have you tried harassing upstream to make a release?

Either way, you missed M3 by a week so this is too late to for the 2.4
release, sorry.

Ross

--001a113c6418c229ad054ada1d70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 March 2017 at 14:40, Lukasz Nowak <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:lnowak.tyco@gmail.com" target=3D"_blank">lnowak.tyco@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4uq" class=3D"=
a3s aXjCH m15ad79068417b459">ConnMan has not released in 8 months. There ar=
e many improvements<br>
in git, which may be of use.<br>
<br>
Recipe is disabled by default with:<br>
DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
<br>
1.33 backport patch is not included:<br>
0003-stats-Fix-bad-file-<wbr>descriptor-initialisation.<wbr>patch</div></bl=
ockquote></div><br>You could use the awesome new devupstream class.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Alternatively=
 have you tried harassing upstream to make a release?</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Either way, you missed M3 b=
y a week so this is too late to for the 2.4 release, sorry.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113c6418c229ad054ada1d70--
