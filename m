Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF0171DCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:43:57 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id c7so184334547itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 04:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=8IcS0r5qKnGnTDizw9atdApid2JgIDQQx5dzut0f5Ks=;
	b=ojrz55pngPQTRC14U378ZCsWq/VaD6Bbv2cRBCpdSrdL48sMNmnxsPvdr9/UCbbQoi
	9uOIgqSMvhRwLLTlROPe+P38T9HWONBbUWxij39qDJkLlsUbtnqjnehFw6jCLUk7x+mL
	nTTkN6E+Uv87nNlHYaei1RU66UH0d1vqGVd9EcK469N/BavnJ+gYxeFPiaYC5vjMAPWs
	h3+B8Iz+iltcelwyZDaPSiytnQJ0I53HULv7lPFk6Tq6VTbvY+BlS5f1I88a1TKLC5Yl
	zqETb5G4HEnWE996/qrsrWS4diVppfcxbpE/ttSdHE7pqTfvJeHAe6HOub2+L60H+61y
	MSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=8IcS0r5qKnGnTDizw9atdApid2JgIDQQx5dzut0f5Ks=;
	b=niBKLevCQ1n+lHhWr9qOBhiZiCnbrCmECvOrG6IDmqCNCnb8CS55FCXakrAjf6Y7IJ
	QGXnmIUKItY5QVucHY25Qv0l07hK5pz04H4reIzTsjw9XRIgkCBHkRUn1yRIcVd6NyhD
	/iBJscUm5eC3/YgNJGr7HNCmN5l9hnyI0gfsvFZi11NagKFU9ngKU1HSglY7VenzkJZF
	J20c0D70U5RhknrTypHtfziGDhGVCaLNYg0HIIQ/kgPhYpUsmqNgRn+zaP1Kzt8rs2cE
	h27lAREdHnKqsx2merhazhHcBPMU4GP64ej1oQfhoYOoAHhgqVGiIqZsccvuDVrE8FPx
	PgDg==
X-Gm-Message-State: AMke39koCnE7F7Q7n6YCF1ywxfa8IRCRGC37n6HcDuT5ihbz8UvpBPwsDA0RR16sTqdZ4qTO
X-Received: by 10.36.34.79 with SMTP id o76mr19913357ito.116.1486989837615;
	Mon, 13 Feb 2017 04:43:57 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB6A.dip0.t-ipconnect.de. [93.232.219.106])
	by smtp.gmail.com with ESMTPSA id
	g78sm4987895ioi.41.2017.02.13.04.43.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 04:43:56 -0800 (PST)
Message-ID: <1486989834.13854.233.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mike Crowe <mac@mcrowe.com>
Date: Mon, 13 Feb 2017 13:43:54 +0100
In-Reply-To: <20170213121905.GA887@mcrowe.com>
References: <cover.d193014fd573473058a6d28217d27ca47bc60792.1484318722.git-series.patrick.ohly@intel.com>
	<ab94bd9c9f3c7170e2a0e40afaec42d5ec9397fd.1484318722.git-series.patrick.ohly@intel.com>
	<20170208115042.GA21576@mcrowe.com>
	<1486559082.13854.12.camel@intel.com>
	<20170208134810.GA29105@mcrowe.com>
	<1486657479.13854.85.camel@intel.com>
	<20170210183213.GA10017@mcrowe.com>
	<1486983272.13854.223.camel@intel.com>
	<20170213121905.GA887@mcrowe.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Mon, 13 Feb 2017 12:43:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-02-13 at 12:19 +0000, Mike Crowe wrote:
> On Monday 13 February 2017 at 11:54:32 +0100, Patrick Ohly wrote:
> > To me it seems like the right solution. Inheriting
> > release-source.bbclass could be limited to builds which produce
> > releases, for example in your CI setup, then normal developers will not
> > be affected.
> 
> At the moment it is straightforward to build the source release with a
> simple bitbake invocation.
> 
> Your solution would work, but it would be necessary to meddle with
> local.conf or similar in order to generate the source release.

There is conf/auto.conf for that. local.conf can stay unmodified.

Alternatively, you could also introduce an environment variable which
controls whether release-source.bbclass gets inherited. Add that
variable to the BB_ENV_EXTRAWHITE in your local.conf.sample and builds
with or without the class could be as simple as:
RELEASE_SOURCE=1 bitbake ...

> Is there any way we can get our tasks in as predecessors of rm_work only if
> they would have run anyway? Rather like the way make(1) supports order-only
> prerequisites[1]?

No, I don't think there is such a dependency in bitbake, and I'm not
convinced that the usecase justifies the extra complexity.

It might "feel" natural to use the "addtask before" as such a weaker
ordering relationship and the "addtask after" as the stronger "must run
dependency" relationship, but that's just not the current semantic and
changing it probably would break too much.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




