Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8D88874F9C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jun 2018 08:07:41 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id n3-v6so34036849ota.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Jun 2018 01:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0Ap0H//cnOX1/vdKr8GSK8OoFoEuHQReM1D0SQuLe50=;
	b=iarTa69pws+wmSpuVljGi7+XkJwra3ZoLOuKRZu+B/tsx2If1AMrsjDNF1SwuUVmdo
	Y+/pSPzan6KhvjSDlIeVOV9XW6jR4RoNm66VFN8uzIkm0Ty2+jImLlouTmGVPC0yavSO
	msRVwaFbfIYQBh1JkExQ72jXi5e5aay0YztUXtU1TfxlNLlwZgPWroIoSyFlW4iTxgMn
	MlnBAydCXF6UJ91I1NxCdptVQc0nS2k4SRRHlK1ghapMC5vWT371hAcbkKQTfRsz+Gsp
	SjitBeV+QSh4P1El5J638DivyhPwPV1cjljPfwnzpnhg757qpL3YLYdNKjfeuLqCVkgt
	ZDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0Ap0H//cnOX1/vdKr8GSK8OoFoEuHQReM1D0SQuLe50=;
	b=rbTFM0EtnYBVbF27HDQT9385IXp+/NSq223aVxhjkuMT5w9LNwgAU9r+F0hfG7ldGs
	Cwaw6i/o+luHTRVLTJrxsVgik6+P421bckEKiQ0vAsto5AIK3wv+hEdZAlbM+cPZ9Qrc
	+1igNUnqUSIWjNsv5gz9y84MOaMtWIRqV+BM6yUBLVWh4he/Y5OIcr41v49MHkWj1QUh
	/bVODe29XPO24+X/D5VzYNhJfWCldAkTUCr4MOJcQveux76SA1oCZPrVj7jWouTBvQzm
	CWSg9OkL6IFgrEX+b8Ag1lytM1v//CI2c+fU75/uDKTVL6LRMAqwzLWG/HnONiXQJ2pg
	idZg==
X-Gm-Message-State: APt69E2lTD9GlHp+nj1mTpDOI6mEleVw2Qt3E8UQAC/HFri+dXuckYdB
	sjly80nTkI0HR0ZqTiRhfvm+vinMykkFPpl5LcY=
X-Google-Smtp-Source: ADUXVKLJ8GPwW3g7GLz5H5cGceDveb7XsHS6idnpTf/eyl1lm/4AJOpkYyEZEIG+wLY3kdVuoJzUqifDPKtDYIBcBFk=
X-Received: by 2002:a9d:3010:: with SMTP id
	d16-v6mr5211240otc.23.1528013262437; 
	Sun, 03 Jun 2018 01:07:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP;
	Sun, 3 Jun 2018 01:07:41 -0700 (PDT)
In-Reply-To: <20180602225958.15177-1-dev@sashko.rv.ua>
References: <20180602225958.15177-1-dev@sashko.rv.ua>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 3 Jun 2018 11:07:41 +0300
Message-ID: <CANNYZj8_74p7hEMtFm_QPf5DVr3yyLt23XTQptT6D49rXvdD9w@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 1/2] chrpath: fix SRC_URI
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
X-List-Received-Date: Sun, 03 Jun 2018 08:07:41 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-03 1:59 GMT+03:00 Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com>:
> -SRC_URI = "https://alioth.debian.org/frs/download.php/file/3979/chrpath-0.16.tar.gz \
> +SRC_URI = "http://http.debian.net/debian/pool/main/c/chrpath/chrpath_${PV}.orig.tar.gz \


Use ${DEBIAN_MIRROR} here please, append /main/... to it. There are
examples in oe-core. Same for minicom.

Alex

