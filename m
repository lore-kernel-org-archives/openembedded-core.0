Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id E0B6E6C19C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:42:46 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id f84-v6so2103891ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 03:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CdA5T2KQPlHN/p6jq4tXzUEjpQzd7Q6dwI1Ddkji/XQ=;
	b=0+PdyO7HRAMoBp17Q3/vTAcHMQAPTxzDdQJlIIeYecOVRfuTRmjarb3zxfs7xCSzxH
	h9mJopiomOaWSV+AxyGHJC+bWcGbgkV4Q33DnXo/LgpR7Px19PIQ7PtOq7h2bUvDrAMT
	vVp0xeDfhALZ3oCT7px5joJ8g4pTmo9vCUlYwo/aLSoz1xZwr1xBOMExT5bTmjAuKwdB
	QvCxa6mmfshoxqkkybDTEBQIpgvfA7/7IMX77d7mKGpWHknch2EciJJTHHsPaQcSBMpm
	dtuqd7ReWYI/fUjvq4fOpLOm9i838ND5m2RfSFejx23wPrVqKhSyX34pqGVbu91dt59u
	tX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CdA5T2KQPlHN/p6jq4tXzUEjpQzd7Q6dwI1Ddkji/XQ=;
	b=nI4hHBdsmojuoJ7DlfKSg7ZyrFj++pkgz9Y7vGW/0lrBp+Y6GCGUGsslognUHoVSVF
	E/oTP4ZnryhBTZP+lrSyrRFeMbripT3FoD7ZPF07YfmIi6ZF2s0v9EjthpNpG2CCmWLJ
	rdyfZPyeIvjiNVZkOho/eIYkZ670MR32Tk7EPiYxuDMXJ6PkQEckkxHk45LE+725Xk6H
	sLp+kHetsTcuLtOnpKf9klcfPPiGk4SN4zjfgu7qBWKnyIV6GysI9foG3moe5mYkFesi
	O0Pe8ACBCF9YU45RMEOehGFYLg5m+E0nd+yK2/wqE4o/IyTWaja0wHr7Yf9JSpbQPKe1
	VrJg==
X-Gm-Message-State: AGRZ1gLOPeQF+kCFPB2nsdk8PZfd4oL2MhdV3Xyh+WIzk1eIhqNkFcUq
	fOCPJe2Hkl6yf+dOXS3DD+Wh1fVmIJiVc1j+pF4Vig==
X-Google-Smtp-Source: AFSGD/Vq24GDg8g0gpUd1WfpUeQxMs4McUFriCDjFGuJzTJuU5e/2p8YuoEqkzk4xYTkQV6m2ama+G6h+tdbXeZKGWI=
X-Received: by 2002:a24:1d8e:: with SMTP id
	136-v6mr1514997itj.62.1542195767890; 
	Wed, 14 Nov 2018 03:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20181114114025.7010-1-zboszor@pr.hu>
In-Reply-To: <20181114114025.7010-1-zboszor@pr.hu>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Nov 2018 11:42:36 +0000
Message-ID: <CAJTo0LZNDXUru=Ow7UgERukByjyBh_mMohBteZsGUWg_ffvvOw@mail.gmail.com>
To: Boszormenyi Zoltan <zboszor@pr.hu>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] update-alternatives: Allow using relative symlinks
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
X-List-Received-Date: Wed, 14 Nov 2018 11:42:47 -0000
Content-Type: multipart/alternative; boundary="000000000000eb7326057a9e6e4f"

--000000000000eb7326057a9e6e4f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Nov 2018 at 11:40, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via Op=
enembedded-core <
openembedded-core@lists.openembedded.org> wrote:

> Add a new ALTERNATIVE_TARGET_RELATIVE family of variables to
> conditionally make these links valid. This is limited to the
> case when the binary and the symlink are in the same directory.
>

Which once the fix to update-alternatives to allow target and link to be in
different directories will not really be the case, at which point it breaks
again.  I think we either fix this properly, or not at all.

Ross

--000000000000eb7326057a9e6e4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Wed, 14 Nov 2018 at 11:40, B=C3=B6sz=C3=B6rm=C3=A9nyi Z=
olt=C3=A1n via Openembedded-core &lt;<a href=3D"mailto:openembedded-core@li=
sts.openembedded.org">openembedded-core@lists.openembedded.org</a>&gt; wrot=
e:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add a new A=
LTERNATIVE_TARGET_RELATIVE family of variables to<br>
conditionally make these links valid. This is limited to the<br>
case when the binary and the symlink are in the same directory.<br></blockq=
uote><div><br></div><div>Which once the fix to update-alternatives to allow=
 target and link to be in different directories will not really be the case=
, at which point it breaks again.=C2=A0 I think we either fix this properly=
, or not at all.</div><div><br></div><div>Ross=C2=A0</div></div></div>

--000000000000eb7326057a9e6e4f--
