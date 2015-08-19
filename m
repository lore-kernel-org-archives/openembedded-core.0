Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 27FAE73CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 07:10:06 +0000 (UTC)
Received: by laba3 with SMTP id a3so10096945lab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 00:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=MPKzSpdHoy35UPVChRlv+H0ZWnKTkHKflTv66Bd8IGI=;
	b=e08q7eZyHEVdzscHLgYdoRqqFyqWOU6Xpfhlw8i0ZrvTIr+siPs/jZseVb9ancbZPM
	65vFcsr7MVKPOYu5PZ1ItgvTkwjP95lzyXz3U6WkVAEMlwFI5rxnxwAwcSiGmDkst4r7
	XxCrtMuBwlVB8mQuXz/gpq/2OkvaERQYUDD/HnLIefbuZI08Cc+Q+2z4WuQ4m0sjXoj9
	DGDBdlbhVP28MFdtIerQj6UwHPHIP7NFjuL5/y3dlT4MhAMYFKH1oq9BmOOqfNAqAEfY
	qGUWrf4NFNBJnHlJD3hw0vU+NZy3givgGUkjhBQB39THXbbqOB4N3HOO0OfaNEOvN8Sc
	P2jA==
X-Gm-Message-State: ALoCoQk/EPo56HUpEZNAcBm836L2QTucMR+4OOfxe1GuHyinyr5G4DYeWkuLqKgnUcs7fJsRHGn1
X-Received: by 10.152.7.101 with SMTP id i5mr1475697laa.63.1439968204956;
	Wed, 19 Aug 2015 00:10:04 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	cy1sm5612415lac.22.2015.08.19.00.10.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 00:10:04 -0700 (PDT)
Date: Wed, 19 Aug 2015 09:10:02 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150819071002.GA10916@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
	<CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Wed, 19 Aug 2015 07:10:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Christopher Larson <clarson@kergoth.com> [150818 18:00]:
> On Tue, Aug 18, 2015 at 8:53 AM, Christopher Larson <clarson@kergoth.com>
> wrote:
> > Bringing this back up again, as I think we really need to at the *very*
> > least pull in iw from meta-oe into oe-core, and adjust packagegroup-base
> > (worst case, with a VIRTUAL-RUNTIME), and better yet also drop
> > wireless-tools / move it to meta-networking.

> Worst case, we could keep both in VIRTUAL-RUNTIME for compatibility, as a
> temporary measure, but I think we need to get iw into oe-core and into the
> base images for sure.

Yes, we should get iw into oe-core. So, I agree completely with this.

/Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

