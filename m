Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 721457857D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 11:50:51 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a79so2964727wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jan 2018 03:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Lv0L+52AAGUFIllq8Oqw7vKvrk5qlXZlC1jPh1c3TqU=;
	b=P+jlrncVkI0Hg3CvmUdUA83HfGv9HfEAwCuIbCrEorSfJ20JFU8n+TQx83YCoGzbd8
	m1REEqvMlMKnqA3tK186lao4/u5kGlxozX29eD1yfXiagT39Nc8/J4LIs60on8eQBtzI
	NVY7nK/nWHHrNn/7VSJPyehAQ3yA49S2mKXF2SOSPFFlML0McwfxTbdx+/MGRhw5hMLu
	hXV4HJTaJSc8Dk5xv2+hRki+Z71uyUqizccb2lcN0fgX4sc7QoVE10QrhEXnRx5bQFKE
	FhTTrYaAIBqSGF3A6dzunY8ShT3voh8mmvJJD+5sr9ss5G6zg1nK6YCbDEEsv2XDocoL
	Az+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Lv0L+52AAGUFIllq8Oqw7vKvrk5qlXZlC1jPh1c3TqU=;
	b=h/es789J/zdrWnA6q6Lgd5brVDi9szL4CKbJ6jZVbjsuAtWeyqxHXjzBcPjqM4O0Fp
	eKzdIdmFbD/0OGHOjgiSQD3/ipSzi7CRUjrSada123KTQxpomxIe3bln+JlCZw2Bv6Qa
	QZPYne0bP21ywlV+17BbHwpsrhE2i5WMswpSCEf5nsfeQmlfUa14pYabbOd+mcpYoty0
	dROfyvQXBbA/s0SmGO9YdaYDDHLVgps4htSMdXIU1RAGxAlOYePOnrYYxo9LdH0uLz3O
	TNKQjU+Pjg9QMlgWLh2WY1bJOdVYl5AwMGiIUjRtVysyvKQzCqLd70H7aOWvABRG5CK6
	NI2g==
X-Gm-Message-State: AKGB3mIJbeCdRn9OmR+IU+/EvQi/WdsOoQSQ87gWe6WncTxFEj4OaN8z
	TFkrYH+aTb47smik/ZezoMuA
X-Google-Smtp-Source: ACJfBov2D/XF3kr/PMKFE8uWVeoyTwG2HZpFcyS2Ru4FmzG12Cw310mCtzyLj5w8FIA3zE6frUeRfw==
X-Received: by 10.28.134.133 with SMTP id i127mr4023638wmd.79.1515066652358;
	Thu, 04 Jan 2018 03:50:52 -0800 (PST)
Received: from pohly-mobl1 (p54BD57AD.dip0.t-ipconnect.de. [84.189.87.173])
	by smtp.gmail.com with ESMTPSA id h76sm4517047wmd.2.2018.01.04.03.50.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Jan 2018 03:50:51 -0800 (PST)
Message-ID: <1515066650.10775.24.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: wenzong fan <wenzong.fan@windriver.com>, =?ISO-8859-1?Q?Jos=E9?= Bollo
	<jobol@nonadev.net>
Date: Thu, 04 Jan 2018 12:50:50 +0100
In-Reply-To: <d85e2e6d-e7b1-8ebd-e3ce-01a26bdabbcc@windriver.com>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
	<1515062493.10775.21.camel@intel.com>
	<d85e2e6d-e7b1-8ebd-e3ce-01a26bdabbcc@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Thu, 04 Jan 2018 11:50:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-04 at 19:39 +0800, wenzong fan wrote:
> If so, I think we should wrapper the logic with:
> 
> +#if defined(WITH_ATTR) && !defined(WITH_SELINUX)
> +      attr_copy_file (def_template, user_home, NULL, NULL);
> +#endif

Does attr_copy_file fail when SELinux is active? In other words, why
should it be disabled when using SELinux?

File capabilities are also stored in xattrs. It might be relevant to
copy those when using SELinux. Or do I miss something?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



