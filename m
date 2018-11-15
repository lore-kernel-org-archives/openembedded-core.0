Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 012006B079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 22:48:32 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r63-v6so20420400wma.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 14:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IsRDbe0o3z4yp5gDZ91847mbqGlOs1ap7wJNreVZLII=;
	b=gWGR2eKAw/CJbPvaE4e1eiu0yCf8ydNxCGXauWlnlR4bQHXSYx4q2Nd883QsQB04eI
	eUAWJcO6tDrtrUinxZ8S1ee3eShZG+hE+M1AOv81LN3tR+MWQf5wwubWDDmSSf/ifycf
	z42JH0N4lsYj0IAzmaUIYEZ2awHE2CgubjzEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IsRDbe0o3z4yp5gDZ91847mbqGlOs1ap7wJNreVZLII=;
	b=pvBdnaKVmNrq7GVM/Ac5HvKlQBknMkavATfNhP7hPMNQgBkTOyC8L4MzP8MYFafVkN
	dKkfKdJt55RS1pozef5Jt01Ok4Y5ROP3wZbEXF6DENrcX66f4w3Ed5TBDT8VmvD27uMa
	qbNrZJ6qORt75VQjpVgQs4hpeDn3JTTCoivwR1W0D9VCAOu6WK3JnYoRu0KXsRL4pu5p
	Ka3OmZtC0TdXmKyD81AUUS8kSavuo4eRDV4yiekzXGVZ5F0JDJop0FWmXbP+VnhjzHLX
	9tnjFZz/uweB3/FM40mepjEIMBP7KRTUiEzVqlpvIN5PFV2lp+RZqa+LRh4tidItLZHY
	+wHg==
X-Gm-Message-State: AGRZ1gK/CUe/EXP/8ZnLwuHrZEcJMkS4WXOzuz5XrochieCp7tozYnea
	3sKZSXdV+ylj9kGnPQTR1f0vrg==
X-Google-Smtp-Source: AJdET5cOJBUzjrMfurMbCrmFsFB/fV86kXxSVy2rA8G5nRaLlazblwYiz5VdV0i2rR1VltN0ywRAlQ==
X-Received: by 2002:a1c:9855:: with SMTP id a82mr600671wme.20.1542322113229;
	Thu, 15 Nov 2018 14:48:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j8sm16791687wrt.40.2018.11.15.14.48.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Nov 2018 14:48:32 -0800 (PST)
Message-ID: <1060b6d3b60e6c821fff8b7cf75fa3da25fcefba.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 22:48:31 +0000
In-Reply-To: <32da8c27357053bf0e1eac4169125a130ae3a24f.camel@gmail.com>
References: <20181115191442.24106-1-JPEWhacker@gmail.com>
	<cfa00b9cb9aa1fcbe5525c33b16109f11f9b0db7.camel@linuxfoundation.org>
	<32da8c27357053bf0e1eac4169125a130ae3a24f.camel@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] classes/testsdk: Split implementation into classes
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
X-List-Received-Date: Thu, 15 Nov 2018 22:48:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-15 at 16:28 -0600, Joshua Watt wrote:
> 
> ---- classes/testsdk(ext)?-oecore.bbclass ----
> 
> python do_testsdk() {
>     from oeqa.sdk.testsdk import TestSDK
>     t = TestSDK(d)
>     t.run()
> }
> 
> ----
> 
> It might make things a little more clear if I describe the end game;
> I
> would like to provide a different class to implement the MinGW SDK
> tests. This would be done by adding the following to the MinGW SDK
> machine.conf file (mingw32-common.inc):
> 
>  TESTSDK_CLASSES = "testsdk-mingw"
> 
> Then, adding a new class in meta-mingw
> 
> ---- classes/testsdk-mingw.bbclass ----
> 
> python do_testsdk() {
>     from oeqa.sdk.testsdkmingw import TestSDKMinGW
>     t = TestSDKMinGW(d)
>     t.run()
> }
> 
> ----
> 
> AFAICT, this is pretty similar to how the package managers are
> working.
> 
> Did you had something else in mind?

We're thinking along similar lines but in pseudo-code I was thinking
something more like:

SDKCLASSNAME ??= "default"

python do_testsdk() {
     sdkclass = d.getVar("SDKCLASSNAME")
     from oeqa.sdk.testsdkmingw import sdkclass
     t = sdkclass(d)
     t.run()
}
 

as there should be some way to structure this so we don't need so many
bbclass files...

Cheers,

Richard


