Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1THaSr-000532-CB
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:18:45 +0200
Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2012 06:05:50 -0700
Received: by eeit10 with SMTP id t10so1254865eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 06:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:cc:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=IfMZAuVdOxQLQOGRw3CrcFNaGz30MPc4bi39xZVOq9s=;
	b=ghhs31qW1OtYUHfBHppVJmLftTDfdySSSczaxfE7JpesSv1fQeVRZQdgfnlsJlI9PU
	OBXH4tv9LNw3DzbfxGOT1ZPfVYLiSAJjwvz7OIoRMgbTcrYunHGLJR6lilSA1X2kbV+n
	iY9xniJzPdn20y+lrndGQ+erafiTpliZFAjMzIdRR8Ch1TMuC6vdi2TadKXQ97E+Hhro
	9rSMECQF8m30K2aBpZNONq6ynleNcerZrXQXOrRVQOY063Q731j9s/U1VImxHtqy1lle
	zS5aPztLVEVK1TmoLu0N7W15kYHfx/FqdE5UJz1s92nYTw/87jJ39jmGKPBRggv966uL
	pQaw==
Received: by 10.14.180.65 with SMTP id i41mr9942682eem.10.1348837548116;
	Fri, 28 Sep 2012 06:05:48 -0700 (PDT)
Received: from [192.168.1.7] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id m42sm25862019eep.16.2012.09.28.06.05.46
	(version=SSLv3 cipher=OTHER); Fri, 28 Sep 2012 06:05:47 -0700 (PDT)
Date: Fri, 28 Sep 2012 14:05:47 +0100
From: Ross Burton <ross.burton@intel.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <CF4AF9D3EAC5423B9F39CDED1CA5411C@intel.com>
In-Reply-To: <5065904E.9080208@intel.com>
References: <1348820316-20012-1-git-send-email-constantinx.musca@intel.com>
	<CAJTo0LaDts7hbUCELdCvJ-Gbt1bcO-rQuYGPk744r-wUP1EFwA@mail.gmail.com>
	<50656473.2040409@intel.com>
	<CAJTo0Lb7bqrjKDr-cQLSuKB2bsKoNo=zbzd3WC9cq16bKmu7LQ@mail.gmail.com>
	<5065904E.9080208@intel.com>
X-Mailer: sparrow 1.6.3 (build 1172)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlR679ryP07B20TgCtQxj2Vam/ImWClZ3b5AKwSPs8VcJb5k8VDpLO2K1fATdup74hNtiAN
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-mdns: fix mDNS resolving speed
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
X-List-Received-Date: Fri, 28 Sep 2012 13:18:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday, 28 September 2012 at 12:55, Constantin Musca wrote:
> Tests:
> 
> 1. Without fix:
> real 0m4.461s
> user 0m0.034s
> sys 0m0.086s
> 
> 2. With fix:
> real 0m0.842s
> user 0m0.066s
> sys 0m0.122s
> 
> As you can see, there is a speed improvement.
Excellent.

I'll ask it before Martin does - should we handle upgrading users from an old libnss-mdns with the old line?

Ross




