Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id F1ACD7ED46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 08:17:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o18so10081132wrv.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 01:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6ZU7gLnAZbEMT3EuvVm7lA1eEoJcU4u0laXOIg8gORU=;
	b=dsIt6GwA1+0tgtuQKLCO0Z79ohtHZFboc0O/CU3CxX/PlO2czE2VrYZKyeVXvgb9J7
	U+/zD2JY7byVGg5bjZmIaeE+pmG85bflKZ1UXwpLNiBJ66a1rzChCnzJh2WE/PFZgYqq
	aYzJvHijQidx+H6hdeV88fLBvYdAC7Rq9b1G62UZTnn8G25hqVBA2WpCkY2/oP0BN8bP
	B3vrx0ih4N/wJKREFkLbBWdXy4oXcsPQARgghm7mrPGDlsfYdRgH82w7Ore9JmweA3Jb
	ARYy1BU9wtLzpJ+INJ0sap6riKBKmUE5qsrnJjIla1Rqu/gMUYHl3/OkSiPMdNyP9FCX
	15jQ==
X-Gm-Message-State: APjAAAVF+nLLG07UeVXRQ4kkCdOrNY1gNkm2DgNu1eoZDChlRJatddH0
	aO4Tm9mzzmWKmLMhFC9HwMavgl/s
X-Google-Smtp-Source: APXvYqzFE188aBJd8F1y8LY5fjTpuuR5HexafQDiY7HlxOcih3sksl/bJSQoGzMC1CI2ueh3aQxJeA==
X-Received: by 2002:a5d:60c2:: with SMTP id x2mr12965142wrt.121.1569831434487; 
	Mon, 30 Sep 2019 01:17:14 -0700 (PDT)
Received: from 1aq-andre ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id e9sm30501203wme.3.2019.09.30.01.17.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Sep 2019 01:17:13 -0700 (PDT)
Message-ID: <93c398f281c59a113e5ba1b3bd00e84204401504.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Sep 2019 09:17:13 +0100
In-Reply-To: <b92d29e4-7974-d6e4-d556-e1a78ff2fec6@intel.com>
References: <20190927135443.15407-1-git@andred.net>
	<b92d29e4-7974-d6e4-d556-e1a78ff2fec6@intel.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ruby: configure mis-detects isnan/isinf on musl
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
X-List-Received-Date: Mon, 30 Sep 2019 08:17:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-09-27 at 16:15 +0100, Ross Burton wrote:
> On 27/09/2019 14:54, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > The configure script does not detect isnan/isinf as macros
> > as is the case in musl.
> > 
> > Help it by providing the correct result via
> > CACHED_CONFIGUREVARS.
> 
> Is this reported as a bug upstream so we can remove this workaround at 
> some point?

Now that you say it - actually somebody else did before, and they've also
fixed it in later versions.

New patch coming.


A.



