Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UIKtk-0005TQ-ND
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 16:25:53 +0100
Received: by mail-vc0-f177.google.com with SMTP id ia10so1412840vcb.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 08:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=B/bOUk9TBASn9eKpToH1Rt3ej5ETBQkuNhZBDBu6SGw=;
	b=Q8ve9VIl84WkdzEa06I9AlB15f8zoiSOntmBVa/1s9w6aDGC81Dqv5HbKBe6zgf/bS
	B86QedurVVVcHudlbaiKbP8ECnMix4bCPciYwr3YdoBLVsKqc5mr6hktz2Cndgg1h8L6
	PTDrEGa7YpPeTyxNvoYyL9q3GGPSwa9mAy9J5ndPTI6z6AFZKBPYt1uRvPT+PV+7U+sG
	q+8aY35NXw4ZJrOP/wW/KfSVqrlXFeGdE3RMN1eNYSfehf8KVbzhsskJjBGHbs/tIUjJ
	nYKHnzLLHQrzBuMCANCx3x1NIWuPpWP00b4gD9cK9GvLGn79gcHY0V1dsVXaVY3+qJ3E
	IVHw==
X-Received: by 10.52.75.65 with SMTP id a1mr7043607vdw.79.1363792141367; Wed,
	20 Mar 2013 08:09:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Wed, 20 Mar 2013 08:08:40 -0700 (PDT)
In-Reply-To: <CAP9ODKr6LLLHZnao_nS3OsMSk9M1ed+Na-yD5kp7545qghv41Q@mail.gmail.com>
References: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
	<1363730053-7719-3-git-send-email-eu@felipetonello.com>
	<CAP9ODKpRRTpX_Ksr4ySSatTCRV4e0f8PREJnP7E8gF02e6Rmiw@mail.gmail.com>
	<CAJTo0LZbNPNV1vbzWyfd9RU7Tz2y0nfqbeB6Rrns6RJPhQtpfg@mail.gmail.com>
	<CAP9ODKr6LLLHZnao_nS3OsMSk9M1ed+Na-yD5kp7545qghv41Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2013 15:08:40 +0000
Message-ID: <CAJTo0LZZMFBbUBgNo4iQ0Dj8CgWe+1LhDE6yY4RvRUuoNat6LQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQlMVvXq7jqIaQSP3M9WxDlJnN/1A1lHqwYseIc7gMgQdO82HAfBHn2wIGNhxIyjPdnc74Xe
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
X-List-Received-Date: Wed, 20 Mar 2013 15:25:53 -0000
Content-Type: text/plain; charset=UTF-8

On 20 March 2013 15:04, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Yes but if we don't explicitly disable/enable it we risk to do a host
> contamination (for example building for same host arch)

Oh, right, your context wasn't clear.

Yes, totally agreed, and this is exactly why PACKAGECONFIG is so great.

Ross


