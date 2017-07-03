Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B18DD60043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 20:17:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p204so22551087wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 13:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=HuzPJoXPMRyk0gwY7TTBlriP/9D4qf9aQ5iPLxmQw8I=;
	b=dpiIJ+TVYVXPlefN/k4eT9CVhDEE9i+b8Qqljo1sZkw53zv3pLQPMmb6kosVJWsviv
	LH83E4HkHdpKP2wdO4XDXeXz3Xlh3GMCV/6fXcqFovnyvfBZswUBaKSMDYyySvcQpUrx
	A+X214jK6Q6l4Y5PduCw9nRhUSaXbtx2F4byTHwM/ajfqPjyoHap69DnjyO1Lo4x8sCN
	Vzw55blwV4zSYtjH5krb4KbJwvVsdyFZoGj33CXk0yRh/lSvF8A/dL6aog9LSdixOXN7
	6fwEgxq50197zEVgdDZFX8SgcCIlWpPMTAulwTAuGvt1+B0vwbOTBmCfMVS0eq8aDS3L
	Kjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=HuzPJoXPMRyk0gwY7TTBlriP/9D4qf9aQ5iPLxmQw8I=;
	b=Ldk6n2s6zebzsxz1uf+u7p0L1cwb5DCeJtLIdKkCfk/NZbBKb9aVDdMedP+2ldCvEY
	u0+22g2ILa9gyJ4GNXTBlffRKXpuFuaEwe9LucmFQ3MygHmtDaeE7w4QAV+dIpVpvzx2
	uNmMi+tBEqAkJXsyVpCKOUyAofTs87J4uWJzy3EeEFFn7+/GvF1JwTtmshKL/5KrTcDf
	PYFah8GycSRlEnRcT6Qf8CWxMTYHcL5vxIDlZVa/+V+m8Zj1MCTdVbONy/KtrzIaLsuH
	ArJSq3llhCwxhiriOjypl6InXSZIJ0+8mQrzEdn2IG344+7f1pm0m9+Lfyz07ziiEkam
	/ItQ==
X-Gm-Message-State: AKS2vOw6xwxpgKeI3f3KoZyyU/68i5Czk/GDvBoZdyRVRYVcsFs32hl+
	czsFhMGcql9rSF3/f94=
X-Received: by 10.28.150.136 with SMTP id y130mr22767528wmd.108.1499113040001; 
	Mon, 03 Jul 2017 13:17:20 -0700 (PDT)
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com.
	[74.125.82.42]) by smtp.gmail.com with ESMTPSA id
	o4sm18549441wrb.27.2017.07.03.13.17.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 13:17:18 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f42.google.com with SMTP id f67so65233437wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 13:17:18 -0700 (PDT)
X-Received: by 10.28.26.2 with SMTP id a2mr6262709wma.21.1499113038653; Mon,
	03 Jul 2017 13:17:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Mon, 3 Jul 2017 13:17:17 -0700 (PDT)
In-Reply-To: <340dcd3ae5be23d6f1395d4f8bb6fd25f7a95c6e.1498782014.git.wei.tee.ng@intel.com>
References: <cover.1498782014.git.wei.tee.ng@intel.com>
	<340dcd3ae5be23d6f1395d4f8bb6fd25f7a95c6e.1498782014.git.wei.tee.ng@intel.com>
Date: Mon, 3 Jul 2017 17:17:17 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoZ48A6Qp1TEvvt2mwE-LEvArjTEQim=FHE9ksvCG1U2w@mail.gmail.com>
Message-ID: <CAP9ODKoZ48A6Qp1TEvvt2mwE-LEvArjTEQim=FHE9ksvCG1U2w@mail.gmail.com>
To: wei.tee.ng@intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] initramfs-framework: udev: Add a runtime dependency on udev-extraconf
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
X-List-Received-Date: Mon, 03 Jul 2017 20:17:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 29, 2017 at 9:30 PM,  <wei.tee.ng@intel.com> wrote:
> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
>
> In order to implement initramfs-framework for boot up process, it
> depends on udev performing automounting, which happens in udev-extraconf.
> Explicitly depend on it so that we always have it installed.
>
> Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>

Wrong; this is need for the live support so the rdepends should be there.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

