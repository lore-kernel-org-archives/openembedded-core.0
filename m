Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 291826C921
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:07:04 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id if11so424656vcb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K1BMPlWCym6QVKWpaCFwWeiX6AynKQiODK+IiQjz+GQ=;
	b=WRK1AANLBEbsgM7PZJqLm88CKIcqk7W8sYLFYGjbeROJLdaMRu8UrvUBe7Cp9IrATN
	Y2X5OM3QFuBkKwpF5qDJVz6CYhGTybXYlrD86w0mC2TLVaMbh6oXKqBKl5MD5W6T6NQp
	Jp3NVa/1K2oZcXf4Zb8IhEpET47zmIl5Z4l5hM9BGDYWfFwWVFkS1X7O6ai0UXT5uNyT
	jwd0FnFVTUV1XWGJD2v6/s7BN+ws8b2xmpsBAcxAUbtXFus24VxcMuIWbyAprcTJYIGn
	ADtFjXH7naTF1SnhSpQ+mUflAsLhwTlr8hb+p9EHW0Xpns3dtqI5c/AiAbQCyU1FqZ+f
	R5SQ==
X-Gm-Message-State: ALoCoQnxYlMiUHtCo5xgyTXuj+0nrXVGV+mF7HkCfrEmmj9SVXY80SRLQVxFl0cYGXl5PO6tz6E2
X-Received: by 10.220.98.143 with SMTP id q15mr964780vcn.38.1390414024848;
	Wed, 22 Jan 2014 10:07:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Wed, 22 Jan 2014 10:06:44 -0800 (PST)
In-Reply-To: <CAJTo0LYvzkHrODzpx7CMWM1hEGAjXDEtukvP8aNbCDYHvY7t8Q@mail.gmail.com>
References: <5278C502.1080100@cn.fujitsu.com>
	<008701cee4ce$d0b805c0$72281140$@cn.fujitsu.com>
	<CAJTo0LYvzkHrODzpx7CMWM1hEGAjXDEtukvP8aNbCDYHvY7t8Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jan 2014 18:06:44 +0000
Message-ID: <CAJTo0LZh6a+Dh3OAK4iaq4KTRxQFE66+fSYi1JuQAn5dsvDh1A@mail.gmail.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd.bbclass: only restart the service when it is active at systemd_postinst
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
X-List-Received-Date: Wed, 22 Jan 2014 18:07:04 -0000
Content-Type: text/plain; charset=UTF-8

On 22 January 2014 17:56, Burton, Ross <ross.burton@intel.com> wrote:
> Whoops, this fell out of my inbox.   Whilst the is-active check now
> means that the service is restarted on upgrades, if the package is
> being installed it's now not started if AUTO_ENABLE is set to true.
>
> I think the logic should be "$D unset and (auto enable or is-active)"

Also, before doing systemctl reload, systemd needs to be told to
re-load the services with systemctl --system daemon-reload (thanks
Koen for pointing this out).

Ross

