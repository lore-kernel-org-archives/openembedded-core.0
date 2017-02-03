Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A4D8071A36
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 21:20:59 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j18so27317085ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2017 13:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=ZKGYo2RSF9OFVz7es8VIxODPcocpj+T4t47eMrVqh9E=;
	b=ckXA2H4al4xbfSh0Cy1a19eFaVZXNWifoEeI8bjHoh8iSwZE/tall+/Ye2D/26jdWY
	NCrlvpLiv7waAjlZs7tibYHppFzaW4I7haNDov/vMNiemLiQkpg7+TjxioNgRBvBhGKv
	G4TuyRW1pU8lyYvgyRBl0Jq4LqhJ8rAMZK3kvjc9rL5zKoMYw370AMUMRmHok6sXtsRM
	LaB4JSukouOrDTs9pCgi8bX8MolXGRS6Y56P62CoODUzRX9l2poLV+s9w4BIcQfi2icS
	EtejUUE8SgdfFVuEztqsUDTX7ReBQkX8wrL+8Klu7cW8ehgUQuVXK57pHnigVcjBo3y5
	TgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=ZKGYo2RSF9OFVz7es8VIxODPcocpj+T4t47eMrVqh9E=;
	b=E6cNajnRYCWvrEQ5PsUQpqU5Q8nx/gUmRX2Vd309pNrPGmnCVttbZ0JlQkjbnHWyfT
	Y0a0xGbAL83DDeZaecEo05L/BQslWYVSUnJzIRzX+/YQUtK/3Vqk782AuR3JPazVZbhj
	HVDkBijRYfmJyNgz7SEuX4P5o+Dwue6ryI0XNSSMPhDqmObGcCGjAMGJDSzinLBRlfmo
	R0Xh7QnTzlPhACG+dZVY974WfqQqQ4aP71nJv5bTEveTUrE5sDepQfWYy3W3tvKsHmRw
	XdchrpImTN1O3sE6sb+een/jyOGV4nfCT2GQPGWroVa9YGwkfUS0hmqIGSEPT/DACjyp
	Vi/g==
X-Gm-Message-State: AIkVDXJ7avVEf2wUiJTkS7CJ9l3wx4o51yGcGQZ8phZjkZGu5eIMQMPzPi+uOeYSeDCkc93A
X-Received: by 10.107.136.195 with SMTP id s64mr10827840ioi.51.1486156859495; 
	Fri, 03 Feb 2017 13:20:59 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E712.dip0.t-ipconnect.de. [93.232.231.18])
	by smtp.gmail.com with ESMTPSA id
	n30sm3255865ioe.32.2017.02.03.13.20.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Feb 2017 13:20:57 -0800 (PST)
Message-ID: <1486156855.14889.103.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 03 Feb 2017 22:20:55 +0100
In-Reply-To: <alpine.LFD.2.20.1702031414250.9747@localhost.localdomain>
References: <alpine.LFD.2.20.1702030641310.2549@localhost.localdomain>
	<1486131492.14144.70.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1702031414250.9747@localhost.localdomain>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: whatever happened to a proposal for "read-only" sstate?
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
X-List-Received-Date: Fri, 03 Feb 2017 21:21:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-02-03 at 14:14 -0500, Robert P. J. Day wrote:
>   is there a command that will tell you how much shared state info a
> given build would be able to take advantage of?

INHERIT += "buildstats-summary" in local.conf will print that
information after a build is done.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




