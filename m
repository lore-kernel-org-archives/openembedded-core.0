Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 00D246FF0E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 12:56:32 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id d9so453034684ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 04:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=4ZfWARayFArSLehdZtfU8Lib9vUPyE1WfiCb3cGeeCc=;
	b=0i0TAgREyjDh+jmWwoyJAcF3Aef0/v8+Xfl8+A7pKvExgbHNAGW4amj+pcuL5KgOmw
	dOD2stlrFOUshT9HrYLJvueLSV1mnlEsHAe7SL1+GRpaMsXEBglHkjSqoSAgS/oXygKV
	qqs3kUhX3bZjBLl0ZwRjQV9NLzGhj35cSg7hD3WTveYcvKC4Z/IlTTaegG9GdNNtG65V
	YUezt7brMEYkkhKIm7EL3upBFLTt0UulDqQT02/m9yKdx4YKG7isFtwiBgrs0AN+VUiP
	gtZmisaUgAIFuHoXs3TZ3cHnlTePX+0qzCJCTOsJHvHlOX8SzWJGL9rV8g6to9QTOEG9
	ELtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=4ZfWARayFArSLehdZtfU8Lib9vUPyE1WfiCb3cGeeCc=;
	b=gH+SW1u3peMy8jNYPCO8wmG4ehX+lC3X4mT5sE9KPyIpQM/KcLzyF+KmC/mkkUB89D
	LPwgJcFmeuHnJ/4joAzsJkpc0lUyQGdBjUVz8697Cpc2R9Ald27dBj9BV1gx+bHyTqd1
	9khD2GiGE1MAKUOJtX2QM/vJ4B9bsURnU2LW0M+5tWBdwZfQ7j/uMV3zzfGFzh/OmVfJ
	vPFmF3dybvgjBq/XsPkCWTBbTwI3LATbZ5R0OPzvQbMbCaB+UmtRCUFwMjpelqoR7IcI
	85WVI/0HwDp4hzdYlmOHhiSrYQLzjENwKbRT4amdlIBhmLZdBX6gBGxI08S2U1dE1e8L
	Y+Rw==
X-Gm-Message-State: AIkVDXLLccZAKjWPPSvZr88+pQlv8aFV5jgzplfqQVBsIghgRWt1Jt8OF6/NPnEJ+YFhft4I
X-Received: by 10.107.6.223 with SMTP id f92mr50232456ioi.2.1483534593157;
	Wed, 04 Jan 2017 04:56:33 -0800 (PST)
Received: from pohly-mobl1 (p57A56308.dip0.t-ipconnect.de. [87.165.99.8])
	by smtp.gmail.com with ESMTPSA id
	y125sm33971564ity.13.2017.01.04.04.56.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 04:56:31 -0800 (PST)
Message-ID: <1483534589.28169.48.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Neri, Ricardo" <ricardo.neri@intel.com>
Date: Wed, 04 Jan 2017 13:56:29 +0100
In-Reply-To: <1482893989.106950.45.camel@ranerica-desktop>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<aec6b06a02be5aeb0cc6a7ae4d960189cbf8a91b.1482324587.git.patrick.ohly@intel.com>
	<1482893989.106950.45.camel@ranerica-desktop>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] ovmf: explicitly depend on nasm-native
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
X-List-Received-Date: Wed, 04 Jan 2017 12:56:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-28 at 02:59 +0000, Neri, Ricardo wrote:
> On Wed, 2016-12-21 at 14:11 +0100, Patrick Ohly wrote:
> > +DEPENDS_append = " nasm-native"
> > +
> Is this dependency needed for both native and target builds? If not, it
> can be done with DEPENDS_class...

I'm not sure anymore. As it doesn't matter in practice because ovmf
depends on ovmf-native and thys nasm-native is built either way, I'd
prefer to keep it as-is.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




