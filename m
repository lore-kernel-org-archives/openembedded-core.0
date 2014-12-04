Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 929DC65D34
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 20:47:07 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 9so8295940ykp.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 12:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=0Je1RE09VfyYvrGFTFb3sCSO504CI3+tDFAs08C14MQ=;
	b=tF55HGbltzDGHcBQZlxgBugGmCUCNaV6rZwE/LbuakcuEagKP3226FhS1rNYL2D6z2
	QgF5FYC6T0vC2RS74V3VlM4McwgvJwYWHll2ijFkJjpF36zaIIKt9amGdm2JvkYydp5v
	VZklNYRFeinp17rpMd+EZMvxqdTntywTBm3qCOBI9gT/opRED4vbdgnZ4IPXXPDkbZTN
	KcdrXEQbsXmxZ14Yhc+slkA7AIHYCpglKbQtprLmNAv+MEZkXcxKD6Cgc0QWk9lfh8U4
	Tx5fPoLaEMwi65e8DlCS9lHNberGAmxCPfUPLZrtHQTVe6qJeUO1/9ckqHrRlPRugEgN
	wLWw==
MIME-Version: 1.0
X-Received: by 10.170.47.210 with SMTP id 201mr18698699ykp.30.1417726027990;
	Thu, 04 Dec 2014 12:47:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Thu, 4 Dec 2014 12:47:07 -0800 (PST)
In-Reply-To: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
Date: Thu, 4 Dec 2014 18:47:07 -0200
X-Google-Sender-Auth: EOub7bEcqBE1vzirG8tdOD3-jDM
Message-ID: <CAP9ODKrh_p=yv7x2hWg7QcV_4vG2xvF+7WgcckMqf=FU457ovg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Busybox mdev improvements
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
X-List-Received-Date: Thu, 04 Dec 2014 20:47:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 4, 2014 at 8:27 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> This first series fixes the touchscreen support. A patch to automatically
> have mdev mount storage devices will follow soon, I'm still testing it.

I enjoy this idea but please put this one in a specific sub-package or
with a setting in /etc/default/mdev to enable/disable it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

