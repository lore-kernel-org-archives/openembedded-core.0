Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id CAC9C77CE3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 10:23:34 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u65so116877596wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 03:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to:cc;
	bh=OH1pEpFqSHk9kP+XprAzGvX0rU1VPWar12Nxs6B2ElM=;
	b=wR4SmI+jO0X+0NOy5PPKJ+TBUC+Jzp0nSqV/Nj7HNozadwxcu8Dr4zvUr0hsVkLBB8
	/h1DXP191qE3Tdicl2etacMvCCvbfoipQHYE7aCRQFLLBSCi6nKp0bsVSIR80eDcE6Ke
	ZZKfWVBT2etDGt51S3GG/wWmzuu5lI7eMgAGmmXDJcqQchCd08ecLZUUsdVzdOfRmGlb
	XaWvJ/VW6oA7HPxBHWYLAgWjUk2pfhFQy9hYkrXYIO/LUW+BjpcIj+qKW2nVkscl/dFW
	J6nCVJyAbVmF+ysQPZVMjtFKKzlTXoRDGwbObCQb5P4R80ZJQaKh9a4PuyeTUWV6Wkxl
	9PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
	bh=OH1pEpFqSHk9kP+XprAzGvX0rU1VPWar12Nxs6B2ElM=;
	b=NUE9DqbrmyAhLt2VYqhDjbvA8xCjLvfNw4WXwz0R0dthv12WKq/H2v5nuolCln9n8A
	2kOG7q1BQwFti/pqzAqoWNF6VvV2H22DpJTSso6AKfhVaDbdBENk+7AnjSuHpKsPhpwE
	62d5R7Pui2YadM5QHFFf7DkBx0aNdxff1uYBlFElHVg0IXVHldUdvmH3YPRehNAgshA/
	0Z48qmSHwqWGbJqutYKXA07YPk9LNFawjk+ec9Z5VRu0J99Z9sGj68qevpjS3dYgkBaZ
	ZQc6eg4h7rcDvztsVDom5oantPrJpMf/jmjGpY1Khnz0ZX7J4kD6sIl133wNftSIOwHP
	SR5w==
X-Gm-Message-State: AODbwcBE73pMRUbc588w392YLXdwAp8TS0YR2EMdNsD6UXVZXd78VIon
	hbQzOIpJ9+j4P+dA
X-Received: by 10.223.133.182 with SMTP id 51mr7320006wrt.86.1494930214263;
	Tue, 16 May 2017 03:23:34 -0700 (PDT)
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com.
	[74.125.82.47]) by smtp.gmail.com with ESMTPSA id
	137sm1957444wmi.19.2017.05.16.03.23.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 03:23:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f47.google.com with SMTP id d127so114225399wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 03:23:33 -0700 (PDT)
X-Received: by 10.223.138.237 with SMTP id z42mr8188086wrz.66.1494930213180;
	Tue, 16 May 2017 03:23:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Tue, 16 May 2017 03:23:31 -0700 (PDT)
Date: Tue, 16 May 2017 07:23:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqHOyLJyGkLFkVGvTyO+P0TNhkqXV04XXZwRhqSyj3MNQ@mail.gmail.com>
Message-ID: <CAP9ODKqHOyLJyGkLFkVGvTyO+P0TNhkqXV04XXZwRhqSyj3MNQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [for-krogoth] Fix pseudo issue in some hosts
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
X-List-Received-Date: Tue, 16 May 2017 10:23:35 -0000
Content-Type: text/plain; charset="UTF-8"

Hello guys,

I've been applying following change, on krogoth, and using without problems:

commit db2cf6ec905e2a8870d1adb6c069c08c36055b01 (HEAD -> krogoth)
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Wed May 18 19:28:29 2016 +0100

    pseudo: Work around issues with glibc 2.24

    There are issues with a change made to RTLD_NEXT behaviour in glibc 2.24
    and that change was also backported to older glibc versions in some distros
    like Fedora 23. This adds a workaround whilst the pseudo maintainer fixes
    various issues properly.

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
    (cherry picked from commit 21c38a091c4a1917f62a942c4751b0fd11dce340)

It would be great if this could be queued together of the pending
merges, for next updates.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

