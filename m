Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9F14C77E71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 03:45:55 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id t188so5493938pfd.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 20:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=89O0QG+IRnrx19myqAYQNsLhdpVI2SySZ4/WXITnJeA=;
	b=gtQ/D1T3cGcFy6UQ51jp/kUi/fNkTimvHZWd+pCNV4CmNKQaG8z5mP+GcHHdh33Pxf
	LpFblzlWUGj+a/YOQmIj4n2ABFZeJCoVcc0MaC4RWxMbUd+phM9AETxoKJ/xGcI0QEyH
	Ok+NdqlcT4NWpp5aQjdg8P40vceeIh9GDXIp/wQ7xKgizilKAgwy9Ur9bopj7GmRV8OW
	WZHdrfdrMRh+TgQOkXedJOzGJXPPikk3Wi25aTgj/L2tZHYpGABS/yelBcmL9CEG+T/o
	MqJ7yxQDp4E65yXHUDLO8ztZdzlTfMCBJcADmWWBKXXgSS6s++CueTThyyRWMUGcOc2J
	02uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=89O0QG+IRnrx19myqAYQNsLhdpVI2SySZ4/WXITnJeA=;
	b=qM+DeHOBuVBMQ8WFTZbKrc1mhoIUx+GZzmGCTnPw9slPDTEzSDk8II0wMT/607Zt2/
	hvgMMTI9pwekNBxekAOGvHEkmRmFLvT+vqX9HaU93i6brkv1Pm3aKYVRuTobL7A6skN6
	A/2XIQzkT2yxl8u4qQWzOv2/DKKoK/FLrQxKZKpQzSwQ1RBO04oFJMVFuhTtEg/cnmcW
	TlJslxsaMeX2LribVYZvSlDf8UfNwCpPEhwGfTRA/dKpnQsBeaIgoCMcR97lHZQ0t1tE
	IcuHT3xJr67bQf5ARPX0+w1imQIBszbPSzieoGD/4JIJzNNjhn8qypGvggIJrg5H2IdM
	4PHQ==
X-Gm-Message-State: AMCzsaWaUwYwdCLMkV8oJKpsolODvR7aqFl/DXcY6zmsgZcwsSU20y0g
	QYQ3NUBnbLMoVJuOligkJOxqpw==
X-Google-Smtp-Source: AOwi7QDYXT5E33K25nXTx6wihx/gqcStteR6NxcLvYieQK8Kw4g8++tDSppiv/0iIkI8ehCem/pEUA==
X-Received: by 10.98.163.2 with SMTP id s2mr96470pfe.242.1507866356720;
	Thu, 12 Oct 2017 20:45:56 -0700 (PDT)
Received: from apollo ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id x11sm70101pgq.29.2017.10.12.20.45.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Oct 2017 20:45:56 -0700 (PDT)
Date: Thu, 12 Oct 2017 20:45:55 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Message-ID: <20171013034555.nkyv5psnxt3abufm@apollo>
References: <20171013004147.28663-1-timothy.t.orling@linux.intel.com>
	<CAMKF1sp2ezog=9DQV4zm=-sa5b7j4n1=ueGm_qJM8+LYsT82sA@mail.gmail.com>
	<B3D4FF69-495F-4E02-9121-70F4ECDCE920@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <B3D4FF69-495F-4E02-9121-70F4ECDCE920@linux.intel.com>
User-Agent: NeoMutt/20170912 (1.9.0)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] powertop: update to v2.9
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
X-List-Received-Date: Fri, 13 Oct 2017 03:45:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 13, 2017 at 03:15:48AM +0000, Tim Orling wrote:
> Also tested on qemuarm core-image-full-cmdline with TCLIBC = “musl” :)

OK then

> 
> Thank you for the additional check.
> 
> > On Oct 12, 2017, at 7:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > TCLIBC = "musl"
> 

