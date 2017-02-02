Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA1E71C14
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 11:20:29 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id c7so38697459itd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 03:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=oe8b0l+LM/WOtC1TTea7k3mtLY5nGVitui8XH+5JmaQ=;
	b=wgvqR1POjuVbQo8pjZ6DRXw3m8AvKqtXtAvuDwMLSoyEwcMjWGKw4fifmBK9GuDULr
	YbPQcnK2pUCDhRI+f6aYwnf2wuOgEgSolfBH/9xsrhVsO/Z/tWglZG+rN2vM6gCLCGmF
	MJHDtkNufGamAIZE3NCm1Qec9JMzSxN6arjeZ1OwL0dbZ0YKwVhf+ZY3FZJFaX5oW2qy
	Nck8GTTwUibQbir2fV91poP5bA16S3QBnMe5Ok/KAsCyl1VlAVj2jBZt3t8iQBhHiLWU
	AiHGRcH5b1R4KwLH6dCscOvxTdgSME74UKTHDkqeIbhiBz8gpi6U5a1IhPoTvydxYoUv
	+vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=oe8b0l+LM/WOtC1TTea7k3mtLY5nGVitui8XH+5JmaQ=;
	b=MCSOm4Ok3ABY2PkKXzX1q4qtxHKuD0lKD1aYPUJNVDQm8n0qzuNTuAPFNfbYYV+S77
	a8GgGUpd/ZP4enG0VwcdioLxJIJ4Exx1RP/X0VQ77e5iMerJeUgMDfE56D9bD24AQkTR
	OgLjcdaK0REp5soeaAVq2LUcSx104Bl5JuabvH70KdjDtUeCWq41U/INgJFbRTImiVil
	K7bTYeYpNGWCINzHzo6sa9yqjRD4OFCZVgPDlhBboXvqu+TZd5pdnEG5cd8/1kQPl2jD
	ISNpXZK2Tb7WUGNsFzLQHwnoWs6PJ9y99qcAW/OABdlNx6tww0MjJCTusdzDPQ/AOQfi
	oUPA==
X-Gm-Message-State: AIkVDXKtqc8gpx4I1ZnaXzALbFS6Tmzcn+A3TPy9/kmWff2oHBXRe69hSlQYvZux8XA18R/r
X-Received: by 10.36.3.68 with SMTP id e65mr18159447ite.50.1486034430004;
	Thu, 02 Feb 2017 03:20:30 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E270.dip0.t-ipconnect.de. [93.232.226.112])
	by smtp.gmail.com with ESMTPSA id 86sm739066iok.8.2017.02.02.03.20.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 03:20:28 -0800 (PST)
Message-ID: <1486034426.14889.46.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 02 Feb 2017 12:20:26 +0100
In-Reply-To: <aeb5c3c0-339c-45e0-9e1e-bbad796e1a2b@gmail.com>
References: <20170131090529.5321-1-patrick.ohly@intel.com>
	<aeb5c3c0-339c-45e0-9e1e-bbad796e1a2b@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtasn1: depends on yacc
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
X-List-Received-Date: Thu, 02 Feb 2017 11:20:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-01 at 08:56 -0800, Khem Raj wrote:
> 
> On 1/31/17 1:05 AM, Patrick Ohly wrote:
> > This fixes a potential pollution by the build host and build error
> > when yacc isn't installed on the build host:
> > 
> >  | ../../libtasn1-4.9/build-aux/ylwrap: line 175: yacc: command not found
> >  | Makefile:1116: recipe for target 'ASN1.c' failed
> >  | make[3]: *** [ASN1.c] Error 127
> > 
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > ---
> >  meta/recipes-support/gnutls/libtasn1_4.9.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-support/gnutls/libtasn1_4.9.bb b/meta/recipes-support/gnutls/libtasn1_4.9.bb
> > index b8ff9eaf7a9..3da5d4bcc56 100644
> > --- a/meta/recipes-support/gnutls/libtasn1_4.9.bb
> > +++ b/meta/recipes-support/gnutls/libtasn1_4.9.bb
> > @@ -16,6 +16,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
> >             file://0004-tools-eliminated-compiler-warnings.patch \
> >             "
> >  
> > +DEPENDS = "bison-native"
> > +
> 
> nit on style, you generally put checksum assignments immediately after
> SRC_URI containing the origninal src location. Secondly, if we use +=
> then we dont run the risk of it overwriting prior assignments if any

Makes sense, will change that as suggested.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




