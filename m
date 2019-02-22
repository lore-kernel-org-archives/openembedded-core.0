Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9460B7CC05
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:18:58 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id s16so2274539oih.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NlOjah/eg2Mmt0m+u5NhAsU665XvwYffge76EKjfHow=;
	b=gMXVXxK6oc94HquK7L0BpHDnQ09OnWITS7T2WUjwC9lim5ftGIfXW9bg+vuLnV6mg8
	kFZbM9mQJ9sNSCM/C5CuzJ11ZX4NxrtWpJoDCwonVoGNXJ81yKuivZM4obZwPzOcoVgf
	7rtcGy6RzyLMyL1YzzhFR1aEur7nU0xzioOIBrUE8/sumD8mPGpxz7xcVZgLi3v+YGF0
	ldr9mebX3P5vD9MKWiijxR+MoYHlkPoQQ2wPtHL8xVdW1p7RTQEoyPGlCcjClkIbOKyj
	eOS4t3yCfnVEbte2cfPk8v8DN+qt0QDbcE3vMALC9z9M8/lB9QsCvYbQ+xCN8gZvG6/c
	OoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NlOjah/eg2Mmt0m+u5NhAsU665XvwYffge76EKjfHow=;
	b=UFZcbFY7DIKFTLULAgS9DN7AaC+moW3UION8Q/UvNRzE47CE0PsNDq7tllG3P5YAnQ
	ezf4JZB15w0aGBDLNck9vJLmI6HaNb4sYsLMKIITwszpa/3/rLmRNAZJQTsF7CAWf+T2
	RgZlNd2oYNzzDcVWqEBUNppIWayNG2ccUlpzWT5k0DJlaq7W1QS//ihCn5lc7DHG/+2t
	X6ogg4O5DZ1TpRRSD2OgDDKOc1nLGAVKts8dNxTEYBiJurjaFaaPx6Qj7GjTIeF3Ec4z
	hP6HMEc2gzHfkH6TI7OHQTYF/t7YFHKJkPg6kL1Ra1L7iDKkEhIyBDuSH+Px6Ki2mxmb
	cl4Q==
X-Gm-Message-State: AHQUAuY3fPfHF7ovx06avp5VK50u/cHul9COdJf4bmFO6G9WSbvTpAr1
	/wM2fU4lbjCH5eGuUhi+DTXs3bghTuiVN7JwqPQ=
X-Google-Smtp-Source: AHgI3IZ6p870HfcXbUQEmHCFpnzd8ZFJz6WQlncWQAmrMHVupCd/BP9S4p7odiuwc7HW7b9B0FrfuqsGp9veoRaw88I=
X-Received: by 2002:aca:30c2:: with SMTP id w185mr3205910oiw.163.1550855939518;
	Fri, 22 Feb 2019 09:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20190222165450.30773-1-george.mccollister@gmail.com>
	<CANNYZj-Fx7W5MKb8hp9F5mPC05fhxq1S56_F9-PDr38yK1ofVw@mail.gmail.com>
	<CAFSKS=M3WckCq3mwaMVWUoo6HaBOR1tBbMyYrg5nJw6=E_0XZQ@mail.gmail.com>
In-Reply-To: <CAFSKS=M3WckCq3mwaMVWUoo6HaBOR1tBbMyYrg5nJw6=E_0XZQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Feb 2019 18:18:48 +0100
Message-ID: <CANNYZj-dz6xKtuuOTVAKz-j-+w_qeQXrC_5PTG8cxNeJFs4ZDg@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix CVE-2019-6454
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
X-List-Received-Date: Fri, 22 Feb 2019 17:18:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Feb 2019 at 18:13, George McCollister
<george.mccollister@gmail.com> wrote:
>
> I believe this was discussed before and the recommendation was to wait
> until 241 to be release. In any case I currently have no interest in
> upgrading it. My main motivation is to patch this CVE in sumo but
> maintainers seem to want it in master first (even though different
> version of the patches are required).

241 has been released:
https://github.com/systemd/systemd/releases

It's fine if you don't want to do the upgrade, just wanted to correct
that point.

Alex

