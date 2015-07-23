Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id D7583761B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:52:50 +0000 (UTC)
Received: by pacan13 with SMTP id an13so158966656pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ir3NiA62BeUV1tqQnfP2tJ99H9Ymawey3W5hjz8Xksw=;
	b=MuncrO8OJ+tFwWclFZImYa7KksXnabKFRCRiXVBxHI+txa+GwKOPWJ8xtt0fCqBZCS
	dNkupOgrcTbHM0HuIyQ5tRX/WCBx3T5uXeeG3FkintH4zQPz6iEMPDhD3NHGZRCkWdq3
	RScbN3tO0ZkWDxwZzd30iK6hpfPuGZh5x8T4z66O5H/AsIYmZFAcuThG6TjBJxAWCLzh
	qLzbGf7oXkz1gVcKN/FEf1/Co+IC47TrWYwdnVVYO+cMYH5hNB4rEMO+Gj/pvvDamIP+
	qq2Fa0MsjV8pvxei1UAzv6xi3YBhjTjXBtYAIsX1oLCBeZ/A1l3ctQnXgVSOaDt+RCMV
	eQZA==
X-Gm-Message-State: ALoCoQlEGAqsLSBUamFb10dmqAdxStddyXGY3QC/vMu1QC54pOJEspz0ouRdTW7qRupFnvyTSNc0
X-Received: by 10.70.91.206 with SMTP id cg14mr18135766pdb.83.1437655970626;
	Thu, 23 Jul 2015 05:52:50 -0700 (PDT)
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com.
	[209.85.220.49]) by smtp.gmail.com with ESMTPSA id
	pa1sm8905253pdb.73.2015.07.23.05.52.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 05:52:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pachj5 with SMTP id hj5so157222796pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:52:48 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.100.105 with SMTP id ex9mr18626938pdb.115.1437655968020; 
	Thu, 23 Jul 2015 05:52:48 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 23 Jul 2015 05:52:47 -0700 (PDT)
In-Reply-To: <1437658192-8322-2-git-send-email-b54851@freescale.com>
References: <1437658192-8322-1-git-send-email-b54851@freescale.com>
	<1437658192-8322-2-git-send-email-b54851@freescale.com>
Date: Thu, 23 Jul 2015 09:52:47 -0300
Message-ID: <CAP9ODKo=EDz4h1fCU2DDF+oqGaoqyPeddfFhtwU6+f--3OFc5g@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 1/3] gstreamer1.0: Add patch for Gstreamer 1.4.5 including baseparse, basesink, inputselector
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
X-List-Received-Date: Thu, 23 Jul 2015 12:52:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 23, 2015 at 10:29 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> Bug fix
>
> -[baseparse] Handle base parse error

This patch seems to be under discussion at GStreamer team and no
agreement has been made yet; this shouldn't be included in OE-Core.

> -[basesink] Fix QoS/lateness checking if subclass implements prepare/prepare_list
> vfuncs
>
> -[inputselector] Block EOS event of inactive pad, send the event after the pad actived

Fine. Both need fix in Upstream-Status (dash needs to be included,
plus version it has been backported from)

and finally please split it in two patches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

