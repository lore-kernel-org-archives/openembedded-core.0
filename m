Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 06EB56C4CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 12:35:00 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id x19so8541381itl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 04:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GJ7LZ2QIM+RlVOGrSTfnyDS3T6ydfKkgssNCrpywi8o=;
	b=tEhtZ1e93iRb1Yo+NWOraxTKflt0dvlOx0yAejMa72wzNyAHngch6k/WFfmhg0lxcV
	Tzh2fK5ojTIUQd9wymjs11LLUtTMxAZqgZtXoaq43WcnY4chU4wvC9Pus2Tf1WgHjbVo
	ZOwrQvhJMfXe7X2afqtn6nramYXAgQ+NbenMyEH9NcfZiFCWkPC1PcriDZ4gEKgqpuF7
	Q7n/pkruC9sqc270ZJfX7GnjkR3Qn6IRUfSu4Nf0tyCZVZMSJ919fA9dFVADJAhrgFKh
	XyMZ1zKHxrTMT13UacsQbRnUSVOqmG4uuDvJCiFqNYxGHUKsyt6frliZpqkYXueWCCB5
	SAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GJ7LZ2QIM+RlVOGrSTfnyDS3T6ydfKkgssNCrpywi8o=;
	b=EoFfOdxnM2odcQOsjZQeT5BjCVkBqqEgPgFCyn8YE7GkbSfl224DrcJY5GqS83TzZp
	I90DI3VR/TFPKQxnobAU/0EBQQqhwvXdmWMCWiYMILyPDETgP64vxJO735jN0KLvqNzz
	YmWqeiX04ImeLvgKr7VBVY0TiTWbSxzPvQB55Daq7IMN0lEvJ8x4Tp38a+kqPpNeELzw
	lHOaC4XR9tr9yu/ve4RYc1KHERZswCOTh0Up2RsISN/jrTH4Gb3R242MsNrSMXTn5hN0
	VOZKbvVNQm1S7xpV78VulY1vgen+9c2W7d5XnL+G2Uw/LLALwoDm3lyhfnqQEa7EJFHx
	jJ2g==
X-Gm-Message-State: AGRZ1gLKx1FilV/Nszt9NSzdPAETJWR7k8erKyYChFKNCLN1K5I1i4YO
	R3PmNXeVt2cO15pBSS7845KdxV/ccepwa9eWbrs3ihLbOgE=
X-Google-Smtp-Source: AJdET5cVT+M+cehDWXabzDZDuZxtHsQivTEd9OU3gHNuNmBBMt7gBie+lvfL1QHGCI1L8sVhEHD/d7IkEEyrTUfauLI=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr6066643ite.130.1542803702032; 
	Wed, 21 Nov 2018 04:35:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542778410.git.Qi.Chen@windriver.com>
	<dc2278cac296d5ad9af04e0de849d0f9e0a0884e.1542778410.git.Qi.Chen@windriver.com>
	<CAJTo0LZRhRoxYXM254vFW61SX5ep4Pu7VBGTDDgTyktz7NXkPA@mail.gmail.com>
In-Reply-To: <CAJTo0LZRhRoxYXM254vFW61SX5ep4Pu7VBGTDDgTyktz7NXkPA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Nov 2018 12:34:49 +0000
Message-ID: <CAJTo0Lb+a2AY2H9CB3UvjNw6LaFC4O75w150oNWCsuC376w-tA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] busybox: remove three hostname test cases
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
X-List-Received-Date: Wed, 21 Nov 2018 12:35:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Nov 2018 at 12:16, Burton, Ross <ross.burton@intel.com> wrote:
> On Wed, 21 Nov 2018 at 05:35, Chen Qi <Qi.Chen@windriver.com> wrote:
> > These three test case are removed because of two reasons.
> > 1) net-tools' hostname have different behaviour regarding some options
> >    So when net-tools is installed, test cases may fail.
> >    e.g.
> >    test x$(hostname -i) = x$(busybox hostname -i)
>
> This is just a specific instance of the problem where alternatives may
> not be what you want.  The busybox test suite should be sure it's
> running busybox tools.  Having spoken to a few people about this
> already, maybe busybox-ptest should contain a symlink farm for all the
> applets to the busybox binary that run-ptest can put at the front of
> $PATH.

Something like this:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=42ec5eaf3a6c512bffe03d20e7e512e8d87343ca

Example package contents at https://pastebin.com/5FpY9xyE

If run-ptest just puts that directory at the front of $PATH then
you'll be sure to be run the busybox tool.

Bonus points for making that a function in update-alternatives.bbclass
so every recipe with this problem can use it, but that would have to
happen at do_package time because of how that class works so I'm happy
enough with this for now.

Ross

