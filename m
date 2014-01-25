Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 657A36E754
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 11:25:15 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id jx11so2557436veb.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 03:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=+LTP/1F6O4jkVC/bOoA+wEpOCmnjd29tG5cECXLICRw=;
	b=T+wvhgFBZvehBhONk5zFExvy9QqrvFVV8aL6oxE/hac623oknBlJ19rIHo5tCWQmEp
	/YaHgDlFNFgg3qifk/EIz7GilgcHeeDCwLAclOKI0gRLwsoX0oO592hnWwRrZmc3fBVQ
	DTIdyjkxRCT8+YkJ/RyXSAMyIt7VhC010ujSYAnFiZwb4O2g67hqHpSeowvaaq9xGv/g
	0lwacx3QynFabXeQgoFi8Hkt2ArVY70XDnmgkMrcQJT/cZn87zZx5owbZupz7trSEz43
	WFTW4Bla8IwXDCfJH0wPyRpncHvEt2A70rTF+9Ov5H+30LVkwrsuV1Q2C7Cp3+KP4u4V
	lw2g==
X-Received: by 10.220.88.204 with SMTP id b12mr10026155vcm.3.1390649116212;
	Sat, 25 Jan 2014 03:25:16 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Sat, 25 Jan 2014 03:24:36 -0800 (PST)
In-Reply-To: <1390623243-28674-1-git-send-email-tylerwhall@gmail.com>
References: <1390623243-28674-1-git-send-email-tylerwhall@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 25 Jan 2014 11:24:36 +0000
X-Google-Sender-Auth: TkNYIJ3Aoqn1P9gP1_AkMZCiY2c
Message-ID: <CANyK_8fHJMUAm=hDfq55fcH4pLSM_=9iP6p0CqMyk9h6ngOsJw@mail.gmail.com>
To: Tyler Hall <tylerwhall@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: Fix libtool linking against local libstdc++.so
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
X-List-Received-Date: Sat, 25 Jan 2014 11:25:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 25 January 2014 04:14, Tyler Hall <tylerwhall@gmail.com> wrote:
> Building the C++ bindings in a484b35b818768487ff27cf06b8c5d4e128126af
> introduced this error on systems with /usr/lib/libstdc++.so present:
>
>     /usr/lib/libstdc++.so: file not recognized: File format not recognized
>
> The shipped libtool is sysroot aware, so pass --with-sysroot so it will
> extract the sysroot from the compiler.
>
> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>

This fixes the issue I was having, I can now build db without having
to revert the previous patch to enable C++ bindings.

Tested-by: Paul Barker <paul@paulbarker.me.uk>

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

