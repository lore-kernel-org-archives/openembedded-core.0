Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id B68BC71AD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 22:30:50 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id n19so12238394vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 14:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=2bam4S51WwOyDQnsc7d2e5B0DKcD1m5g9LD5Wn55B2Q=;
	b=EIXjL8G+psRMdieVDx6koDPUBNeE9ye1Mlq+e1KwKMPplXdZzD9PqFNy3aH7MrzBxz
	froGOoH5n1QFnY1Iw+3E9puUAEWLdsE32F1K0EyOiszdTgvcowK/c+NvXjeCBgkIomsl
	eaAx8IOCAukxbZG7n8a+pn9rRPONPEHtGlUW8revi1KvHqvD2mQfZtyZcXaHN4K048gl
	Iknf6R/oDu2/XRBxsI2OknLhEo4MOu6eiKO6hQHxIuY7t5BKFdc5NQQz10uAmBYeFCGh
	8Oya1bdc3+6AXKg656bQAgzlA+nfFosj5sXaMzkoXCXVGI8JKPrTAfqcRDd6En3pOSis
	G6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=2bam4S51WwOyDQnsc7d2e5B0DKcD1m5g9LD5Wn55B2Q=;
	b=UxZ+WSWkYVSKunSqwrbpdeWrf973UtqyLwhEPfwQZrXvKYZAm1kZWvfOf7yGrO14ZD
	p6pqjXwCoO5/O24r8lnXbcuUTHRl8FQTquEZQIiHF6k8DrlUYY3AiauqBdDMQfWrSdwD
	3bIm6PujMLEA+ZFOhjnZ1EyKwzKouYpzw07VFxFO+mSPq7pibCnT9ZRApzIrx07dJTdn
	offHy1W9mJ8viqYxbzaLc8fj6Fzb4ILIBLmTr+xT+W00eqD2JTYpTrZvXi0RoPvPEAmh
	M8lEaMXN0Rp/CiX6fA2xsTwlYYsEAyq4sytDebBDmfF/eZ2g3/fDyqMmWACS4hc1Ivlc
	NrFQ==
X-Gm-Message-State: AIkVDXJVmwLXwSazs0Z7stYKhTVsGlcStQQkTF66wI3coVDdFJ5R47aLi5UiYghyMPNYwkX98ODkVYpvzP4jHg==
X-Received: by 10.31.75.198 with SMTP id y189mr16342331vka.51.1484692250403;
	Tue, 17 Jan 2017 14:30:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Tue, 17 Jan 2017 14:30:49 -0800 (PST)
In-Reply-To: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483300393-10174-1-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 17 Jan 2017 23:30:49 +0100
Message-ID: <CALbNGRT+hHsE6M1iZwoMqkFTCOTd81K5PaEeH6KrqSZk=P0b9A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Tue, 17 Jan 2017 22:30:50 -0000
Content-Type: text/plain; charset=UTF-8

Ping on this series + follow up

'alsa-utils(-scripts): fix compile on build machines with
python-docutils installed'

Andreas

