Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id B99557D58A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 13:02:36 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id p11so7137711wre.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=aSQ//TY1q4xH33nNB89PX+0ZtWQHB3fu4fZTZsfCEuk=;
	b=LiMr98OeHokjd/a2Bpz7KBzx9sNcXVW7xww8Ovzjgl0E6Q/QV1KfAPveItO4zoWpWH
	da7rnB1OTXn8/nuLUiWFo56jqcnALmoqZNlVU78Laa18Zu9Flc3OfRcXqAco9n343Wij
	MP5wpzjXM6cdZdz+lAfvpXt19dwcOIPi1KamY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aSQ//TY1q4xH33nNB89PX+0ZtWQHB3fu4fZTZsfCEuk=;
	b=XclMZ/KUiBJMAXOOGpCzZQbZAZF3Bx2V408E+DPPApGRVVlYzDS+vixD+3zpH9xJs3
	lj8OppbOyZN7NRg36pwFLwnA3EJ2GfVO+/H8Pg+NR7DPwjeUh+P3hzhmlVrY3XWXHGkj
	dm2U+G8RmtVYDWA8MyzYGV+gZU1mS1TE51zdOcGrx2zjzQLxuLdDhueFx1gTDyPa3yBv
	sn1EwBesqXSryRiHtSVS2jBadPMW3JFehk6EHn0RtCBT/9YmxVMN0j9fgllJKjPUvfwF
	8ozrGXw7Ygmp/1x2b0QFwz+ybmAETIZ/MuEWyduqiMyx7tpDDSM1o25oPQjfr7QMPhbN
	JN0w==
X-Gm-Message-State: APjAAAXRaGPk94e/nLBE2tFNebcS3TZbk8s5gJUe2q+BUbMOjcKtga3h
	3K2dBtwxhe8eDz/4Is9mT8zRMbM7pvU=
X-Google-Smtp-Source: APXvYqyqcjVEOoF9zarvXRt3yNIq8XchY7qysVKBR/lJt/DlahHMK9+D1e+R4F1nctqtsn85zX6O2g==
X-Received: by 2002:adf:aa0a:: with SMTP id p10mr16199550wrd.125.1559566957405;
	Mon, 03 Jun 2019 06:02:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u19sm36058694wmu.41.2019.06.03.06.02.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 06:02:36 -0700 (PDT)
Message-ID: <40a7069ef696bea5b7e2764c61e809769dab41ab.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Changqing Li <changqing.li@windriver.com>, Randy MacLeod
	<randy.macleod@windriver.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Sakib Sajal
	<sakib.sajal@windriver.com>
Date: Mon, 03 Jun 2019 14:02:35 +0100
In-Reply-To: <e044d19f-4cbd-7876-0575-820e9e43d212@windriver.com>
References: <69efb132247d1706c6c23262ea59e80f75e96768.camel@linuxfoundation.org>
	<6ed430aa3e5e722cd75b1798cacab3f92eb71b71.camel@linuxfoundation.org>
	<2b4e8d0f-cbb9-d2e4-c17d-33950d3cf9df@windriver.com>
	<7134ea3a82bc3817da8bdc9f52e0867d223b2df4.camel@linuxfoundation.org>
	<090bebe4dfd6ba60188c0476aea5469787a94822.camel@linuxfoundation.org>
	<e044d19f-4cbd-7876-0575-820e9e43d212@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: ptest with BBCLASSEXTEND
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
X-List-Received-Date: Mon, 03 Jun 2019 13:02:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-03 at 11:10 +0800, Changqing Li wrote:
> Based on this list, except lib*perl and packages that are dealing
> with by others,
> 
> I picked some for your reference to evaluate the workload.  If more
> info is needed,
> 
> feel free to tell me.

If it helps, I reran the minimal image comparison and found the
following issues:

Recipes where we have problems (differences) in minimal images:

bash                         | 76          | 5       | 0         | 163
diffutils                    | 19          | 0       | 2         | 1
e2fsprogs                    | 0           | 0       | 0         | 111
elfutils                     | 194         | 0       | 9         | 32
gettext                      | 354         | 21      | 37        | 32
gzip                         | 19          | 0       | 3         | 3
kbd                          | 5           | 2       | 0         | 0
m4                           | 145         | 7       | 18        | 5
openssh                      | 15          | 1       | 1         | 145
parted                       | 41          | 1       | 22        | 5
perl                         | 2413        | 18      | 245       | 861
python                       | 301         | 6       | 41        | 327
python3                      | 30277       | 2       | 1043      | 1012

Others:

acl tests are timing out?

gawk shows failures in sdk image but minimal:
gawk                         | 407         | 24      | 0         | 20

gstreamer shows two fewer failures in minimal image:
gstreamer1.0                 | 104         | 1       | 0         | 104

(I'm using 
https://autobuilder.yocto.io/pub/non-release/20190601-2/testresults/testresult-report.txt
for comparison)

There are also some open ptest bugs in bugzilla which I didn't
duplicate here.

The above list is much smaller than the original particularly now we
have the perl module issues resolved.

Cheers,

Richard

> diffutils   depend on perl
> elfutils:   mingli have work on it and send patch to oe-core mail
> list
> gettext:  depend on certain locales for some tests
> 
>                depend on autoconf for some test
> gzip:       have tests depend on diff, while diff in busybox 
> incompatible with POSIX
>                have tests depend on grep, while grep in busybox
> don't 
> support context options
>                have tests depend on perl
> kbd:       have tests depend on readlink,  busybox's readlink don't 
> support -e option
> m4:       one test depend on perl, some test skip since depend on 
> certain locale/codeset, need to check one by one
> 
> 


