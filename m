Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2856A74604
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 11:27:51 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id f63-v6so8038195oic.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 04:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=DAVKZJVdjwh9EWu9X7NYfgNKlMkDWNNOBdXyQJvykhk=;
	b=EC/mUmBsjmWSAg6TTxTutPYvrg5Pjxe+ixKGifCVJiNfYm9wApTR6t7FAPqwxmnr0P
	/zmehQwlG14djcPO6xDUaUo/a3hk4kKcIj9NEIOdnaH0jnw7U9elXhW0mgAwQEdMbIPI
	wIQhopfN7QJpI/GRuiD2jcvKlFWHnUr1Q0wxGeR7bKCA1c/LvTCB0q7OhqkNMQ2CmknM
	upjm1ra6ui2AFcEcwyojYUESxk5j+2PngYzG4ZV6h9iZFDBQGc4ewwC3VqJEVw6XMZ/a
	2arRCozS9GcwEPRHD998JeG3MVPk8GRxUUD1BV4dwwzSYublruc3L4SBNCcGYCg1WRw1
	DCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=DAVKZJVdjwh9EWu9X7NYfgNKlMkDWNNOBdXyQJvykhk=;
	b=FkkeZaOnN95+bVPr4liyrrzvgHt7/YtVge8ywf14ppWQ90TJteMW1hoIH1vxzhjg/q
	BnYzBxEhwHXnYnb0ZSp3BuHi0qc1uHCDjDb3qT/tcEiF/QcvpRNharnw9A17ZaXoZ8HS
	7Jk+y1oxnHiCjQxx2jIVv8m5xK49O8lih0IMEqyPcQ2A5V5lXiOtyxr6StxPIi8758mT
	rmnD6YtKQuVQh+z4AoNo4nOu9dYnt2IEtdxIPrsN7+JfRfthlu7/4MzZ90RMEmvE5F87
	fb/+1+Sh9XSGoo2oIPnwirs5xzQsjEZHYHF5QKUsxiJ2380SUOZDea2BGOUSdSFwU8g4
	JcOQ==
X-Gm-Message-State: ALQs6tDLEUdTCzRwBf4oc5PRP/3suiFxwxnguAQ6fJKnRiqvXpMj4FQy
	jS5fUO2vMegXRWy3lK5rkKFNn+Z5
X-Google-Smtp-Source: AIpwx4+gMTGzGyNn9zh+yfTvWvVL9a+DCvmOjN0eN46laWBbFOQrAvnPURVOe69DJpVGwY9HJ0hp6A==
X-Received: by 2002:aca:d09:: with SMTP id 9-v6mr8444712oin.170.1523618872548; 
	Fri, 13 Apr 2018 04:27:52 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	k188-v6sm3363700oia.38.2018.04.13.04.27.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Apr 2018 04:27:51 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id f63-v6so8038094oic.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 04:27:51 -0700 (PDT)
X-Received: by 2002:aca:c457:: with SMTP id
	u84-v6mr7720456oif.288.1523618870802; 
	Fri, 13 Apr 2018 04:27:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3fe1:0:0:0:0:0 with HTTP; Fri, 13 Apr 2018 04:27:49
	-0700 (PDT)
In-Reply-To: <1523611622.23422.42.camel@collabora.co.uk>
References: <1511810927-22695-1-git-send-email-martyn.welch@collabora.co.uk>
	<1523611622.23422.42.camel@collabora.co.uk>
Date: Fri, 13 Apr 2018 08:27:49 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpgxRRiwOSoao6Rt7wUdDG9PuEoOi_uC3FSTcJm_-HkNQ@mail.gmail.com>
Message-ID: <CAP9ODKpgxRRiwOSoao6Rt7wUdDG9PuEoOi_uC3FSTcJm_-HkNQ@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 1/2] image.bbclass: add prohibited-paths QA test
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
X-List-Received-Date: Fri, 13 Apr 2018 11:27:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 13, 2018 at 6:27 AM, Fabien Lahoudere
<fabien.lahoudere@collabora.co.uk> wrote:
> This patch doesn't seem to be applied.
> Is there additional comments or something blocking?

I see no reason for it not being applied.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

