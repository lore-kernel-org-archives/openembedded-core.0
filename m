Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id C03487D10A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:34:55 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id y63so4169023itb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VRM0bUf9dwT6QQJxO8NZ4Frt5BRGR5G2mlMawqddFPE=;
	b=xRwNnJu4SmnA9VwHLU6PCHN2BLcMs0Xym73lvhu2NVNn1jnm4cXSeeRFEiQroslVza
	Pvkimu/9Sum/w4hk3ygGbys25iWtn8GTxRZoz5bIQEoezGS3tyWkB2ogNvf8YT90F3Di
	Iy1KkQwqBeTxKXlkH6H0bCECk+wlAPy7r3tyZOvZGxmd83vAT8oVX66Kfz317g+n73ok
	bcvxCGCm2oJCwYeBfBMdWRsSAtRObPTEjZ3oV2Xb2ectMnlovRrckbNGMkqQpznNrXOB
	fKYcbRj/g9ihplHWX5geVyoMzKjptjTNwi+Y+UdChdmnhnHzAk556QAymdOP9YPJwznB
	4WZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VRM0bUf9dwT6QQJxO8NZ4Frt5BRGR5G2mlMawqddFPE=;
	b=iF2j18IJddUf1mWeltMuwl3AnlHx0Ps1yjVWKEyKX/DK22DQLrrQSaPDJM3uq71ZK3
	5VtkMtITCQTH3iUHMvIxgWOZDt/dychevDqsZNLTmiBxa3LLfc9FkaoNysJC7ucGsS1W
	Fkfv3212LItJzrHk4SiA6boWfzo3RT74ewElKy2cFN1IVr5OxA3zV7LPDnHHjyauBzKh
	8IqqDsItZm/MmvNLkyacwyUMQTcPBcVhSNnMu1T1Q26rl11zj1f7Fmd9evUmdX/AX88W
	880ab2dX23jSwK19ZsmlZeFVBXPFP0YgPTPyAi2wzN+O0z/hmCp91vPPEe38Qg916G2s
	JETA==
X-Gm-Message-State: APjAAAWU9RsR+NH0pM/lV6XdntVqwJbiRTsX3LDzUFl4aU7wkuN4dqwB
	dP6MjFtrz+jAbU8n8E/svEJAe6iEHP6bzgordMFCmw==
X-Google-Smtp-Source: APXvYqwI0KoNQhTUoQq68qAhqQk9M/neAsByU/nUCHR69u3rsQ/CmJrrzO9kNCvnUMSlnLCEfRakeifb7s4l/onOhEk=
X-Received: by 2002:a02:c955:: with SMTP id u21mr19563904jao.105.1553870096730;
	Fri, 29 Mar 2019 07:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
	<CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
	<CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
	<CAJTo0Laq_H-C+-S5zNU+4c5urQ5Y2Hy4oSe63EoQZotnLkFsDw@mail.gmail.com>
	<CALbNGRTJYpi90K4VYtSfTq7kJj1Fukvu_iGGx=D-n6hDrNH7Pg@mail.gmail.com>
In-Reply-To: <CALbNGRTJYpi90K4VYtSfTq7kJj1Fukvu_iGGx=D-n6hDrNH7Pg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Mar 2019 14:34:45 +0000
Message-ID: <CAJTo0LYQHcaAg=ikVDWSQjBTgTOwTTRmtpKnNUvbuK0UjRuJWA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 14:34:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Mar 2019 at 14:29, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
> Thought same. Are you sure that does not link - or can you explain how
> DEPENDs fixed adwaita: If it does not link: How comes that librsvg
> makes it into adwaita's native sysroot?

I suspect historical about how the sysroot is populated for native
things, as until very recently RDEPENDS wasn't considered.

(oe-core c62520b63284927e177831c351fafa4d2768cb1f)

Ross

