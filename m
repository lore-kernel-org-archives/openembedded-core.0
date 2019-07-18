Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 61DA07EE56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 11:43:51 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id g67so21241367wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 04:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rdmTN0U81tKdeVVJmLAUeuXMN67OdDq1tCW3LVhrExQ=;
	b=HIpsLfWU1p02xri0pYRPSensKKMYjU1ZLDgN35sqr00wAUl9Ynuk3uwtuVD+kEJ3uj
	67RjyMgZBw0phX69v8UIUzgAuP2akucdJdnnU5fgYiCu7ofWn+bqBiFW86r7yCLZldEQ
	dVSK2ezk99PNDdwvvE+NOplx6k16szAk/RQSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rdmTN0U81tKdeVVJmLAUeuXMN67OdDq1tCW3LVhrExQ=;
	b=BkdRIr0iitBGllPKgqGPd2ErcRmsXgBEE/tCAUbDBQAwxVH3gYQk/oBBV7Vpr7CC70
	buJEUyqimjnPxb7zYlss5sKppNO3ZGq+fZrZUksTCikqjujMoj+6o+DAkw0GTOrq2FTT
	XIQD1GYffaEtOGDyktinRwFdW4Qeh9yYBPW6j+oLJosIo4vDj4XL11sJ5GRxxJ1geUdO
	yjuWuqX8C8GsOjIxRkCjsMdZJKzzgnZQLB/7o0N9YIHVgVJSsQeQaHjJOAe4AtrN9BY9
	oagvHbQ/tQgh0/KfKsiL4+Jk6KsFU6Tn5Va0hCNWR0T0S9hhSQypMInKzzNAzBTZ7xWw
	VlYQ==
X-Gm-Message-State: APjAAAWZXMPCuzCxs/j3AOMhp2bOG/KRRDmrD6BA470Bn+IUzbndwYi0
	8fz3cs8m20DhOS+bTuk6MwMMRg==
X-Google-Smtp-Source: APXvYqwNvsrmM2TjbFxL02VbI6yzrQC+qqcEhh8uGgp/baH6D7UziaPs9NbRAmb6wUFmaO4185ydTA==
X-Received: by 2002:a1c:770d:: with SMTP id t13mr41319181wmi.79.1563450232097; 
	Thu, 18 Jul 2019 04:43:52 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n8sm20687061wro.89.2019.07.18.04.43.51
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 04:43:51 -0700 (PDT)
Message-ID: <b19a2df01ff9e66056d1c4f23fb9469cff9dacd9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Adrian Bunk <bunk@stusta.de>
Date: Thu, 18 Jul 2019 12:43:50 +0100
In-Reply-To: <CAJTo0LbDCp=Wn76R56LxkAbU7pbkeJuBmnXhVr7h=gCJd1phqA@mail.gmail.com>
References: <CAJTo0LaOHbSB75OGLsHJ3Vxd5eVgg9+7Cq3k0=P-BwPLpFiyjg@mail.gmail.com>
	<20190718060409.GA27459@localhost>
	<CAJTo0LbDCp=Wn76R56LxkAbU7pbkeJuBmnXhVr7h=gCJd1phqA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: dropping official support for Debian 8 / Opensuse 42.3
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
X-List-Received-Date: Thu, 18 Jul 2019 11:43:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-18 at 12:31 +0100, Burton, Ross wrote:
> > CentOS 7 is based on Fedora 19 from 2013.
> > 
> > This is the oldest currently supported distribution, and when to
> > remove
> > support for it (replacing it with the not yet existing CentOS 8)
> > should
> > IMHO be part of this discussion.
> 
> Centos 7 support is, I believe, already patchy - I think we mandate
> the buildtools for that?  Any idea what the support plan for Centos 7
> will be once 8 is released, whenever that is?

There is some kind of official feed to add python 3.6 to it which we
use.

Cheers,

Richard


