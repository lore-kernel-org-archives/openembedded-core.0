Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7B07A6BE32
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 10:20:38 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id p13so3632374vbe.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 03:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kpSSGtdJwJkg5EkFAhMvHpYwf/4MjUfeKEihpCvOyIU=;
	b=UdM6yaLcCpPyPm6xvPo0WyO3qQf/pqCll8jCUQGN+KtTMFSx+4Y4cPzhocbpCo5nAp
	Oe81FnUGbZQAK9jXIPdbIe0+H8Q/rdP3LQaa32VSqgcKImKCuRA5lkOdUnZ1Qt/zJAbv
	CxWhe9uXnSp9o1u4Us87Sr2b8/7xAwejdqHF/gx2eo/TZF0XblbFpW4380619q6ef9qb
	5inD4UklieO/fz/T2BdB03Dc8+s1lMQ1uZNq3Z2oOMDbsHfS6Y/LNsGCv/VcF3q/wSH2
	YuAXwA45utXFf+qLlwGcOHG5r4/WV1/vzCiGvb73uhzNfUuaF7smFKcY7H0gLDH8QeEt
	U8hA==
X-Gm-Message-State: ALoCoQlnUznjxtTQGuYaAWnrXdkAh+n9TRnQXTaeUytoZoMGkzIuOCopndg5ge4DpIHBJPD02p0Q
X-Received: by 10.58.100.234 with SMTP id fb10mr28033037veb.5.1378203639042;
	Tue, 03 Sep 2013 03:20:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Sep 2013 03:20:18 -0700 (PDT)
In-Reply-To: <1377672247-16456-1-git-send-email-raj.khem@gmail.com>
References: <1377672247-16456-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Sep 2013 11:20:18 +0100
Message-ID: <CAJTo0LYOH6_QV_R2Y=BLKE-NLMEdPpU4T9kxCc4BPvJWwia34Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Cover for udev-systemd
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
X-List-Received-Date: Tue, 03 Sep 2013 10:20:39 -0000
Content-Type: text/plain; charset=UTF-8

On 28 August 2013 07:44, Khem Raj <raj.khem@gmail.com> wrote:
> meta-systemd currently has a bbappend which provides just a cover
> for udev-systemd, if we move this to the recipe proper then the
> bbappend can be removed from that layer

If we do this for systemd we should do it for all recipes that were
part of meta-systemd.  I thought we'd previously agreed that
meta-systemd would contain the "compatibility" provides for people
that had previously used meta-systemd, not oe-core.

Ross

