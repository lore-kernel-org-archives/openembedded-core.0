Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id BDC9078392
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 13:24:59 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id 40so17957801wrv.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 06:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=zrAhIRxITk5YomexGVxp8h6SXeJjbSxpXRKemVAOuPY=;
	b=fRkAYD2iyCrfEjOOZ1ivf6hXL/SSBm2z55QOVLeY4wPPuNW7KJ6sALbL55rJu/zomX
	zYr1TNvyTD83MwrmKVO1UWMRFmdjjecWSuHGMUuDSO8Zpu3NwpMTvTNgyG/NTK9PrMp8
	0cBh0mbF5n5lfCYNUXhsfull+XLhc2ENNHnBTr5cBMiW5aiLX2srzqytX/kE9fPkeKON
	gENobm8D535gGDDvPGogFIRetGN6/O05XtrwHYpiLseaVxNssEpbugiqdhtqsaBhzvFA
	znNFDSqh/VTIzcXdBwkwlZsG3jLCQqnh0HJkWZWfq/wxBly0htR7k0KiBQV1QqqloETV
	qXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=zrAhIRxITk5YomexGVxp8h6SXeJjbSxpXRKemVAOuPY=;
	b=T2LLifaZgTNf9FzmNQMahu98iBmtoNOSkh+HdkAVVHLALWIwyIvd3QUQ8MebI6o5dM
	85OpVVveDXTYdlAI7x3L+G0vPF0Vk41uTKj2/ovcKap/kNNNsfesxOvsrKk6bs/jpsxY
	XQpsMLVBwqFFQbCHklScLaZwOCNGF/qZNtZMYyrGFcHmHR4xekqciCQiHmFblD05AIUQ
	1ucZlZzt+SfmEEXF1xrsw5EmutULnrAXY4VsOV7W8WNiARqBBKYw1jGCNvvWgnLU2wd8
	O6pbr+rIRkR/4HrDPLq4HErswWuNyHw3oye7VXDw3TWnRqd934AILHbJyd8A5oBIzwui
	GURw==
X-Gm-Message-State: AHYfb5iuYgT6fq6t1HScAppFW5MnR5A4SLYCDPhfplL6HwaAU4Rf0cnN
	p2oLzDtblQ3YNclm9yw=
X-Received: by 10.223.131.1 with SMTP id 1mr1129343wrd.40.1504099500514;
	Wed, 30 Aug 2017 06:25:00 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EE7A.dip0.t-ipconnect.de. [93.232.238.122])
	by smtp.gmail.com with ESMTPSA id
	k195sm2611839wmg.43.2017.08.30.06.24.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 Aug 2017 06:24:59 -0700 (PDT)
Message-ID: <1504099498.12799.41.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wed, 30 Aug 2017 15:24:58 +0200
In-Reply-To: <CAP9ODKqSH7PNk1fATkb6CGiwkKAnkuR5d2esZtVbzp77b2n3Mg@mail.gmail.com>
References: <20170829204309.16139-1-otavio@ossystems.com.br>
	<1504085996.12799.39.camel@intel.com>
	<CAP9ODKqSH7PNk1fATkb6CGiwkKAnkuR5d2esZtVbzp77b2n3Mg@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Wed, 30 Aug 2017 13:25:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-08-30 at 09:46 -0300, Otavio Salvador wrote:
> On Wed, Aug 30, 2017 at 6:39 AM, Patrick Ohly <patrick.ohly@intel.co
> wrote:
> > Let's not dig us deeper into this hole and instead split out the
> > live
> > boot module into its own, arch-specific recipe.
> > 
> > Then initramfs-framework can become allarch without having to make
> > layer.conf more complicated.
> 
> I think this can be in two steps. Splitting it out makes sense as it
> avoids the build of useless packages if someone is not using the live
> modules but it can be another patch.

I'm not sure in which order you want to get it done: first split out,
then update (i.e. remove the layer.conf change) your patch and merge
that, or apply the v4 revision of your patch and later clean up
(including removal of the layer.conf change)?

Personally I'm in favor of first splitting out the modules.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



