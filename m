Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 55EDF72899
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:43:38 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 20so569447yks.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 06:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=HR0EYmGafseveM22PqEervbcq9NFbLP4yDobzV2l5Ps=;
	b=o/0wJ2VKcZUtp5+Dt4mfcUF6SJ7GgJ1Mac9OtvSXe7U9KtXNlv/01wR8XRjTT6ZhqU
	uETuVaZY/TEJTO8T/Z7iDwKbOphJY5Ekn1T4Wmidx7qFXgtRZPopXmx5fGkuPb6IN+jI
	AYnBbQq6C9xQVKKntRE+cWmroPCUG2bHR1W+uBrjReQJNFefBdl4ViWjkY/kQBBrmEXs
	IAEKZ5L5LX8wSNfEC/1U4ord987Eyrat9GxbG5Eb1twISD7ktaToexOTvbx1Dch8d7wN
	O4O/Ldc/7RpUo2vFJ5eujC1NUs/QM+r8oKiRN1zGfgL8tf3BJiVlEMIrBb8vUTygWjxL
	mxog==
MIME-Version: 1.0
X-Received: by 10.170.130.21 with SMTP id w21mr2382089ykb.22.1418913819241;
	Thu, 18 Dec 2014 06:43:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 18 Dec 2014 06:43:39 -0800 (PST)
In-Reply-To: <1418912251-3313-2-git-send-email-mike.looijmans@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1418912251-3313-1-git-send-email-mike.looijmans@topic.nl>
	<1418912251-3313-2-git-send-email-mike.looijmans@topic.nl>
Date: Thu, 18 Dec 2014 12:43:39 -0200
X-Google-Sender-Auth: Yv8feknVUmV2HRfmiCEpnjDXRwc
Message-ID: <CAP9ODKrk8tFWcz80KvfUCUq3EMR6151=-f+PxU-F6p4mXPA3fw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/4] busybox-mdev: Install missing find-touchscreen.sh
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
X-List-Received-Date: Thu, 18 Dec 2014 14:43:42 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 18, 2014 at 12:17 PM, Mike Looijmans
<mike.looijmans@topic.nl> wrote:
> mdev.conf references the find-touchscreen.sh script, but this file
> was not being installed. Add the script to the busybox-mdev package.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

