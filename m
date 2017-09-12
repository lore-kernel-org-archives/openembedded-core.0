Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFFC784FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 22:58:54 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id r85so31402495ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=zYcdL4NGI1DpRtbgBd9XvkXvg4ijwui73i0Ld2mDLlk=;
	b=g8uvR6IMpQ3O3C11/y2QEfm7YrOYzCPw2+BbLBRs/O/6WPVXiHpdtZkh5DbAhnjp1p
	PJBOuhHiN6VJrVJyGCs4402Q8/keeJuKPNnLcW0TF5eokUfELfahKBedv6GqRpfFnSj6
	Pi6nguDoThJ/ZNA4bsbqdiZt7A/y3iHQ5/8k6S7VzE3VOduJrT0SaCU+HuygqCYUbTFE
	F/9MV/EvJP2KSW2V0aVXaa1sJmwOY5rkVYu6j6vRp42+FawKMomQNp/JTi7shkb/tr+M
	dlxHIdWnbP99dA6QgDbQlCpFPH8kiu1IlNfumXrWxvJaLBNcPUepy/scZyqfqvoGcl2J
	U68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=zYcdL4NGI1DpRtbgBd9XvkXvg4ijwui73i0Ld2mDLlk=;
	b=HRZQcn0uX9ltCJkA9xCoePNUnzCGrarS78TyHTK+t4RgA4KfQYrFX3CXRIWSa/OAFI
	znOVUxQCDTZWoXOUldkhaTjmfMlzanvzLDFzD/dWlQwfpkJ6XjvSv0xpgFqL+q/FpMgG
	mMIcz0ILaQDd1Jwdlrd+xb795Bwb5Nbsue6FrdjLI64xnlTB3ePqtnbEkYZqAMjkSpeS
	vtD2SiKcyrybvBXGzDq7XnN9bmJVcMzyLLFiQxcAEbIb8vqeaQZUIpR83HBBqUqmZM8K
	ffbf9OIbXkec9/pEExs/RedF47Imdm1ZuEsDHO2fseZpra3u1/qBuFx0Fu6g7w2YYdcd
	j/1A==
X-Gm-Message-State: AHPjjUhhj+NnxacubQCeknpoGGXJnO1wSmS3Q5qNdvP0jDUb/hNyPwKR
	AW5UIbHOPCm8hKpFUtg=
X-Received: by 10.129.109.151 with SMTP id i145mr13648142ywc.64.1505257136063; 
	Tue, 12 Sep 2017 15:58:56 -0700 (PDT)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	q131sm4282247ywq.8.2017.09.12.15.58.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 15:58:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id l74so32323872oih.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:58:54 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCFEDunLGQ9BS88VoZFdo3xSB5WQGBqtIRVCk1OhFm/x5wXz87sO8gV4x8rENFrfbT5Pa47V840DzOrlNrERzQ=
X-Received: by 10.202.199.129 with SMTP id x123mr6742242oif.67.1505257133931; 
	Tue, 12 Sep 2017 15:58:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 12 Sep 2017 15:58:53 -0700 (PDT)
In-Reply-To: <CAHUNapQqFe+f-yd6H6ta+M7MaMUiEyaU2PjpNQSQn7S+Ug4hYA@mail.gmail.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CA+chaQcHzfovU588PVbky_AOrmXgUrgu0qe7U+Uhe8Azh_VUVw@mail.gmail.com>
	<CAJTo0LZ_FCc-VOn9f+Z=cMPioWav+TmC4z=AXDuDe_+NHW2ywg@mail.gmail.com>
	<2482308.N8aakNJOlD@peggleto-mobl.ger.corp.intel.com>
	<CAHUNapQqFe+f-yd6H6ta+M7MaMUiEyaU2PjpNQSQn7S+Ug4hYA@mail.gmail.com>
Date: Tue, 12 Sep 2017 19:58:53 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqE0+PwHNshx9W_3oJ3VgEEHGgnXQ=YLuazCBCuS4c8DA@mail.gmail.com>
Message-ID: <CAP9ODKqE0+PwHNshx9W_3oJ3VgEEHGgnXQ=YLuazCBCuS4c8DA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Tue, 12 Sep 2017 22:58:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 7:51 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Mon, Sep 11, 2017 at 6:40 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> Is someone documenting all of this? I'm pretty sure this isn't the only one.
>
> Better still: an automated test (with comments including this
> information, so the test doesn't get removed under the assumption the
> thing it's testing is buggy)

What kind of test do you imagine?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

