Return-Path: <theknoppix@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id CEC756B899
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 08:41:39 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v18-v6so16274088wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 00:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=1yKxDJxpO7CetUGtMzXxt2STcjcJFyyBPDqZVvKWgMY=;
	b=SNekyG4t+WWm0s2FU811LcciWRR7UHE6kN1RjOwTQNtMGegU+gdeSBDQQlbQSY8/IY
	PUGZM1CPw88uf1MeGMPhhJp7BRB0RHEYgFY1mBPnjXBioF7Uc4T5zESXh5WJ7ZXbOxxP
	9/TFbjEodzyvg1O+zGvdnYk34/bnIcW4qDrZbhjcUNZK+TbaAMoCMkxpfRNUJJe+C4sZ
	jtKp1m6SuV5pyFWMvFb99NndnMlRindiAWri3uD64YiteKpTK4jvom2RRs84Ts5eNvHc
	axg7H3DkJGGXea5VWa1Jn4fWKRR8L3923EcG/GVuinSdDmWRwTjJcqdlYF72zHiNk649
	nnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1yKxDJxpO7CetUGtMzXxt2STcjcJFyyBPDqZVvKWgMY=;
	b=dkcdZiF6lcz7V57m8+fdcnX25O74rkdhFOPfxUjfVXwKpjKAQT2UPeAtbVShcJ1QpY
	RtCA6qbbNrX2MXRA7xtvyKBTw5FiZMj3D6RhniM+c6O7eShFnpVytmLIy6FwpH0lBVel
	ItjGU5rkzuETNxMeAAHncsArWWAqpOTl6ocf9NAyuiVyQbtOahGvhZ2C6edyRdlo7u79
	4Zb4IUTzi1e/TKCq1cy62BXynLFBEw+aHGcX2rAWZkA9ADwZA9ghz1xKUAzP22FtMGge
	Zma0EbsCPTBn8aTIsOz7TweWCLIvWOdmXOHnTO4Lq2uMeNLAmzgKVLpjKQNygWqNizYz
	LxKw==
X-Gm-Message-State: AGRZ1gKt/UhzJ9tYQLuEyYxRYB7Zz2d8ZM+aMlRmRkmDYRbKzIpVG7vW
	NJAzzxX0KJuu08fKI1LyahKNOFK9XtJmesEM9EU=
X-Google-Smtp-Source: AJdET5d0buGB1mPm2gXW45CDyjSmAH/jInJqoAQAbYaG6zPoO4zbHzgYoy8rjVispwp1P7PoSI4AnL49vPyv19jznXU=
X-Received: by 2002:adf:f651:: with SMTP id
	x17-v6mr894240wrp.229.1542184900457; 
	Wed, 14 Nov 2018 00:41:40 -0800 (PST)
MIME-Version: 1.0
From: Knoppix <theknoppix@gmail.com>
Date: Wed, 14 Nov 2018 11:41:28 +0300
Message-ID: <CAD9sEJu_CbZYAGCiytx1GuM+HEQ+ar8mRG+aWG55dRe_okpK8Q@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: meta-gnome: what are dependencies for gnome-full-desktop (gnome interface)
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
X-List-Received-Date: Wed, 14 Nov 2018 08:41:40 -0000
Content-Type: multipart/alternative; boundary="0000000000002b785d057a9be7c4"

--0000000000002b785d057a9be7c4
Content-Type: text/plain; charset="UTF-8"

(Excuse me for my english I am not native)

One disappointment for me was learn that meta-gnome is not fully-supported
for running desktop. So i want to write all remain recipes to use desktop
environment. I want to start from scratch (except from meta-debian-recipes)
because for learn gnome world.

Dear friends, how can I learn what are the necessary binaries&libraries for
gnome interface (i.e: desktop window&display-manager panel, topbar,
settings and other UI full-desktop-environment) to use on yocto project?
Which project is I should start to write its recipe?

My question is what should I search on search-engines?
Would you advice me a tutorial&manual please?

Kind regards.

--0000000000002b785d057a9be7c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>(Excuse me for my english I am not native)<br></div><=
div><br></div><div>One disappointment for me was learn that meta-gnome is n=
ot fully-supported for running desktop. So i want to write all remain recip=
es to use desktop environment. I want to start from scratch (except from me=
ta-debian-recipes) because for learn gnome world.</div><div><br></div><div>=
Dear friends, how can I learn what are the necessary binaries&amp;libraries=
 for gnome interface (i.e: desktop window&amp;display-manager panel, topbar=
, settings and other UI full-desktop-environment) to use on yocto project? =
Which project is I should start to write its recipe?<br></div><div><br></di=
v><div>My question is what should I search on search-engines?</div><div>Wou=
ld you advice me a tutorial&amp;manual please?</div><div><br></div><div>Kin=
d regards.<br></div></div>

--0000000000002b785d057a9be7c4--
