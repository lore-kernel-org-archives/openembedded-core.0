Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F326C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 13:33:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93272.1783085619248169960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 06:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pPLFw2Qq;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so4291925e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 06:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783085617; x=1783690417; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYhhUqOuArpR8537Zh6ILVW2IOJ9M48Bezc/OF8mOIU=;
        b=pPLFw2Qqsbqxvx7mnuJFRhsSDdDLIMPDXiXZGNiVpBik2Q1RFcUw6gxTFPzavYGia/
         NL6HMTWjh8H5eMdgjYUktGjInROtPcstEw7vnGYDlzSGxQ1C0yTClekieaH47EvoSunL
         naJ/BUS5l8P/oH7v79lCjnaT8HqQJT5OYsjrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085617; x=1783690417;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYhhUqOuArpR8537Zh6ILVW2IOJ9M48Bezc/OF8mOIU=;
        b=rkoMvhOTBbxsz6x7ftEw043gHkdQ2V0jSEho1HYJfVD2fdwDSJ1zB6k/JAceuggI+P
         6+cg5ABJR4TUXjkzK4LkP7K4llRjOTdmi0jDVioUUamRbd+bM91bxFern3HWMvYOn6Nt
         TaSat+Hv0qe3d5m2B03aun2jC8ReCTcL0uiEyP9qf7tjOyx4Je5Ago9fWInicHBZnOgn
         bZManxwDHf4Wd2RMKbT0lbfo81LTp/Ucksg0rm7HeqxrmXtiRUarvYqbG1Aw7k9Dby4K
         OWzmgxl87QlaJ4aLQcC7LsKhBnQ4ZcwxPJk9PXS+GvZ1QEHqkHz/c6kWJLacufcmNSYt
         El1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+bSsnCGTJ/O1bfnywHuYg18WzFDG4WPtYxp9e4rwm6VYkNMrF/vbwJ8r10nan7hdDloYbq/utWksCyZ/egHAh8Vg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3jl6R8/gXCakNyYZsSkST0n2+8hMxkb6B5/cfHiN1a7CCJSlY
	3QCqQlLSLm+mv94Qmxnb9AmgjW1KJ5+jojPn1kWnsatdQzIxM/WBfiHPXUw2Mdnq9gs=
X-Gm-Gg: AfdE7cm4RmDJqdAmbCXbjLZiUpr5/xzYw0E5jxO5e3LP9NjCjIw7pyVFe4QzDGo/XPN
	4jBkdB6fRVRh7TEL1AVwXTcbf2IyorBwEgFY6PUetZWVcpkGMzBxWbxZtleZj+2ewhahnFyCXbl
	hPgp2PFGvg4JZBRdpLZnkYI3imqV0ZO0jLMxE1PZrGceHr9PFUScq5rHusvjEPNdzZd5hkIq04C
	BExMwgh6l7M1nzKR8V/7pEgAyqIRDqdjiIfSlTGw/1COAKCDn0zCLHd52c0LylIw7YN7QV4L3NJ
	Czp8ff4v0YVgAEsCDY/oXBGEP8vRZVE2jYFG+cYUWxX0uHAlBevgwIzUHEvKp6mN+Lz7tQCMyv9
	JhO8BRpLHaYnbdUXZm6YCUTDy2OtJIGb6RLl6wrKn2kRSYh/ummQKW8lOlv0uXmHU1/5BSa1utD
	Pt2VytfA6dmBQBrDisOECs2kufVQwuR/P01Hb0eL/YgGGncWAY9C9tSFgpTXm992ZhtIOutSyb5
	p08wO6SlOZDgjPw
X-Received: by 2002:a05:600c:4744:b0:492:70f4:8d1e with SMTP id 5b1f17b1804b1-493c2b47ea3mr159450735e9.11.1783085617403;
        Fri, 03 Jul 2026 06:33:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bbcfsm127689795e9.6.2026.07.03.06.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 06:33:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 15:33:36 +0200
Message-Id: <DJOZ3JVV6E0E.1ZS5B4UVCZBLN@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <pascal.eberhard@se.com>, <wahid.essid@se.com>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] glib-2.0: fix CVE-2026-58016
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260703-glib-2-0-cve-2026-58016-v1-1-23bfe853642f@bootlin.com>
In-Reply-To: <20260703-glib-2-0-cve-2026-58016-v1-1-23bfe853642f@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 13:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240109

On Fri Jul 3, 2026 at 3:25 PM CEST, Benjamin Robin via lists.openembedded.o=
rg wrote:
> A flaw was found in GLib. A state confusion issue exists in
> g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
> processing malformed D-Bus introspection XML, specifically with a <node>
> element nested within other elements like <method>, <signal>, <property>
> or <arg>. This issue can cause an unsigned integer overflow and lead to a=
n
> out-of-bounds read, resulting in a denial of service.
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> ---
>  .../glib-2.0/glib-2.0/CVE-2026-58016-1.patch       | 92 ++++++++++++++++=
+++++
>  .../glib-2.0/glib-2.0/CVE-2026-58016-2.patch       | 96 ++++++++++++++++=
++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb      |  2 +

NVD tells this is fixed in 2.88.1 but wrynose is at 2.88.0. Can you send
a patch for wrynose so I can accept this on scarthgap?

Thanks!
--=20
Yoann Congal
Smile ECS


