Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UIKhv-00059R-M4
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 16:13:42 +0100
Received: by mail-ve0-f180.google.com with SMTP id jz10so574169veb.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=2qta/GJyIC6IxcLDyBOaTMbofHVyUrF6Mzt+KUTgsfw=;
	b=CBAQZbyZDAZixoTjcLvSYqggtOO6Tzj9VZaIJaPX2GwdiAguAciZFhzO1hzmIPGuR+
	HN5MNETYDcsqaXeFc+sOirv2Z2Rsq/RrBhknxPqJMRKdOs1X6ivi4OuyYEb17Kt/Irq5
	gPZvcjnFyzIEZxJVD4Fg9u554IcpvJW8fIjha4S7hrTuhr0ekiOuqxeRyrgNQKfV5Bzk
	kl/Hu1DPRp95XNDIhSLjxa1KBmKFKhsgCIIrWcxbsskzOBSgSXYA9jAmti1kb5AR+Hjk
	VsL2Go83gArsR+AS0gja4/3j/W5UKZnoPW5ZUcxgPjHdV7tuRhvhggc0N+TzFBh39zNh
	7QMQ==
X-Received: by 10.52.65.147 with SMTP id x19mr7182678vds.27.1363791408334;
	Wed, 20 Mar 2013 07:56:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Wed, 20 Mar 2013 07:56:28 -0700 (PDT)
In-Reply-To: <CAP9ODKpRRTpX_Ksr4ySSatTCRV4e0f8PREJnP7E8gF02e6Rmiw@mail.gmail.com>
References: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
	<1363730053-7719-3-git-send-email-eu@felipetonello.com>
	<CAP9ODKpRRTpX_Ksr4ySSatTCRV4e0f8PREJnP7E8gF02e6Rmiw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2013 14:56:28 +0000
Message-ID: <CAJTo0LZbNPNV1vbzWyfd9RU7Tz2y0nfqbeB6Rrns6RJPhQtpfg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQlHJlOzOOsw2pVluJLXOzl15WzrLWPYjsrlxRKxcwH+MoOjXcbZwWA5oIADlbHZ6ZzvlkH3
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] qt-mobility: Add pulseaudio dependency if DISTRO_FEATURES has pulseaudio
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 15:13:46 -0000
Content-Type: text/plain; charset=UTF-8

On 20 March 2013 14:04, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Is it possible to explicitly enable/disable pulseaudio support?

Isn't PA one of those "all or nothing" options?  If your system is
using PA then you want support for it everywhere, if it's not then you
don't want it present at all.

Ross


