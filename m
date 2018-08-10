Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 070EB78EFF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 11:12:19 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id k12-v6so15132459oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S7f6ucsUDhaDgULS2eboprjO+KbM3/RUH4g4pQT3Eco=;
	b=MvlKTerGwPBvNfXWzCkZ0nJXmv2LGd8AON/u0kydP2RKjRk7/+jwx4U2wU0W6OnRdx
	23+5xDQrcBijpoiA/z/n3P+7JXOP6KCM0EgOKKiujKbBjcaB2iD8Rqdi+oP/xVo26TTo
	QWSuy0HQE2IM8xnGM/I1gIjmE8B0m4clSXCyh0jNEMitFIm4QW5eCPnnbxaQIePY5Spp
	VRihbDlHej8fVwm6GDn0KF4X5Zj5pRWSAzy0CICRSYNFA+nm4G0OHv66z1H7anF1vRc4
	qmcoxcAKn11kxmBo7g+DORaWULNUZ480KB/LCwS18Z9j5HuSy4IppbPO2+jFaNRigoBL
	xxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S7f6ucsUDhaDgULS2eboprjO+KbM3/RUH4g4pQT3Eco=;
	b=PjT0d//rM1QoNpYa25nkXfG22XrJfQDGffD55dsZqf3Uin0RLvMs73fIcOFAb9OKy8
	qVL5T8welJ7mG+9zgii3k0T6KvHSbLsrFOczfwjd20UkitX3nqIrtVzDgW6w0F8da1r3
	1O5H5kADfgIFA9rLoa9ofEPM3EFONQL1r7s0R3sJYf6UHdqvl+4mJ6R+4JBqZX0s+PqC
	xCpYGZPOsYaOHXEEiBCmELJ2/tq1oi7XgjSfusGVllI9FgQ8BExDm/sZL/0RC2Rc8K8E
	j9f4/NK13dRrgeQDy+J6K1g/WBeQP2fknIdlf6RftrvtBQ3smL8wATeZUSO7YcN2o8YW
	OvfA==
X-Gm-Message-State: AOUpUlG/ABbReUaqUjhQsLzW1sDpefG9N6w8f+Sv8L1FhJwitNFiQNmE
	QrQCoAkfLvu9TrqXdi65iLglW2J0b4wnpqgwe/0=
X-Google-Smtp-Source: AA+uWPz/QNOQeUZSlTwyynBu5nIT0TAv0wXYvcNNA81JBhcWdbY4/w7AdBVXlqe4S+pPHgV/2VRQXXyHp4lq6k8dL6o=
X-Received: by 2002:aca:3e03:: with SMTP id l3-v6mr5674154oia.54.1533899541024;
	Fri, 10 Aug 2018 04:12:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Fri, 10 Aug 2018 04:12:20
	-0700 (PDT)
In-Reply-To: <c68310f2a56a13e0f0a0e30071ec30dd1d65854b.camel@linuxfoundation.org>
References: <20180810073139.89868-1-zhixiong.chi@windriver.com>
	<20180810073139.89868-6-zhixiong.chi@windriver.com>
	<c68310f2a56a13e0f0a0e30071ec30dd1d65854b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Aug 2018 13:12:20 +0200
Message-ID: <CANNYZj-SnHgTcoukpVHDaBF88W-vC=zc3zYs+XC4U0eVkiMWCA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] nss: fix multilib file conflict
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
X-List-Received-Date: Fri, 10 Aug 2018 11:12:20 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-10 11:03 GMT+02:00 Richard Purdie <richard.purdie@linuxfoundation.org>:
> Shouldn't those files be architecture independent given the files are
> in sysconfdir? Isn't this really a determinism problem and we should
> fix the builds to be deterministic instead?

Yes, absolutely. This 'multilib_script' facility should be used only
when there's a genuine reason for the files to be different for
different multilib configs. Otherwise it does look like someone took a
shortcut without looking at the problem properly.

Alex

