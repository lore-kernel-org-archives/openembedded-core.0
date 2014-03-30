Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6D36F89A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 22:55:31 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id va2so8391705obc.38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 15:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=fjb0G7JD8GzNOgEOoGs1lgB/x8CZBaqElUg2awPP5ug=;
	b=fEU6xDEpt9rrRGWJ5KFblh7ZhdGyz/DsEwrZXaZUFkJyzzMse7XaHVlxQER7Yx5jSC
	Av4S2TUskO6j3kmxOZcKoKGnCagEWSrrTwQvrnxv9njw0bMrYYkNj7ZW0BqceEe8zhEe
	Efp+3sZV7dnUf+zeubvUddeC2zj/kVr1OwamrFdypGOrQ7PGG5LTzP3/wAHx1h//teuL
	/Hyt18mVwB0O6qzcKpjqLrIlrgWFt4gM9mM6wCJ0gLN3+CsgO0dqf0uLZ93dLwQfA6/W
	lL8zBhFpGvuWMdkBnktmsALIzxEPuEDwjaASWIOliBZG5n7zh7I1/xU2nb4tb+Vc/3iX
	Apog==
X-Gm-Message-State: ALoCoQl3ihNtuwEWVW0vl5KqQG3AOTc4rC6RuuTGTdKv9rQwTPO4IrZT1ezoKxnXmRiPVvam1OQ8
X-Received: by 10.60.37.99 with SMTP id x3mr19157962oej.2.1396220132841;
	Sun, 30 Mar 2014 15:55:32 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id gm2sm21244536obb.3.2014.03.30.15.55.31
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Mar 2014 15:55:32 -0700 (PDT)
Message-ID: <5338A0E3.60002@linaro.org>
Date: Sun, 30 Mar 2014 18:55:31 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Stefan Stanacar <stefanx.stanacar@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1394552409-7544-1-git-send-email-stefanx.stanacar@intel.com>
In-Reply-To: <1394552409-7544-1-git-send-email-stefanx.stanacar@intel.com>
Subject: Re: [PATCH] lsbtest: fix comparison bashism
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
X-List-Received-Date: Sun, 30 Mar 2014 22:55:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/11/14 11:40, Stefan Stanacar wrote:
> == is a bashism use = instead.

But the first line of this script is:
#/bin/bash

Shouldn't a bash script be allowed to have bash-isms??!

