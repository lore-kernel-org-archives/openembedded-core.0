Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 34D2072805
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:47:57 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sBIClqPb017278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 18 Dec 2014 13:47:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1418906876;
	bh=gnrdM/bJD0a6P/hyJII7l7EmSQav8QqlwMYewz6CTxo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=j+aYAnAG8IRoQcFh3e/XLoOYW2ykvb/VaaHAR6h+Pn78nV8+04nfrqNCC2OHQ9fju
	6wioTpnx5QsYdReeklHYLErggGv02xMldp4rOydJDUwdcOYrvlMt7vrU+AyetyiYB8
	myVHtfXgcWRN54Kbf4V8B6Y7N54LUg67xJdQyCCM=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sBIClmTa027764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Dec 2014 13:47:49 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Y1aUd-0003PW-SC; Thu, 18 Dec 2014 13:47:47 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1418900663-20985-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1418900663-20985-3-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1418904217.5106.24.camel@linuxfoundation.org>
Date: Thu, 18 Dec 2014 13:47:47 +0100
In-Reply-To: <1418904217.5106.24.camel@linuxfoundation.org> (Richard Purdie's
	message of "Thu, 18 Dec 2014 12:03:37 +0000")
Message-ID: <lyvbl986q4.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] pkgconfig.bblcass: remove PKG_CONFIG_SYSROOT_DIR from installed .pc files
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
X-List-Received-Date: Thu, 18 Dec 2014 12:48:04 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> Patch removes this string from installed .pc files.
>> ...
>> +do_install[postfuncs] += "pkgconfig_mangle_pc"
>
> We are *not* going down this route.

Ok; then just apply the first patch and perhaps the last one.


Enrico

