Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA3C37EBDA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 15:57:31 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id h19so5600910wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 08:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=oMuOCmQq2dIVpjGZMVSa1+DpUJC02x245vmbT7jv5TM=;
	b=NM4mw51azd3Ch/kaadzgANiK19SK2X73E6rLPi/RRcVAoiO5zXoPWXdOsDCTRCix65
	ZRj0LvmnQrY0snYixIQZ3aLCHurESgDiaq6asKruBEpESnPzTFswF63DJuj+kwvF8CpB
	EupNRN01MMovkUTLv3SXLVIaOyf2gkzAzqHGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=oMuOCmQq2dIVpjGZMVSa1+DpUJC02x245vmbT7jv5TM=;
	b=JEeuq/rAZmjmkK1/lIP8TqQ4z9cmLufY8ZSjxCiEmrxmoWt77el5z6Wvb/QhYTrBjz
	0nQzAbEm9a+eh1XMyu4mOIxy7rPqP7RyUodcGIfAImuk0kgkQbMR2lYlzrCJcTCuiIBF
	6uu6mUoSb6sBxRB/Vj+P9/6NEDnE5SzGKsaMbK5udVYHvbchO4n3WqDvKaeHkwOu3dkW
	p7p5tWikjHlHarhnvHAjyVD95W3Vm6pHGxKdeSPTz/G8nRu1/yS11A85p0xeqHRPSu0Z
	5YLIj6yi+aDm0v7/XlxMkJNb2iS3bVfOPCVExACTNBV3Lk9lbCQnUbmvZuccmr2OzWzS
	me1w==
X-Gm-Message-State: APjAAAXFk+P7N2XH3qaRHbGfhblpqzC6jr+u2xHr1BJNwU0iK2na7lFW
	nZVEGsx/VlB7kEG/eVEAEhDt6w==
X-Google-Smtp-Source: APXvYqzwHyE3kqH9+pVn0G9WxlICumja9C9wRd2iL/G5tYNaZrbZlBqFdP+MNb8O97k9s+tmj1DvzA==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr162261wml.160.1562255852596;
	Thu, 04 Jul 2019 08:57:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t80sm7099584wmt.26.2019.07.04.08.57.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 08:57:31 -0700 (PDT)
Message-ID: <a8811c40e7aab0303c7069c5acc00823567821e6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Jul 2019 16:57:30 +0100
In-Reply-To: <20190704142709.GA3410@linux-uys3>
References: <20190703150405.GA23280@linux-uys3>
	<1008b3f46332ba67abe67586b176bc7f565b11ad.camel@linuxfoundation.org>
	<20190704142709.GA3410@linux-uys3>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: build failures due to pigz host tool
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
X-List-Received-Date: Thu, 04 Jul 2019 15:57:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-04 at 10:27 -0400, Trevor Woerner wrote:
> On Wed 2019-07-03 @ 05:10:14 PM, Richard Purdie wrote:
> > Is there any way you could try pigz 2.4 on your machine, see if the
> > problem still occurred there? If you do rebuild pigz, could you
> > apply
> > the debug patch in master-next?
> 
> I've updated the pigz in the $PATH jenkins sees to pigz-2.4.
> 
> However, my builds are always updated automatically and always build
> from master; there's no way to insert ad-hoc patches into a build.

That is fine, even just the PATH adjustment will be interesting to see
the results with, thanks!

Was that version of pigz patched? FWIW I've patched the one on our
opensuse151 worker so we'll see if that helps shed any light on things.

Cheers,

Richard


