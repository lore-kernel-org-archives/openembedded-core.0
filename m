Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id CAE5F6F8FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 18:53:47 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so1343553pbc.21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 11:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=IBdliW6SbEeHJyMlnXllLqtkU+q6XDak1Bv8xCiyA6E=;
	b=e1nRbwVPIdAueJ3nn7uFctRsQylBPAMHmvrJOMWPf4FI3bBEs0MsZB+OGl5j9JTMOP
	6KhQUINcOjQL8j44pvZMTotb7wX4j8cWmEPz8jnf7GLipx2axrhWjkTs+ptFrY7egH2R
	xt0X2zqpJrJH3emqRzw7CMDq78bqIZr0C2FUUQ4+dW7nf/XBdeVntED5TDrCOT/Ps+Df
	0kJO/kAYBR5q2nwiiVFq+fxNjE0WqitycDCmQuacbYSnCvk/i1PzTThE0ZGdTcoPxthi
	rSiMZyI04sd8xwx5l1sajDK80aFYeQwtXvOQjPbguAKgBPyidvRcn9+0XAuKyMtGb1qf
	oW2w==
X-Gm-Message-State: ALoCoQn3SZp4KuyWnhbU9BCdYlw5aj0Vv4+Kmhr/xZwX6jAWjQqw7BbBOaAJIz2/yqiEwIIzGxwL
MIME-Version: 1.0
X-Received: by 10.68.189.5 with SMTP id ge5mr48455888pbc.42.1395341628497;
	Thu, 20 Mar 2014 11:53:48 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.11.164 with HTTP; Thu, 20 Mar 2014 11:53:48 -0700 (PDT)
In-Reply-To: <CAOMwXhNx8XFYQhKytm88YtCfqPxAgOcB4VnNgwDfqkng2aN1uA@mail.gmail.com>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<CAOMwXhNx8XFYQhKytm88YtCfqPxAgOcB4VnNgwDfqkng2aN1uA@mail.gmail.com>
Date: Thu, 20 Mar 2014 18:53:48 +0000
X-Google-Sender-Auth: i9Dppx4EWUIO3_1RiELGZ3Ymepk
Message-ID: <CAOMwXhMpandYbNxMJqx254J-365Hmn1h=sHi43q75-J1DRC4eQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 18:53:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

What is actually probably a bigger issue than the LSB, is that the
conf is currently sourced. That means if it contains an "rm -rf /"
statement, it will execute it.

Perhaps, this should be solved more gently...

