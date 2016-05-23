Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 64954605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 08:07:56 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id t40so96695267ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 01:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=KyT9euNfGmd5EYw/oknQKj6tS+tODzj2tZfHalfK5M0=;
	b=OU5flzyTI/hZmOZG16u+HbAQXP18JoDu9wKtsyM62M3PMkPo2drhc7kpr7yZPRKBc/
	uEeWFftJTY/+zKM8ImApc7iKQ+fXxHTsbSP8YoRIXTmojoYe+P4DpKh/5o0MmTak+obZ
	QMmli4uVc9b4cgMyLTlfeeAKceS0G47wwpAr8U/usXXb1Hu+0zZZpquzEDhJBoGzQ1Qe
	ELB3n4iN3AhoBn4bdGP+Td2Ck6jbXghwBFE9/htWqX3Vrzv20s2HhwhYOnj4TNW0AJMx
	E58iEgfFvQ9mxmpdyaF7iWYSWiPTy7gVcK5vXg5kD4wSii/ELKTINDH9+Z8EgYdPL2Xh
	Emfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=KyT9euNfGmd5EYw/oknQKj6tS+tODzj2tZfHalfK5M0=;
	b=LvUTzQYiGzZT4oDMhJ1xYm/dF+2tBYUYqnL3trvgJkhtuRsvR0K9iftjl2PS6nYFM6
	HpHMxpER/HFx8URsebbC9H95rFkVX6Ryp8O1ie5cMKVI9s/mWGnKjsy2BceCncZ37cuM
	4/7JbposluNZS1HjEvYfp2F7mhcXL8bdPMJ4/gErsg5ClQmPhImwB/3HT2BBiLQZ8EPq
	rf8p4FWZaOT+ERmpQp8CVEjcvTupzCWLEiqMrKrZRv1OeFKtFFa0g2iOWnWmifcf1tbM
	VmZSTHInkuZJn6/FO7e5TL7Y8cNpHRPJaV2BWkewioq10ZJLSf6XSIJGTqoqqtBMTdlH
	IfAA==
X-Gm-Message-State: ALyK8tKI13q+jzH8dOGqVl7/KbqvoPHRgrNVIynWJCPfwvqdhrxB7uZ44SCAIDVEQcStJR8z
X-Received: by 10.107.7.210 with SMTP id g79mr3939896ioi.140.1463990877087;
	Mon, 23 May 2016 01:07:57 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8DF24.dip0.t-ipconnect.de. [93.232.223.36])
	by smtp.gmail.com with ESMTPSA id dj8sm3617812igb.1.2016.05.23.01.07.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 May 2016 01:07:56 -0700 (PDT)
Message-ID: <1463990873.3095.13.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>, Olev Kartau <olev.kartau@intel.com>
Date: Mon, 23 May 2016 10:07:53 +0200
In-Reply-To: <CAMKF1sqUdo1X0v1ET1_udjGb8-7pg8sucv5yZ3=PuYacvtGQwA@mail.gmail.com>
References: <cover.1463546289.git.raj.khem@gmail.com>
	<c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
	<CAMKF1sqUdo1X0v1ET1_udjGb8-7pg8sucv5yZ3=PuYacvtGQwA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] useradd.bbclass: Strip trailing '; ' in cmd params
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
X-List-Received-Date: Mon, 23 May 2016 08:07:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-18 at 12:38 -0700, Khem Raj wrote:
> This fix was not sufficient and there has to be extra fix done to also
> consider the case
> when sysroot is created during image build time. I have updated it in
> pull request here
> 
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/pu&id=642c6cf0b6a0371de476513162bd0cefa9c438b3

That now fails for cases where the USERADD_PARAM ends in trailing white
space after the last valid opts. The reason is that the 'if test "x
$opts" = "x$remaining"; then break; fi' check does not get triggered
anymore, because $remaining has the trailing white space whereas "$opts"
does not.

I'm not sure what the best approach is in this case. Perhaps also strip
trailing whitespace from all assignments to $remaining?

The case were we see this is:
USERADD_PARAM_iot-rest-api-server="--system --home /var/lib/empty --no-create-home --shell /bin/false --gid restful restful "

The build then hangs because the useradd preinst loops forever.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




