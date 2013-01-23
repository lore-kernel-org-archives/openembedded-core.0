Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxyzO-00074x-5P
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 12:59:50 +0100
Received: from mail-qc0-f197.google.com ([209.85.216.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Jan 2013 03:44:01 -0800
Received: by mail-qc0-f197.google.com with SMTP id x40so7888054qcs.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 03:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=IRPOUACzRLXzIxNskPaqRCt1higuGQoJw+t/QvMvIq8=;
	b=gfTPsCdHN3M+gNgnVqpI5+kB6t5n9YU/qvyGpkvaNPSjcfFr6Hoe3hhsdSM5FTouWI
	0gP9PDj4iYFjv6vIQGOfESUYdjcf0+k0R2I4MSD1ADRBO+B8YFs0VXKL2QZkbykAZMaD
	hYwSGiaIKfrZqJmZV8rGfLpvXIJLK5m4xUMBnI9ipKdiu9SNJVqxVwKJLkOkGhhdT3Jg
	7AYFlmHVPLSRtCeCPlx6g1ED4DZItZuEGwMUCEfg0ZGBsC/Cn9deVu0P0D8xY7C1jQTD
	iSDMxQE/Ok9nPS4RAz/Zm4znaAiw7zZGuzb1DX3LM11o/AJUDPzl4O+hr4e/bT2p3fAG
	5lZw==
X-Received: by 10.52.28.44 with SMTP id y12mr807789vdg.19.1358941440915;
	Wed, 23 Jan 2013 03:44:00 -0800 (PST)
X-Received: by 10.52.28.44 with SMTP id y12mr807786vdg.19.1358941440848; Wed,
	23 Jan 2013 03:44:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Wed, 23 Jan 2013 03:43:40 -0800 (PST)
In-Reply-To: <1358941121-12772-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <807c839e2a2d9236e4b5a1425d6ca47e200aaebc.1358635193.git.ross.burton@intel.com>
	<1358941121-12772-1-git-send-email-marcin.juszkiewicz@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Jan 2013 11:43:40 +0000
Message-ID: <CAJTo0LacJmaNqVTTbctN5Up7r65prWDeE5X9eyNn1Ar8Fo-+kw@mail.gmail.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Gm-Message-State: ALoCoQlAdyjTSVofdYEEm9enGBl0OtejT9eqagYoSkWAVPkA8JPdhyoFTpZtmwxvlL083OzkjkNBCMrsiqbtIRjVxs9jltSkoZZ+LxYF126RAkrdB6WhyCaOtrIIkduSYpaxO1It5dv+j4wCsJrx6XKpsB9hxyoeJaAGB/nMPlgkfO5IsaQZNTT81RWvGenHZAW1V+y6Izq+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: unbreak all builds with custom DISTRO_FEATURES
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
X-List-Received-Date: Wed, 23 Jan 2013 11:59:51 -0000
Content-Type: text/plain; charset=UTF-8

On 23 January 2013 11:38, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
> Commit 9e7c64ca9afbf27edd0d35a1830ce55ee6d778ab broke all builds where
> custom DISTRO_FEATURES were used.
>
> Resulting images ended in non-bootable state due to lack of initscripts
> (unless someone had sysvinit or systemd in D_E already).
>
> https://bugs.launchpad.net/linaro-oe/+bug/1102910
> https://bugs.launchpad.net/linaro-oe/+bug/1099405/comments/12
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Ross Burton <ross.burton@intel.com>

Wow, it's like you're reading my mind.  When I next realise what the
problem is and what the solution is, I'll await eagerly your fix.

Ross


