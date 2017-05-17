Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1083A77DAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:39:42 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id k91so9284071ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Bv5Jyi5ro8H/Go2OBmnXzsOfxhL+we0NFyJo1+UXyoA=;
	b=Wc67CGjklWDUapdmnK3FA7XzOTUaJzVqlj3U+cEeYztpVu82s6jbPRNKV9cFXUrerH
	OIKUCPlmenQ0FBOvYntgUf+S5Lz7FcSq+6zc+gZ0oxNv4AsIc2QdiK/3PdwLTP5YBada
	XDrMEsRRDIi12uZ0xEBc2ZDzimnoMpy5C6ubgbzw3g/cU1E8+v5EYUCYoPQTV3FrEZOB
	4woWU1+ZRr9e7x+xVb2C39nFRV6IAW3mmwb4goVceZFjtT7cr1YBPygfZIbvivwmq8sB
	n7XoIWqoZmR7BTdV8pK+eGt3nIxeylDmeyQLbUtxWa4TSjsM63Ah3UWrLebmNL+LFPJv
	aT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Bv5Jyi5ro8H/Go2OBmnXzsOfxhL+we0NFyJo1+UXyoA=;
	b=R+urubtRynuNuYvwH3PqO7ncyQ1FS05RtI0F9vxQFZDCLomKkKJ+Tj4mMxG4YS0BuR
	zgRThQpxmCwtZEgl3/6ipp1ZIbxKFKPFb2SvyZND4L+O0IsKfLXOMSlS7brFNCYpZSqe
	FtjnvnZTEdo5rLynbefNAvm3zTeDE4SqbSwymVNU/cz2WbwHnlgSoFIXcvHFPD7l47hp
	TZGrhGmLFGoLkD7M59ApMsE9OJSA/hlQN3pAsUDc6k8h33B4igUxaYJYmPp01V8Ns8i5
	3LRaMoUNosVp+5D+YGLgMjIDV11g8PgS2lE/is4eogopZ50CnJt2jpDEof6gAxTUJW9B
	bzGA==
X-Gm-Message-State: AODbwcCS8wZc/kgp4qhpyIzgIGTxv/ZlkH5B3MoHorCgFqVo8CQaIprP
	TCEeO07WtJ4XzSS2
X-Received: by 10.107.180.135 with SMTP id d129mr3146620iof.73.1495028383538; 
	Wed, 17 May 2017 06:39:43 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F2FD.dip0.t-ipconnect.de. [93.232.242.253])
	by smtp.gmail.com with ESMTPSA id
	v18sm1119883ita.18.2017.05.17.06.39.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 06:39:42 -0700 (PDT)
Message-ID: <1495028379.28624.46.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 17 May 2017 15:39:39 +0200
In-Reply-To: <b06241d4-97c2-a272-7d38-95091bdb66e7@linux.intel.com>
References: <cover.eea09064b94ca036ef2177896c19070d316ee965.1495007905.git-series.patrick.ohly@intel.com>
	<8810a4bbb1c67b438a7320df810db02099fcb5a0.1495007905.git-series.patrick.ohly@intel.com>
	<6d634eb4-a0e6-7f56-0d6e-b1324eece035@linux.intel.com>
	<1495018023.28624.38.camel@intel.com>
	<b06241d4-97c2-a272-7d38-95091bdb66e7@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] image-mode.bbclass: common infrastructure for choosing image defaults
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
X-List-Received-Date: Wed, 17 May 2017 13:39:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-17 at 15:56 +0300, Alexander Kanavin wrote:
> On 05/17/2017 01:47 PM, Patrick Ohly wrote:
> 
> > I know that you prefer defining more image recipes over allowing the
> > reconfiguration of the same image recipe. I disagree on that, because
> > when you have independent aspects (like content and login
> > configuration), then you end up with various combinations of those
> > configuration options. Writing down all combinations in pre-defined
> > image recipes just doesn't scale. But you are welcome to proof me wrong
> > by showing how the existing image recipes in OE-core should be changed
> > so that they not only cover different content selection, but also what's
> > currently done via EXTRA_IMAGE_FEATURES in local.conf.sample.
> 
> I disagree that it doesn't scale. It scales just fine with a 
> well-constructed include files hierarchy. I'd even argue that's the only 
> way to stay sane when there's more than a few product configurations:

[...]

Now add one more mode and you end up with six instead of two image
recipes. That's what I consider not scalable.

> This pattern is used throughout openembedded. Take a look at machine or 
> distro configurations for example, or how both python 2 and 3 can be 
> supported with a single recipe include and two very short recipes in 
> meta-python. What does IMAGE_MODE do that include files cannot?

It does the same thing in a different way. What is preferred is
subjective.

I think we've both made our opinion clear. Let's hear from others.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




