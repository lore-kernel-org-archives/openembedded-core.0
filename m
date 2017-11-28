Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2DCD07826C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 11:47:13 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id d27so33906ote.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 03:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=oZyMVoyqPxcFByljwg6/xhhMZIYPcgPTK1VJoF+7F10=;
	b=aPQjkFtYmOnRM9Cv0AC2s7aZmQnkubWVgwCdlstALL6CT94qQIs+0t2S8kRCNOCyKd
	8s3pOCRCgAsllPK3jC1RsHIjIliYr1YM+KqAWoFJBRxwni3ItFBacBlyzcyewTlVe1JD
	ygqYCur+EC73EuBRNRUwCGETRuMEkgsRiAlHNuVgvCE+P3uvEx7lqdgXjO5+9M+p/bqP
	XBFrRUCPkL+iWMWMer9SFpF8c06uiH5FxfNwzK0KxPlCscYGz+/N7QGKOK6ZrAjynVX/
	EsJrLQAzCrJbcsCU+ik3AN7Qw4RMAJcNuFmgixH7orEtgqX3yCYINPUeO+0gYgnGNFCB
	ELGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=oZyMVoyqPxcFByljwg6/xhhMZIYPcgPTK1VJoF+7F10=;
	b=ff/L2JSxe/kX4mm3rBTGqUJ+r7ONWAi6heZmdaa325/2/jeNOqhFziGxgvY6NMPb9Y
	OV8UHQEmccghBOZ5F2QJcA7BnCe3mD5Ide+1X+65zKyFNzb9prYbZXpPCqurdhxapd7U
	sr6FcEFz3SzJRj2lIDVA5ryaN/IS0o38tZ9aQ1kKYiVzgq+loL5qUDrkwASC04ozHzUY
	0DAVFAincPIejUrfHXRZshIfNIg41cANgOZcZOSh+DRsWLlp9bd4EEDqRIQGuWr9qk5Z
	JjBcx9cZuT0oaRe0rq2nTx/yl0jhL/T5PZRbmvbaJUJHZWIrc68U0zgJHQE0gP33Ojeh
	xLWw==
X-Gm-Message-State: AJaThX7MNXu/w6ql6mn5lDXZIZ5L588RLH8O3CXlFtxqDJdV8Gu37uaZ
	beYi2fzp2NrLiIeyf5ZYpqErbDG8
X-Google-Smtp-Source: AGs4zMZGVDgeTAaadliUHrowl1FEWfF04SGB2PIXwSzDRIWsaE3h7gvKTwyKjWtrChX6/0KlI+1GXg==
X-Received: by 10.157.39.45 with SMTP id r42mr34789032ota.71.1511869634783;
	Tue, 28 Nov 2017 03:47:14 -0800 (PST)
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com.
	[74.125.82.170]) by smtp.gmail.com with ESMTPSA id
	a39sm13369491ota.59.2017.11.28.03.47.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 03:47:13 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f170.google.com with SMTP id g104so43695otg.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 03:47:13 -0800 (PST)
X-Received: by 10.157.36.18 with SMTP id p18mr31385045ota.191.1511869633235;
	Tue, 28 Nov 2017 03:47:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 28 Nov 2017 03:47:12 -0800 (PST)
In-Reply-To: <1511810927-22695-2-git-send-email-martyn.welch@collabora.co.uk>
References: <1511810927-22695-1-git-send-email-martyn.welch@collabora.co.uk>
	<1511810927-22695-2-git-send-email-martyn.welch@collabora.co.uk>
Date: Tue, 28 Nov 2017 09:47:12 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq=Qb+wcS6Cemh+Xeoe8imWek3avaRoUcOSREEAW3Gtvg@mail.gmail.com>
Message-ID: <CAP9ODKq=Qb+wcS6Cemh+Xeoe8imWek3avaRoUcOSREEAW3Gtvg@mail.gmail.com>
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 2/2] core-image.bbclass: add default IMAGE_QA_PROHIBIT_PATHS variable
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
X-List-Received-Date: Tue, 28 Nov 2017 11:47:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 27, 2017 at 5:28 PM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:
> Add a default IMAGE_QA_PROHIBIT_PATHS variable containing paths known to
> be mounted in the default fstab, which are known mount points or
> directories which should be populated at runtime.
>
> Suggested-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

