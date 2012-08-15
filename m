Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T1U3N-0002eM-Ed
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 05:13:53 +0200
Received: by eaad12 with SMTP id d12so282167eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 20:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=VdvZ2jRs/fC/A1BbpHGyc3SsJ18NsJlyRZP8uRuhFkA=;
	b=pijYoHuGGNnyyb4P5gZBa3jGPanWjYiDwDkexFn4BEbI1TsNCEhujFzMCAmQfGV53l
	UehJnu9Cng8z73i0YbTaGGR6Hme6q5lwrDyfk+LEWgeIgMvPz5Z1f4wf4s7Ltmce5AZk
	PljnWH7UrAhX2dqPaoldH4drpqTguL/9wsXJ191pTf2t1IN6VSRDN/vAuhMgl94baQTT
	/U2JhyAytDIAuXv4FUrM0bLwoEL84bn1MTT7vopR9qCagE6ya4Q3eqYKInoN1H/NDJBt
	ocJO8tNNI5TDhTubVnL+kR/VkqeJYTF0hb8WSdE8LtRGjJ87k8JGIv5bQHX1/x1LAJ3P
	biog==
Received: by 10.14.203.69 with SMTP id e45mr22431164eeo.23.1344999717929; Tue,
	14 Aug 2012 20:01:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.225.6 with HTTP; Tue, 14 Aug 2012 20:01:27 -0700 (PDT)
In-Reply-To: <1345000125-3865-1-git-send-email-b19537@freescale.com>
References: <1345000125-3865-1-git-send-email-b19537@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Aug 2012 20:01:27 -0700
Message-ID: <CAMKF1so5imbcuFU1Ad2FXD8zQmAyLSTbfSS0kNtvQSE_Wj9JbQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: udev: update rcS to auto-detect hostname
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2012 03:13:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 14, 2012 at 8:08 PM,  <b19537@freescale.com> wrote:
> echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a-z]"`

$ echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a-z]"`
model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz

is that what we want ?


