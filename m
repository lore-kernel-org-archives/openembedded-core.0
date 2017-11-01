Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0962F60290
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 12:51:38 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id g125so3691842oib.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Nov 2017 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=bPKGltTtqupypXXxoloZjee0oithMQN776+NIeDKfeM=;
	b=ty5RjAEVvr1A3+0dVHU6dXG0mXgy2wJhTC0bpNxwofpZymNiDSGJgJHBdSjPAe4wSh
	XgBAdeFiOxGrCtGM8roH7KDVIWRnofxrBlzHYlWjNOyXekGMpIYrOOQ6S5q6ISJe+bdo
	eQ+bZb7LE9F+ajyNyuxyX+XDXMhcGE18YBZaLCYGvp1AFhsCa9bLNf068YPrecIGTEzy
	0M6ohnjqfpvhU1NastB+cld/V0PIHdO5ah5TPnu020WB0cZfTndZIz/z+c9fNYdVZ5lk
	vCyvl4ERr+hTO8bJC4zRyLluN1wCMO1/T1g5tpo5n1H/iuW5xhlHKRItPXSZu8gh4QCp
	wOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=bPKGltTtqupypXXxoloZjee0oithMQN776+NIeDKfeM=;
	b=MBkLmSumFjMsHl6IhIFLOygNka+tjw4GCLsj+CEArQWs60M0Y7FSWxd0U8vh8wz7gi
	ozEKIbZtNzDjdtsUKWxF+C/D4gMmNHMma8q49wPj/0kUkp3fe9KIiHM0dwd5GGBxhYvu
	65PGZwJoCbFGBH5LZrvZr4dqBId3/fJAY0LHH46hrO7HTNpUaKu+2dHlQuRgLhg5XJqA
	TAdholiF4umVgPHXQyJNYq80ypRL/AQw3y2IEKbC8pdjiQfUBeUgI/AGVkEFsAROEDx+
	wg/qbMagKSJfwOWvtcIP3diDI4KWXaZdYRUiPtmdEYLDgAE8FKxaj63FKaqhuWtFq7id
	WzfA==
X-Gm-Message-State: AMCzsaVS60KfM7zkXf3JWL3Ol5fpa8+yjMBFFVvdNeU89f2I+v5ALAfH
	kKAA8Kl6ZuvDr49YcIasOYPY0eLI
X-Google-Smtp-Source: ABhQp+RBWrixcJyFDv4KWKbyT2MgQZgQEbDf6ZGGowLu4Te//Q3J5s5XMGdrvh9o/LRcC4xW0ueAIQ==
X-Received: by 10.157.68.10 with SMTP id u10mr3608143ote.82.1509540699481;
	Wed, 01 Nov 2017 05:51:39 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51])
	by smtp.gmail.com with ESMTPSA id o58sm202182otb.2.2017.11.01.05.51.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Nov 2017 05:51:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id j126so3703068oib.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Nov 2017 05:51:38 -0700 (PDT)
X-Received: by 10.202.4.69 with SMTP id 66mr2619202oie.409.1509540697788; Wed,
	01 Nov 2017 05:51:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Wed, 1 Nov 2017 05:51:36 -0700 (PDT)
In-Reply-To: <ba38a925299ad32664c35b90486f5c9e97ed64c5.1509516068.git.wenzong.fan@windriver.com>
References: <cover.1509516068.git.wenzong.fan@windriver.com>
	<ba38a925299ad32664c35b90486f5c9e97ed64c5.1509516068.git.wenzong.fan@windriver.com>
Date: Wed, 1 Nov 2017 10:51:36 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoLas2y3uyQRV-ewU4u3RQnHW_dMA-WaQb2SiHC6ZWySw@mail.gmail.com>
Message-ID: <CAP9ODKoLas2y3uyQRV-ewU4u3RQnHW_dMA-WaQb2SiHC6ZWySw@mail.gmail.com>
To: wenzong.fan@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] initscripts: disable mountall.sh for busybox init
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
X-List-Received-Date: Wed, 01 Nov 2017 12:51:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

On Wed, Nov 1, 2017 at 4:04 AM,  <wenzong.fan@windriver.com> wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Disable 'mountall.sh' to avoid system halt while the init manager is
> set as 'busybox'.
>
> In busybox init, the 'SIGUSR1' was handled as 'halt', calling to the
> 'mountall.sh' would trigger the signal with:
>   + kill -USR1 1

Wouldn't be better to add the signal handler for it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

