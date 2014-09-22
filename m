Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 504CB609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 11:25:17 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id x13so6165677qcv.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 04:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=F3F0DFg/kDI11BdePwudTAHVzqPdgDeKjY/TgBESIyk=;
	b=cEzTxJXSCS0aVlXPdG2OtDxx2Y3HC7KOgx/zxc42PQV3JprGkt/WpU4x5OZGdBxKYP
	Tv4QEq+0xVwv35NMirQA0qwEB49NL4Jyu8FnNYDk0iIb0bO7u8YiWB8eLl8uMNuo2nNR
	7RLqI3X92QOPLtoChvaj9Fv+TaKRtndqF0YGJTnVT0HB8xlYhgZFOKFo8BeMtxq0DBXt
	rGJkX1nUB0unzl1lMj75IX8cdTMegOBKQ/G5sltyKtJtb3T/8UZGZZVQfZYN+Fm1w07m
	+1Fpi46/ReYMJTai0r8y+GE6qKyZBI8DpwIeEepIHnczfEzczqO5URXASbXZ2Et0r4WE
	84hg==
X-Gm-Message-State: ALoCoQli+BaCawC00aWjfGnlLYbDJZG/dgzHbjihxqPK5/m3U3CBbDygrkcCt+GJm573B5DU3wWV
X-Received: by 10.224.104.2 with SMTP id m2mr21557345qao.52.1411385118972;
	Mon, 22 Sep 2014 04:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Mon, 22 Sep 2014 04:24:58 -0700 (PDT)
In-Reply-To: <541E85E3.7070901@pseudoterminal.org>
References: <541E85E3.7070901@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Sep 2014 12:24:58 +0100
Message-ID: <CAJTo0Laqdv6NZRN1va1j+f7fb7ZaY-BNdwb6j0m4Z9BbwNUD7g@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: internal compiler error while building valgrind ptest
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
X-List-Received-Date: Mon, 22 Sep 2014 11:25:25 -0000
Content-Type: text/plain; charset=UTF-8

On 21 September 2014 09:01, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> /home/build/OE/poky/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/valgrind/3.9.0-r8/valgrind-3.9.0/none/tests/arm/vcvt_fixed_float_VFP.c:147:3:
> warning: dereferencing type-punned pointer will break strict-aliasing rules
> [-Wstrict-aliasing]
>    return *(ULong*)(&block[3]);

All we do at compile time when ptest is enabled is run "make check",
so you might want to report this upstream.

Ross

