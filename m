Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3584.1793992140372768610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 11:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jmfn6gFY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso9237675e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 11:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793992138; x=1794596938; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iT/eowrohnxm0qbz+tVMIXzUkq2mMyDi/xjAJ64u9b8=;
        b=Jmfn6gFY2rXy7tjKQ/ADzD3fWAX3lBaVt/x8ibVXun4aJMvM/Bae5IgpjGy8F5maln
         Gpr1jit1rme4wCLD2j+3ZIsa28A88Wh7Z5gtqBoB1CrZeuMQvlW4bDNSS46gkiYTk0ut
         Oyw3nx2WAik6fDh989C150KbkCLpXgmrPYlew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992138; x=1794596938;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iT/eowrohnxm0qbz+tVMIXzUkq2mMyDi/xjAJ64u9b8=;
        b=kBd1cHiwTex4DzuxbWwQL31cR7oPiqOtoI9Rf/bfmuJ7tEMk3WzrF+NzUJiwDK88nY
         b3uoxd2Jrly84OBjhxpDQ6j2OQuVbTSTJW/yarBOR5fNP7N2NIs8+LzQWW4H1cSLNiu0
         rzq0dzVsEsFd7sQLxTTNN4DEtzIdB1+URJYlHtSH2X4cn+ZcPRuWWaI+K/7ApgUeh+UY
         9AUUvGfSUCuGzMThUeDPDmMZTtB1R8A90Snbki8fVQ8fBF2qMc/kisPytCnrJg6/b6oz
         jtqdPIWvJqVT4d+RjW1FjCQMy+RzhB2eIuwJ+O3TpNCe537/W79+iilMUmYjTGtvMFTA
         PHnQ==
X-Gm-Message-State: APuU4Z/MuTmxz+LpuEZRe7Zm2STS5ampuf5aXjFltkT5BFXpxbMwneUw
	XJ43g9+VHnCzAlpOQGCx6cYqtuj24YbcvLP6qn0iB5cJHf48nS7v9RN8xU9ul2yDeT0=
X-Gm-Gg: AYBFou3S9RXQdx7dHqw5BcsNF9NGA/kgydT8ADAvVX4ZXjRzSfV8WW/dH9H4SjBmHxT
	60iTqt4IIPg3MtVlsHs/744CRe2oKTXVOtQ5dVhZb0ZODyrC+37bg8Wx9xXCErL8hq0u1MokSvR
	PAdlko/SwUrgOpiAWS9f1flENrzo5vRUKo0bSiy0QkfR5Ri5QTBV+a7g1RM7L4wfjr0DxremUjE
	YcU2cZiN/xdcZduVFDfLJdc9LHccPjlz7GkakE5+EbN1/Enm0YGufQ0U01JSzLagUqTXyJ8dh3p
	M3WpRFhfQJh4qmwkhhVNZXzkyxRMkOpS6OTBO6FmlhMD8x+orIjetLQLQJFqBc5/jrLl3kZYzfp
	W0+DpvEAEl1sca4K32wV0sh9pRo45fxFnak9lx89ZE6GGPM6FHIFcftKreM7ajs8c1HVbPwLy5F
	Zx2JMiHey/D3CrGEO18Azy0OL8vId1oyOC4oksUFp90tB7sNUVkfne28xShf1ocJB0wCmOwWnq9
	pe5aUZ2KiPkjfvEA8muBNC0pP9Bwg5WLFnpbpAS4e7roGVtC9wXwaOY8WXs3us++tlAjvI1xrmo
	doAh5oVgwzJvnVTRYfuFD3C/Le3kPW213tjRSFVUO6iCmJTvfsd0+l6r+UxIYgSaQhiHy74/bcp
	3DT/EUCx9+1XNw93WWw==
X-Received: by 2002:a05:600d:82f2:b0:4a3:7344:13b4 with SMTP id 5b1f17b1804b1-4b6df3fd27dmr71047825e9.14.1793992138573;
        Fri, 06 Nov 2026 11:08:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1e90:9dda:c43a:4321? ([2001:8b0:aba:5f3c:1e90:9dda:c43a:4321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d609a3sm5548554f8f.7.2026.11.06.11.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:08:57 -0800 (PST)
Message-ID: <22b23081715a48206765902938899bb7f9af3be0.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC PATCH 0/8] enhance kernel -devsrc output options
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com, Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 06 Nov 2026 19:08:56 +0000
In-Reply-To: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 19:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249713

On Fri, 2026-11-06 at 12:32 -0500, bruce.ashfield@gmail.com wrote:
> =C2=A0 7-8: two general oe-core fixes, for issues I noticed in the debug
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs while working on this support=
. They aren't kernel
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 specific and don't depend on the res=
t of the series:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 postinsts of debug only packages bei=
ng registered against the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image, and IMAGE_INSTALL_DEBUGFS pac=
kages with broken
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies being silently skipped.

Do you have an example of something which has a postinst which this
pulls in? I'm wondering why debug src packages have postinsts :/

Cheers,

Richard
