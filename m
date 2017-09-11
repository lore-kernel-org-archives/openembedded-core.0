Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4748277E96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 20:34:30 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id s18so19845207qta.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=0HC2aveLTlm6jMTJCPJKY0GlIbOSGkfiGgF+0R/kCyc=;
	b=x5nglb4GjJWBV+8iboBJfgkRXmC18OAIlGRF7Pe1IXb3WulRCo8sh6fmLreLyCzrV9
	DwjLCCfFOo0UE4eGOzavO1+IlI3hil+ze8R4NrKVbaZVpP26VC3H5glFaDQt9fW3uBWL
	tHEdWP2trO3SPadQCtjuFaQROXWEL5Zew3f/Gw5l3l6J97+rv5EiEhCBPDs42XLU8B7l
	P0iE/YLZZON1T09h4pOOhu8vUsIVg+vFp/RbR80TNyE7iRfmuv7q49FE+0bLS4MzFftU
	dpJTBy65i+IuitwBCFw5t++ycX9DhyceUsl12Xtspw7DQJxozOHJF5dXxp12477pX+oj
	9JFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=0HC2aveLTlm6jMTJCPJKY0GlIbOSGkfiGgF+0R/kCyc=;
	b=alUvkg6cskQcLVcSZDEe9kangQDwLychnPIQYFijGWbTNn4SDgB+nawO8Q4zLnAM0p
	jK6WEefHtR0pAbqaTp2qH5ZJZeO57XuhvbcMxg/312adl49Fljo1Fw3rx+L7wE7VtDmA
	NjdiTEUWEo6LyzcqlRdi9TGaUDO196omxO+PsJdzTk/Xh5m1DRmp53wEi0m5iuxeYJ9j
	Cup/oG5V4QXRW//MbItto9rj8IQ7WHjR32lFos8Zb6ihnH6EO3SemLTVT17P+KE68fFO
	mN/UVLUxCxgIdLm/QLGSMOGZ/KFkVdUi3CM+I37lGPZQM529IswemaHGzqUZoZYOqtA9
	mDqw==
X-Gm-Message-State: AHPjjUjccqlkz1JJdyvIh23xhwm0fvGEdtrecrJlDjbyhnRLcfTYTGq7
	S4Ikp8QqxrmHaOzrjJI=
X-Received: by 10.200.3.224 with SMTP id z32mr11184443qtg.72.1505162071901;
	Mon, 11 Sep 2017 13:34:31 -0700 (PDT)
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com.
	[209.85.223.173]) by smtp.gmail.com with ESMTPSA id
	e67sm6454229qkb.67.2017.09.11.13.34.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Sep 2017 13:34:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f173.google.com with SMTP id d16so34499001ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 13:34:30 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCcc4tidvubkk7v+q4bK9/bMjRLmj3a5/O7Xm9fEnzOM7gbRarQ6goShFnCoz3XzTC2SDO5v2Xy7CK3Ys5qMKI=
X-Received: by 10.202.83.10 with SMTP id h10mr11978299oib.56.1505162070001;
	Mon, 11 Sep 2017 13:34:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Mon, 11 Sep 2017 13:34:29 -0700 (PDT)
In-Reply-To: <5qd16xm2qf.fsf@yctb05>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
	<20170911190035.2787.74154@do.openembedded.org> <5qd16xm2qf.fsf@yctb05>
Date: Mon, 11 Sep 2017 17:34:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqdoCPSuzsN9JGBsoBHn=tug5AsZ8reCMh3u2R9aurXzQ@mail.gmail.com>
Message-ID: <CAP9ODKqdoCPSuzsN9JGBsoBHn=tug5AsZ8reCMh3u2R9aurXzQ@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Patchwork <patchwork@patchwork.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFJldmFtcCB0aGUgR28gc3VwcG9ydCAocmV2Nyk=?=
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
X-List-Received-Date: Mon, 11 Sep 2017 20:34:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 11, 2017 at 4:53 PM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
...
>> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence]
>>   Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)
>>
> patchtest is picky on this check, so '+Upstream-status: Pending' must be
> '+Upstream-Status: Pending'

I fixed it locally; I will wait til tomorrow to send a new version.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

