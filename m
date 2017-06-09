Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id BCDFE78299
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 14:04:10 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id k93so33498726ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gEX4W1lnrnMwdan039c/FW8dyjTAXSE3chl3fmwriDQ=;
	b=M93Z3JjO3pqx9/cSoB+w17V8dLSf/3Zz9vnfjGimO3VWSybcJTQfTNirIOlZF4BuIj
	aJPdrhxLG3kj73kBjZcc93rlsuJWpbh+/p0aJVXKlrRHAdIS8uGtOlxhgiB8Smu/90FR
	nQCznqBdXFxmHpO6+2xn7BFsJinAqrj9yopnksDWMLgpKJBQj4UboXZ4wWUka1rJLrNA
	3uYflQJkhUzsHHkokXCsMIMIETNt3lELktAh7INqnlS5Qk0OR4wpOWtU/7+/OkYTLPDr
	2M+0Oa1Ya88ZUDHPIWm5NMDexfYzSbNucBR1BwQsuJcSyjyRQ82ByvsQk85IHE+iz9v2
	yCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gEX4W1lnrnMwdan039c/FW8dyjTAXSE3chl3fmwriDQ=;
	b=d4XY6RGDPLdV5nXCekO4u+2N84qIUueAKXLGz7w6I8kfvAapsB5SEjATXrdgfJn7J2
	W4XnbJeni67adV5m5loEMENKjaQpq1XKCMH0C/9FXb+v43U5scRPdjBTEqu7cNdHNYyZ
	bE6672Q7nkTnsC1pfxU2vzdP3YIpaKEfcuM/bWv6HfBYyx0IkSIEkNJNsSd9YpFzNVKD
	CjUCQO8e7+T2tFgWFUN/5z7X2oy2wyuez+MYdy2Fx4Fqow3Q2P9teguP8X+GECfLEsWn
	YDe+hbRWoYf4G7n6B+cvlUxqERK7S4OFqsnfXQdU2VqrmDyrXvki1pnhAQplwxtAHYNm
	hdsw==
X-Gm-Message-State: AKS2vOyu8EWWzuC94QDybPrpa16tgnHDoN+xCDbkcCLhiiu/KRMnxUov
	Si+0Yuly4pru7B/y
X-Received: by 10.107.35.139 with SMTP id j133mr1329417ioj.136.1497017051803; 
	Fri, 09 Jun 2017 07:04:11 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C0DE.dip0.t-ipconnect.de. [93.232.192.222])
	by smtp.gmail.com with ESMTPSA id b70sm477826ioe.57.2017.06.09.07.04.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jun 2017 07:04:10 -0700 (PDT)
Message-ID: <1497017048.30163.185.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 09 Jun 2017 16:04:08 +0200
In-Reply-To: <1497016223.3131.7.camel@gmail.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
	<1496932400.6630.250.camel@linuxfoundation.org>
	<1496935714.8427.7.camel@gmail.com>
	<1496950316.30163.152.camel@intel.com>
	<1497016223.3131.7.camel@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Fri, 09 Jun 2017 14:04:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-09 at 08:50 -0500, Joshua Watt wrote:
> On Thu, 2017-06-08 at 21:31 +0200, Patrick Ohly wrote:
> > There's some truth to that IMHO, but I'm uncertain whether it
> > warrants
> > introducing entirely new syntax. In refkit, I only ran into one
> > particular case were an include file was necessary.
> 
> I'd be curious to see that. How big was the .inc file?

It's here:
https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/recipes-devtools/bmap-tools/classes/bmap-tools-deploy.bbclass

That's the code still using the "inherit" workaround.

Not particularly large, but does things like "inherit deploy" and
"addtask" which themselves then either require conditional inherit or
anonymous python workarounds, so overall having them in a conditional
file is cleaner.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




