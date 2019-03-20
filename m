Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 46EBF747E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 12:08:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id q16so586762wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=2ohSaHem68QVxCcfEVZ6PG4bHEb1+NJw7pYYmu1e9MQ=;
	b=MroRalUakluUARs6RTAT1PWzjl4AeIcYQElYTclDRVjl2Qg6nPnoCk0uN7FyNt/LHL
	bx7hP333D04qMav3Xjk1P2+XWfw4Iv5ltO+wL9FNwVu2tfGeoJZ5rhu8IByvFkqT2DPG
	kXEiUBkhYQvzabsxhaKo9+U6kLUv8x1hT1wrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2ohSaHem68QVxCcfEVZ6PG4bHEb1+NJw7pYYmu1e9MQ=;
	b=fs6O8fY2H8v0qEd7pzZzkxVYF9Quxf+pjAVwf1a4Y4QTLvqJ00mK9A2QlqP94pVbTt
	J/Fret8dMxwheW8eqFv+BvagnYF6mdnegZe6orkXsF/BdvzfRFXwfH0L9lVWgS0moFyX
	TAo74MT0hgyJm9tL0NDbVXR0+3mfCnAQvNIOjXw6Fv1FBHmp7B1NZyDq/0yu304ZDsx+
	y9AbmI8LO8sJk3v6aMZDEhGgl+QDjnqAHhZoSyL1Tpsch3N0ti4Z2NV+5b5w4nVZcumq
	hRjTQ4qGHsF36NWUx2ZoVBmi5gn4JhTdBnuMnVvrPQWE6V9uMqvhWUWiw9AsR6ecj5Ua
	dwHQ==
X-Gm-Message-State: APjAAAVZIXQSIV5mdr0RmW/lT8hd7U2nCGxnKjrzSj/+0RVjsWCVfWgl
	B6uhqOGRzA2UvTkXZp0PE95MFw==
X-Google-Smtp-Source: APXvYqzN7+i6J2sG4yJTF9VXVeYFEmBfc2Aqbfj5rkcYO4HS9P/ccs2aQHC0pcTtHQwTUPZD6bwoiA==
X-Received: by 2002:a7b:cd93:: with SMTP id y19mr7828080wmj.113.1553083724883; 
	Wed, 20 Mar 2019 05:08:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f1sm1561931wmh.44.2019.03.20.05.08.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 20 Mar 2019 05:08:43 -0700 (PDT)
Message-ID: <bf8d76f02a71a362cbc1dd9faa68014ed68d9569.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Wed, 20 Mar 2019 12:08:42 +0000
In-Reply-To: <4881796E12491D4BB15146FE0209CE6468224CEA@de02wembxa.internal.synopsys.com>
References: <4881796E12491D4BB15146FE0209CE6468224B73@de02wembxa.internal.synopsys.com>
	<861e1a12b82944f7a363d4f6f10b8f54340df1fb.camel@linuxfoundation.org>
	<4881796E12491D4BB15146FE0209CE6468224CEA@de02wembxa.internal.synopsys.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu: backport patches to fix cves breaks qemu-system-native
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
X-List-Received-Date: Wed, 20 Mar 2019 12:08:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-20 at 12:07 +0000, Alexey Brodkin wrote:
> Hi Richard,
> 
> > -----Original Message-----
> > From: richard.purdie@linuxfoundation.org <
> > richard.purdie@linuxfoundation.org>
> > Sent: Wednesday, March 20, 2019 3:04 PM
> > To: Alexey Brodkin <alexey.brodkin@synopsys.com>; Kai Kang <
> > kai.kang@windriver.com>
> > Cc: Patches and discussions about the oe-core layer <
> > openembedded-core@lists.openembedded.org>
> > Subject: Re: qemu: backport patches to fix cves breaks qemu-system-
> > native
> > 
> > On Wed, 2019-03-20 at 07:42 +0000, Alexey Brodkin wrote:
> > > Hello Kai Kang,
> > > 
> > > You recent changes in QEMU [1] lead to build failure:
> > > -------------------------------------->8-------------------------
> > > ----
> > > --------
> > > # bitbake qemu-system-native
> > > ...
> > > > .../build/tmp-glibc/work/x86_64-linux/qemu-system-native/3.1.0-
> > > > r0/qemu-3.1.0/hw/rdma/rdma_backend.c:316:42: error:
> > > > 'VENDOR_ERR_INV_NUM_SGE' undeclared (first use in this
> > > > function)
> > > >          comp_handler(IBV_WC_GENERAL_ERR,
> > > > VENDOR_ERR_INV_NUM_SGE,
> > > > ctx);
> > > >                                           ^
> > > -------------------------------------->8-------------------------
> > > ----
> > > --------
> > > 
> > > That's obviously because of meta/recipes-devtools/qemu/qemu/0015-
> > > fix-
> > > CVE-2018-20124.patch.
> > > 
> > > I'm wondering if you tried to build QEMU yourself?
> > 
> > We're not seeing this on the autobuilder, is this gated by some
> > non-
> > default config option?
> 
> Maybe.
> 
> But if you grep by qemu sources you may notice that indeed 
> VENDOR_ERR_INV_NUM_SGE is not defined anywhere. So regardless of my
> setup
> that looks like a valid and expected build failure.
> 
> At least that was the case after I fetched OE-core changes this
> morning.

I don't doubt it, I'm just wondering why our testing didn't highlight
it...

Cheers,

Richard


