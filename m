Return-Path: <anders@chargestorm.se>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0C216731C9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 05:17:32 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id i5so9573343wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 22:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=L+veEXGyLYcDsqXGOdvfltHz6A3QDCEB6x7W6ef/5ME=;
	b=sDtXoziOFh4m1HIe6jDN6FXeeU+1HW7caBmic0RHkXje8mFq/4/matXAcl+Y7yFXk1
	IgkDaRXAxVwSCGVVCcJNBjXP5RAncj4SrfIIu/vzxNRbu1fZcp03l7JM9L6onyeNcGzR
	X2ERwy5+PHXA8SVcBYvMOveAAWCx4w2+zFOA0MZjFnStaZUbU5L+ZhfBNYYo6svyr6ql
	zTuhIRaYzieR1thci7yfx4GOtCS5hZ3N/YKXlBaRpqlrS4PsiKPTKDJYaBP7NUomr54e
	94s8YPfzOjtc9+UADwB21uT2E3wuXZvpNaou8HvOyjbr9DLzP4+WPGntVcCIAbYbs+2Q
	gNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=L+veEXGyLYcDsqXGOdvfltHz6A3QDCEB6x7W6ef/5ME=;
	b=JLCUWvf+YoPLco/mY4RAzcwGc1luV3MRyXp1V5owpn+Ifdx7G3cqWMIu3y98bdDzdb
	11hvZS7QZ8O3cevLmeKxfnu77PjT3kouyqwx+K44nQ0+P5NZeMPinoOfiK87dhJ51dhn
	fHVuqiqz40PGPzUlC/cq1aBrWeOkFZbc9IInF4PEDOSKoZtBFqgWfoKnIFSEHDsfCWAU
	8p7Ed3ObbUoFa17FpM8pGWtH9JvYBQXtflZEIu9l9H4llQEzIuV2KrAA8WIJ1EFJOaB/
	uJEQcV4LF4QKLzqL2A4AmnJGxeq0om7EkT+vmDLuVYcaPxsJxNxiUKV6A4Zuv04DIxA+
	ZXog==
X-Gm-Message-State: AEkoousooOMGU/+D+Idtxq3DzKsauIp4bsiFcUEu0ydTZ2++DF0kc9SjXtdij9lciK4iow==
X-Received: by 10.25.158.147 with SMTP id h141mr30716814lfe.63.1470719852256; 
	Mon, 08 Aug 2016 22:17:32 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	b71sm6264153lfb.42.2016.08.08.22.17.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 08 Aug 2016 22:17:31 -0700 (PDT)
Date: Tue, 9 Aug 2016 07:17:30 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20160809051730.2j5xuc3tud3mrj6g@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1470663448-5191-1-git-send-email-ejo@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1470663448-5191-1-git-send-email-ejo@pengutronix.de>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.2-neo (2016-07-23)
Subject: Re: [PATCH] systemd: fix useradd parameter generation
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
X-List-Received-Date: Tue, 09 Aug 2016 05:17:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Enrico Jorns <ejo@pengutronix.de> [160808 15:55]:
> Constructing the USERADD_PARAM_${PN} value with += (as done before)
> resulted in having a whitespace added for each entry not having its
> PACKAGECONFIG parameter activated.

> This is not only a cosmetical issue. The useradd class concatenates all
> useradd commands from all subpackages of a package by doing a
> ";".join(). When having a useradd command that ends with ";" and some
> extra spaces, concatenation will result in an empty useradd argument
> ("commandA;    ;commandB"). The useradd command will be called with this
> and make the Yocto build break by returning an error code.

> Fortunately, there is no problem when having a "commandA;;commandB" in
> the useradd string, this will be ignored. Thus using "_append" instead of
> "+=" is sufficient here.

NAK

Fix useradd.bbclass instead. Otherwise, the same issue will happen with
other recipes. Having a single variable, that you're not allowed to use
the normal way to add to, would be more confusing. Personally, I would
find it hard to rember that I need to use .= for USERADD_PARAM...

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

