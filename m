Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5856.1793999011107871684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 13:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=AUsKkTOY;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso9931545e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 13:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793999009; x=1794603809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqBjiOVICdjgDknixJgDTgpUQGYaUuxGJv7IIvCxFYM=;
        b=AUsKkTOYzfe+iDt+qoCR5zn4NXHuhjoY+Ozc34q/xCkEvHu0L2gbI4TSMPHx/3U9D6
         MnucYND6K9mCCLdYoOn6V5fVBNhvPOOluTDjClJYByeHeq8RsdiylAYOPRwCDn6mlitr
         H3wHwM+SAW7TGDoTZ04YpddOlM85/ZeXN7aYgViKZ70WjjcUlxH+XXQ6LXn+5Aj4la4k
         MCmQ4XrB1U+vcZ3DWoN1UgQOyJE+eRt1ulOqx3o+bJe9jqoZlEMtA0nz5CKZuuAeKIrC
         pqwStDSfVQHlR66Gz29fg82I3eaoBRtlesAF4MtJoByvPS180JB64abOzPipUWqPC1Z+
         lU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999009; x=1794603809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqBjiOVICdjgDknixJgDTgpUQGYaUuxGJv7IIvCxFYM=;
        b=azC8AirQTpQ5J6JBK4AjIUvNbl6PZQUapw4k1fb7O3HeHpxtLi8YPODiN1SPpB0xC1
         Iw4f2zzKs54cBoXQ4cJyr1FbDlOoq6l4q5iFI+aWdcpZ/CenSn85b9Mkf6/mn7U6IhoG
         KFIhPFewL6iC3U6MNKJ2/H2CSu5udi59xrd4SiwPBwxeRPmUfpNsQ4IhYGSEbYZMQU5d
         LzTUWWoM+AzsaT4hcWGDTXLB7WqL+lixWuyVWNRQcBuF4sfRCfHKYVjupIb0lBr3tQqt
         xMMgN+OnnIWvT/hl2mFc+f48aHMJ467qXuFaWnKkO/UyEWV31VpEQfctE1xYcNYLlmOR
         svyA==
X-Gm-Message-State: APuU4Z9JXcTTlnX2+k6dMy+ehi0vbk/DD0oF0xN5M0LujfLD1cAsr9Pe
	f8wW2vCxOVsbjcyIqplCtBH9L2GKuRlfnCVRyUt34ZuuTPYc865IBJs/LIlmzxNMIJsaa3FCs23
	KyPXwrX0=
X-Gm-Gg: AYBFou2hz+vgUXU57VkJzV0l4LfqKKqtwRPPDKBqKJFHDhMN7MkRKl80R7zCYfiE7HZ
	xRNVE5qW5ZzTKxKl183KITljQ+d0H+vQSULd0Gbna3AZhzBOZ37IjKFHXkMN1G8QH386t3AEbdX
	0QeWpKDRuoM/Sn8IMV0uk/t+peOz5P4TYPz6/xTgIFfRGeLsW3CaKf006O6QxqwS4hyA6/ii9/e
	Sj4uuaohhZq3xp1wpliikjdEunXwu4maubSjT6CQNptgB2fti1U3GP3ZC8/NTX9TLdvZscZRf7j
	MKeElhKv1TSNdJvL59Y/+/wC8gfntZQJubCvrEC+2558LDja2fS2zdQZSdJwld5MJAhqtHp4fk2
	tjLhn5FK1Yvo7YKji+5eWUHtuMY9NroikKd1E6bsNtQrEZJQ18ApFHwjNjK+mSmzFkf7xAh8COB
	0aXBjf1rz7m+h6IZTUmuwgAIg7r8xkjrhs8IjKQZa13j2QvgBeWduvksLdqIlUCY7UMnNszqMn7
	h8botrTKfkyQgtV8t8z2YaOnZX5Jraky9dcWQ66Qx7nxRAGpIpLUICnzF/1JfS/KrTV5bYPzN44
	ck5+KcVloq2kZn4Zpr7PTcr6uTlUpvp1TkjWUWmqGX6v12ekpl6ys8yP7AmLDgLBX2S5fBZgZkv
	BUI8HUwQrVJXjHC/+E3juC3U+LTFc
X-Received: by 2002:a05:600c:4fc9:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4b6e017053fmr65780155e9.23.1793999009188;
        Fri, 06 Nov 2026 13:03:29 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3c6c056sm6035216f8f.4.2026.11.06.13.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:03:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 0/1] Pull request for CVE-2026-123158
Date: Fri,  6 Nov 2026 22:03:09 +0100
Message-ID: <cover.1793998796.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 21:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249715
Content-Type: text/plain; charset="utf-8"

This is an expedited Pull request to fix CVE-2026-123158 (aka
"sshhole").

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5073

The following changes since commit ae5a301091f5b0574ea7444aab40b309b6d9f3f2:

  glib-2.0: upgrade 2.88.3 -> 2.88.4 (2026-10-27 08:03:41 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 2285da08068a6d1b4a64c9a52d85a58be50e4679:

  openssh: fix CVE-2026-123158 (aka "sshhole") (2026-11-06 17:15:59 +0100)

----------------------------------------------------------------

Yoann Congal (1):
  openssh: fix CVE-2026-123158 (aka "sshhole")

 .../openssh/openssh/CVE-2026-123158.patch     | 191 ++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-123158.patch

