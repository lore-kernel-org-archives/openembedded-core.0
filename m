Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2849273FA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:50:03 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p65so8217520wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 12:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=G/QBcRhVB+YYu89tqWa53SVBKOLdz1MGOmEGeaZ++vw=;
	b=L10Vq5APnS4M5x8rsaSo5qGmbbQkt1Xxk72OLAnll9Noaln1H74OsEhX1dXBmFHnGV
	YYlu7ojgks8Los4+8NJDSXbzK0cIdfo32dIgXB7GUdsnlb4r4E49XnssXc16L8dsSEjy
	8u5muHGvPq9O9AnSAsV9kRDkbppgVUILkiDQls1nrsa867yhyb5daIcPLths0M7xegdL
	/tJ9DaRD3jrP/OKSUN7ZpUQKb6drwFqPkydUBUOZbpU2f4U2JKvJMvO3bZKHFIx00D1J
	tkcZ2FDoanEV6D/VGDkRvlJL7OPCj0V+no3CKLOIyVVdf5/ram2uLvqVOQFcF9aK/FNk
	rJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=G/QBcRhVB+YYu89tqWa53SVBKOLdz1MGOmEGeaZ++vw=;
	b=QTKrqzV6CwJcpA/pJZwBDaV7A0FdfpZdhGzX9tFTEStTImZ+Y+C4oW/ofOyf1qjvrm
	ZDY6UPmfowUV1YpjiDgERMji06nYiY3PmNTeTW58EWMBYs/ImKM3SVk6E84NysXN3ikY
	PAd7fUIymQxrn9M+YZ2m/1fYCm/DYbnM65pTlES5VGORyYSkTOrH1DgqDNN5jStxDUO0
	g8ZP+0tt3rlLTyPPOuO/awPZI+Qe9VvDv7JXbKjSnXPI1/cm+q6+4rzJpI0k4saXbTG3
	1FZv2FKu1aE6JjhBAQWsJozBrsmA4PC7YPll1jhLKojzajU57XrSZA1Q17Y0RU3X7Xgc
	+MWA==
X-Gm-Message-State: AD7BkJJOssXXCSCkXndOi6eclZjr3RQ5OmeVkkXtq6itWBeQAIHKr/xDmYYoeUOs3NPUMseRM1WCasq2gelSNQ==
MIME-Version: 1.0
X-Received: by 10.194.242.202 with SMTP id ws10mr16742020wjc.3.1456779004052; 
	Mon, 29 Feb 2016 12:50:04 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 29 Feb 2016 12:50:03 -0800 (PST)
In-Reply-To: <CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
Date: Mon, 29 Feb 2016 12:50:03 -0800
Message-ID: <CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Mon, 29 Feb 2016 20:50:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 29, 2016 at 12:43 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 29 February 2016 at 20:40, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> I'm a bit puzzled as our autobuilders build this all the time and we
>> don't see failures. Any idea what the configuration difference might
>> be?
>
> Since oe-core 94e1b917078bedf73830e54278af77f742c93581 gdb has a
> packageconfig for system readline, which is enabled by default (and has been
> enabled explicitly for a long time).  Do you have some local patches adding
> more PACKAGECONFIG options but not enabling readline?

gdb 7.10.1 depends on readline features which are not present in
readline 5.2 (ie the GPLv2 version). Using the gdb internal readline
is a workaround for people who don't want to switch to the GPLv3
version of readline.

(Although gdb is itself GPLv3, it's self contained and easy to exclude
from release builds).

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

