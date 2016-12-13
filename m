Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id C20BF71C9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:42:02 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id p9so66898893vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nDxbEPaT4vP9/+3SnTw+Dg84YR8Pv5P0kE2VRTzsN1s=;
	b=ExaRD1KrBA7Rt0u6sjaw5tHkFS4/kpP4VYUBV5Nw6YWnxkLfLSeyrMz9mL9FUU899E
	RIioF7ajVacR4WrL5Slu29tRT6sQ2SIXIpLihw7m0D7oa61+4uet/SFDIim1hNKhI7Kv
	YmNg7931sd5BCtUO2Gl3SHWrR0YG7Ny0sHd9nRLR4Pj6QgqUYjuSfXyb09c9rEfUwp3z
	o1H+JXJtwWDY+mLZWeo4rOEU9e/ND8/aWxceUCLb+nuwxV62OVV+kqL3lFB1fyXgjehk
	TSe1Gvq6zo1kNLEeaXiBsMy0q20bU9k+Z+CEnJA/m6BF3o8u9fVvuISY9Z6ThwbhV5r+
	6rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nDxbEPaT4vP9/+3SnTw+Dg84YR8Pv5P0kE2VRTzsN1s=;
	b=bJWUnHx7DXwJFzw2jSEreGSN3gwtb/eQ9/bOnta8xUvwmZZyiGk99Rfey62PswYfQ4
	aCqtZYLwzae2KsOUrhtvMP0GCc5gXIqXyTyTUxF1N3SOPbGufazsqZ5eqLRYKIY+PZpZ
	m9ApDevouXa+6KoVIY7mZ7yHa1QdOg+YVIoVuRtPQxmikVoN9H0awmCnYUF+9UdISs4u
	uamT4RVg8YMZelLsIjdUH+en19PvBqs7b4eWf487zmwGRyQoK0FWUC+TyQncwo9yBFxA
	9bZlkeHTP/yZH0adtv4uOEPVn5xsyR+Hdz1sKMNFpEyq7OoBBeKAGot42JLRkTJrFpzL
	tWDw==
X-Gm-Message-State: AKaTC02E6qBDq7Pg8O9lF5OtF4+7FdD0Jg/lOI4edKaBEQvbeNjuMTlOw2O+a5z94AJPGLD+4b73a35yPkT++w==
X-Received: by 10.176.82.71 with SMTP id j7mr65067590uaa.77.1481643723629;
	Tue, 13 Dec 2016 07:42:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 13 Dec 2016 07:42:03 -0800 (PST)
In-Reply-To: <CAJTo0LbtMiBd=_rip_Let9C0aAg-moLt2=3V=ghGOUA=yW-m=A@mail.gmail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbtMiBd=_rip_Let9C0aAg-moLt2=3V=ghGOUA=yW-m=A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 13 Dec 2016 16:42:03 +0100
Message-ID: <CALbNGRR0CXGDXr6Jj1q5_WQ8U_=kyJmdvUs1hJ_jELBSEYcnDw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libsdl2: fix build on wayland(-dev)less hosts
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
X-List-Received-Date: Tue, 13 Dec 2016 15:42:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 13, 2016 at 4:31 PM, Burton, Ross <ross.burton@intel.com> wrote:
> I finally merged the sdl/wayland bits of this series but libsdl2 fails for
> me:
>
> |   GEN    gen/wayland-client-protocol.h
> | /bin/bash: client-header: command not found
> | /bin/bash: client-header: command not found
>
> Ross
Strange - something must be wrong on your machine :)

Seriously: Can you supply full log.do_configure and log.do_complie please?

Andreas

