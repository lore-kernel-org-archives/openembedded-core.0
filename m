Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4F88971B9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 09:19:19 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id b2so13136332iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eqr8z7qdDIkVAk70Idkj1yoLfN7MA8l4t/xs/s8rPf8=;
	b=mWBe/DRmI5mb4jXMQx9m/yaidgLovXCaLCsQSUsUpJra34bgWF+salQvSsjaw3x/da
	Tp/tSFuCe063fOFdx52yQi1wfPIr6rHFeZg/6laaDDO6276QRpHuBPWX+EWer8dqMFyh
	CGIyLksY9D5gVmFvUkP/UUKF/PldeLC12wI29HerPiBdJujRgr0ckAn/HlFCmkQfb5u0
	Ns9ufbk38KeFpRuhD6+f1s2YZ8A4BZGzXn9YDV3945ARmj2N4h9MRzvBZi+p+wYkn5py
	sgkfkFqoswukVxy6c7XOEQLWBlasdMxk8+GE0HlnwLCqOwtW4a56eSk9SgA6kjkayqfN
	xgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eqr8z7qdDIkVAk70Idkj1yoLfN7MA8l4t/xs/s8rPf8=;
	b=CRrBr0FLJ63dpp+/G+zd8jzlep+cHhJC6/9QEt+blStI5F1VTShyiz7ZRaxgMmhb+B
	DXmZThq21p2IqCHpLV19FVPqB5UKHqhKxxstGNxrTsgur9FaxDA/Ln18/lWJxpRbxmay
	fDie/uJFnXbsSup3XVY2b4ZBqQEmcUlc7j7N2asF+szxcpupPbFRCRZsf8XusEyQYBUt
	2lshWSKUYJEQGzk9FZrwwLdRJMsJG3m3HYZ6pDv/mfVZkIeCZtiT4RGwGu1tf1/OClDa
	xINLouM/gLfKhiPaXNFwLgu+j+QKXv83b1WEfb4dxti5+5Yfz/W6xnoC1EYDF00TxJNH
	YMHw==
X-Gm-Message-State: AHPjjUg3E9ortxWBPe+7KmI0JYOyz9FNZ36nPHSCF8bQxyV51QoS4EfV
	XKE/Cop2LWFVf8lvmMBxUCtPWE4MzjNi
X-Google-Smtp-Source: ADKCNb5L0ynJrPf7HWQaBC0SUBrarV/dgZq/Z1t+l8u+BLhQTMmwpUJE+77Al6AjZOVGBsP4xhQ2Lw+y8TuxJnF4WWk=
X-Received: by 10.36.143.195 with SMTP id k186mr3411696itd.88.1504603160657;
	Tue, 05 Sep 2017 02:19:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Tue, 5 Sep 2017 02:19:00 -0700 (PDT)
In-Reply-To: <1504597605-18076-1-git-send-email-ankit.tarot@gmail.com>
References: <1504597605-18076-1-git-send-email-ankit.tarot@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Sep 2017 10:19:00 +0100
Message-ID: <CAJTo0LbyFH-7a2Yq4TpBcYJ5o2D6t5s55qJqhk9s7b29RkAX8w@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ell: upgrade SRCREV and move recipes to core
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
X-List-Received-Date: Tue, 05 Sep 2017 09:19:20 -0000
Content-Type: multipart/alternative; boundary="001a1145ed82eb618c05586db86d"

--001a1145ed82eb618c05586db86d
Content-Type: text/plain; charset="UTF-8"

On 5 September 2017 at 08:46, Ankit Navik <ankit.tarot@gmail.com> wrote:

>  7b7c15c build: Include check for xxd binary when in maintainer-mode
>

It's too late to add recipes into oe-core as we're now frozen for the 2.4
release, but if we were not what would the rationale for adding this to
oe-core be?

Ross

--001a1145ed82eb618c05586db86d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 September 2017 at 08:46, Ankit Navik <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ankit.tarot@gmail.com" target=3D"_blank">ankit.taro=
t@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=C2=A07b7c=
15c build: Include check for xxd binary when in maintainer-mode<br></span><=
/blockquote><div><br></div><div>It&#39;s too late to add recipes into oe-co=
re as we&#39;re now frozen for the 2.4 release, but if we were not what wou=
ld the rationale for adding this to oe-core be?</div><div><br></div><div>Ro=
ss</div></div></div></div>

--001a1145ed82eb618c05586db86d--
