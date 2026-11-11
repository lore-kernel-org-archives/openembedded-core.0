Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12427.1794412105675267096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 07:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ey/iPS0W;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91ec2d42231so34318946d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 07:48:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794412104; cv=none;
        d=google.com; s=arc-20260327;
        b=hLvtZZ6J6dC2rBsBIImGKwpCRFAc5MDtt00OVBjMr97BjoPttC6K2N2sAHFVkXsVy3
         Pp267XnY8l6WEocYiaHV+mTYH9GWTJ1JCPYm6/TnYjINsgnwVVAWN6orpdAJH1hxBMpJ
         ON6POtk02K5BYeIqeD+SumVpotzDL0jVttk50pWdS1t9DI3aecvwbIinwY9CDUn9f0kq
         1gv7yJqHRrbDif8N8Wa70Kjtp6sXxEre9jwQRBFRi+ipU8LgMh0Q+Hli9hYbyXRuLK3e
         kzhLmsPVZorpwIx3jn5QrFRsI+y0j21MGiGQcB2EVP65XrDxQ2eaVT7AHaGNwdBIcvuI
         N6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=stdbTFOV/iX5ryJzZ3U2XI6YsLhUtidU9sqwTAadjf0=;
        fh=SU1zTV3x7W1Z5EWlpEFizmMpUhugwnbQL+ASJoQ5xuM=;
        b=MiU0tBvRykyZuAL7bhn4ot/I9hC77C7LOfqkmkonVhSQ25DHslzhYlSbFFztgcH8Ef
         d3EAFbnMxW32lHfpDsSEbZwitKPB6pOytWNYOzIFBz2gQPYx83BXR1llUSiyx+qjaCsy
         AXhll1xE2szrKDR6579nVasMCnx7zEes0QWEc6+DTAq97x5XTuhhhqLQGgBTeJGYnJys
         OPkR/MqDTkkenbvwhpGt7MtCG2kQCJ0SPUEu2nsH2SAQbJQVm8KWY2Tx+zeRruRWP9CH
         rdY5Ql9StqwlJwn+7xkNvVSlUTwJiKDgV9RX3iZVEfUQvQ2Rj3aRq/NIvZnEZfcjgqmc
         BD8Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794412104; x=1795016904; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stdbTFOV/iX5ryJzZ3U2XI6YsLhUtidU9sqwTAadjf0=;
        b=Ey/iPS0Wp+We3zOBPTIhfvI+3uEKcTSVNUrf5AjmugYz1+dt07oIzU29SHQVXCCkAV
         gQaUOZZAFYFvftqB+lssR3Zx2+w6jSCxHHecniio2c7Mv3Fp+CPgc7p/btS18DRhoV4B
         3DukKgJm3jvmrD/pX1A/KR/L9dnh0V9MbtjGTMQ35rrvOh24DCS6niriaYJyRdxSzcay
         co+qfF0/9hlNY/66OBn/+QxjUAXys8pcExFw6au0FjvkeBQh/1UOsxARgxNq6P2Ti2XX
         1NllDgEfETLwd+xIdZGmx1r+yHsl9NKTh7DBSVw0agw3ENXEZ50eISOG3N+DWx3Zc2lE
         pmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412104; x=1795016904;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=stdbTFOV/iX5ryJzZ3U2XI6YsLhUtidU9sqwTAadjf0=;
        b=IU/y9KlZvS4xX55cDubz/PtDnIe5O6XfAw1WuzxSb4JVG787jQn8ACmNwCFjBHF8vP
         x7L6PmN/Y+CoG0S7emRBf68k06ZONWnY0hrkP9gjGw2gz3MSCqCVBKD9/TFuI/Kyb7Ts
         CA0l3DXtbdG4pOMdqRfNsmMpvOp9gnWEDPA7J0Z+Nomu51+pWBzhcgiqnnIANXe4+Mtm
         wFhcYtjptSCIPJMWzpv7BskqmbXgiemplWZ1Q7xxHiVB0xjiddeqi+SG8zwWS31J7gQW
         3ltmtpZzAaaNrxLtasqWz5A7AbEZ83NSDFpdC1kp57IVNdjrZfMaocG64naXfbPuIe1a
         39YA==
X-Forwarded-Encrypted: i=1; AL+hErHHEFTCxDVjqU4t3rkmfub+shtBtIoHDNx6mTxnn5u0WWdIp/Yua1F8zsN3P/N3fNsm3eWopYQYlO7GNpBt2UgZRw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9dzWrNTRVGGhtXYtlPziQDFks4+A8mXpfVCcMcV8fNV4QdQlMZ
	bJDh0XDgJLBIztqJGRTpIfg7vqImwAp6UlH5NoLxnVS9BdMktTU/FTLrXzTvPCYpY/UKdyh2eKe
	W9U/RbwYqTaypVXGxPOoOjAhHHM0Q8nM=
X-Gm-Gg: AYBFou0GEfMv6DsGV106edXa5nLfucZ71ftexWQtJLkKYrhQJ6cxeUIXJA93R0CNgu7
	feOOpOdX8wj0Y7Z5iongOXibETXlwKtBGPISou2Uhjc1oyoBDeGeInAdg/uriPmuAR9x+3RaBLd
	gb/um2CEy2RLa6nmI6A7fTtczyD/Xa6REMFmwJEQXhQ4CH48C4lLID09bCaZD4kj+T77hju4P47
	zn8myrnICer0ogxxbLP6fSTEM7m4BdFuljOCx6opybUkPol7muOxvAVMnrxqT42ghW9tJYSbTYn
	H9+hTtiWMTPkwmtZXBTu7vbM2wP4YDnpn6QN4AZ3W6oNStx8rD6+i9r0KeA7gBonLuxb+ImXpgj
	zz6m4gjnpdnLBFca2UwhS6XGCBM7JnSkbaGgI9UAn0xkNSEz/AE5dxFrx4tmb295PKBZL/Yaj25
	u1m7ghPT+8YgjgzRb+
X-Received: by 2002:a05:6214:1c0f:b0:91c:5f4b:d2d7 with SMTP id
 6a1803df08f44-91f04183928mr47317466d6.47.1794412104477; Wed, 11 Nov 2026
 07:48:24 -0800 (PST)
MIME-Version: 1.0
References: <87910dcc110b0e4cc397d9f57d9b37824c6859f2.camel@linuxfoundation.org>
 <20261110215935.107339-1-stondo@gmail.com>
In-Reply-To: <20261110215935.107339-1-stondo@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Nov 2026 16:48:11 +0100
X-Gm-Features: AclHuK8AJ03S-VkFdvhA8ut4S0aFrFDxxuxn4EFVw1cfTwe2TyVQREMPxbRl3BA
Message-ID: <CANNYZj_rf==FyKuRF85F=6f33OC89L=mA_NoGjjthYRT+mG78Q@mail.gmail.com>
Subject: Re: [RFC] spdx30: name, version and purl for dependency downloads
To: Stefano Tondo <stondo@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, stefano.tondo.ext@siemens.com, 
	openembedded-core@lists.openembedded.org, 
	bitbake-devel@lists.openembedded.org, Joshua Watt <JPEWhacker@gmail.com>, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>, 
	Peter Marko <peter.marko@siemens.com>, Adrian Freihofer <adrian.freihofer@siemens.com>, 
	Patrick Wicki <patrick.wicki@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000001175a30660022039"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 15:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250039

--0000000000001175a30660022039
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 22:59, Stefano Tondo <stondo@gmail.com> wrote:

> I agree, and I would like to help with npm. My idea is to follow
> cargo-update-recipe-crates and go-mod-update-modules: an update class
> writes one SRC_URI entry with a checksum for each package in the
> shrinkwrap file. Then bitbake checks that the list matches the
> shrinkwrap file, as you said in your reply. Is
> that what you have in mind? If yes, I can prepare patches.
>

More or less yes. Please write tests together with any new code; ideally it
should be possible to use and test npm fetcher without npm executable, same
as cargo fetcher doesn't need cargo executable.

Alex

--0000000000001175a30660022039
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 10 Nov 2026 at 22:59, Stefano Tondo &=
lt;<a href=3D"mailto:stondo@gmail.com">stondo@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">I agree, and I would=
 like to help with npm. My idea is to follow<br>
cargo-update-recipe-crates and go-mod-update-modules: an update class<br>
writes one SRC_URI entry with a checksum for each package in the<br>
shrinkwrap file. Then bitbake checks that the list matches the<br>
shrinkwrap file, as you said in your reply. Is<br>
that what you have in mind? If yes, I can prepare patches.<br></blockquote>=
<div><br></div><div>More or less yes. Please write tests together with any =
new code; ideally it should be possible to use and test npm fetcher without=
 npm executable, same as cargo fetcher doesn&#39;t need cargo executable.</=
div><div><br></div><div>Alex</div><br></div></div>

--0000000000001175a30660022039--
