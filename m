Received: from mail-ve0-f171.google.com ([209.85.128.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAjpY-0007Lz-SD
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 17:26:09 +0100
Received: by mail-ve0-f171.google.com with SMTP id b10so753833vea.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 08:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=03EeX9W700AdLjmNVYadv/FcVuCBb3Qr6P7bR6Niw6A=;
	b=ThulV9QScV7Clif/AXn+QYEr8nUHu+QoMqkAovf2hjQGRy3G6Z2D1AKFLbNDMBzSER
	vKiRzhMkFqEtmF6cAzty1DhN8CsBeB7oO6ytdOkXAhP4ZHiEb2fugATSQDSYhqrLvr/Z
	1AFHqMkkRUU+6TbZ4851+C5i8rBBjLuDrWURWsK5NctVHN+07j/KDaZOXe7vyKbUbdjy
	8/5qbB3hVdkcdymXlPxS1aOWOEoTzmnryqdj53ILLtl/TOR884rTg1YD6jBATNvszq73
	ZU47D/L16BH/bE/yVcYn9FO/HfEqN0NVlEx9jJ6twXY6QxvgJDaLaraqTePwNoXQi0jJ
	HtzA==
X-Received: by 10.52.74.102 with SMTP id s6mr953805vdv.28.1361981387690; Wed,
	27 Feb 2013 08:09:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Wed, 27 Feb 2013 08:09:27 -0800 (PST)
In-Reply-To: <CAGiJk9drhuVo1AfCsHEc3jbevtzaYcONQwHQ2qfE=HuJjUCbSw@mail.gmail.com>
References: <CAGiJk9drhuVo1AfCsHEc3jbevtzaYcONQwHQ2qfE=HuJjUCbSw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 16:09:27 +0000
Message-ID: <CAJTo0Lbnt78ssmdTmTh2CoFfDMHq_SpoV9qYEX+2kPod4EW9Jg@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Gm-Message-State: ALoCoQlLSV4bf7BzymnHz1dLKXZPekI4L13aeOstF6+VSQV3vRnj3/p2tJRLhlrr0WW9dZP/XyG9
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gst-plugins-bad and EXTRA_OECONF
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 16:26:10 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 08:57, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
> This is caused by sdl-config from my buildhost, though gst-plugins-bad
> has EXTRA_OECONF += "... --disable-sdl ... --disable-orc"

I tried replicating by bitbaking libsdl and then gst-plugins-bad, but
it still disabled the SDL plugins.  What version of oe-core are you
using, and do you have any other layers that could be involved?

Ross


