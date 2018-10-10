Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id ED30E79A4C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 14:29:22 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id u197-v6so4248707oif.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pDJsNPNDGSg99i+IXSW9JfLXAzDqFWYsuNt7gUCWqME=;
	b=juqXd/u+e5sNyTIkrOvNHEYAr0POF+ZT0aBE2eLNP+fbXR4GZipYP8ottU9fTzsbDQ
	ThtjQIaMKBuE0049z+Z1g34kVXpIyOZXlD+px5Q3jLU//k805Z2pKaIu3azfLLW1font
	TL4afog4CQm/kYEppnVQClvxmm0kNvSJtChH7rbwahGkjlhbN1llp6jyG4S3O7Tqb1z3
	7wClW1EeR6sjgEf/wbr97pMpAoh7pFR1JxwGvLJkf4FfC/MVuRFA8dj5sf+gfrp9fSEi
	YF8mO6MBwzAPsWCRiKZEnRJMExf0kJe1K/UVoAstukcI2ht17fQIBLgsyhK5DUcMAjBA
	vV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pDJsNPNDGSg99i+IXSW9JfLXAzDqFWYsuNt7gUCWqME=;
	b=UEJw+rZvAFNrL8qIdBj3B8wwfAgMSB/AP1jyUJZ4ksOk3+1+cqgv3YJth8n8gYyF6X
	V3SBenzgdM1kxebm+mndeRiRxFP6XjqpOdCe0QS4erte+4RVX3LHOifkvq3XuNuKh72V
	5dwXCCs8Algw34DyKdk98Vs/bysAMuGETsNdIjRYUy9BCjjWBvTFUz+sPbhc0F3Q68+M
	/tNq9IbAkkADLqJqyRgjtwl5+dmReCkIas1rIlbcCeqRVrmddAlgfv1vCtpmcDU+OZDj
	cJvU8P5jqkQCRTHgi+c0xRfTSn34WJQWhp6JnUTdAft0rWEaYwlyHpNFsgO5DtTiUS/g
	ECJA==
X-Gm-Message-State: ABuFfohuu22N6HUR8LyviaEEl4XuS2WXqoD9qxRYH8bFJplVbCcxL7hK
	VjwSlWGG2xI0nk+jXByWYYMiyuNcEtnxtjfGynE=
X-Google-Smtp-Source: ACcGV61nUJfEDf5h6aHyUc1effF30FczWGNeMSNmyeFEKtqYiE6QCYiBLD8yjncrrErNRhn04o/guGl7CRtiKiQsA/0=
X-Received: by 2002:aca:3f87:: with SMTP id
	m129-v6mr1712460oia.228.1539181763898; 
	Wed, 10 Oct 2018 07:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180927190648.27553-1-schnitzeltony@gmail.com>
	<CALbNGRQ8qkKnUz+BsPD9ReuEzYzLX4ni7cr70bFQpL3Uv0UNxg@mail.gmail.com>
	<237e6b83-e0dc-4993-6dd6-d910b95fe10d@gmail.com>
In-Reply-To: <237e6b83-e0dc-4993-6dd6-d910b95fe10d@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 10 Oct 2018 16:29:11 +0200
Message-ID: <CALbNGRT4Caac6GEp-xysoX_TpmF0jex1KviPPMyAdSjsW8kBtg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [sumo][PATCH] libsdl2: Fix left rotated display for RaspPi/VC4/GLES2
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
X-List-Received-Date: Wed, 10 Oct 2018 14:29:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 10, 2018 at 4:21 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 10/10/2018 01:57 AM, Andreas M=C3=BCller wrote:
> > On Thu, Sep 27, 2018 at 9:06 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> >> The patch should increase performance for libsdl2 on GLES2 too.
> >>
> >> (From OE-Core rev: 52f9659f2bb44affec2f67935df01f13b6ff3e02)
> >>
> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ping
> Timing is everything. it just got merge to sumo proper ( Thanks RP)
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Dsumo&id=3D3acc=
7a6e28a980cf662a7aa600d5503780c522e8
>
Thanks

Andreas

