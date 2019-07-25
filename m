Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id BE68C7C9C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 12:47:04 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 300E95C0A6C;
	Thu, 25 Jul 2019 14:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1564058825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=y1FXhm1xCzQWPExfZP+R3IJOk6RfO6li2vdS0Lu3U7g=;
	b=GyDn4T5v2r1143oBJArB3F/w6Ts875/FcVJ3JIhqpUv16JK0MiEr6v+cXQkKw8ZJT/n+Ro
	G0E0Wmy2WioBJvbI1rl5NrWtQesjv+ek0F5YHxZKl3HwFcE53MNAsoPPMiX1/pcTYqLf0f
	mEy2c6HQWtVJkkDiCeZPVXf3A0e4mgE=
MIME-Version: 1.0
Date: Thu, 25 Jul 2019 14:47:05 +0200
From: Stefan Agner <stefan@agner.ch>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LZas-J9VBo1UyHOatWQXi0TKsSydBB21H=L3wEXCvk1Aw@mail.gmail.com>
References: <1564054891-8168-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LZas-J9VBo1UyHOatWQXi0TKsSydBB21H=L3wEXCvk1Aw@mail.gmail.com>
Message-ID: <17d83af3916dcdf164a6e8751d6ce288@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Ming Liu <ming.liu@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Agner <stefan.agner@toradex.com>, luka.pivk@toradex.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: Re: [PATCH] weston: change to use meson build system
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
X-List-Received-Date: Thu, 25 Jul 2019 12:47:05 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-07-25 14:21, Burton, Ross wrote:
> On Thu, 25 Jul 2019 at 12:42, <liu.ming50@gmail.com> wrote:
>> - Introduce remoting package config, without it meson would run into a
>>   build error.

What do you mean by that exactly, I guess it does build at all with
remoting, and by introducing a packaging config you disable it for now?

> 
> Did you tell upstream about this?

There is actually Weston 6.0.1 with some Meson related fixed, also
remoting:
https://gitlab.freedesktop.org/wayland/weston/commits/6.0.1

We probably should upgrade to 6.0.1 too.

--
Stefan

