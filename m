Return-Path: <trevor.woerner@linaro.org>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 52EAE605B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 15:14:44 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id a41so2839994yho.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 May 2014 08:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=LttOq+LcQWqkHuh1USEAf4e6mhLNJIG3vLT/pfENP/s=;
	b=mE4KyWWJHVYWBc0k4OpTBgLvhpJTDLxnBLttZ27qZCizgYYJFjmmTVRocNDkjP6ygl
	epZ8tcjtvuUbfhwxejdXeTi9DqlwKGdgYAgyoNzkgJCVwpW0YA+h5CWOCfbVxlmSzQYz
	zFqByJ1BebImSfOowKCejvOrC0J0lV5TguHI+OKrZpNeoqgMtXheexeU2Y5dIwx7fHxS
	nIx1C0xpCdvzqU2ddlQalUzKtIsJQ8CdiXX3FvGAmGzM9jblqUQRjQzOygc3OO4xjWHy
	9av6zv2/LkI8zWu6iGhTOSBG+pVi1RTuT0Mgk8oA2W5ASFoTY2c/49h/0OGIrsRMFxeD
	yz6Q==
X-Gm-Message-State: ALoCoQlSH0c7MQI3fuwp6dvxkd0PjTdtAENinG+IGE6vj1woOsD1uDZ5AHkfcJWE+MrZNz9A6MMv
MIME-Version: 1.0
X-Received: by 10.236.142.204 with SMTP id i52mr32878544yhj.6.1399130085286;
	Sat, 03 May 2014 08:14:45 -0700 (PDT)
Received: by 10.170.156.8 with HTTP; Sat, 3 May 2014 08:14:45 -0700 (PDT)
In-Reply-To: <33115ABC4887814E8A92A08FBC93416B0A254DBE@IRSMSX103.ger.corp.intel.com>
References: <33115ABC4887814E8A92A08FBC93416B0A254DBE@IRSMSX103.ger.corp.intel.com>
Date: Sat, 3 May 2014 11:14:45 -0400
Message-ID: <CALmOhgkxOU3tagcWw7GRSpoJab9V=6N8SQwkSrr1xJB7vDAD=Q@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: "Stoicescu, CorneliuX" <corneliux.stoicescu@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-selftest developer oriented improvements
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
X-List-Received-Date: Sat, 03 May 2014 15:14:48 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

This sounds like a great addition!

On 23 April 2014 05:26, Stoicescu, CorneliuX
<corneliux.stoicescu@intel.com> wrote:
> 1)   Testing recipes updates or new recipes
> (any experience from common recipe build fails can be helpful here)

I recently stumbled on a situation where doing a clean on a recipe did
not remove its artifacts from the sysroot (or some variation of
"clean" that is supposed to remove such artifacts). Making sure this
step works correctly would be a nice test to automate.

> 3)  Stress testing

Being able to catch incomplete DEPENDS would be great. And maybe even
being able to catch bloating DEPENDS would be good too. I have
sometimes come across DEPENDS lines that include more things that
required (which I assume is just carry-over from older versions).
Having the correct DEPENDS would help builds to succeed and also
improve the scheduling.

