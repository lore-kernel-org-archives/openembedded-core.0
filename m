Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDAA6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 13:09:58 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id g125so26601928oib.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=yr5+IMZtaToZPHD1jGE5KUc7jJ6j9qhOiLxw+2Cq88Y=;
	b=YH92O2ZUvsROnX4AjzgKZupQ6StK1Xb9KhURjX2Ea+D7WnDfjOQv3qH7TRSce38szI
	Dqh3L+nddUlqVL1L67vK7iZuHcaK2T2ivnl7zR2GOjelo1rVEbF8cUwYTkYz4g9buGi9
	GFBsSdLZe1RyCHBlS/uLabApv1TrLkoLWRo4UGifHo/L8lS4hcReniBkLzW4awSnLa9E
	T05nqtFeUo6SomaRIE0WTIsq69Q2youuob3jRqCPGXniWiw1j1+66xASfjRgMz+lOJ+i
	45cdiKLaLwT5skBbtx2EeW277FtzSx36E0JkOd8v+7ycbxgjn3rPx/CEKiNO7g7h5uiB
	q0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=yr5+IMZtaToZPHD1jGE5KUc7jJ6j9qhOiLxw+2Cq88Y=;
	b=aexEkkAQcbyoFyUSSA8P4E5veff8QDMyZs/jXlxKfjD06MQdLsJQREXSFW1KIasPVw
	fmLMbIuU8x0GS4IUhRrAs2kddVGtyi4/lEYsb0mA3GkN1qSf3QUOgi0LdQn6DwPoZnGm
	OI52KyoTMwXfDNxnhqsG/mLAjqMDJNfbAE97abag+IgmwE6d8VQ8fyG7g7APsLDhwIA3
	Qyc81FPyxfHQwsgR2tTSCP419QHI4TawSMlw0I8KCYA8vjNG2mYBxU50ME9WIoYxrP5y
	7rVlC/JgtkE+qMjWpP4LR9Th9/vAMskzE8N/Hn33ITP6s/s1P+Zum0byT6/vCPFPJ3xL
	P7sA==
X-Gm-Message-State: AMCzsaW40Oj9jbYr0WMjV1oT0lKrpiULyQQAWSq6If1UdsjDWELRuvaL
	L4H2HeelgPSnsHYb+Uj/ToOLpHqd
X-Received: by 10.157.56.45 with SMTP id i42mr6492841otc.61.1508677799965;
	Sun, 22 Oct 2017 06:09:59 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51])
	by smtp.gmail.com with ESMTPSA id o58sm2842887otb.2.2017.10.22.06.09.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Oct 2017 06:09:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id h200so26598072oib.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 06:09:58 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Tmag+GG8d0gjHffEQarHBEWCQVTi4UqMorYuUSFh8HhvH7qy3HWVXyC2zjhan2D/ezmkvPAifAG7tUuRIHcLE=
X-Received: by 10.202.205.66 with SMTP id d63mr5657158oig.352.1508677797876;
	Sun, 22 Oct 2017 06:09:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Sun, 22 Oct 2017 06:09:57 -0700 (PDT)
In-Reply-To: <1508587571-4733-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1508587571-4733-1-git-send-email-richard.purdie@linuxfoundation.org>
Date: Sun, 22 Oct 2017 11:09:57 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq_cbXjby0USY==7gZVsHAShjKK9q7oyhDFvEYLhJrbFw@mail.gmail.com>
Message-ID: <CAP9ODKq_cbXjby0USY==7gZVsHAShjKK9q7oyhDFvEYLhJrbFw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-buildenv-internal: Fix finding build directory
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
X-List-Received-Date: Sun, 22 Oct 2017 13:09:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 21, 2017 at 10:06 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The intent of the env setup scripts is to set BBPATH to point at the
> build directory if not already set. This means if the user changes
> directory, bitbake can still find the original build directory. The
> default bblayers.conf files reset BBPATH to the correct components so
> this is safe and restores the behaviour the script was intended to have.
>
> [YOCTO #12163]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

A warning letting user know that it not going to be run would be good,
also printing the current value

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

