Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9B91E7BE38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 09:57:43 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id x202so1612620oif.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L1vz98h1KnlsRIhPqjHIKbL1Uf5vOTRaZDdL/h3W194=;
	b=Ok+kM2xUVcuCYu0LOZxK/oKcMQVS46oHBYWjjd1LRGPHO/awvgMzT+Q4MlV/+kqZXQ
	QkUhgobA4iOP74Vz3XcBOTAjSgbJTO9lNa6uqgZm6a7WL9xjnda9/7Yk/oIQuf0k1oQi
	6Bh6Zcp8PeFRi74fPwwFIB59YQyq3BoZKjrpHS69cizyYnDnC2tRFSqmYy2sFQTTrkSh
	ndjXyMXvAeUF8kRLrwNwgovoOS3NMuLINpjL9Jss1IvQZU+R6/F+iMaxCtVxSQIyI3Xg
	t5RPtBJhNrxTlhI++cP02jDSDVthk25xd7QYmQ7+Cz63FzCr65jSLJNcUlLvwAAOjt+m
	ftJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L1vz98h1KnlsRIhPqjHIKbL1Uf5vOTRaZDdL/h3W194=;
	b=JmncYn00hikHMzECR3PTCoEM0leh4kPK1gdcu3k2NlnxVwfM2+WVNrrHQ7Ba4tDCaB
	C1BBFk9YXhoGyAQ/zeaga7PJ1c7ZQtvT1rlhtGUf6FVzny6/keB2v0rQhfzG3GKKbzxX
	nIpeAiWSlcG7q0MOdI4rddr2UYd9KwVDtRewtSTTS6MjUVipHv4OKs6KBh3hv6eUoBXU
	Jm8nqlBBiqafvxGXhygnvb4Oyv+DeOgBipYJ1LPnorLM03yrQrKVxTUi/D73Jt+WLSUN
	/XCR2Wz8aGBsSPTOob1OFPud+f8lwfOqu60foaxclsiAfCL+X+7JkADImDyH7bwR++vX
	j2Gw==
X-Gm-Message-State: AJcUuke39U5ca48P++S5pP/I07Z5Drzsqz1eW1vaQBZrYZ4SQWXxHSB8
	MC+bilW7Cp/neJl+/HMwPXA1ujxzHuJO3CvqTdc=
X-Google-Smtp-Source: ALg8bN60zcTmlTH/tNU6Ssb1nFAz8iQoETeRtl1Pzwat54Ap93x37y+6nmN2d9xgtXlQovz/KoVkM7L3RQzJvJ3UKoQ=
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr1596343oit.325.1547546264626;
	Tue, 15 Jan 2019 01:57:44 -0800 (PST)
MIME-Version: 1.0
References: <20190115064546.121351-1-kai.kang@windriver.com>
In-Reply-To: <20190115064546.121351-1-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jan 2019 10:57:32 +0100
Message-ID: <CANNYZj8h07cnf9k8EiDCjd+zpEnm1urJ0FALHwE9F7fATEAafQ@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps & librepo: fix buildpaths qa warnings
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
X-List-Received-Date: Tue, 15 Jan 2019 09:57:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jan 2019 at 07:46, <kai.kang@windriver.com> wrote:
> Add preprocess option '-fmacro-prefix-map' to TARGET_CPPFLAGS to fix
> buildpaths qa warnings of libcomps and librepo.

These warnings are not happening on the AB or on my local setup. Could
they be happening due to something in your local config? Can you try
with plain poky master please?

Alex

