Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4407CC41513
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:38:09 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.6838.1721122679733037771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 02:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ri73r/o5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-367a9ab4d81so3199858f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 02:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721122678; x=1721727478; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uWqZfsHDwBoZYlCfVu2XR7obvk/kAqPYsE0so2JV0Ew=;
        b=Ri73r/o5C1sjRPKaur8dwrBUaijhp0jk9j3fNj9CNNwRPnuVSYoOq0uWSZEOGCJjUu
         KIh7YxPrkW2hZqf1nIQwXsV2hEUypQznqGNXgWn4HMfLgwAq9/PX99dpHlBHWWUu4kIb
         Q6RjWcBt8dZouVRhVEsBiYAplezFlIkQc6RNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721122678; x=1721727478;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uWqZfsHDwBoZYlCfVu2XR7obvk/kAqPYsE0so2JV0Ew=;
        b=mSHp2075QRS7+ia2rzqjuUxLzHJV4OpylaUMkxkxYBUzkL9yuIzvLdTYnX651M92ps
         rqtK4vzFt/Qru8KB2V1zyr2z0DvgvexAo0sUQzUiOv++oEU2TJ+nUsxD3b/FrkF5zs55
         VsJy8teK4ZdSUVChyFPb08cogb/9Krps2l5dZJZlFc1wj+K8n2L1OjiaZMb1Lm08IZFe
         4qtGzCmQcpOz68gzFlo5E0sofBVREvDHxnfim+EbaSadJIYJ/1KG4BvZPAM1ouwsoNJl
         RWMOT/X+MtDLsh9GTE7PkBYQUH72wbb3VRdPAU4OaFzUQvjU2IPyVMnXQV1EQhcBE+wN
         8OAw==
X-Forwarded-Encrypted: i=1; AJvYcCX2ZvDGS7HnIt66mrv+Xs10kpcPuK9j348LFT1NwdFW0DT/0Yze8aHndYD4MI8hJqjUJTIc+lX2Sc8ZxQTxZI/dhM/I6ztLH8rJb5Mtq1RRol4/7YJsFfI3
X-Gm-Message-State: AOJu0YzdWO5q3PRrBQ2/iV4Q0qxOFYd28mmg1sr9bmSWMT/3NS4wtDWo
	ucdRW9A2rGIdMNJV1RuSTf79WMhpWObLkji59PUyaTW7PL1smVGxF6WmJt/twypA33XJvD16RTe
	w
X-Google-Smtp-Source: AGHT+IGnRNpAC32YkCngmeYtNXRXGEAJ8YWi2MK/eafPGykbsvLU3+8z73jKRIjn2USOVhqPcyeWIA==
X-Received: by 2002:a05:6000:10:b0:35f:1d10:18f0 with SMTP id ffacd0b85a97d-3682635c63cmr1040745f8f.64.1721122678103;
        Tue, 16 Jul 2024 02:37:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:86a0:3ee3:878:91c7? ([2001:8b0:aba:5f3c:86a0:3ee3:878:91c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3681c30a024sm4214466f8f.96.2024.07.16.02.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:37:57 -0700 (PDT)
Message-ID: <0fcd691268dbbb1e3d8c3dc4c4714b64de53094c.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 2/3] openssh: systemd sd-notify patch was
 rejected upstream
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Tue, 16 Jul 2024 10:37:56 +0100
In-Reply-To: <20240716092955.2463-2-jose.quaresma@foundries.io>
References: <20240716092955.2463-1-jose.quaresma@foundries.io>
	 <20240716092955.2463-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202093

On Tue, 2024-07-16 at 10:29 +0100, Jose Quaresma via
lists.openembedded.org wrote:
> Still side effects of the XZ backdoor.
>=20
> Racional [1]:
>=20
> License incompatibility and library bloatedness were the reasons.
> Given recent events we're never going to take a dependency on
> libsystemd,
> though we might implement the notification protocol ourselves if it
> isn't too much work.
>=20
> [1]
> https://github.com/openssh/openssh-portable/pull/375#issuecomment-2027749=
729
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>

I was reading about this in your previous patch and was planning to
make a comment about it. Thanks for splitting it out!

I remember when I was asked to originally merge this patch to OE-Core
and I had reservations at the time. I tried to push back and was told
all the other distros were doing it and it was essential we did as well
:/.

This does raise the question of whether we should be carrying it. Did
the other distros do anything with it after the XZ issue?

Cheers,

Richard

