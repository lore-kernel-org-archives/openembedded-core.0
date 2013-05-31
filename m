Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id CBA99608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 13:23:52 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id fp13so1341287lab.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 06:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rqRAFa4OzqI2qtpX9KgpjbRg+mLQGswXAqDZ9AR3YwU=;
	b=tWmx+B6ENZ7WX9lx284QXHQIbUjIx79WmatDGD5ThZYfxQXgEeZiLQVXB2jWPkOEXk
	/Y+426pWn4woJ2GsQiqii9nAdpq9XvVGljgMH/kfJIR0tny+E9+ZcWr6PIVzo+xgKmJT
	9/gUK4qXYjF559Sw80FBM+z2x4pIPwpbPLFIfeWbGX19lGCgiEMGFOZzCMygNEYK4BVE
	v1rdDLzBPS1XEDwD7OccUhBZRJCZ3LvBXdcr/JSW7Wce/wocxtWgp2qeqlL07e2n6Uto
	SnehDPEgFmDbg22ZfCkLmacbQ/vli2Aarm9zCyT/+K3lUfnZvum3rQaKDRWxVEO0zTbP
	ZuBA==
X-Received: by 10.112.53.136 with SMTP id b8mr5905613lbp.94.1370006632173;
	Fri, 31 May 2013 06:23:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.4.66 with HTTP; Fri, 31 May 2013 06:23:32 -0700 (PDT)
In-Reply-To: <CAJTo0LaxaDqoygUx6M-VudeM+11yufFbEh+PB_2UQYXJdv4VMA@mail.gmail.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
	<CAJTo0LaxaDqoygUx6M-VudeM+11yufFbEh+PB_2UQYXJdv4VMA@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Fri, 31 May 2013 06:23:32 -0700
Message-ID: <CABcZANnHWq26Kt-MZzwb20RcbyQHo0K6_uW2-Tg9dkL=TowzMw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Add 'tcp-wrappers' PACKAGECONFIG
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
X-List-Received-Date: Fri, 31 May 2013 13:23:53 -0000
Content-Type: multipart/alternative; boundary=001a11c3a2f0a697af04de038664

--001a11c3a2f0a697af04de038664
Content-Type: text/plain; charset=UTF-8

On Fri, May 31, 2013 at 2:26 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 31 May 2013 03:26, Christopher Larson <kergoth@gmail.com> wrote:
> > This makes rpcbind, quota, systemd, portmap, and nfs-utils obey the same
> tcp
> > wrappers PACKAGECONFIG which xinetd obeys.
>
> If many packages have the same packageconfig option, should this be a
> distro feature?


It's a good point. At first I thought to avoid that due to feature
proliferation, but as you say, it would probably be a good idea.
-- 
Christopher Larson

--001a11c3a2f0a697af04de038664
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Fri, May 31, 2013 at 2:26 AM, Burton, Ross <span dir="ltr">&lt;<a href="mailto:ross.burton@intel.com" target="_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="im">On 31 May 2013 03:26, Christopher Larson &lt;<a href="mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br>


&gt; This makes rpcbind, quota, systemd, portmap, and nfs-utils obey the same tcp<br>
&gt; wrappers PACKAGECONFIG which xinetd obeys.<br>
<br>
</div>If many packages have the same packageconfig option, should this be a<br>
distro feature?</blockquote></div><br>It&#39;s a good point. At first I thought to avoid that due to feature proliferation, but as you say, it would probably be a good idea.<br>-- <br>Christopher Larson</div></div>

--001a11c3a2f0a697af04de038664--
