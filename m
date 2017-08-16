Return-Path: <liu.ming50@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id ED9DB77EFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 04:37:33 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id t139so1664430ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5Gaq6GaU9cvzJMtPEJnH2pdIKkLcB01e1+xzNYOir1Y=;
	b=ADWhrPm+V0uGVR08hZbQYsWofeVBy6ZVNKx1S3uwZw2lUAgZURdc+kqIn9Bic797pa
	57IPL8uBjhRl8jBm2M0vl6L53ddtLQG+y5hjhL8WxsE/F/TZS/ktpNApfmdh2BukGBCS
	EYd+Dscuix3cPEClyBDmXtXMbM7kB7jGYBNWmdCYCPhEXAGbcRXRnmu2GT6d1nDEcnqW
	j558dlfNZ49Zqj5/rHU1n3yrgD633jv6q+v2FplXfjhtA7eTu0x+tWT2FOqcGnU3qKpS
	RiIXREVHoXd9gQT9EYOBXmMjbR/qD9bAqC31kNfzpJVLQqI4ncTzU+dF6Vsptuyc7W0p
	ATtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5Gaq6GaU9cvzJMtPEJnH2pdIKkLcB01e1+xzNYOir1Y=;
	b=WaXdb/4Fj44l9JrlH/6TkiF3PQdvey2qeWOeLDVZgtHs3MhvBJJI0nAl7GE7gXOAwD
	5kUDLyQXHiXE6NE7XF299RZ8mHNnLRSlV9NP19EPJNolL8w9L3RTFvwVXFfALAUz2VEb
	MtB+satfi3fbQZO2qGy6HU+tuNKmhxm7YtMp214xJYfodzqxJfEXjLOP/xC76thlPGVK
	CJqaEq1V2aqChc3Jg2cN7jwQamws8djAqQoN6yZwjksXCpJtSPjwIeXdmHbdI0ETZHzf
	ncd87YWr3E8rF6D0sywxyl1MIU9ppqcixhXwYuvI/C4lGnRDapu5ET01Tt2i4FhS0nrh
	yU8A==
X-Gm-Message-State: AHYfb5hfh8rZEvKjBzBAnRWzM3WZmS25X+Qtk4wzFY+nwQUmd8iIxBIx
	Q6hld1noI++fCwoC
X-Received: by 10.129.30.149 with SMTP id e143mr363056ywe.238.1502858254783;
	Tue, 15 Aug 2017 21:37:34 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.240]) by smtp.gmail.com with ESMTPSA id
	i71sm4231278ywg.47.2017.08.15.21.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Aug 2017 21:37:33 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 06:34:07 +0200
Message-Id: <1502858048-7170-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: bruce.ashfield@windriver.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2] image.bbclass: drop initramfs bundle related code
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
X-List-Received-Date: Wed, 16 Aug 2017 04:37:34 -0000

From: Ming Liu <liu.ming50@gmail.com>

Hi, OE maintainers:

Please help me review this patch or please feel free to comment on it
if you think it's risky or something.

The patch has been being tested in our project for a long time, I
think it fixes a performance issue and is safe to be merged, but I
would appreciate to hear any options from you.

Ming Liu (1):
  image.bbclass: drop initramfs bundle related code

 meta/classes/image.bbclass | 13 -------------
 1 file changed, 13 deletions(-)

-- 
2.7.4


