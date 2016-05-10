Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 291B47001D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 22:43:06 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id gh9so2081811pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=snkhr3yCEX1+buMV6dsuYyW7J+0P8u7sJxHg3TEAN2A=;
	b=xkDwsMvYmMr0Oj1AfjSGZYRUbB6HTPd23AgX3Mmwtz3CRuSrN+4kRKLwhB7oXV0koI
	NjO5ifBYjnQITyJORHBy8S/SiAsLbjfdCEAMTR+y8d3Updhlb9MZDfuZlTD7X+dUCUgQ
	yXnQJhWusTJIo52ND0dxzWXy7YoK7Kh6jz54OovLXzwJjiSicgfIh8AQap1BGpYfwv+V
	FrdMAQAXErQpxVgocnoJ+2xLDOF3PueHNWXu98LLoTAgCfPl2PHSb4kMYXH0XJVsYmlY
	xmN+Qj7eEuGcL5xrKJ76vEBYQ7wUDdpnx53fw+PHIKoER9RDnqTEEhFlND+Yz0i4Mc6P
	mz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=snkhr3yCEX1+buMV6dsuYyW7J+0P8u7sJxHg3TEAN2A=;
	b=ZXbJnsz3wJ9yPLzmN+ZcBpU9M/KSaJaUzokiYetcNXuyyugzX52i3L/nim96Ar7ouA
	O3tink4AravF2ZC4VVVSdIHY5cj861SIu5cCAFeZFH96MwVKiSq43GTjRgDl5Mz5rrsq
	KGLPB+LRLzPdeiohySjYT0Brc+TVw1EXu9J7yoh7MNtXv55KBlEx49DNmsVjxSr+KP1i
	csSjrXdM3+UEONfJ2csgztLgEShge+t0gU7Mb6i3Sk97L6AUshIHg4u1aX+Uxc0cg94v
	+e5KIjVJ5jtc1vPPckOBOCthJNIodOebFkACbgnC60l23uTnSgfFxIceE1FSV8dsFsFO
	ElTA==
X-Gm-Message-State: AOPr4FWx3fABPtYc2V+bH8wC2E+SHJasN5bXhHg9RRKt5gCRHU9i7icJ07sdRKj7PNvK0A==
X-Received: by 10.66.254.1 with SMTP id ae1mr102368pad.32.1462920187493;
	Tue, 10 May 2016 15:43:07 -0700 (PDT)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	o63sm6899504pfj.30.2016.05.10.15.43.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 15:43:06 -0700 (PDT)
To: OE-core <openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <573263F4.6010207@gmail.com>
Date: Tue, 10 May 2016 15:43:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: Patchwork [jethro] glibc: Fix CVE-2015-8778 - patched dropped????
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
X-List-Received-Date: Tue, 10 May 2016 22:43:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I can not find the original email but a glibc backport for Jethro is in
limbo.

http://patches.openembedded.org/patch/121007/

can we get that merged?

- Armin

