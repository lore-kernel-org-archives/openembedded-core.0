Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2F96C7ED64
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 21:25:27 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q12so409612wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 14:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=pW/4ZzIb9OJldtyteera4b6vOveDruKoTcOsBOJ+uDs=;
	b=SXelOSYrivWUGGIGpnvoP+D+7s7FQMRoRWCPMSYn3LcQT3Zbg7SxhpdQ0hloJzZ1tF
	XyGr4A4J0I870MNIySbGwH3Wr36z9B0UGDzZFraLtTkUCBoSPzz4Y9/YlmeXAnYE/+L6
	JmLOV39wCCWTOvlkJ0oD2FqFxFwTME2g1PPD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pW/4ZzIb9OJldtyteera4b6vOveDruKoTcOsBOJ+uDs=;
	b=KA6qEU5uac5fL9Gw8HEvOV/XzqxKOAnyguh09WX8xEUqBDL3S3RrDBGu+JkiNAJimZ
	jVaUD4kkTZ1hx1zzFOVo04wVdV9sdkOEFU0eW8ElYu5jQ3p6dH0En5p0NkwF3GcVuxDB
	oPAI0squdiHG+QSJfFEYEzKTpj5K4TAhWZA/e71pPC7Hu0+VmLF/Uv8e9NQRe2lhcHsd
	HWaCyJOxXXjDFWeZN7huuLpeNVlOThJalqLNV5jDgksHpVOkHmFXcIrNqrGZJ7y++wcw
	rJ2ezZ4uiA6mJ9YJg/T6QswQBGzIy+uP9TFBw9roLN+0uXMGyGm1TbR6yI/wWjZris5o
	+F5g==
X-Gm-Message-State: APjAAAX12u5uWMfkFsjt8bMAGWUj5rWJrAfRw2L4A0b5ckdj2JH3ean0
	g1G6CjECwXnHaQlCQdDz5fiiUQ==
X-Google-Smtp-Source: APXvYqwmq3F9jxEjJlCUFwL91C7ooCgHl+hFrZFcUkdxwvfSzph1nvGCfN31+r0y/MIuzB8HqLmxmA==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr1632101wrm.2.1565817928755;
	Wed, 14 Aug 2019 14:25:28 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id p10sm711187wma.8.2019.08.14.14.25.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Aug 2019 14:25:27 -0700 (PDT)
Message-ID: <f30af5bfdca30721a345f656c6f3762dbb947d25.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Aug 2019 22:25:26 +0100
In-Reply-To: <CANNYZj_XzB3g55qEe4hYGGCBwPPkg9kwydWQ0jGwRbi8UkJNGw@mail.gmail.com>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
	<123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
	<CANNYZj_XzB3g55qEe4hYGGCBwPPkg9kwydWQ0jGwRbi8UkJNGw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Wed, 14 Aug 2019 21:25:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-14 at 22:27 +0200, Alexander Kanavin wrote:
> On Wed, 14 Aug 2019 at 14:55, <richard.purdie@linuxfoundation.org>
> wrote:
> > You followed up mentioning this wasn't with master-next. I think
> > there
> > is a patch in -next which will help with the empty task spin so
> > both
> > together might get us back to more normal numbers.
> > 
> 
> As all of these patches are now in master, I re-ran the test with
> that (209f89ab8ed51ac2867ca8f749336af1ee24ab25), but without
> including the spinning task part, pressing ctrl-c just as it starts.
> The outcome is 9m42s, compared to 2m9s for the baseline
> (6c7c0cefd34067311144a1d4c01986fe0a4aef26). So the worst is fixed,
> but the slowdown is still noticeable.

Right, it still definitely needs work. Its a balancing act between
sorting out the execution bugs in the code and figuring out the
performance problem.

If anyone wants to experiment, the way I'd debug this is to run the
before and after cases with the -P option to bitbake. If you want to
exit early just make the code return where it prints "Executing tasks"
or whatever makes sense as Ctrl+C won't write the profile data.

You want the profile.log.processed file.

So save that file with the "before" commit, then save it afterwards and
look at those files and see where its spending more time.

If someone generates those two files I'll happily take a look, I'm kind
of used to reading them. There are four sets of output in there, same
data but different sorting/types, each has its uses.

Cheers,

Richard


