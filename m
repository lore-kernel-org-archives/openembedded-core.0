Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2EA60589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 21:11:32 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id f6so64628835ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zAOjIEzOMQhB65CXgEUyYsVVwpJ366sNImvFpxTo6NU=;
	b=yLagqjdECgDTF9ms/UW/1cgD6jzVooQZmcu3mf13S5zkcovVMjSOlxWahT7rCCTCWV
	RFsqob2eMB6ukIWJ5wOuT4ZkeO4S3ojetfYx+KZpXBTENFWJcIUROvBihhL2krOBkGcU
	AvkO9N7ZkgTmq/ozPSmOnuM5IHdRUCt+2xgFbaoyEDrWzgXNKRuUgvuCXdyPqw09PgzL
	HWDTc9bS7Kx6ngY35rnGgGDtx+9UJryjvzRH9o2FL9u+kERNSouWnv5yzTB704yuBRRa
	ux1k+vS+E+sXiEHbk3fZ7BIF05maybOnCJY2xRD0ZYSkJB1ggyKpj6CScsRRHaL0tJy/
	HR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zAOjIEzOMQhB65CXgEUyYsVVwpJ366sNImvFpxTo6NU=;
	b=kXi+zD5iHa/pY3ntpnKbVUN/SRxUHs+eIhARj1NOR60Rem4qg9daL8d1LcV/mIWbJA
	uSZ37p/vCb3CLDQUyvNa933+7J6p/5u68QPKvyKmakiMjhrZuxtj23t1SSfC5kmK9z2F
	v9klLxBZSWajVvVYBW0EsvPBRb2U36pXU8bJ9u/s+szleKZmiBGFvT8OpE7s/7Tn4IpY
	QE4yyrfJgG5LLtIYtwH/e5U85xn0iuBDunFbuThSMAkt6VojVJ1DfEVbERUvNnix5nPD
	/F3MmQfFjzFTyyXYffWl/VN+YtwLvTUii+uXWaPCoH3x6jhviMYBHIy/qgqLH1k86cnL
	qgbg==
X-Gm-Message-State: ALyK8tKsSsNCR7vcll+2HyqcoxJPgscLHtvfbiXlBb0ElfxO9XqdIouj1FsaGgS8muMpZU64Lx51B64G1NE0vGfr
X-Received: by 10.36.120.74 with SMTP id p71mr12760099itc.22.1468271492998;
	Mon, 11 Jul 2016 14:11:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 11 Jul 2016 14:11:13 -0700 (PDT)
In-Reply-To: <CACS+7ZTMT_k1KqhxiwG82EtP-bK0iQ2Saw-vFwTN-=tSoeiYEA@mail.gmail.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
	<fda7b83b51d93891bfe9c602f9c69cdee7a084d3.1467855356.git.liezhi.yang@windriver.com>
	<CACS+7ZTMT_k1KqhxiwG82EtP-bK0iQ2Saw-vFwTN-=tSoeiYEA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jul 2016 22:11:13 +0100
Message-ID: <CAJTo0LYb1BVYYq-grRyue1OGDkuB6tqyftH2VeLHN-oBrfT_-g@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] git: 2.8.4 -> 2.9.0
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
X-List-Received-Date: Mon, 11 Jul 2016 21:11:34 -0000
Content-Type: multipart/alternative; boundary=001a114aa394c6559905376298f7

--001a114aa394c6559905376298f7
Content-Type: text/plain; charset=UTF-8

On 7 July 2016 at 14:14, Dan McGregor <danismostlikely@gmail.com> wrote:

> I have no real objection to this.. in fact I've done it locally. But I do
> think we should wait for 2.9.1. It should be released soon hopefully.
>
2.9.1 was just released, fwiw.  2.9.0 is in my staging branch so will be in
master this week (fingers crossed) unless someone beats me with a tested
2.9.1.

Ross

--001a114aa394c6559905376298f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2016 at 14:14, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"mail=
to:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr">I hav=
e no real objection to this.. in fact I&#39;ve done it locally. But I do th=
ink we should wait for 2.9.1. It should be released soon hopefully.</p><div=
 class=3D"HOEnZb"></div></blockquote></div>2.9.1 was just released, fwiw. =
=C2=A02.9.0 is in my staging branch so will be in master this week (fingers=
 crossed) unless someone beats me with a tested 2.9.1.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114aa394c6559905376298f7--
