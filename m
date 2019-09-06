Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6667F42F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 16:01:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h7so6134635wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=cfZZ+MUxSPIWAHwa5Rt2soysBjPdtp+6XKT5496Oh+I=;
	b=GCZ+uf1oJPvJIqV1TkreqipMVjTSrZLnY4QiWKsmrZX8ciUQXU0pWadETvhiq7muTH
	p/QyCTGUJMbjevtGMBiFUnFFjEhqc8WImcN4RIx90cQtwXnet31ig23j5noRQxzu7UzW
	iZOqPGrJi8xypm1FCNCNF7jb7QRnXDKs5X7tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cfZZ+MUxSPIWAHwa5Rt2soysBjPdtp+6XKT5496Oh+I=;
	b=DPvBmrxaPW5OvEq3J1u9htjvBEOdZgEc9YbflUZTjJmpxzJDOuqxk1PjVDI6JTObAj
	ATEnFtfPgkIT1CBgpJ4kdHCrPspW3KdGDP0ftirJ95T5zQRSlEq2TRfT7p9WQ0MCZRvS
	FpKRnf3+Z1MBihl7M2j9OLY/kSqRDzuvjSK4uFB2Z5/ZMJad6G1hizjAUKtWKwadeBPB
	eali0lZMPTwt6BNI/7rPYIfONTJRi+hSJqc+i6G0rjVV/v47Z33Ay8D/MzYs0Axzj4Bj
	GFP7Z+JX+s2KRE0FV60BT+e4Nou+ADzrp+qcDMxLVnriTUTzr5RUk42nmASoAPb9Pj5u
	xD3w==
X-Gm-Message-State: APjAAAVsaPvnO3+lTPdLpA3Q0vOw61ePaPv4UZG1GXlkldI3y9D8IBPV
	zOXgA076oIJClaVpk5yWLQrP3A==
X-Google-Smtp-Source: APXvYqzdQB3gNwkLOqe7mP6jPQPv5dtHTnxutHhbYLIKjG5Irg/CRuEilUQcai9OiIznLdTKqgTf6A==
X-Received: by 2002:adf:dc03:: with SMTP id t3mr7460632wri.80.1567785712299;
	Fri, 06 Sep 2019 09:01:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id g9sm9344504wrc.11.2019.09.06.09.01.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 09:01:51 -0700 (PDT)
Message-ID: <dc427cf04f8a32a07839a29c9632d579a0e6e188.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ruslan Bilovol <rbilovol@cisco.com>, Ross Burton <ross.burton@intel.com>, "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Date: Fri, 06 Sep 2019 17:01:50 +0100
In-Reply-To: <f71a860b-2b01-41db-786f-ffd56876483b@cisco.com>
References: <20190904104144.3530-1-dzagorui@cisco.com>
	<91c7e151-9b37-9017-365c-a0fb3a0402fa@intel.com>
	<f71a860b-2b01-41db-786f-ffd56876483b@cisco.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] gzip: add nativesdk support
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
X-List-Received-Date: Fri, 06 Sep 2019 16:01:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-06 at 19:00 +0300, Ruslan Bilovol wrote:
> On 9/4/19 2:01 PM, Ross Burton wrote:
> > On 04/09/2019 11:41, Denys Zagorui -X (dzagorui - GLOBALLOGIC INC
> > at 
> > Cisco) via Openembedded-core wrote:
> > > Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> > 
> > Can you check your mailer configuration, as the From: is the
> > mailing 
> > list, not your email address.  This means the patch doesn't get
> > your 
> > authorship.
> 
> This is OE mailing list specific issue, we can't fix it
> unfortunately.

Well, its also related to the way your company email is setup.

> This was discussed multiple times before:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280394.html
> 
> Richard, do you have any updates on this issue?

We're transitioning to groups.io soon for mailing lists. That is
proving quite tricky to do but work is in progress on that and it
should happen in a week or so...

Cheers,

Richard


