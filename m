Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id EC4CA71C0F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 20:26:40 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id k127so57223925vke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 12:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jg2VxYTvLvPOzdr7B9Rh6/2+p4xmD91Ol4e6bZ7g5CY=;
	b=VImBKAFuNVSQjlg/p6Z1PUoPOm1RyIENnMmH3GSpRFaNVwXAVHwziJjjpN0uh7VIn3
	uiQvPuEbLkHxRxYx1nGcQJFcgn5HwmdJGzBgp2OI3hElPwywpIUxQxg+NKurtDpKEqt8
	++3uTX1MHlDCC4rJ4qKDhDmNGW7LhZGcdMv2dC/LemxK7SylFb06+n1mdCGk3piwV1M+
	Y3S+6AFK5vYU5oPz4u6dCdey0SofApWxiRoGlNZ9hYLx7XQsZIWwZ5FaX1DG6E1ab9+R
	f5eOc8BLwH1FV3U/OqHndXXHW037Q2DMt2gAWhcJ26H6twVaBfToyJUdRHjQgtEgB0Hz
	ZV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jg2VxYTvLvPOzdr7B9Rh6/2+p4xmD91Ol4e6bZ7g5CY=;
	b=iwTCIxEdL3+PF/oxIlxYVWIVRupu0mdiVHKVqQklA1syrXA0yXfRlB+MHhu0EAq17S
	1Wwn8v3UiiT/O+AnuoMDZXhSrObnAJyq3DqNUTFjKhkh7aylr2aNMYkTIWA9AW+K+tf4
	6swzeHWY3enIY+hqHPBjCVQKpOYI+0tSXfd9/HsXj9qwEZQCCuioWcvfrALdv2kpUml1
	o4wHA9u85VzAM23wxPK6jUs/3JtPyMiJyCOjfYUpBjqVZX5mXDuQFZEbP1d8JFhowNq9
	cjBqGqzwPIpv2tlDMX1gRYFcIkbNaxT/BWkAkwx9dFExWDfH6cx1xgkFGGdRuMNoz+zp
	YfYw==
X-Gm-Message-State: AIkVDXIl3HkG0CWs0tGC6v398r6f25UBYhN/UtoeOopdLXv7VW9DruOiwI1yaS0WdFXgrF5Vn2DPHreLjOR8HA==
X-Received: by 10.31.179.73 with SMTP id c70mr6480152vkf.81.1484944000833;
	Fri, 20 Jan 2017 12:26:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Fri, 20 Jan 2017 12:26:40 -0800 (PST)
In-Reply-To: <20170120182400.23276.727@do.openembedded.org>
References: <1484935378-1881-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20170120182400.23276.727@do.openembedded.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 20 Jan 2017 21:26:40 +0100
Message-ID: <CALbNGRQp1oM0dmYULiM7ywBFkFS64GC68vAGUYCRLOXZkJdCzA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJTd2l0Y2ggdG8gUmVjaXBlIFNwZWNpZmljIFN5c3IuLi4iIGFuZCAyIG1vcmU=?=
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
X-List-Received-Date: Fri, 20 Jan 2017 20:26:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 20, 2017 at 7:24 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: "Switch to Recipe Specific Sysr..." and 2 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/4877/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Patch            [1/3] Switch to Recipe Specific Sysroots
>  Issue             Shortlog does not follow expected format [test_shortlog_format]
>   Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
LOL

