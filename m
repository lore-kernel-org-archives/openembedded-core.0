Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9D7772B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:10:52 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id z8so12025088ige.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 04:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xp7PiPqTWkmw0JXKp3WxMixslQFPGbC0KzT2UtvhILk=;
	b=VFWd15RUvY5tqElY8PW8FSLvle1ECR4Wgr7xJPj7cZu76C9hMvyQ/KtT9D3o45OR0Z
	ZCc2eHwxRSeGKBO1igjA2VQQd+4k6hJm0YcJsmaBdE7oaa6IiS5QllN9IJo6LAQN5wgj
	UUZ6PkEI4NchNXv8rThsuWRjlLJ9ACg+3JXfddvqcTWAFkfwJs1QJJLWP/4ZRfORRYVt
	Kmx96YdhEhkPZB6dg7og4Thv0ZFHckmbfKCQ04Lj8QsL9eLfwfNf60tSZM8YbTtAF+Br
	QytHvBum8BDUfgCm4Na6EejJnTk/GAH+rzp6X/7VNhB/YS/tOTVpA9AxKSKD+R5C7EvP
	a6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xp7PiPqTWkmw0JXKp3WxMixslQFPGbC0KzT2UtvhILk=;
	b=mc/9u2vIC0rltGCjk9t9fL9ziyyQGsPmg8/x1sDaj8SdGZfkSLdFFsMCMbO78pXoZ1
	UJtYSLTmk8g+yzaZgDrPSntEImfmmYEvIjrelqxQrY4MMXvzD4n/6j621SQKvAFgJVhH
	nia0DZdZHaWESbuFau0D1dBcxCZoj4U535hS6J1WpvBjjqn8NzzcOBbvcOH11IQRwZQX
	MyQumwXXAq5DC6L9R9Pn+XcODlVRu9qGIcD1rC2BKWKbXFbkrgx77vkV3diKLGmZVyfA
	Lk7tlB93r9h/T9KHPEBmGLMJUJiVLgLr9MvPHOm9R+ikDUB5KpCWeVO8+iMUpJ7mFuSI
	lxVQ==
X-Gm-Message-State: AG10YOSsT5WMUebhX73dhCWlONxKtTW2Ex30q2dIEcEF46lcIuEeUBB9XRFFDKWj8qqXezDNnsnhHifTMgxO8IN6
X-Received: by 10.50.66.238 with SMTP id i14mr1847972igt.52.1456402253761;
	Thu, 25 Feb 2016 04:10:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 25 Feb 2016 04:10:34 -0800 (PST)
In-Reply-To: <56CED925.5090700@windriver.com>
References: <56CED925.5090700@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Feb 2016 12:10:34 +0000
Message-ID: <CAJTo0La3R6rUxvNvvPCrXje-QYLtV6LH2wnLnL2gc6iMhLFV5A@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu needs target kernel sets CONFIG_SCSI_VIRTIO=y to boot vmdk qcow2 and vdi
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
X-List-Received-Date: Thu, 25 Feb 2016 12:10:56 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109cfc65b3052c9712ae

--047d7bdc109cfc65b3052c9712ae
Content-Type: text/plain; charset=UTF-8

On 25 February 2016 at 10:36, Robert Yang <liezhi.yang@windriver.com> wrote:

> We need enable target kernel's CONFIG_SCSI_VIRTIO=y to make native qemu
> can boot hdddirect, vmdk, qcow2 and vdi, otherwise, the scsi drive can't
> work in qemu since our vm image's root default to /dev/sda2, or we can
> change it default to /dev/hda2, then we don't have to make any changes
> on kernel, but I prefer scsi since ide is going to be out of date.
>

Are there any other virtio drivers that we really should be enabling in the
qemu kernels?

Ross

--047d7bdc109cfc65b3052c9712ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 February 2016 at 10:36, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":duf"=
 class=3D"a3s" style=3D"overflow:hidden">We need enable target kernel&#39;s=
 CONFIG_SCSI_VIRTIO=3Dy to make native qemu<br>
can boot hdddirect, vmdk, qcow2 and vdi, otherwise, the scsi drive can&#39;=
t<br>
work in qemu since our vm image&#39;s root default to /dev/sda2, or we can<=
br>
change it default to /dev/hda2, then we don&#39;t have to make any changes<=
br>
on kernel, but I prefer scsi since ide is going to be out of date.</div></b=
lockquote></div><br>Are there any other virtio drivers that we really shoul=
d be enabling in the qemu kernels?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc109cfc65b3052c9712ae--
