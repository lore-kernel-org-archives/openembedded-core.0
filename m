Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE475745ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:11:48 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id a19-v6so1762221otl.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hvtDAE2YXFuIF9SdU7poSRVoHX0iVeS/tlIVMcrEzus=;
	b=qMuqxRaLUldCQyJsrrC1kl+J1yeexJeLT/bNowpWC+yAAJdKoBAM8EqgIao2eZw7YM
	xrDFO2ZqHlm63BLO1iO7EQyLuGJSWM0k5reSxBi+RfjvEoSNapFGR29XUcJMl3xQLy1+
	PrMZ3LzUZQQJfV8kbnPpLmjgpYSpeRJGjd+ITvDPZbLy9zIITDcmXI4HoFCfiQXLZYaV
	oFu456QMTKD2mjSj7PNg45XTySWQN6z+MBcrHW7i/6d7LLXhwZ6ut2t84Tbc1ERbNMCn
	Kfskua4LO5PEHTw8aHyB5QxdRpbzF/rdaSaTZjdLs2cWpgwnk8+1ZsASKGYUSQwk2WjG
	v3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hvtDAE2YXFuIF9SdU7poSRVoHX0iVeS/tlIVMcrEzus=;
	b=p6iPXSR3UqjH4ORlgRg2UmUo2Q1w5E92cnyy7czUCU1NE6R34aCnA/T/lWEeBcVeV/
	viexvdC+AYvdRsht+uSiKs4xnOjkAv8LTa3Sri/lKZNN1iKaiup8Ug+lWU1pM0NqcVBD
	2PHhjeEo1ddi8nc+Lqe2JbMA0u2T/CumwjZ6kVRZmksw/niX9y6bPHKiC7fo45/38dAV
	zonnByfeo2Ig5kRlFhSLADQQfb1aCfpk113Q5TAW0dgtdyd6FrkB7a0zq+xeD0PFdT8a
	bqiMQK1lOKXh4ekwhu/tFttoxOMvIlPryPQtMt7Mzx391i/5Od0chbbcglO1Hke2Iwnb
	4w0A==
X-Gm-Message-State: APzg51BL4M7M5syDY7Wb/K7fy1n+JB47Y/PxIdtsXXYrjrfjIi+Pv49E
	cVDCYWPN2WE17UdWBH9/ijvDs97feO7N1vNRjtpjmw==
X-Google-Smtp-Source: ANB0VdY8zXdBsi0fJVMQKUMOuAyjvj7H6yQpWbl+Ipph+hyL6gqv+uknW8wJM/w9EKDm4fPmED/ISzvyguawFOrk5+M=
X-Received: by 2002:a9d:844:: with SMTP id 62-v6mr1586471oty.159.1536855109775;
	Thu, 13 Sep 2018 09:11:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Thu, 13 Sep 2018 09:11:29 -0700 (PDT)
In-Reply-To: <6bf60656-78b8-7c83-4755-d0d6db9cb6b6@taitradio.com>
References: <20180912012707.30046-1-douglas.royds@taitradio.com>
	<20180912020259.13844.22579@do.openembedded.org>
	<6bf60656-78b8-7c83-4755-d0d6db9cb6b6@taitradio.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Sep 2018 17:11:29 +0100
Message-ID: <CAJTo0LaYWE56CxaakJ14gCEzVsJAszwUmP1WRnLMae8i5s-aTA@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFJlcHJvZHVjaWJsZTogRmluZCB0aGUgZ2l0IHJlcG8gaW4gV09SS0RJUi9naXQgb3IgUyBmaXJzdA==?=
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
X-List-Received-Date: Thu, 13 Sep 2018 16:11:48 -0000
Content-Type: text/plain; charset="UTF-8"

On 12 September 2018 at 03:15, Douglas Royds
<douglas.royds@taitradio.com> wrote:
> The patch series already was applied on top of b7f3f7ecfd.

Fails for me too:

Applying: Reproducible: Tidy class description
Using index info to reconstruct a base tree...
error: patch failed: meta/classes/reproducible_build.bbclass:1
error: meta/classes/reproducible_build.bbclass: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.

