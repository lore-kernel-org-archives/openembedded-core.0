Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id D999860119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 17:17:33 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id v96so90731546ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 09:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=fPsM5IFN6PO297VnoMML9biwcdqJhRQlJsN0++BFOCc=;
	b=JfT2x9JH2ExM9PbcXzwyUt6u8Ob5hYSv3GPAUUi1QYFoziejdAL6LiFYx2e1CxYPfl
	eXAfErfLDGI1Szf1f+Og0VeCAfsUS/xq1mEhTjuQ76MITHiajBM2x85XjahSguPKWzv/
	k5dxs2IHnrraAnEdewE0uqYRTVbJ9qnUkFhtpdswUVWR3Ug8sq2k8QQZ8WO+FpfWvFhT
	wDasnRBHtYSBa92yF/X1fNcr8kSadmdSoDcIe8NYqI/WFYMjHOY/rX4xhh0Du/kljjnd
	cbLYiiM6BclWuw5qevohZnj+bD0X22M1TMGGHz9G/fRRENgd3A4ZO0QnMLcvtTr4EE/E
	mQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=fPsM5IFN6PO297VnoMML9biwcdqJhRQlJsN0++BFOCc=;
	b=k5SiAfijXuzxJWjnyNcqR4MjzTliKs+Vj6k+Aw4HjNCKLRWhXRT4F61zXm8Kzt9Y3E
	0XG2Jci5x9H2N3Ww/LeK/WyKgxJEQ1HQa0S1n4GMHi+QlDMICZBAtrTGxkJZsALk6fXb
	+Tq84w9zYQhpg12EQCLlTvTpYZvnIVs6FU4/sgzLI8kLymXJPwEoFCg/refH1szfP57F
	aSr7DE0XcFqX1/TyggknMwNhh9WxiLgvih+Fl8vgd6CPGn0Z2kElnJxoyzs5gxu+fYUo
	wIl3NGJZ8MsFgnaGRCdpM6N3XacUxDGk6aBQ4w3iZfkjJv0yzTUR3EbtbesHpz3kmx18
	mHAg==
X-Gm-Message-State: AIkVDXLYnc2WzbKaOmqSitRE91Ms6F2h8y/Z+eqO8eCiTgxgveABYfyPbMplPdCyu+7Jq7IF
X-Received: by 10.107.166.18 with SMTP id p18mr7206244ioe.15.1486055853308;
	Thu, 02 Feb 2017 09:17:33 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E270.dip0.t-ipconnect.de. [93.232.226.112])
	by smtp.gmail.com with ESMTPSA id
	m196sm1194193iom.14.2017.02.02.09.17.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 09:17:32 -0800 (PST)
Message-ID: <1486055849.14889.52.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Seebs <seebs@seebs.net>
Date: Thu, 02 Feb 2017 18:17:29 +0100
In-Reply-To: <20170202111201.3fcee3fa@seebsdell>
References: <1486031880.14889.35.camel@intel.com>
	<20170202102105.07a3bb91@seebsdell>
	<1486053547.14889.50.camel@intel.com>
	<20170202111201.3fcee3fa@seebsdell>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: host-user-contaminated QA check
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
X-List-Received-Date: Thu, 02 Feb 2017 17:17:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-02-02 at 11:12 -0600, Seebs wrote:
> > But I find mapping to root:root more attractive because it makes
> > packaging simpler (less worries about accidentally copying the
> > original uid) and the builds faster (no need to run the QA check).
> 
> Hmm. I think I would rather have the QA check, because if a file's
> supposed to be non-root, and ends up root instead, that could cause
> subtle problems, but we'd no longer have a way to *detect* those
> problems.

But that's not the kind of the problem detected by the QA check, is it?

It warns when the owner of the file is the same as the user who did the
build, but because root isn't (normally) used for building, files
accidentally owned by root on the target won't trigger the warning.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




