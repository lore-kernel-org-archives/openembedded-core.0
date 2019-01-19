Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 621D960107
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 12:15:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b11so6860195wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 04:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=J6yx64BWJdNUkaWCk9kjmTMPw0PlmzNK/Mrisvm3aAI=;
	b=Z9gdrq4rOgWpNWlCsy26t2XqJE8uDLvNJSaqFFy+9wwHkWLrgXBjeI7s57muQiQ7V3
	6n3AMXwtDjfyuCj5G43WA2v0gx65cKzZjHM5xL8eTXuUDISx8rquqcarhM26oobAj0Ea
	J3pTsEzJmAG+/tmOCdsVH4GIhuSrrDvamT/VU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=J6yx64BWJdNUkaWCk9kjmTMPw0PlmzNK/Mrisvm3aAI=;
	b=Uze4gs9+OjAQunWcIePxffiIK89GZSxtJmSe11rfYUjWeRATRXP1UN00Sre/I5eBR/
	qfkWOZaDfyypq5IEegQTr2sMQrU0eUmsJ3xl6BAdYcjwUs/Le64QrLa+rXa5CrzNH3QL
	89n8sUlF9q0zJgNsV8HFBlh4tceDtoPVCUXhJVtCilGztdcn7UM0EykW9HCUEv2cCn1x
	1WZnBxXm9UTFo11TmdR+Sw16dQcUY6WC5SRo0UFywVyRFJOCJr1iYPmBD4HvwtwcMOod
	WB7S4g1SiqeKdMfwSPbYgbOotJZdtEeWPE9hN8IUQgwH+p6BDfwtJJ+XDTtFw10gHM2I
	mRKA==
X-Gm-Message-State: AJcUukdkOIk4PfaEqcX+jNQgvM1M8GxdB3gh47VZQxlT+jAjjQvG4KEU
	rtS9izvM81TD+j/JspofsAyPjQ==
X-Google-Smtp-Source: ALg8bN7FH3vW6TaB7fRIIWMeFtYTq+NOv3KeIs9Nacy5pL7+F3wjAE2OcPzWzBpCWsasaDiHdWpwSA==
X-Received: by 2002:a1c:bbd6:: with SMTP id l205mr17513661wmf.97.1547900151889;
	Sat, 19 Jan 2019 04:15:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c1sm36394332wmb.14.2019.01.19.04.15.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 19 Jan 2019 04:15:51 -0800 (PST)
Message-ID: <9fe559c1167c274a29f0c2d73f779e024401174a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2019 12:15:50 +0000
In-Reply-To: <20190118221737.14443-1-jdmason@kudzu.us>
References: <20190118221737.14443-1-jdmason@kudzu.us>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] qemuarm: update to ARMv7
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
X-List-Received-Date: Sat, 19 Jan 2019 12:15:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-01-18 at 17:17 -0500, Jon Mason wrote:
> This series of patches allows for qemuarm to be a more modern and
> (hopefully) faster platform to test on by default.  Firstly, it
> introduces a QEMU ARMv7 based Cortex-A15 system (of machine type
> virt).
> It then renames the existing qemuarm machine to qemarmv5 to allow for
> it
> to be used by those who still want to use it.  Finally, it renames
> the
> newly introduced qemuarma15 to qemuarm.
> 
> Jon Mason (3):
>   qemuarma15: ARM A15 Support
>   qemuarm: rename to qemuarmv5
>   qemuarm: Rename qemuarma15 to qemuarm

Thanks, looking forward to sorting this out!

Unfortunately it failed in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/38/builds/191/steps/7/logs/step1c

(the rest of the build is ongoing)

Cheers,

Richard


