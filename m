Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1319.1794242424677463717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 08:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=M5KhyWHL;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: rybczynska@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be7b9abc8so874304d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 08:40:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794242424; cv=none;
        d=google.com; s=arc-20260327;
        b=An/Gas4euG02inWpDnW2olCNLyeNrIE6Z+pNT3TETJbVeMoHo/YNwcO/4GplA7CjHT
         vziA/WGxymKC3T//0VXfqKxezJfkDXNNu0/fgwQkZ5nPGHT3xOBE0zMNUiPo1Fcle0no
         eTdmOfnCIi/ejTm87tdP4QklvQgsP1kYGRwVke3D+qCaO4y7bvDx9vvh93aFwHPitmpJ
         nWyPXLW/QfimNYec5AhUZRPqr9BzEuV0mTPRB9W1mhgiSiGcZ2OMvcnld1/PvwKVvsTT
         WVuzN/TamZcQuG0BxJzZQBAiGxCUwWmrl0NgaF1dv1Gp9ThlG5kvdMC+g0kpOZFUfEeE
         Bzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q+jVJ829ywuOXgDIFZPthNpkSO2bhD8fm2/hDrAinD4=;
        fh=kGhvP+CVO2AoFl1MOPJBPRM9gmaD2ZbdVV1jdTDf27w=;
        b=gnPy9MBvU0NQ8ibK7WTyTkXCCRrpa+Adcddjce/uTihshfUKM1Ne5LjukypB+jtvhx
         8pIBGi+S0suFcRI12mE80oihlM2/y4pt++evdZjqAuPeOO8geAvFR13ovyAMa9bqO/BD
         p98+5I88b8/FE/BMjzU2xbCBNcgiFfwj6VCsH0ds6VFxb7W8qmW16BjvevUro6ysxoCI
         daTZOmmB4Ub39377Y0O6f1Xul9wYm96gBAEoqkpB8QsJnKBPP/dh6LAlag1KdndWISYT
         REcnJj4kBNe8goI24l+n16e4bkiDlxUBKGmivKw+wFf8cReEum6JDtmFcdwmVS0D3jLx
         +fQQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794242424; x=1794847224; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q+jVJ829ywuOXgDIFZPthNpkSO2bhD8fm2/hDrAinD4=;
        b=M5KhyWHLFilmyWCIOktrxTFoSBqlzaeEizDMNDfdn/sBTfhE1Rab4nhnNGH5fFcgUQ
         /2pmHgTC2nc4IyhPJhE+CB8dkvsTCnKy4HEC5zYgNuq5zPGxZkvZ0zwyY7vXSeyncN8c
         s/6X3J9RPNsySU5Ff1ysh8nAr8qppEK7qNdpwW4MA6DhGDrLY/2QgJ+f8gcCzLFo6q7q
         PmBx7GVDUzr7BFbHC/kFondQMdY/S+qduSJJ4Rzw3AqNjqR2w7ccn74E6ARE7VZxD98p
         VyY65isONS0qtnvOdf567ZB8bTXdgbFc/83pOTm0AmN2gwn4Bo+0pVExa1g8Lbv0xUce
         PdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242424; x=1794847224;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q+jVJ829ywuOXgDIFZPthNpkSO2bhD8fm2/hDrAinD4=;
        b=aTC96PI8GJLZhdriDQOZ9EuAWlJxKgu6zVnPipfoidFCiY0LAY0QUnYpr5M+F9SxVf
         HXuW4y3U0la7rZO3eRyXNHO22xwP/SCtOxqtcCPXJpChZOkkobteZVlzOnkCOq53w+rE
         PGPWU7pHsO52xYivn9eVlW0qCM2Lyi0mj3QQYz0wJYVJugeB64tqoX6BsiwFyStWfJ1R
         U3ogSJ1Htm/AZTckeJ/DEmn2R5gkuTemVj4rJDEiimDLh04lKkaDtM3m4eD7RM4CDCpn
         L508MyB9B/I1OUNnzi7aVVRL2n6+efu8WOxksK2Aa+Yh1J0zQZ/FdBN5oe1c1inojyhm
         dX1w==
X-Forwarded-Encrypted: i=1; AL+hErEQGexVdlkIcwcbX0l5h5IuFgfISG2x6QsxDvTK2pyU/C953ttZ0UaWI8ZR+QA2cvwNgXZW1gRR30r8zD15hZVuIw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9KEFmpGH5ygb9iWIFSHrSny5f5g+EU2wKm30jsDURUU+lHA/1M
	cqr1c/fsITGijsvNhKlVkvEPFBjNOshPVgSDfxCfrdp6/1d7zJRe9UvRhrQa2B20Hh6CJEta7Oq
	CjOSjZ0bREXANAQM7/4wBUx6/odWQvarYLA==
X-Gm-Gg: AYBFou23rJnH70OFywOr7eyIc2WXTwutSba+SvukPHDxHNjyFF9cPulK3NSrlSRDZRi
	2nth1yS0ap54IPKXJzUp7f2sBR0jIBII/UjJaoYp2bprlpk6McDj8MpLqw3MYiAJFLZ9bCumXAk
	RsgMLAmZs25uueHYiBCJKYPkKlBZqn9/SFGmfotN2ZTjsUnEcJnT8PEAz0ON2X/eYi5X1MZg/Vv
	knx/L1ofdoluS4lBGEjWARtVyIlvCo7qR3LHKowNV7klefjawD1b5HJY2yK+nxBM80+tAFyv87K
	YiIyOPW89eIvjAABwIbqExY3+4NP+C4KuF4bSLdfD8700/CO4HZh4urf6JbxM530xFHtAWM1PBv
	exTQq8r9PRRoZFk1qyaRT3efCue+ggp0ajLaV71kSkTeaF1+bVMSAoNMFnlID+AQekpwMYcI+2O
	+NyNm7QmRktUNeytAhENjw63rAj7P46Zwe0kV6AlNfg5l13YU5qlJ7UaNmozwXyvOzmJzn4dn7i
	kv/
X-Received: by 2002:a05:690e:4890:10b0:67b:f39d:6265 with SMTP id
 956f58d0204a3-67c56751108mr57757d50.21.1794242423450; Mon, 09 Nov 2026
 08:40:23 -0800 (PST)
MIME-Version: 1.0
References: <CAApg2=RBygWWkQi9HtLHAbzdyTJGb7SLo=RJn8tcFyve21LdRA@mail.gmail.com>
 <CAMKF1srwK1AFKj1dZWb4iHMaBOMdQPd+QiBswO=RY76vXYJRyg@mail.gmail.com>
In-Reply-To: <CAMKF1srwK1AFKj1dZWb4iHMaBOMdQPd+QiBswO=RY76vXYJRyg@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 9 Nov 2026 17:40:12 +0100
X-Gm-Features: AclHuK89Dlr-28OsbGJnHGBX24b60LJg5knSx9yzl4BymddOmXgpPUGuPgSPH44
Message-ID: <CAApg2=Ru1mT8s+xADhCf-Zi5rFjwS0UmMPVCyru3fEQGnqi8Sw@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Security Advisory: CVE-2026-123158
 (openssh with musl)
To: Khem Raj <raj.khem@gmail.com>
Cc: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 16:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249860

On Mon, Nov 9, 2026 at 5:02=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Thanks Marta, there is a long thread on it on musl ml - https://www.openw=
all.com/lists/musl/2026/11/05/4
> there are more packages that might need patching e.g. vsftp see - https:/=
/github.com/InfrastructureServices/vsftpd/pull/9
>
Thanks Khem. There is likely more to fix indeed. I hope musl will come
with a new version
(if they decide to fix the behavior).

Kind regards,
Marta
