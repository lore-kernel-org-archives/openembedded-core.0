Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SjlUI-00035T-2L
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:12:26 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 26 Jun 2012 23:01:13 -0700
Received: by wibhm11 with SMTP id hm11so3957297wib.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=bXQKx+FYUOEKGxeOMV/YKyDbjP58bF5vu9ryPyTrkyk=;
	b=Cf++Puc/v1tOiOUYaSi8oKWH4jOUJePNy9DvVTtFSjE+S3r71Ij5En3V1RtyijErr7
	Tqz482cmoKO99Cp4sHsut0mYjqwm6pt39Xjc2kECNQQB7QMcAiUPB3CM9YfbwCI394dk
	4xFU3MkqDM5a2DGuCFqGbdx5EkIHsUSsaWc534+wlXqj3aexNJRQ25pBrpUaTVG10viI
	2fYUvT+ltF9lBOEHb/X94SdOSgJ1R4NRM+iggMpe5LO/okixwH++uCjGHWPyb8M6+0xV
	iMqSumSC4oSMiF7OZ7/VSWkxrl9FO+ag+II6I1PglHnzI49joBFWJJJz7Ackx7bQlowZ
	eSaw==
Received: by 10.180.102.36 with SMTP id fl4mr1808899wib.2.1340776871715;
	Tue, 26 Jun 2012 23:01:11 -0700 (PDT)
Received: from elizabeth.local (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hs8sm15892062wib.10.2012.06.26.23.01.09
	(version=SSLv3 cipher=OTHER); Tue, 26 Jun 2012 23:01:09 -0700 (PDT)
Date: Wed, 27 Jun 2012 07:01:08 +0100
From: Ross Burton <ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <C4D2E4A76F2943CD9278FA15BFD5C15E@intel.com>
In-Reply-To: <1340744566.3500.2.camel@lenny>
References: <1340705423-18430-1-git-send-email-ross.burton@intel.com>
	<1340744566.3500.2.camel@lenny>
X-Mailer: sparrow 1.4.2 (build 959.4)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkxHO1bv2rKyKaFick9wXfTE7a+QJdUS5RnkeaUdG1SF9O16fDUNG0JUC58L28/Tj1a1yC7
Subject: Re: [PATCH] gconf.bbclass: don't register schemas in the install stage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 06:12:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday, 26 June 2012 at 22:02, Colin Walters wrote:
> Even better is to have the source code check for DESTDIR, and skip gconf
> bits itself; e.g.:
> 
> http://git.gnome.org/browse/evolution/tree/shell/Makefile.am?h=gnome-2-28#n201
> 
> This patch is still useful though for components which don't check
> DESTDIR, but again it's better to patch the relevant source code to do
> so (or port to GSettings...).

I'd prefer to use an option that the GConf autoconf macro provides over patching every module that uses GConf, as we're assured much better coverage that way.  Adding the option caught every module in the Sato image but two, which were being rather minimal with their build system and the environment variable caught those (as it affects gconftool itself).

Ross




