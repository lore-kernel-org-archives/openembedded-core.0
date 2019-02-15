Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id EEE927C6F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:26:15 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b3so16462753otp.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=hnHM2yV9K45MNlHMhxKGG46mtyupI/LShhtPzP7j3y8=;
	b=ShzB1gLd+2aY5bZoFExViXpNM+cTqLPLeID9IF3vPSN66BRm8NDEg2ssvIGB3r+hIK
	WJIIOzSt8dcihCsvvc15xOrdDmP7MKuUTwa2vkNbz/RjNA9MukwpdJF31RcJb8j5G0QN
	CNCLowp6ol02omSCvGRD/vvnRic4Z+00Z/233tRVhBqL7LoeXcsazTp0M+WvHJ8T2z7r
	e9FaAZtrKLO9K4mOsKJeDSnlfuWZ1mUM5qmUpRINrmOJxvlUm/MX/zYdKocp+cVZcw5l
	LdO7ZqV7et8hxoMJxWX9+Li0nQymO/2G03CLUp2b6SopgRf9GfaaAMoDExGZCcKc/wgA
	LeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=hnHM2yV9K45MNlHMhxKGG46mtyupI/LShhtPzP7j3y8=;
	b=rLzDlbA6dJmnJEmUWvitcD4yeD6v/Ce/n3VzFHgnYBXi0jWnWZu6Ohj7qr8Yyjf1h/
	ph3+GuUaXcxhHJGKGnlJ4St+VbbVk1OHSPElosc+eLJN0nyP78lRBRJCd7eqf7EC2Ez/
	x22F/wY36JI3suupn70ytVT/KvtTSmAAY9MT2NDaFfQjrnQdWWz1i4WkJJWuyETDR+xb
	E3b/4AeZH1LUQnMiYchfjTXcFuFXvFRMrjmom6BW+xzqRwEEtSsnuytgUo2RT/vucnd8
	R5OnUTfHu1j22uUckiGp+DmhGdabZUobtZj5rA+rtnqL7XLmVRTbpZ8vt3J/tOPO+OBQ
	twFw==
X-Gm-Message-State: AHQUAuax+lGERubvSY+NCoJCmoSiMfVtBahSNdiSvzmhjoqhaI9yt8pX
	76JHyBXh/aODEZshe2cU3rUQ+bI+jREavA==
X-Google-Smtp-Source: AHgI3IaDXJk9r6/ePrPbznVFOT2COgKd83iVPoGi0w/lguxwBWrmzWbfHhuUk1Vcqlz6frz/cpTHjw==
X-Received: by 2002:a9d:5605:: with SMTP id e5mr5961128oti.226.1550237176644; 
	Fri, 15 Feb 2019 05:26:16 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
	[209.85.210.53])
	by smtp.gmail.com with ESMTPSA id 21sm2881661otj.6.2019.02.15.05.26.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 05:26:15 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f53.google.com with SMTP id i20so16517392otl.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:26:15 -0800 (PST)
X-Received: by 2002:a9d:4799:: with SMTP id b25mr5857159otf.294.1550237175131; 
	Fri, 15 Feb 2019 05:26:15 -0800 (PST)
MIME-Version: 1.0
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
	<CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
In-Reply-To: <CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
Date: Fri, 15 Feb 2019 11:26:02 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqTBM7Y0APGnLOHDxBRm8wpw1p4ocxyW4soZWhPn+vcZA@mail.gmail.com>
Message-ID: <CAP9ODKqTBM7Y0APGnLOHDxBRm8wpw1p4ocxyW4soZWhPn+vcZA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 13:26:16 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

On Fri, Feb 15, 2019 at 11:22 AM Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> In my opinion, there is no relation with an update and change build
> system, once we can use mesa 18.3.3 without meson.

Agreed.

> On Fri, Feb 15, 2019 at 1:11 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
...
> See commit 30b10dbb7c6f6bdf3e489620f8333c727bd3a6dd
> move ${sysconfdir}/drirc to ${datadir}/drirc.d/00-mesa-defaults.conf
>
> We can remove ${sysconfdir}/drirc from FILES_${PN}

Agreed. Alex, as said, we need to upgrade first and move build system next.

Also, the build native change is another fix and should be sent
independently, with a proper commit log.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

