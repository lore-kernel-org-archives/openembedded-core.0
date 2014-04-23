Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id D452C65D0F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 17:02:59 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id vb8so1330377obc.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 10:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t9QfSpBX01gipE5L9hTM7iwbskZxQbc7Zf8pPRPG598=;
	b=fWGO3R3mcF9ahX30V8OX04J5aHXzpZfeDaDR7mdXAivuEeb+uITxePHnzJjfbpGiB8
	zUqzwDivyWxhzljGuD+p2U/O+8EO415GQqvO6Errn4M5YPTid4JDwWInXmKFx7K8cTMt
	K49XyOX1gTWpJm8QxeJVslOpHG2+0SMbNWJ6y4QeU9qR92gvsGT6QIxp+9auN/6ZX4yf
	jHMKXizBcrZH53LEMX3EEiI33jAgOQppOLeQDq+n0uOXnm0NtaRyNZ5MzC+LficCnpxD
	7L7l3mKVp3fThIvk2OW81mtbl5HLmKryUyNqgY5afUCcWwX8GUMHuzn2YKgLa6t3pHx+
	858Q==
X-Gm-Message-State: ALoCoQl5JtiTi91y1fwXZyXbCyz/MYWHNdb3KiF6peJ1x0wiLa6+Q5IGMyrGsttQJ0OwNz3VhAa0
X-Received: by 10.182.24.226 with SMTP id x2mr43931023obf.13.1398272580823;
	Wed, 23 Apr 2014 10:03:00 -0700 (PDT)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id c7sm6047272oek.12.2014.04.23.10.02.59
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Apr 2014 10:03:00 -0700 (PDT)
From: gary.robertson@linaro.org
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Apr 2014 11:59:47 -0500
Message-Id: <1398272388-3326-1-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
References: <1397851967-24110-1-git-send-email-gary.robertson@linaro.org>
Cc: mike.holmes@linaro.org, clark.williams@gmail.com
Subject: [PATCH V2 1/1] rt-tests: bump version 0.87 => 0.89
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
X-List-Received-Date: Wed, 23 Apr 2014 17:03:04 -0000


Thanks for the helpful comments as I am a relative newbie at patch submission
etiquette and procedures within the community.
In response to comments received from the mailing list, I have:
   - included contents from the initial cover letter into the patch header and
   - removed the obsoleted patch files from the recipe metadata.


