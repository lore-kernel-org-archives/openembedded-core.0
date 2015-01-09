Return-Path: <kirgene@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0191772A93
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 11:32:13 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q107so7851277qgd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jan 2015 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=8i3j/apV9NsbWAD/LoRs3HuTr+xOtbGW02ErRHGQZPo=;
	b=D3d68/tjvjU9cawCmg5PpZjn2JvPSqykRX8Wwa2cfX6jWeSMc/lxlshZcW0u7l1Cpj
	phpbVMSGjk0aHhzLIXLKde1SXh88f6zaRTOyqw0xaWE7vk5nDkfkuJGmVQwBF/az4H0q
	sL8uIxPqoEz3iScVqHksz0IamHt3UJGJT6m/+pqvqy03Gen5XmEsR98Bm+M9QhpfRn/9
	0Cg7OJo1glwxMR/2POp2oP2KivA5tRW7dsmqdW279Q7l2Il6hAVm/QUCg1BxiPbT3efX
	SYizf3jYwcwZ25HY0ZtLDQBckrc8hmjwz56TTkZHBK26riTlsULftsEbihOK2qMDtoA3
	WFnQ==
MIME-Version: 1.0
X-Received: by 10.224.21.133 with SMTP id j5mr25679095qab.83.1420803134311;
	Fri, 09 Jan 2015 03:32:14 -0800 (PST)
Received: by 10.140.28.227 with HTTP; Fri, 9 Jan 2015 03:32:14 -0800 (PST)
Date: Fri, 9 Jan 2015 13:32:14 +0200
Message-ID: <CADV-EXEYxztudfc2a4YcGj7HC4AMQaddso5uYPjmv_Wfm-DvvA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: DNF package manager instead of SMART for rpm
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
X-List-Received-Date: Fri, 09 Jan 2015 11:32:15 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I'd like to know if there is a chance to replace python-smart with DNF
(github.com/rpm-software-management/dnf)?
DNF already has more features than smart and is well supported (smart
is kind of dead project).
I'd like to prepare a set of patches for dnf integration.

-- 
Regards,
Yevhen

