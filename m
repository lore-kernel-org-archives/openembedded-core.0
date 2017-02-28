Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 37F0471A18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 12:42:32 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id 203so8192778ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 04:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=QSxp4ZkNyCzngZzFmKRk0Tcf9jKLZ/Go8vZQrPFUfCI=;
	b=Uv3bS79rYpfGM4PIKEt35xMc0rlLuI5w+uFN9QbuIJHquSTlY0L8CWmQC22cx6puOK
	gfOfn46Vn66clgHk3DaVukahKZ2tvTLV8L7WJ5XBAZ/LL/SF8V72IaZDPlS0TxBJ18kr
	FRCiwsQuVE54AKq/Dbi6B+r6xnuwQXW6JeygI2nALhFv/0BARYn2YYCOm8DKdaRnUmp5
	cPs1sqHwk7DZeVhX2EgweRROOVCBuwIgkm4qa6NQSDOrRXnTkxkiTClHtmpHlE6jLes/
	AIE+mfHUTV/mBovlZaxPoNTADLoJl3tF5ppTqaXsT9ac77hF1M66urveyMZRrespQ5gx
	WiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=QSxp4ZkNyCzngZzFmKRk0Tcf9jKLZ/Go8vZQrPFUfCI=;
	b=sRSqtpACjKRk1kDOBO4M3HKYrgABzuwnOXDsf1YrU4H1RMM9cU+XTHa/BNvKTRofDJ
	tmZ5l3uTJDHEeyOqkr4NRjMYm2AUkcrHGC2HBAfX/UpaupY7vCD4S1D6RpFw0VQaDGqI
	xc8qQjruc1Bd1PYH2pHIXFPRZrR2qu+FAYCNncG8bg4lmPQCzqi6nuC5JDk349DBACjl
	Z/Nb36bkAyYCvmJv6hSS5v0GrJVd4GYT2lrj36Q2OX1UqYJWMTd1Brk9xyy/ZdKRkP33
	aZNA6gxPZ71bw4exJ3dlLBzniKpEwUlUBSu32QSKZYuXxj9Wf3MUu/vAMR4022c/KS4y
	lc2w==
X-Gm-Message-State: AMke39mWE2Zs7+C5EhW9c/Gppbavkc7tKjfiQAe23d2tCh5l4PdWW8E3Q+wDJ7jaQgFDj970
X-Received: by 10.36.65.135 with SMTP id b7mr20022550itd.86.1488285754036;
	Tue, 28 Feb 2017 04:42:34 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D654.dip0.t-ipconnect.de. [93.232.214.84])
	by smtp.gmail.com with ESMTPSA id j14sm5732478itd.0.2017.02.28.04.42.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 04:42:33 -0800 (PST)
Message-ID: <1488285750.7785.43.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Tue, 28 Feb 2017 13:42:30 +0100
In-Reply-To: <c784e8d2-afd8-b4d3-1cd3-75d1d398dea8@mlbassoc.com>
References: <alpine.LFD.2.20.1702280518430.30803@localhost.localdomain>
	<1488284875.7785.41.camel@intel.com>
	<c784e8d2-afd8-b4d3-1cd3-75d1d398dea8@mlbassoc.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how to *securely* do a remote install of an OE image?
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
X-List-Received-Date: Tue, 28 Feb 2017 12:42:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-28 at 13:32 +0100, Gary Thomas wrote:
> > For ssh keys, there's rootfsdebugfiles.bbclass. In local.conf:
> >
> > INHERIT += "rootfsdebugfiles"
> > ROOTFS_DEBUG_FILES += "/home/pohly/.ssh/id_rsa.pub
> ${IMAGE_ROOTFS}/home/root/.ssh/authorized_keys ;"
> >
> > This copies my id_rsa.pub into authorized_keys and thus let's me log
> > into images that I create via ssh.
> >
> 
> Does this work for dropbear or only openssh?

Should also work with dropbear. From
https://matt.ucc.asn.au/dropbear/dropbear.html:

"Compatible with OpenSSH ~/.ssh/authorized_keys public key
authentication"

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




