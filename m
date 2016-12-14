Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9903C6010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 18:13:11 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id p42so47542979ioo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 10:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=xihm71AiyOIKH83W3gjpXhd5na72T5fiBUDami+CBoU=;
	b=I/flDSqQeT4VuEwYbSvvZl5vjWXfAViShzetuNUWSam+D1/9Mz9zOtNGZ6WrLR0EAt
	HU3FcJRQKgN+fbOy9vZLEY9l1UtCc/+18h8JnZJKnCuEHiRVYIYE4WtbknYCIBjVOgHs
	Ur62vnHS7O/i8wGxb3o+GK/n09xmsC+CLpIH4vaggZqvIHcQEEQkh3oUQP9bt5lzf1hC
	pQDk89D4T7y36ztMU5qOWjzlyxByipITnmQljuuABDuah6Y8Y9cjAw29ldm3x9zVn8dB
	A7/HUL4eKPAxwHAPYfdFAENDnrvBmHososymzm151VWNe+hUY+DtxhEVhP/n4QIWs3Va
	xT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=xihm71AiyOIKH83W3gjpXhd5na72T5fiBUDami+CBoU=;
	b=d88z83sD2HfH4tCn2bg3N04VjDyPJq1mHJwyvyhdxFHaP0QtCwzXEIUgP6tH8xcz8w
	dGtCMxYiC2dHK8+TEQD5k7aOi1wv+L5bGvkCaJQLL1FF1xWcti8hFkYuM4/+eZ0J2i/P
	YJOzy7M5KtWydg4v2fhpSqmDSqYqQIBsfSgxIHBpFW9lGXeUSbJdu6ZxMWTRRoYnXQvV
	jrC6h9jBP+OEl1MYo2/277KpJcwB4aj1bwHB1gEhVlc3uI5kfhMS2Ss3gDMpBxHog1LY
	At2oUaMB6dZn8ipKL4nVHQ3Hpw8HJGnkYSB1QNG9AO1h11t1TlSmtNK7PikDh1hj0CrY
	3fqw==
X-Gm-Message-State: AKaTC01MXK1yPgogoQwm/MU2qs/itcwxH7hpSHH+5CbRmJgt1MGe7rhRee+y1zhAarXGQqqZ
X-Received: by 10.107.18.193 with SMTP id 62mr38733808ios.155.1481739192228;
	Wed, 14 Dec 2016 10:13:12 -0800 (PST)
Received: from pohly-mobl1 (p57A561C0.dip0.t-ipconnect.de. [87.165.97.192])
	by smtp.gmail.com with ESMTPSA id
	w188sm2892933itc.9.2016.12.14.10.13.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 10:13:11 -0800 (PST)
Message-ID: <1481739188.1544.37.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Dec 2016 19:13:08 +0100
In-Reply-To: <1481729863.1544.33.camel@intel.com>
References: <1481729863.1544.33.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: multiconfig + siteinfo.bbclass
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
X-List-Received-Date: Wed, 14 Dec 2016 18:13:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-12-14 at 16:37 +0100, Patrick Ohly wrote:
> Hello!
> 
> While trying out a multiconfig with two configurations (one for MACHINE
> = intel-corei7-64, one for quark) in custom Ostro derivative I got an
> error while parsing recipes:
> 
[...]
> 
> However, I can't reproduce this with just Poky :-/ Any suggestions?

Turned out to be a user error combined with missing error checking in
OE-core: in the custom distro case I was using MACHINE="quark" inside
one of the multiconfigs where I should have used "intel-quark".

Enhancement request filed:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10810

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




