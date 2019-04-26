Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0386F7DA5A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 13:40:20 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c1so3866293wml.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=psmwPYULGOomhlo2X4n2cX46bfMBo3f+847NIicyFVM=;
	b=ObaKGcfLjPOM27KnHJipd+5upFO0VKUioRLqNP61xUIRIzTPjzms4KA5bR8ZI5LngX
	8l/Vtm9AIDWgFtJnwcoA+D9qQiCoz2eV+wiUWB2qqhuuAX36qSSm5IzKIKrLMTx1aUo6
	VqsINrFLbXEu+VWx1ehPEwt+ls+PLlqlP88X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=psmwPYULGOomhlo2X4n2cX46bfMBo3f+847NIicyFVM=;
	b=f2VWMqt92tvUMOwl05N2B4QeKSCSMcT2g3hNavF6IuHzt2/7UUEvKe3KieBnPZT6yl
	yTgQk47y/WfD3gPb/mpbrhgNQatXEIehAVIaOsTGGuyEQFpczkKIxxj2xZHoZ86ujXkn
	4RQ4RkKAFK4IBTva3C9GllZXJm5XhTCvib75TlAFFvSRDbgUz+plrUOhKSU32Oj1w2cC
	CpMunZSr+BlgRjowyf7okD4gBqPIVKUhh1j9hzaykPtDPVqQbT/PQBmCxyAWjEmH30da
	uBso+Oz/6LJ84EyuQWMj3Z/46d/XFt0NC9JUqWi1oAZtA41B2Jqk2urmveaQteLKUCJv
	LCdw==
X-Gm-Message-State: APjAAAVl1Wx+KA2tYLWtp0lbDlSQnbAfqgWHirgDrPub0P7Pyo1k+bMx
	9DFwTQozQaGOkVA4dZpvoNCDow==
X-Google-Smtp-Source: APXvYqxF9kFCNLDs3TGsd+kIh4p800M7Lg1HW9bBlfeVqmg90L+xAimvEY3CWjyAiRYioyVC46o3PQ==
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr3450282wmh.88.1556286021553; 
	Fri, 26 Apr 2019 06:40:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o4sm32426697wmo.20.2019.04.26.06.40.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Apr 2019 06:40:20 -0700 (PDT)
Message-ID: <f25bf5236a45b8494cf1cc4e8bb7e7b7e05ac3bf.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alistair Francis <alistair23@gmail.com>, akuster808 <akuster808@gmail.com>
Date: Fri, 26 Apr 2019 14:40:19 +0100
In-Reply-To: <CAKmqyKOyQ82yYZzuqDBgM_+-6=czN4Xg8npAWxkXvNkch0JXpQ@mail.gmail.com>
References: <20190424001333.14948-1-alistair.francis@wdc.com>
	<a824b9bf98abc6545575514aa58e97e5f6347ada.camel@linuxfoundation.org>
	<bccaa968-1653-f9b1-4b75-8e72337dcd7c@gmail.com>
	<CAKmqyKOyQ82yYZzuqDBgM_+-6=czN4Xg8npAWxkXvNkch0JXpQ@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Upgrade from 3.1.0 to 4.0.0
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
X-List-Received-Date: Fri, 26 Apr 2019 13:40:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-25 at 11:24 -0700, Alistair Francis wrote:
> On Thu, Apr 25, 2019 at 7:27 AM akuster808 <akuster808@gmail.com> wrote:
> > 
> > 
> > On 4/25/19 6:49 AM, Richard Purdie wrote:
> > > On Wed, 2019-04-24 at 00:15 +0000, Alistair Francis wrote:
> > > > This commit upgrade QEMU to the latest 4.0.0 release.
> > > > 
> > > >  - The COPYING.LIB file has changed SHA to:
> > > >     "Synchronize the LGPL 2.1 with the version from gnu.org"
> > > >  - SDL 1.2 has been removed, along with the --with-sdlabi command
> > > > line
> > > >     arg
> > > >  - The backported patches have been removed
> > > >  - Al the other patches have been refreshed and the numbering has
> > > > been
> > > >     updated
> > > I put this in for testing but it failed as nativesdk-qemu doesn't build
> > > due to unpackaged files:
> > 
> > Bug opened: 13308
> > 
> > Thanks,
> > 
> > Your neighborhood swat team.
> > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/535/steps/7/logs/step1b
> 
> I have updated the patch here:
> https://github.com/alistair23/openembedded-core/tree/alistair/qemu-4.0.0


Thanks, this worked better in testing but showed issues with qemuarm
booting:

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/535

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/549

I took it out of -next again and those passed (but some of the other
build failures also in that build remained)

Cheers,

Richard


