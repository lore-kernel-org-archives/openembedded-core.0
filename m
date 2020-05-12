Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.5864.1589291088558621506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 06:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=hgxWH7Rg;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49LzZ41zp9z4y;
	Tue, 12 May 2020 15:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589291084;
	bh=wG3kuwyjgRSrqT+qYmkVSeEQ2vuzqLYfQQdT4RsbIzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgxWH7Rg9XJrZ5/fYQtEruISgorZvujN5RA696HzBViEKvULgk9nn+CU5h7Q5JDm6
	 lsbgQh6h5d05NXVuouBHpid+fVp4hWJdMAi32Vr0ze1zzwAwwE5NPOXDYME48IkZHN
	 xqOAAR/8ZWbYCkwVL9iWBSO1Zo6BKC5KeTfi2dCiDYd1vyUyJfefswDf2/zOpQS6dA
	 tfYP10Vn9nlDE6ebYnJx3t1PXL8Dw/0vwBex1/lTu+1XESHwtUcz0s2WjyUTGVpzKq
	 o+7RUcElMfIrh1i6hSUbwC0KA/kjvciL3l/6o4xKqk6L1ucErhSsivKXe4FP/aDK6+
	 L3ZBQQNPUYzrfDcmcL1ZHkSbekL5L00eKO81jIpVTSI93z3K5DysNILvDzkLqy89Y2
	 4iuyoNIdmxxc3g6ZQP80R5jEPjOhA+cCjzOO48O6kurtKFsrM21BR416Wk/mJ17ZTK
	 d2LS1dcvSiuQFaRzpPgFSj19K0lzHMPm9CXD6Vbx2+ecMRjc523AiZaYatCCkvmyRv
	 nbvyUupnbnl3jxL+QP5pmsGObIDOMwWta5+K5W5tny6v5/5/gQONDOtGl/6WBUB116
	 GI/6LDD0zxvECyoqRStPLyTovh7E5Ll5HMcm2n5T2Ss3lu932d/do0dFHILvXOH7XJ
	 WeHyp8WALCFcxZfVTmi107sw=
Date: Tue, 12 May 2020 16:44:42 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 2/3] gcc10: Default back to -fcommon
Message-ID: <20200512134442.GA11943@localhost>
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-2-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200511182812.441561-2-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 11, 2020 at 11:28:11AM -0700, Khem Raj wrote:
> For time being change back to -fcommon as default, helps us iron
> out other issues, eventually this should be removed as we fix the
> packages to work with -fno-common
>...
 
What packages are still unfixed?

AFAIK the only remaining big issue is the host gcc in stable series,
but that cannot be fixed this way.

cu
Adrian
