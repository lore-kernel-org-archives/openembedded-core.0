Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5Hh6-0007JP-7T
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 16:22:53 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so4525367wib.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 07:06:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:date:from:to:message-id:in-reply-to:references:subject
	:x-mailer:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=D2fZlhiaTT4XeQt43cx3lHrX4pclOu8344XZo0A3aMI=;
	b=Of82ytVMUrL2rlrZQ0VGkgH1otPhNFj2SoC2XJXOH2y9VqP/Cg2mcEnGUMH1lAXpzg
	sQZTG+RyQuqwknxmKRn4FB83Jef98yoIAZhfK1i1aApqx6/ONYgSdXPBkDxSbVUY2DuE
	HAInqRTQy7I6NYkllXQU1diACufUKjbCeGrpCNj03dhsg3kuXFid45qPkAXczw3q0Wue
	nQBQPPCAHSACb4b8MOwQrLc3vFaDqZ44OPCs5rD8T5a+HtggN4BG+W1O0/poAymWfFq0
	UjBdE/7i97zHSuNZZbiGbZVNvJckyw1BTTIT2s3VfIZ5xIFyZdxsjbopA/2ryCUwpyb9
	opRQ==
X-Received: by 10.194.57.206 with SMTP id k14mr31632001wjq.26.1360681601747;
	Tue, 12 Feb 2013 07:06:41 -0800 (PST)
Received: from [192.168.1.11] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hb9sm37111002wib.3.2013.02.12.07.06.39
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 07:06:40 -0800 (PST)
Date: Tue, 12 Feb 2013 15:06:38 +0000
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <62239FFF613F4094A369C927D0617497@intel.com>
In-Reply-To: <20130212150107.GB5968@ad.chargestorm.se>
References: <1360657337-7154-1-git-send-email-raj.khem@gmail.com>
	<C7C45274F728429FA76E2C1C47BACCDC@intel.com>
	<20130212150107.GB5968@ad.chargestorm.se>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnCWJfQlnux9HMx6bxZUEAw+/V30KBXJkdiSqauXkJNGxkxoC+FssX5Ht3JRqRnaiNB92LJ
Subject: Re: [PATCH] systemd: Add systemd package to PACKAGE var
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 15:22:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, 12 February 2013 at 15:01, Anders Darander wrote:
> > Or is there another use-case I'm missing?
> 
> Well, there is always the possibillity that the install is split into
> multiple packages, with binaries also in some sub-packages. I can't
> recall right now if we have such packages, where the binaries in the
> sub-packages should be started by init, though.

And those sub-packages are obviously already in PACKAGES, so this isn't required again.  I'm just trying to keep the amount of magic in the class to a minimum unless it's required.

Ross 




