Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2C43165C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 23:02:44 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id r5so10608984pag.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 16:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=a0tsciwLPRqU3rhzkazTuzm4Q7UoUwYw09soejY5SYE=;
	b=Y7eoqAPUNtBY4+dYv0YGoYTV+lE7szH4mrrIeO0I3HSIhBj6Z8McvC+5JNPAX20n0p
	QtRhn3XVBnqIQkAOGVWX7MrEYTipFcFTsGFIB62XY24qxQ4EHDyZQgiXdpb/NLoEAzja
	UVkUAo96TteT6sTbhQBAGASljv7OnBOMGeAq7qQCsLOQI5QksxVzY/mQYDgLg9VHMNGb
	q14w4heI4b2dXERHXQGeXQD9u9z+v3eq5LHdDwKhXHn47Xvbx7QAmVKZbQeKFXwI4dQP
	P5Sz4HUOdKcaRl1M2kpkHYmh+/NzzfebdkYGznHq6x0pCzxURPESf7QibsqvxNc9mc4Y
	oB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=a0tsciwLPRqU3rhzkazTuzm4Q7UoUwYw09soejY5SYE=;
	b=gbIReaglRzjdFD04m8hEX+eM8MCS7GyLC5QFukMbam1mO0kt9Q02kwpXciiAho6QY+
	8V8estgFWl8RwklXYrt616U9YEAd/j9OBbyWUG/s1MfPRZ9hjaXubCcmmk6jEVNkSd5b
	XcP5OOGjlBRQyfJnkBSgb1T5gtocUGLA2t8w8MchYMVjKBJqztHaid4nAbCrU3xxzYkl
	IEI/YJniwRjWIknCCIgn+e0HkLUlz12T+5fyUR8VCmAz06CzX8DQRUOHrY2n3NYz9CY7
	BlfWl1pWP/5kmZVX12IWGcJ9cdE1jg/oTUUL31SYs6fD9hWEHoCU0W2zZPmUq16nXsVH
	dGiA==
X-Gm-Message-State: AOPr4FVk86Nd8gTnvWEVwkb/Q/xL5TzkAMe8+RAq/JtH/ZCXO7XsUHdq/KDVL/OAWxWaYg==
X-Received: by 10.66.176.103 with SMTP id ch7mr203910pac.20.1462921365384;
	Tue, 10 May 2016 16:02:45 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:115c:8d1b:25c6:1dcf:e654?
	([2601:647:4c00:115c:8d1b:25c6:1dcf:e654])
	by smtp.gmail.com with ESMTPSA id
	m190sm6939074pfm.29.2016.05.10.16.02.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 16:02:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <573263F4.6010207@gmail.com>
Date: Tue, 10 May 2016 16:03:00 -0700
Message-Id: <9984C0EF-2B39-4DB6-B765-D78A83E0D88D@gmail.com>
References: <573263F4.6010207@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Patchwork [jethro] glibc: Fix CVE-2015-8778 - patched dropped????
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
X-List-Received-Date: Tue, 10 May 2016 23:02:45 -0000
X-Groupsio-MsgNum: 81824
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FBF4865C-F891-4714-9A49-498E7018209E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FBF4865C-F891-4714-9A49-498E7018209E
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On May 10, 2016, at 3:43 PM, akuster808 <akuster808@gmail.com> wrote:
> 
> I can not find the original email but a glibc backport for Jethro is in
> limbo.
> 
> http://patches.openembedded.org/patch/121007/
> 
> can we get that merged?

this looks ok.

> 
> - Armin
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_FBF4865C-F891-4714-9A49-498E7018209E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcyaKcACgkQuwUzVZGdMxS23wCfcfu7n2G7rmteH9y4g7QhRDJL
cU0An0I8VVs965ubZUEnyElR9ImuT79W
=vzu8
-----END PGP SIGNATURE-----

--Apple-Mail=_FBF4865C-F891-4714-9A49-498E7018209E--
