Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id B6009781C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 14:02:39 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id e124so7473495oig.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=M+Y3Cu/ubTF7wBsggjcIplCSRsDSwietwtllXzmzrFw=;
	b=Ll731HyM7GcSLWJXEhOCGG5OLK1T2N5ElptCHl1/YocNpuUPXIMV/QFwJweXAduECV
	PV2OaT1HYQj6aTi4j3sVbexyXh8f2HyVz5Ax+x8g26QAwFzZvwGeEL8JdBwTN1dMnDEA
	hLWxO8bT8sSz9rXgIvLhFLjXAymqcO5gjIjF/IHNMmd+iPCapp8iAz7n/FfyLf8gEQas
	QShwa4OQA/PHcQgK4ewCBn/B+r+l4EolvINU+AWFLqFfWSPInY07UY6B2NM310LuLjRJ
	dQ17WcT22GkWa045SczkxQee4HbcvA6eaFEU7Ugcm1Lu7E1vTIeGUnAtE7uqNs+jNgUH
	ExvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=M+Y3Cu/ubTF7wBsggjcIplCSRsDSwietwtllXzmzrFw=;
	b=kjwC5ZdSFuuzn55NFCBdJtS6Hvtl7kOkEEXywqyLT6TOiW5dq2NwiRACP0197Ae6gV
	Mrf0j+R1UheWG6bI7R/nnJaGBS8lUpUbs8kI7hiylXDRR7ZUS6+vKEJvRGDDSBHh5Rsg
	GFrMcZXx4oq6l76oV4X/6hFxFZz62r7FlL1ed56REiDjsYyrpVIdvYD6MOPtmn6GuYPT
	8v/ayWAXecLHHa4kpq8qyAMRuGX+z5jtF9uKEury48OV+vphYwdl3bqACpcN8ClgDwuz
	jDX8aL0FeHTSpwwLrNw+SRFmL01oyKMrFJ3qeH0OYGDXQbHe7Q+UY4XSR2nc+wIHncMx
	HRmw==
X-Gm-Message-State: AHYfb5gcsQFTk9y4zJW6l4Gz0SOnLBfZobRj1n07/K05YJjnbXH7YnkT
	H7xH7S6+7MXTD+tpHoQ=
X-Received: by 10.202.72.70 with SMTP id v67mr13867748oia.83.1502373760295;
	Thu, 10 Aug 2017 07:02:40 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	s69sm7679289ois.15.2017.08.10.07.02.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 07:02:39 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id g131so7359081oic.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 07:02:39 -0700 (PDT)
X-Received: by 10.202.184.8 with SMTP id i8mr13750839oif.266.1502373758710;
	Thu, 10 Aug 2017 07:02:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.247.10 with HTTP; Thu, 10 Aug 2017 07:02:37 -0700 (PDT)
In-Reply-To: <3a2e0473-4ff8-21c2-b5f9-0eef996413fe@pseudoterminal.org>
References: <1499267003-20382-1-git-send-email-maxin.john@intel.com>
	<3a2e0473-4ff8-21c2-b5f9-0eef996413fe@pseudoterminal.org>
Date: Thu, 10 Aug 2017 11:02:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp9sALnm09F4y6NRN49Asi1z2moo9+bfjREjObR=fQijw@mail.gmail.com>
Message-ID: <CAP9ODKp9sALnm09F4y6NRN49Asi1z2moo9+bfjREjObR=fQijw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/12] gstreamer: upgrade to 1.12.1
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
X-List-Received-Date: Thu, 10 Aug 2017 14:02:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 12:03 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> What is the status of this? GStreamer is at 1.12.2 now, and these patches
> are still unmerged. What is the blocker here?

Ross?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

