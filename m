Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id DEC10749D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 12:25:52 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id b18-v6so8450968lfa.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EiH+KyD+C2mi/3fA3p5MIkrW3EnfGwf2Y2VcHEU9g3c=;
	b=WAgFt+Fr4QrHQRsHA4hMc2jbsLpjB46UCcqkZMcmgCIB68OOxgFOUnHLhRnJECchxv
	2ZqmDuKqEGEPsF0IEIYZZpHP9xunidvVJdUBVSaWUkyiRnHw6282C7Q6Mwm9dXOFeN5f
	OK8nqIOjWcjQOxbtLdwMprPsRNRuTrNOnU2xT/ypm5gPaUUSnIXEpavowSZqRwU5lQ2j
	BRbJqWzguzA32M3JAEGLLPMZpxPYQeD1gvGe3lgYp3Jx0i8XvlqUWR3YekGMJHLZ0Cni
	ISPRnXYuX607uGz1OpI7TFbVuw3Jt0zxK5ITgnBSk9dbmbxGOldjA/TQDOnt7TGnbQqO
	gyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EiH+KyD+C2mi/3fA3p5MIkrW3EnfGwf2Y2VcHEU9g3c=;
	b=V/vZJncXmcQ4Sws1xWf5qJbxokUWCc6t7e/1BogWP4tgvcOH7eKhtSVvTEvYmwjMZb
	44QVo+/TSlSHV4b0Rr1WDZ4UD21Pj2s/2IPrMTDulXVluQSk5JVyhiY8FTm6jGA3wi8N
	3kbFN9Tgh+ejDvonNyiujf6Q83whFjslAE8IXk2SWJOb6mBIcG87czCe81uZ7IzrOxYY
	zFaCC1LblwoFe+Euc7Q1oVO6GAgLUFSTPDN2cNlW3OUlZIkXfvhql4erRODK8AKpuQfm
	5r4eDmCMKUiT9iw08LkTUq4i1xr4sPcOqmuaGgtOQHInB54gBZRwN+o8Fs+LrbTGnrwE
	9uHw==
X-Gm-Message-State: ALKqPweGPScwrNL7fzS2By2ZKSa2DvlsF/Zs2Cy3uETlyDtgzFZGJN+V
	/yPx49DFetGdx/pTUgX2co8TS6ThyAQ11TXIeHh4V1ki
X-Google-Smtp-Source: AB8JxZpl48XwHPVYhfI8bsgoyCiAoE3upvKGd4n/dOWr05FYPvI4XYO3mVPGRxbnSfDWuPiu4wLtpjN+pC45rgUt6cI=
X-Received: by 2002:a2e:760a:: with SMTP id
	r10-v6mr2961833ljc.144.1526559953106; 
	Thu, 17 May 2018 05:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180517085704.28799-1-ricardo.ribalda@gmail.com>
	<20180517133916.0c6b0a9c@t460p>
	<CAPybu_0Uprq-Qitz_ER3rfp01MfD4RXDw3LtmHj-3rMG=TNVVA@mail.gmail.com>
In-Reply-To: <CAPybu_0Uprq-Qitz_ER3rfp01MfD4RXDw3LtmHj-3rMG=TNVVA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 17 May 2018 14:25:36 +0200
Message-ID: <CAPybu_3=pYogTmPU-CWjtbU0M-WfyEhkLJ1L1LukC0Tcc7Wa+A@mail.gmail.com>
To: obi@opendreambox.org
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] apt: Port apt-file to busybox readlink
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
X-List-Received-Date: Thu, 17 May 2018 12:25:53 -0000
Content-Type: text/plain; charset="UTF-8"

BTW

I have just filed a bug to busybox.
https://bugs.busybox.net/show_bug.cgi?id=11021
Lets see how this evolves.


--
Ricardo Ribalda

