Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D2F1F74A13
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 08:47:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id j192-v6so6864954wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tNieNeGa4ElL90Z6SowPqSxGZlKS21EOFLLLIX5OjMQ=;
	b=WHfcbc3D9Onfoa3rIYJZgq8NRZForYLNfL7/D/lK+01SJft+3s5HXOk+L8fMn6kgs7
	dpEaNaISOhPC0pgA+0tAKgxGvZwRWcE/qWxgsmcfOu+EvujTbo3l+zEANN2M8mj8T2zY
	YfBFJMjWTwlDBKk+GpRHBsBDHUUOp8o+YtnKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tNieNeGa4ElL90Z6SowPqSxGZlKS21EOFLLLIX5OjMQ=;
	b=lAUcoptzUkWFzHjW3d9kzlSZ6VTEd4rSGQ2wFHezJWM3WDz9OMzMUBE3L/PkT5OxFB
	pypj88fwK3ALHQRjNnCLf5VgqHLX/sQ0MVzL1x+CN75bIYjaP30ZCa3DAsswp3r0RD3A
	xkWzJDxLllTpKHTSeVkonvzaPH/z+FuvMbdc+QOIVki9ctuVEj8KJAoeYsOKrVH+xvWV
	RD/BhJXah8p/yK9vbT5SOna+7Qws1i1WB4MpankhUdPnQwZLM0CSZTPnziqvybixwMt0
	JUsdHWrRL1TJX7fbQ9gybltAfteuFA2Ua6fuefaTfxLzxCIikeb3sB2X8UggzTrOrCQD
	9fTA==
X-Gm-Message-State: APzg51DFd/F9oRJFmO65sUrjEZSIZHWIwv6JFlKwSek6Gz5Lrvdxd/Jr
	POny3ZtQnN8KGLUvodw01VEjMA==
X-Google-Smtp-Source: ANB0VdZQX37z17HUBkx3ngOUBYPd7nToHZNkt5fN2KcN5RV/Cgb9ThqKcnImy5u8o2RUgxx7tvDfjw==
X-Received: by 2002:a1c:c64c:: with SMTP id
	w73-v6mr4797289wmf.98.1536137275554; 
	Wed, 05 Sep 2018 01:47:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b189-v6sm1741427wmd.39.2018.09.05.01.47.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Sep 2018 01:47:54 -0700 (PDT)
Message-ID: <31af238ebb7cd5b1be0188a4d705ba93db8a490a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 05 Sep 2018 09:47:53 +0100
In-Reply-To: <CAJ86T=V1rPqM8EYT+y-U2gt0znODtNZ7enaGM5TVBMnPmefgVw@mail.gmail.com>
References: <20180904155000.3715-1-ross.burton@intel.com>
	<CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
	<23275ba8a359cdc7edd4f0f85bcecda99bd60aaf.camel@linuxfoundation.org>
	<CAJ86T=V1rPqM8EYT+y-U2gt0znODtNZ7enaGM5TVBMnPmefgVw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] os-release: fix to install in the expected location
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
X-List-Received-Date: Wed, 05 Sep 2018 08:47:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-04 at 19:04 -0700, Andre McCurdy wrote:
> On Tue, Sep 4, 2018 at 3:36 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2018-09-04 at 13:19 -0700, Andre McCurdy wrote:
> > > On Tue, Sep 4, 2018 at 8:50 AM, Ross Burton <ross.burton@intel.co
> > > m>
> > > wrote:
> > > This probably needs an "rm -f ${D}${sysconfdir}/os-release" too
> > > to
> > > prevent problems if install is run twice as lnr doesn't handle
> > > the
> > > case where the target already exists.
> > 
> > Doesn't do_install clean out ${D} each time it reruns though?
> 
> Yes, it does. Sometimes it's useful to rerun the run.do_install
> script
> manually though.

We don't support that, I think its reasonable to assume that ${D} is
empty at the start of do_install. To do otherwise would mean changing a
lot of do_install functions for very little gain IMO.

Cheers,

Richard

