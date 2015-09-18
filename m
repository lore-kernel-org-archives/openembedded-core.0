Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2D08473D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:41:31 +0000 (UTC)
Received: by iofb144 with SMTP id b144so64341314iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=DAbgkLWrVQH5KERFi5kr9q236+p7XhdOvEyZmcQ5Uoo=;
	b=YMni5Zoir3YLivMMRIkCI7GA2eWXrlzC/JnC3SiPXl4Fb/qmmwnpYnmE9r6B9ZXiM/
	rCagsDixOOe8bsdxwfLxRdvM/zCoNjWfVu91GhGwZPuJSl0njp9CwtK3PONfNmzH85mV
	tB7oA7yIhk3ckFa/5gTzQTzUqsnbot7Y7kp6dCzfD6ovVr1uJmGoxFiGVOxXhvMg5IJ/
	htubjwHrtCwtZ7s5ghXdEmTk++Jbh3A2OhJZ/3fS+uinkJxn54lXEDY7FLEX6dRAfABv
	XVN48opKH9bVbFmulAOMwJC5AwD2fibqfymOtbtQpJul6o1U0KkpRJso0diAt5mhujVI
	0+xQ==
X-Gm-Message-State: ALoCoQn0w33lcjtizbQFnA7cTu9MDAAO+nK5E+imNGD8WVf/2HXW72W6QNRRgRtI3SJbTpuG6/O7
X-Received: by 10.107.31.135 with SMTP id f129mr17768018iof.8.1442598091924;
	Fri, 18 Sep 2015 10:41:31 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174]) by smtp.gmail.com with ESMTPSA id
	n14sm4135504ioi.15.2015.09.18.10.41.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 10:41:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofh134 with SMTP id h134so64096289iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:41:30 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.134 with SMTP id n6mr14988818ioi.192.1442598090466; 
	Fri, 18 Sep 2015 10:41:30 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 18 Sep 2015 10:41:30 -0700 (PDT)
In-Reply-To: <3f8882bbacb0c9567aabd7d65d2cb859411c85a3.1442576806.git.patrick.ohly@intel.com>
References: <cover.1442576806.git.patrick.ohly@intel.com>
	<3f8882bbacb0c9567aabd7d65d2cb859411c85a3.1442576806.git.patrick.ohly@intel.com>
Date: Fri, 18 Sep 2015 14:41:30 -0300
Message-ID: <CAP9ODKqCNZMcPteyEFzcPBPxVtPYPz3-=65_rsJSf5bRLERJNg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] initramfs-framework: fix "support dropping into shell on failure"
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
X-List-Received-Date: Fri, 18 Sep 2015 17:41:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 8:49 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> Due to a missing $ before the variable name, all fatal errors ended up
> invoking a shell, instead of only doing that when init_fatal_sh is set
> as boot parameter.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

