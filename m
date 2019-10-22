Return-Path: <dbaryshkov@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id B64C97F69C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 19:24:46 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 205so11251886pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 12:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DYh6y/4f/ZzmdAB+aLXN83B+eqEAEOJlzzX4fkl1DlI=;
	b=lqHTHHG0X+GmIc3fe9v1PRUDu9Pjza0ll2mmeuVVzkYl5KuRvJeBmfN+IMODHAe0Bk
	5v4KjxxwlArlPR/qO9EkEhUQQzb29slmUteLneHIBX/BMTKeVh828RURt4aBeHMU97qG
	/9EMdH3XqrYKiETRTlTvZg3ajpKRthnZ89ISt3wK93i3dCO6B6djvkSm2kDSwHHO2Y8t
	z/BWwuMAW4bQFsElRz4mBOeLJnIg/0DtxURI4zF7WF+BgNcofS61aEVkM5YjcNgwaL61
	fM5ScWpRr8/zo6BNwYr7DLCCAA2Ufj7NHdTPwK4OqCwsBOWQF/mzn/zOVVyx8kEONiV0
	M6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DYh6y/4f/ZzmdAB+aLXN83B+eqEAEOJlzzX4fkl1DlI=;
	b=GJ2u4NO7zpy+ppRuhRBNlm5bHUz529TodfKSiBY3jHWWlVlw6WR3wrrhtL/12C6NHe
	y3Qp4zKPoThEfDUvzmvB1AlqJ0MAoBi655vQ9UgsmWpklpt8lVUZVVbbu4AbgCEyqxgY
	BiR9ieasJlD1TNdyJyyhtYgIswR6ylYzqy5m23rsxa6lPo/TBdmD6fJg7WxT8U1SrZYq
	6aabQl0RIhb531tIE+Yo8b1jQDzJn6Pha4yoDRNbMcB2qlSFZolAcBtsuO6SkRlrsYD8
	LLBKDH2wn9U8qv0qH0NMN26mqBxTMi3seGEzEtsov8BSmlbBTP9YRxVwoQ4X3fO7x9J4
	TaWQ==
X-Gm-Message-State: APjAAAVjUOm1aodGIjcbOHYxilezfhjcdWrSS988Kan2isMcqjGYw8s8
	dBUUoZlmktxNWrBWX3fDeLE3+So76AA7S1AEaRJ6HAKA
X-Google-Smtp-Source: APXvYqwQ0v0codnuIhA29pbqOSJWGiH21Wyh3IXr0m/ZBAGhjPqcHH+fdjV2a72TTT7JhpY6pJ0rFYr8J3lJhxd31n8=
X-Received: by 2002:a17:90a:9f42:: with SMTP id
	q2mr6640364pjv.95.1571772287278; 
	Tue, 22 Oct 2019 12:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191014215014.9656-1-dbaryshkov@gmail.com>
In-Reply-To: <20191014215014.9656-1-dbaryshkov@gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 22 Oct 2019 22:24:35 +0300
Message-ID: <CALT56yN4cApL0=dBcV8wGZQXK3QJD9N9ri+b-ym9VnwTShBcJw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: Re: [PATCH v3 1/5] conf/image-uefi: fix building images for multilib case
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
X-List-Received-Date: Tue, 22 Oct 2019 19:24:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

=D0=B2=D1=82, 15 =D0=BE=D0=BA=D1=82. 2019 =D0=B3. =D0=B2 00:50, <dbaryshkov=
@gmail.com>:
>
> From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
>
> Building live images for lib32-core-minimal-image will fail because
> image target override won't match grub's override. Fix this by
> introducing anonymous python function. A proper fix should be to
> introduce multilib overrides, but it will be more intrusive.

Any updates on these patches? I think all build issues should be fixed now.

--=20
With best wishes
Dmitry

