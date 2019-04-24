Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E4FD7D672
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 19:02:53 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id m10so17165420otp.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0q48vkO0YuxzqUHqiNModK7jDXF4nPiHknBYGrILSRo=;
	b=Rph7qqYN1Ngw255/p1nPShTdpRn7LK+QSAMOXuh2SPAkfuDbOaCV+wy5Jdlk6qvtKl
	SkDG3bD9tPAmevAumLNsEcFEnaiVWVkcFWAKVGINjdjSgAwXMuoGTiQSQGJUGY+lKmPv
	C7xpQE6RopYAwDT2N4RIXRk7qxWE7OAdopWzNOyeS9QRzE7Cd6mOWBZVuSfGhM9wH77W
	ukxmxogFKPKYcKElX1y62IVMi/i912R7pYvpRpeNSUGeOf8v88DPAIMJ2BmwcDxMZa9m
	jiIJjxEtw7ndsD1fH219RjQpgOXiiJc4c0IQ5eMf6Vn9WfHLaxTOq3cClpue8G7GbiVh
	Vc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0q48vkO0YuxzqUHqiNModK7jDXF4nPiHknBYGrILSRo=;
	b=QM+33PYEVcTpElkM1fARVQfd5upeG46WM1CKM9BMVZPG4qDYi//UhpuG9f55BCeTAx
	LcxfVm4pWVd54DLHawsYZsEAHYkk4YrEmF9ING5KdXzenkh4EePrTN44E3/5W0ThEo76
	fesiulR9K7Eh2UbT83NpsTZSRJhXqaFg52iNsXmWPIHEp+fGS7RVB6BQyXbxWM2ESRFa
	9Dx7me4bODyRPF5CVldNXqQl0z0Yu9JfEoPTsUu+zLTXVYtx+hiwWu3OIjiIMBn/C1Jy
	Wnuo8r8E6mrLJMfVDMgmTE71YMvCbByCH9tjHjTgiSH5HapO7+Lx2OZEWkl3QnNUn8iR
	Lubg==
X-Gm-Message-State: APjAAAV7HRkcO8ZPNxcq34TH0IkcvmyjiaqpKlWwU37830BgSKcNwXkm
	TGDb0Yu1CS2xtA12x0WlcVd28mf5BIz8oBbHpCswnA==
X-Google-Smtp-Source: APXvYqxoJG3jDW8hEZ+t086wKKeHcqFmT5X/d8py8E/Ou7V5+qFkfNoX4P+gob8utEg1CVmT9MeIlrqwl72Lq1azS9g=
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr104314oto.293.1556132574482; 
	Wed, 24 Apr 2019 12:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190424184711.19015-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190424184711.19015-1-open.source@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2019 21:02:43 +0200
Message-ID: <CANNYZj80U3T9YqSm9OduV2zFzjygWb53m8M64uGFynsgh1K2dg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-pycairo: update to 1.18.1
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
X-List-Received-Date: Wed, 24 Apr 2019 19:02:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Apr 2019 at 20:47, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
> -FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
> +
> +FILES_${PN} += " \
> +    ${datadir}/include/pycairo/py3cairo.h \
> +    ${datadir}/lib/pkgconfig/py3cairo.pc \
> +"

This isn't right (and packaging the header installed into a wrong
location wasn't right either). I sent a different patch that addresses
this a bit earlier, together with the rest of python-* updates that
are now in master-next - apologies for the duplicate effort :)

Alex

