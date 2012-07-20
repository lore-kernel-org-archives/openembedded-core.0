Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SsJ4c-0006fq-J4
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 21:41:14 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Jul 2012 12:29:49 -0700
Received: by wgbdr13 with SMTP id dr13so2816570wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 12:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=E5C8ZDyg5C022g7XGVxfyOZX/JBV0LGGuPlFjrzNLr4=;
	b=ezCyyivW0fEc+o1CgtMPQI6xnKuq8Pc0aaGe5Mcgr6PVg9r50FjvOZNzF7lsqGEs7w
	895Y0PqFu8/TMY9u6Oh7t/gIqaFKaUwy9HtK39RB/FfkG8/s6+Fxk3h3eDOFrsP0lo+z
	JYDVpSZNDrnKFW9/Og0SWXsULKnTg67iEI5o4jwdsxfxTDlvnh8b4juulA6G5qVX+6Zn
	fOxMcvvIVwJcSllOMFP99Xy1G2+6SLzIAxzivCG1KtjsULB6FOB3JDwZE67LTg/JPbTo
	T1Gys7OY7K8K09ZgdL5xWvyqetVJc6p7Y7ko8HS9ENs2KzDufbjMydnnPgrXLqeO718S
	gQig==
Received: by 10.180.78.5 with SMTP id x5mr340433wiw.13.1342812587806;
	Fri, 20 Jul 2012 12:29:47 -0700 (PDT)
Received: from [192.168.1.12] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm17590761wid.1.2012.07.20.12.29.45
	(version=SSLv3 cipher=OTHER); Fri, 20 Jul 2012 12:29:46 -0700 (PDT)
Date: Fri, 20 Jul 2012 20:29:45 +0100
From: Ross Burton <ross.burton@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <35FBB7A8207843A5AFC9AF27326C7ABC@intel.com>
In-Reply-To: <1342799746.21788.37.camel@ted>
References: <1342799746.21788.37.camel@ted>
X-Mailer: sparrow 1.6.2 (build 1143.6)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnc773ziGW9tK0RMfJ1dU/lWRkgqIkAvBga4xFzkPekWsQ9iswf9NXqHYc3/6uBbMwxCjUe
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-doc: Ensure we run gtkdocize else we could see build failures (e.g. evolution-data-server)
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
X-List-Received-Date: Fri, 20 Jul 2012 19:41:14 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, 20 July 2012 at 16:55, Richard Purdie wrote:
> This is a fix to Ross' series, we need to run gtkdocize in case anything
> was built from source control and the appropriate files are missing.

Good point but I'm curious how the build was succeeding/what broke before this.

Ross 




