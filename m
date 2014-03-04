Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id C36A96E759
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 00:57:42 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so4328497yho.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 16:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3UG58ennSfixMMy4drqISMm7s0en+FshDg4R+sFZ46c=;
	b=drkt39ufGqzxioHOLjwLxoVB+61PmSFTeb+e8P+37J1V39M1Q+S8etRTer1Hu8p2Yf
	y3aWQatmJN/UQiHtyouVsSIQ36VuLPeq/SYBX4j63d+pz6Pc8ZwXBljL7ivKMLoxobc7
	C5ZgWgVCtyVnYLHEve2QQ22+rWiwUCiH7l8Haq9yFrTxLX0nOQOHiafjJwHdt3noDB3/
	/9Fwm4Y3qNXnAISJVA0Sz0fg7Aj4vNy2CXi7slmRwmY3r5BYjHXBL19g6iSGu7fE2V6X
	XrhpLmdETKZvhxhXsHzZ0znH9LNJ3UwqxcHu+kd/2OZDiO3FBUyGw1YH5/Okf9VZEA5r
	Tr6A==
MIME-Version: 1.0
X-Received: by 10.236.3.10 with SMTP id 10mr5401512yhg.79.1393894662679; Mon,
	03 Mar 2014 16:57:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 3 Mar 2014 16:57:42 -0800 (PST)
In-Reply-To: <CALmOhgm_ScJQNZecKUQS-ki4+YkX_nYuZUDpYZcsLqjYSsECZg@mail.gmail.com>
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
	<4343044.DpKneM5m4P@peggleto-mobl5.ger.corp.intel.com>
	<53105913.6020407@enea.com>
	<CALmOhgm_ScJQNZecKUQS-ki4+YkX_nYuZUDpYZcsLqjYSsECZg@mail.gmail.com>
Date: Mon, 3 Mar 2014 21:57:42 -0300
X-Google-Sender-Auth: nD_KuQR9qEgyZ9_tDLqRsqV6XWQ
Message-ID: <CAP9ODKoDYzbYmRkCuTFypk+4uA+JE1aFifdj2KBw=hp2_hwCRg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] do_rootfs: Added PACKAGE_FEED_URIS functionality
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
X-List-Received-Date: Tue, 04 Mar 2014 00:57:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 3, 2014 at 5:41 PM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> Does this resolve issue 5407?
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5407

Seems so :D

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

