Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TKkDD-0002hE-7W
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Oct 2012 08:19:39 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 06 Oct 2012 23:06:32 -0700
Received: by mail-wi0-f177.google.com with SMTP id hj13so1891199wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Oct 2012 23:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=BwvxMCrWOStQbCSx9UU2SUlqSqvwYPrpDCMi1QXFPOI=;
	b=Rnsr/GXoz6JSez1NdI8nKtUS01FGscppGNfNFyYhD2oqRd8sXSWEjpuDH1KiNi2igY
	9FF76NY+01QfcJccLTDAoCgy3bLHGufLLNCORY9x2pUbmPYjYvUDDbG42rWMDKf1E4f3
	UQpcoMENf9VmCZJ5KwHYEFeCTPFQrlnMELoPVjnr94aC8uR2Vy5D7RZwviPvAKKwlQeY
	NdBWDScw9RUWRt0+Abj5RlzBaV6XL05h6MPCvIwoh8e/CciGPFOjBft9lcx8v1gCtJqU
	SZzvlDxvtYwDqL8RSaTMvIAk2Kl3S4KkpzMeCu9YiZ8clR/zwgxjF+54srslHZfdEvPX
	XrDw==
Received: by 10.216.28.140 with SMTP id g12mr8162059wea.59.1349589991185;
	Sat, 06 Oct 2012 23:06:31 -0700 (PDT)
Received: from [192.168.1.7] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm13637858wib.3.2012.10.06.23.06.29
	(version=SSLv3 cipher=OTHER); Sat, 06 Oct 2012 23:06:30 -0700 (PDT)
Date: Sun, 7 Oct 2012 07:06:32 +0100
From: Ross Burton <ross.burton@intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <8FAFDA66FB854DE6995357C603C1BCDD@intel.com>
In-Reply-To: <0132F9D2-DCF0-4605-9120-F8CD9A2A3B6C@dominion.thruhere.net>
References: <1349318775-17939-1-git-send-email-fcooper@ti.com>
	<0132F9D2-DCF0-4605-9120-F8CD9A2A3B6C@dominion.thruhere.net>
X-Mailer: sparrow 1.6.3 (build 1172)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQn45afAlengamn35euFY/Ne/uBiiW6/QFcfYUqZEVXYrlvU3S7Ldcq1echGKW+bk14nIHq4
Cc: "Franklin S.Cooper Jr" <fcooperjr27@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [for-denzil][PATCH] gconf: Disable gtk support
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
X-List-Received-Date: Sun, 07 Oct 2012 06:19:39 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, 5 October 2012 at 07:26, Koen Kooi wrote:
> > There are only a couple of helper utilities within gconf that need gtk+ as a
> > dependency and those are unused and pretty useless. We might as well drop
> > the dependency on gtk and allow more parallel builds by reducing dependency
> > bottlenecks.
> 
> 
> 
> Except that gnome needs gconf-sanity-check, which is one of those "useless" binaries
From gnome-session:

/* This probably means gconf-sanity-check wasn't found, which
 * really shouldn't happen, but we'll just ignore it for now as
 * long as gconf seems to be working later on... */ 

It's not needed - you'll get a console warning that it can't be found and that is all.  Fixing the spawn to handle the error case where the sanity check cannot be found to not even produce that console warning would be a good upstreamable fix.

Ross


