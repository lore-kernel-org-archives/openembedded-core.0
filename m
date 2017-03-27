Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA2772FA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:28:49 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id y88so30225113ota.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=dkgTVGFinyAe/YNYPru93EXQ4Sjt7KUz+j4D2ra+lVU=;
	b=DvOOIzpVMpSniylDvvWdIBojzUVVyezSo0zyNlVvgHDqtPPy+PmlYsjD15N0EGhDqd
	SeHcxsa8detwqMdgc+iQJESMdghpgg4dR4ZhZvtGRctgLB10vaIXPcc34ijb8+sF/Yuc
	hiRAUavTIFWmfmrGg/6t1t4FOV9Ey503Nw37FZ5ixQ4AhbY5AN/0tPgVQ7XpVccnMjwO
	KszzmLdaYCSpMVn1ecHWHZ3p+rm8zQVJWPQNdEi0tUx9D/SFPEulBoWHRU3DwUFJjBQV
	uU7ecRgSGX5yR637fbkQ+IWXqIuSnOUMySd3sywArhcknmRTWHNLb0pNJ/vwRdLRkiB1
	8SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=dkgTVGFinyAe/YNYPru93EXQ4Sjt7KUz+j4D2ra+lVU=;
	b=eq9e9jJ38oyTFzgq/PAssunvSlF46jGd/w4sn3ckAjSX8UZNlePVxoQme8Rfdrx/KR
	0R/XBZBYU6AQ+AJM4d+oszSbY0oMgK3PYMe682QH4tHin+m9oZFSb63h2HgucSXDFxPs
	ZIPBYRfRwyRdviG2O0tzEvKzKOzT5nthY1POuNuqwxRSCj8KBw8XWhI6w3Gjgnx//QJh
	IP869BfOg9WDTzYSrqe52AHRBqQz4eHGzuDLH76yPyJsxTXS5me80cU+EY09MQ09sSfp
	CuyJenSA31zPbEY9HMoW62nVfaOOi8qYlKgXlTis1LFPQq8PHzJURlP3X63jGlqU1rDm
	bUxw==
X-Gm-Message-State: AFeK/H16PsSD0MiONMBQNie/KehuC4fW8voapwqqnC72MqGWiH436wTreNA2KrVWnu+xpA==
X-Received: by 10.157.53.34 with SMTP id o31mr6061692otc.76.1490621330694;
	Mon, 27 Mar 2017 06:28:50 -0700 (PDT)
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com.
	[74.125.82.178])
	by smtp.gmail.com with ESMTPSA id r2sm206959ota.21.2017.03.27.06.28.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Mar 2017 06:28:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f178.google.com with SMTP id t8so25696580otf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:28:49 -0700 (PDT)
X-Received: by 10.157.48.59 with SMTP id d56mr11349376otc.81.1490621328808;
	Mon, 27 Mar 2017 06:28:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.79.203 with HTTP; Mon, 27 Mar 2017 06:28:48 -0700 (PDT)
In-Reply-To: <CAJTo0LZ_V3p43c55r5cjhxp8K5ABf-001Dx=S-V0GtASPp2-tQ@mail.gmail.com>
References: <20170326200813.23705-1-otavio@ossystems.com.br>
	<20170326211438.GI15664@denix.org>
	<CAJTo0LZ_V3p43c55r5cjhxp8K5ABf-001Dx=S-V0GtASPp2-tQ@mail.gmail.com>
Date: Mon, 27 Mar 2017 10:28:48 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq8YMMDT-GK762Y==Ut=1MpsGR_jFOD29cVrD+8iTAgGg@mail.gmail.com>
Message-ID: <CAP9ODKq8YMMDT-GK762Y==Ut=1MpsGR_jFOD29cVrD+8iTAgGg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Mon, 27 Mar 2017 13:28:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 27, 2017 at 10:19 AM, Burton, Ross <ross.burton@intel.com> wrote:
...
> Also what boards has it been tested on?  As it's from Otavio I presume the
> Freescale boards have been tested.  Denys, have you tested this version on
> your boards?

We are using it internally and we will upgrade meta-freescale for this
release as well. I believe it would be great to upgrade this as U-Boot
bieng up to date allows for a more up to date reference code.

If there is any failure in the automated tests I can try to iron them
out but I believe it should be fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

