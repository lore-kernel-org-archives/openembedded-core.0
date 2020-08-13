Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.2457.1597345531412903553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 12:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=d7ysKtIr;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=pkdr=bx=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BSGHD5Lcfz23;
	Thu, 13 Aug 2020 21:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597345529;
	bh=PDP+em8Cq9tDdvMV3xLZ/weLq2cxYCgfWuJSyCymBhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7ysKtIrl66VhXX9a1ozhxPhe/3TfO4Qv5LMZQC5EX0j5BA8Gjp7PeGq1LvnlCvRr
	 DBbJTyHeT8R6bdhwHPO1J2ttpQ5Ddy8BAfzgbQs+eIK59t8CxfK7960P1gyLmub2Xl
	 PNn/XLpt71m9+1HEvehb2cLdcJ2aNJCuU8+OWTsOe1ITil5uwe36dYmw1uaPtIqwoM
	 qy+A0GUf2F3ghsE5ofTAs+cMDbALfk5Ibr2Oyi2XIsLL4YXnvkX3/mHVWOiUSD9Mr3
	 e9slyCVvmGiRwaF29HM6NfNUMcht1DESEM+9YbDthgrgzDqMYjJxNpUvoptRA+QYeH
	 wyMbAXEbaN/tJLAv84nI26CjcFBYdZUdkB3xYuWQ5E+yHtUb+CYl8grIrhzD7Jbg2n
	 YyflnjEyK9U6Wi4jrdG6lRrlaPLA7jciLdexpKM6fKasnCFSGGOeskAD/ipKXuLGF2
	 E3CbDy0H7yyJg8oS+ZdywMp/PK4FIg4CXBHH4qsOcNNvZcf+pSM07p3pvk14xg0gr6
	 +ID7d4a+iEtLrgPd9xh6/58lyChqAZYEXilzXbRVPZnxU/ORqEmQCFEy+Hx+TgC6ko
	 Cm3DJwKQTL0WceM9uCP/BQH2Xt3DSll4r/+qBLwgsMAlAY+V9w32wwhb1il0POwhSq
	 SNLaLx1pSBe1A5q/qDuCD/wE=
Date: Thu, 13 Aug 2020 22:05:27 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org, stefan.agner@toradex.com,
	sergio.prado@toradex.com, max.krummenacher@toradex.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 2/2] libubootenv: uprev to v0.3
Message-ID: <20200813190527.GA30737@localhost>
References: <20200813102117.8726-1-liu.ming50@gmail.com>
 <20200813102117.8726-3-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200813102117.8726-3-liu.ming50@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 13, 2020 at 12:21:17PM +0200, Ming Liu wrote:
>...
> -PV = "0.2+git${SRCPV}"
> +PV = "0.3+git${SRCPV}"
>  SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
> -SRCREV = "86bd30a14e153a18f670b25708795253d8736f0f"
> +SRCREV = "ad253cfdb07c8492f2ee46a52fbc607ad0b96414"
>...

This is exactly the 0.3 release, so PV should be
  PV = "0.3"

cu
Adrian
