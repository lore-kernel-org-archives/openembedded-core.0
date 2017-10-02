Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0C67309A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 14:19:16 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id w9so3742994ywi.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=2GVgPk+DPe+IEGVcgSopKJ6YA12UnlvqH/t9jWxe6H4=;
	b=leZvObxCz0gF1HiCJBC20CHvGIP4cipdnyDiaXMpjgv5VQniFcVKB2MMEBuPVgPs8i
	oKS3kNRiGWk6ahIWAU0LH7TVyZRZfc8BGlJisWSE61KMAKz46sQiJ8X2P7i/eVse9dL/
	vgYDuB8UQSlEExoTTH4fyqoVK/rmOEerGV3wa0zjNZ979w8c952/lkRspkTfG4fEsrmE
	z7pBtjdKBZDDGfkT93rWZT0igXSNuvBILxx1yVyoaxnSy39ClFo4lTniID6LBJL1Lrpp
	A2oTx1GoYc2mhOL9OrjClucvrsRzfhr/1ocFcO+hiQV4rR/vNNb7RukIWOxTmnVbEhtj
	9vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=2GVgPk+DPe+IEGVcgSopKJ6YA12UnlvqH/t9jWxe6H4=;
	b=JD7ajtaEp5S6lYxYuNusnlb08t4Fk+oePSxATZJt5zeUfki6QU9y/IiFHL+0mN+B/p
	LrAyoqYyZ+oe6KAfiQKvqZZMwUurCCKTge9PLFUZoDwvj2gH1GzSB794tJF1N1Ch1Kre
	SzVtVMnjZ4b6C7VeChvb+9eAOfR08RZ5Z8vsmQRSPlt0lHn3ZDO9RP6ETK2rT37DNdsI
	WeOTmV8bTvoWjnpeTla54Zkgnjstr7ic3xpRkA0qZ+VJrTPlmU1YixUOA6vUC6ZXVsKN
	MMatGqZk+OueSX/rp/z0p+DtHqXVjwNkF4JuiVjjNjEYZvjctoPTArelho3AvO+MjfH6
	GWVQ==
X-Gm-Message-State: AHPjjUiPFJOEDM8NRWH5fOLT08JaNhOvSPhj3zZxFmaIn87gw6GEzr9u
	z2/p+ga2EHkhAb1QeepC6uaQQbjh
X-Received: by 10.37.91.69 with SMTP id p66mr12746492ybb.423.1506953957073;
	Mon, 02 Oct 2017 07:19:17 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	p202sm2654536ywe.17.2017.10.02.07.19.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 07:19:16 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id y64so9233168oia.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 07:19:15 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC9puivow+GEU1e5wJ5VrR/uJTcdzoZiMytYMWaXZKoLw7SrYaxMnzaXsntxHNEouxslN98E5+Xn24MOkBpUu4=
X-Received: by 10.157.21.54 with SMTP id u51mr3262563otf.215.1506953955416;
	Mon, 02 Oct 2017 07:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 2 Oct 2017 07:19:14 -0700 (PDT)
In-Reply-To: <bf43435d-1ad3-9be1-bb3f-9009a11a0767@linux.intel.com>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
	<d270479c-2e98-0211-1cc0-b7775a318d1b@linux.intel.com>
	<CAP9ODKopd3YGyd7wfz-Xyc+QDEJSJX3yeCwY7ced+aFAY4+Lgg@mail.gmail.com>
	<2adc6b6c-9538-bede-9235-b3642b0d5ccc@linux.intel.com>
	<CAP9ODKrjgs211OR+P3CBMbL9HhD1RK-bks7jky12NuqD49qmSA@mail.gmail.com>
	<bf43435d-1ad3-9be1-bb3f-9009a11a0767@linux.intel.com>
Date: Mon, 2 Oct 2017 11:19:14 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqJCeLM3EJgeW8CHo2ZGGpSOAoeaeVA1VFgqD7Apy9Hfw@mail.gmail.com>
Message-ID: <CAP9ODKqJCeLM3EJgeW8CHo2ZGGpSOAoeaeVA1VFgqD7Apy9Hfw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lib/oe/package_manager.py (rpm): Signature check is enabled by default
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
X-List-Received-Date: Mon, 02 Oct 2017 14:19:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 2, 2017 at 10:56 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/02/2017 04:09 PM, Otavio Salvador wrote:
>
>> I assure you I did test both patches. I leave as an exercise to you to
>> show me what it breaks.
>>
>> Also, keeping "exercises" for contributors is not something which
>> helps to gather more contributions. It solved the dnf install
>> requirement for my test and seems to be the right thing to do. I may
>> be missing something but please point it or give me a case test.
>
>
> The first patch is removing the addition of 'repo_gpgcheck=1' option to dnf
> config gile when repo feed signing/verification is enabled. Dnf does not
> enable that feature by default, and so the option must be present in dnf
> config file when repo feed signature verification is in use.
>
> The second patch adds 'gpgcheck=0' when repo feed signing is disabled, which
> will also disable package verification at runtime, ignoring the altogether
> different build setting controlling that. As I've already explained to you,
> package signing and feed signing are two different things, with their own
> sets of options.
>
> Test case 1:
>
> - enable feed signing, check that resulting dnf.conf file has feed
> verification (repo_gpgcheck option) enabled
>
> Test case 2:
>
> - enable package signing, disable package feed signing, check that the
> resulting dnf.conf file has package verification enabled.
>
> Both test cases will fail with your patches.

I sent a v2 making it clear it disabled package signature check. It
works for my test case. I dropped the repo_gpgcheck removal patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

