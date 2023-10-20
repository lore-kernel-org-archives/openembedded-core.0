Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5D3CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 17:26:30 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.60572.1697822784658657078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 10:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=G8i5J8oY;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Content-Type:
	In-Reply-To:References:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xF+39Kz1rcXS8zDbrzwMHeTdall6/kkGJ+6yHDSYkIw=; b=G8i5J8oYDLkX0v8DHfvlX96PNi
	pKMdEWc4r5UQkNFrDKLurF2UXP5sOyW3sZTRziKU8+jB7muymKogyv/lYNKLyGZ89Ll+s2bNyOtga
	5Mv0FGrpfOd4XMiOkuDB1HA0MKXaZZUo2cE0m2b+i6eA4Z2IblmYBnvpOZTeezto+1+41j5+mTTMc
	fv8raPA1vhH7lQgtkIgf9RwGt7jOfyTIsxA/6vrpOcfAScLYNVrrEpyFxZT5OfI2ZV3X/o2vV+7Us
	/pat88jODFsfYJ/Zd1+YdA2zDSsBvK1NRZ3s0LKLqXg2WWUIRUbcpRFHd8lcgM50Qj4IxPIN8r47d
	SRcgNwGA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qttGQ-00088j-51; Fri, 20 Oct 2023 19:26:22 +0200
Received: from [192.168.0.32] (helo=webmail.your-server.de)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qttGP-000MBC-TP; Fri, 20 Oct 2023 19:26:21 +0200
Received: from [2a06:4004:10df:0:c132:1d6d:f1fe:7161]
 ([2a06:4004:10df:0:c132:1d6d:f1fe:7161]) by webmail.your-server.de (Horde
 Framework) with HTTPS; Fri, 20 Oct 2023 19:26:21 +0200
Date: Fri, 20 Oct 2023 19:26:21 +0200
Message-ID: <20231020192621.Horde.yuIspbaq8hJ9Q1lkSH9Rlbi@webmail.your-server.de>
From: sean@geanix.com
To: Steve Sakoman <steve@sakoman.com>
Cc: alex@linutronix.de, kasper@krinvent.dk,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][mickledore][PATCH] weston: default to launcher-seatd
References: <20231019132843.2623456-1-sean@geanix.com>
 <CAOSpxdbvouz+syXkw7aOwCiui4qz6YUZiNPC0bJaZn2bn4xq_A@mail.gmail.com>
In-Reply-To: <CAOSpxdbvouz+syXkw7aOwCiui4qz6YUZiNPC0bJaZn2bn4xq_A@mail.gmail.com>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27067/Fri Oct 20 09:48:05 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 17:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189577

Quoting Steve Sakoman <steve@sakoman.com>:

> On Thu, Oct 19, 2023 at 3:28 AM Sean Nyekjaer <sean@geanix.com> wrote:
>>
>> Lets use the launcher-seatd as default, launcher-logind is "sometimes"
>> failing to provide input events. Further more is the launcher-logind
>> depricated in newer versions of weston.
>
> Changing behaviour is typically not allowed in stable branches.
>
> In any event, this change would need to go into the master branch
> before it could be backported to stable branches. So please submit
> this for the master branch!
>
> Steve

Hi Steve,

It is part of the master branch be7da75 “weston: update 11.0.1 - 12.0.1”

/Sean

>
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>>  meta/recipes-graphics/wayland/weston_11.0.1.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb  
>> b/meta/recipes-graphics/wayland/weston_11.0.1.bb
>> index 0838791a6b..09753e7c51 100644
>> --- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
>> +++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
>> @@ -37,7 +37,7 @@ PACKAGECONFIG ??=  
>> "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayla
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11  
>> wayland', 'xwayland', '', d)} \
>>                     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd  
>> x11', d)} \
>>                     ${@bb.utils.contains_any('DISTRO_FEATURES',  
>> 'wayland x11', '', 'headless', d)} \
>> -                    
>> ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'sysvinit',  
>> 'launcher-libseat', '', d)} \
>> +                   launcher-libseat \
>>                     image-jpeg \
>>                     screenshare \
>>                     shell-desktop \
>> @@ -71,7 +71,7 @@ PACKAGECONFIG[lcms] =  
>> "-Dcolor-management-lcms=true,-Dcolor-management-lcms=fals
>>  # Weston with webp support
>>  PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
>>  # Weston with systemd-login support
>> -PACKAGECONFIG[systemd] = "-Dsystemd=true  
>> -Dlauncher-logind=true,-Dsystemd=false  
>> -Dlauncher-logind=false,systemd dbus"
>> +PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd dbus"
>>  # Weston with Xwayland support (requires X11 and Wayland)
>>  PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb  
>> libxcursor xwayland"
>>  # colord CMS support
>> --
>> 2.42.0
>>




