Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5307855A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 14:48:11 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id y42so14665380wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 06:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=fY7bwfN9IcvovxDtDwBNp9sGSXv8Nz+SxS/Q+t4/bu4=;
	b=WL2YNA6uJPtScgoa6K8QFYx0sHfADI8hu1qlHImKXCmzTUDLPIKtwctAzMqM95cUnl
	7vssRE1gNdmk0Xyph2MHjGScY9lAUHJDLrRAMBl9epPBX8LV4cZJ5gR5litJe2p3LQMQ
	IcQj2bw0iWrZK+e42xMj6m47NBLmjfTqK06vnL+Rwghf/vwbcYgRaZWwegyWvtsH2p6+
	s7+AfMNl0DK0SmKX7sqbZGsIkak89jOXzgFCCUNBQivmgp0WJA+M0HoX4yJxMjo4ds4K
	aZlGXDqXfgCsST5PsiG+H6HU5yZa8ofvX7mTDqfeYSGxA0Tl2LB7zxzSR71LjgWTT/Vv
	eHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=fY7bwfN9IcvovxDtDwBNp9sGSXv8Nz+SxS/Q+t4/bu4=;
	b=W4caT1TvFJJtR6BfsuXt56huxXX74NW/dpQSex5yssJruhQhOV8SZY/xdm4mRwpMdt
	a5JRW4aZ4XATjsWoapXNHe3CJlWsgwKR0cr8HQfs9fP7HwmIECPRWGqWSUdfLhjKP9NL
	8wl1UkrVtCIS5mFS1/xLTuG/x3GL8XT9nL/YWCAcGJO32orlfc2/jeRUVKZnt3ZhZbdP
	4cKIkOgJkhGZLuPvW5C451A1GXSBTtCSinaj18JLOI/7MT1fjyRk+J+r+3RbMi9HUsiC
	UZmgJ9WzeyafpPiBcIYd65Ocs9PF4hVOvUuuNte+eLTxknnengWvNOs2lfNteLiJrzxx
	XsFQ==
X-Gm-Message-State: AJaThX7t52scG46mL0dNTy3RpYEJuX+r8OqoOADPcyjcdDnLVQC+wmbD
	4tEvbPsDdM7plIEa9Rrje+AdmSU=
X-Google-Smtp-Source: AGs4zMY0EY4d+B9jDwDcaTyiwa82yfthB+/S5DtLNmh44KZeQNILOPiue8HTmsPRM/wl+gQXudzOsA==
X-Received: by 10.223.153.202 with SMTP id y68mr7299245wrb.216.1510584492725; 
	Mon, 13 Nov 2017 06:48:12 -0800 (PST)
Received: from pohly-mobl1 (p54BD5837.dip0.t-ipconnect.de. [84.189.88.55])
	by smtp.gmail.com with ESMTPSA id 16sm4382590wrt.81.2017.11.13.06.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 06:48:11 -0800 (PST)
Message-ID: <1510584490.22094.65.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 15:48:10 +0100
In-Reply-To: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
References: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: Re: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Mon, 13 Nov 2017 14:48:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-11-09 at 21:54 -0800, Andre McCurdy wrote:
> The default systemd-tmpfiles config file expects to be able to create
> files etc belonging to the wheel system group. Currently the wheel
> group is created at run time by systemd-sysusers, but that doesn't
> happen if systemd-sysusers is disabled (as it currently is by default
> when building with musl libc).

Isn't this something that the systemd_create_users rootfs postprocess
command in rootfs-postcommands.bbclass already takes care of?

I know that it is has issues (https://bugzilla.yoctoproject.org/show_bu
g.cgi?id=9789), but it should at least create the wheel group.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



