Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id 12B73798BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 12:40:17 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id v44-v6so12790419ote.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 05:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k5H5JxI5zRcXUZ+DqAkH+r3xWuabygAQB4BZBK+ziDI=;
	b=s9PgYpVgILL0SMVD+/QFnJd0Re8P9FnML1dNSLPOIcaYN1mXR4yAP8VJSsv/xIitN+
	AAd7HaWOQXp6JkfUD1XPS24Q+qxTMGUkHgVH2Phruauj8GkIaR7iLTkq1xEY9xP2Zja3
	ZU4dYaGnrJoxA1cdPjDjVJ9iiazC8KaD9viZdTpjCx697ZNLBXDO5zL14WBFsSyLDLB2
	iQ7Qux8ChUA6VX8WC1kGXsbZcOkfEozVBboILlfXDR2mrNHxK8C1KgKtPSmZfJJ/YVZB
	bPETT03Cnj9nOY4TGZ4KxIz02qJrWXZPQqbc/5s5ok0Fan8Rox4XOzWMb8K3J8YMwipA
	4Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k5H5JxI5zRcXUZ+DqAkH+r3xWuabygAQB4BZBK+ziDI=;
	b=aBxcyD+mE1Quz6mqfA+eNSwQ757xWLND1PZFWoEzhiEtUBmRGmoaGXbjunLOtqRDmn
	q3fEv6vV2HsgzwWpFFESLo8ZckTxXUFY/HI9aRfjwAWqQvOm4OcNEVYlgnjjTO7juCG7
	fG/WdUCfN616VmVVDzR6wfurjBFoF+gfVV6b4/o4WnNzi9dm1n6Z6qUuxqsPctUCMltk
	1htM0f+eakj3Bn973sNOp9udQliUclmVA1VplxsG++kGhWQ37oNSk9OyhOxdt5Zd6sfv
	0QGl4NbmM9MpKJaKU9g0j/JiKhhku0Z425gORRplZc/6uccSebTbt0u3KW80LYZXxf7W
	FqZA==
X-Gm-Message-State: APzg51BVe5lX/nTdVPDzk+fq9cri1O+d0hBIoTX4co6FqeH/w3dr7Zmy
	Oo57j5GWzfwsD0PzJrpkvLUjoAH+8PpC09EXrFs+wg==
X-Google-Smtp-Source: ANB0VdZq3YEsoSK6j04YkL0lJtO5T1gzz9EwEmmAbF5x2e5dC1carv7AdsM8UbOSmu1wcazR5QSGXqo86Cok97adlFM=
X-Received: by 2002:a9d:4ea:: with SMTP id 97-v6mr23383352otm.99.1537533618835;
	Fri, 21 Sep 2018 05:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0La8KFRbVQvhcYyN-JMjRiBzjeUE9-dwadBvmCCbX95A=g@mail.gmail.com>
	<45324447-7512-2987-1e2b-44c59c7aaddb@windriver.com>
In-Reply-To: <45324447-7512-2987-1e2b-44c59c7aaddb@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Sep 2018 13:40:06 +0100
Message-ID: <CAJTo0Lbzv-5s20HycHXTxbWPr+JvkbMBj6RXj-qq5Be+VHNYKA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Kernel warnings with master/poky-lsb
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
X-List-Received-Date: Fri, 21 Sep 2018 12:40:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Sep 2018 at 13:33, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> > FYI, the poky-lsb builds for meta-yocto-bsp BSPs are all emitting this warning:
> >
> > WARNING: linux-yocto-4.14.48+gitAUTOINC+9beb3a2873_04043b48eb-r0
> > do_kernel_configcheck: [kernel config]: This BSP sets config options
> > that are not offered anywhere within this kernel:
> > CONFIG_USB_OCTEON2_COMMON
> >
> > Is this something that is fixed in 4.14.67? Did I miss an upgrade or
> > are there upgrade patches outstanding?  Note that we were hoping to
> > roll M3 this week.
>
> There are oustanding patches for the remaining warnings. I was
> traveling and didn't get a chance to complete the last few
> platforms with remaining warns.
>
> I may have something out by end of day, but since today is my
> first back in my timezone .. I may fall asleep before that
> happens :D

Okay, thanks Bruce!

CCing Richard so he know's we might end up rolling a M3RC1 before
these updates arrive.

Ross

