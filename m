Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id AD973616BF;
	Wed,  4 Mar 2020 05:43:48 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 2so362231pfg.12;
	Tue, 03 Mar 2020 21:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=FRMp6HCszX2PcTtXVauXU8hZhHmsi+C+wSpCu1V/EJ0=;
	b=j3jaJzRyJSZKAziZE4FpkrgwSuoqCHhXPXaTLGJJB8cjMvR1FhsL1heg5gzAoLicLS
	b8PCVwgsZ4HCLUqfrF8/bpmxuV4PHxZFaQN7B2YA+CsiJO6hkdj9OinTzzLwAcGebMPG
	k96igN1qk0Cm7KfQjkgdcG4MdIankQb7KHWHNBqoxzhBdg7eUgRYXPbp19JRJhhp3qqS
	73LJJLZHSPz+7HhTw8tmfAvym0NO6Jag+Ge5LduA55zMD/m++cJl0+go+HHT8t0Jo4vs
	iZJ6ZEoCJs9FEHNnLerZh0Jwzw0kqefr9ur9rf3eCu+P4BsI18hMyB2LCk4kx/YBPANa
	vPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
	:user-agent:mime-version:content-transfer-encoding:content-language;
	bh=FRMp6HCszX2PcTtXVauXU8hZhHmsi+C+wSpCu1V/EJ0=;
	b=ABelYWJI9qp6f+4St8qyP49uQ23+fbJQ6VlfhnDDrS2pFIE6E3QTQcghd6pTWNoyn/
	RToXuU6bVFwjEPcEMk3vMCU2ZiXqciVKY7YY0PAX3dGuCKJY4bPIM6/4QvEO8Hh5Q3V3
	NEtWTeNzgw1m8qvRPDxnd1E4rUj3Zrxp5ZaiYgIzG4Yz9b7VLhSO4Z9XUbvmqtDMLhJE
	B1VT8B+H4+P1rqBEFuJZfUy/qHtJ4hEvSvkYmoF/oJSC5z0vrILvwVW+YNIrkvcjLgsy
	0vF93QkSNmK+N8+w1DlN8XiBlPs8tVV+FJhkNaa7K5hDaF97eoAbI38npz7fhfF5LnvX
	elqA==
X-Gm-Message-State: ANhLgQ2TLvZpr8b5gsBJOTkiQ/V91nNA9OelSwevYpkdLiigF0NmjO5a
	WTl+H5/FtlbalIZIKZvga885Ozow
X-Google-Smtp-Source: ADFU+vvuFv++ObRKFbALvUsspRcfxI5A64WoSt/frqK2DphDwlcsmPkP9ifUw5QvdQCG6tw+I0PGmw==
X-Received: by 2002:a63:5251:: with SMTP id s17mr1091504pgl.160.1583300628853; 
	Tue, 03 Mar 2020 21:43:48 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:3055:bf8b:bc3b:3d57?
	([2601:202:4180:a5c0:3055:bf8b:bc3b:3d57])
	by smtp.gmail.com with ESMTPSA id
	x21sm26094846pfn.164.2020.03.03.21.43.48
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 21:43:48 -0800 (PST)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8e1a92f2-b131-4594-b07c-58192fa2f5b7@gmail.com>
Date: Tue, 3 Mar 2020 21:43:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Subject: Stable release changes now that YP has an LTS program
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
X-List-Received-Date: Wed, 04 Mar 2020 05:43:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

As Richard has pointed out, The Yocto Project now has a LTS program.=C2=A0=
 It
means the stable branch life cycles are changing.=C2=A0 The new standard =
life
span for a stable release will be 7 months before transitioning to
"Community Supported". That extra month is so we can pull in changes
missed in the release.=C2=A0 With Zeus, we are giving it 9 months to help=

folks transition=C2=A0 and before it goes to "Community Supported".

The "Community Supported" and "EOL" policies are being work on by the
Yocto TSC.

The LTS and Stable processes are on the YP wiki and where the "Community
Supported" and "EOL" policies/processes will be noted.

https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS

let me know if anything needs clarification.

regards,
Armin



