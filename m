Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEC7731C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 15:13:48 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x130so8522428vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=5BZJMErkvQ3o7dwjcrFNxdMv0nb269792VuvBbSWnBE=;
	b=qV4IithQE1C4JEC/UjCeEtLVWCjyNnyVlL+Ws8ryj/Iz6SKTSdDmN/D7VelHXuaLAm
	rQxw7c2GBxKPAuTMji/TirPiWop/Ht3HSCxbb7B8jA6v8Wkh2vFSbhhdKN5blaaLnwGh
	laM4B99zpLkgJNKPtIssnr93MOEdCHw4Foi2LWNIFVrrUM1Rtjv+sjmzQT3Ak5OsZ7d4
	UlaW4TW1lC7yn1q0b/rEDCMevJPsTYZpeDqGcFIJXUB27LXxj3s2+EGfz69xfJg9FIoh
	S6rw+iVDrJVmTulzVU8RClxgLmaC1IZVdCbNS6wuawb9GryhqXgYfbc+5DtvJ9Wj2ekM
	WOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=5BZJMErkvQ3o7dwjcrFNxdMv0nb269792VuvBbSWnBE=;
	b=mp2D1Qy30wn/cHP0NXaaUxQtfGtpqmvPIpXHqqJgisgpawZF6dl+DYh3VZRnJ5fwJl
	sb8TEB8QrObquDkspjat6peCRY8L0eEANAI1eNcFpQrW19l+g+nUun45T3/MvkHa6dnv
	5yiWyJdf3Rh27rDidkhshAK3QzpMxGS9wFb78HbT0o1b53+f+ykA3VcZoaIn6urdsM7f
	CN6ok/FK3yZ+4RgBtxcGZE5H6A42wPoSMjxD1CIIMFM8h9bHIYxnu+TYmdPvKn7y5Hpc
	jiRJkW++HZXOcFfFl1kfIJ1w7GIHncuP/iMUpy+kN1KZOfDh5KVCaBDSj3L0hTb+g/+T
	Vixw==
X-Gm-Message-State: ALyK8tKDLaqgoVRgcAp58fHEnmXMH4S3P92DBbqP5vPnPDOhOazeUgb0FV33f2DkcXH+6g==
X-Received: by 10.31.99.198 with SMTP id x189mr14921896vkb.83.1468854829041;
	Mon, 18 Jul 2016 08:13:49 -0700 (PDT)
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com.
	[209.85.213.41])
	by smtp.gmail.com with ESMTPSA id p17sm3085129vke.5.2016.07.18.08.13.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 08:13:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f41.google.com with SMTP id s189so34101632vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:13:47 -0700 (PDT)
X-Received: by 10.176.64.72 with SMTP id h66mr17227674uad.97.1468854827655;
	Mon, 18 Jul 2016 08:13:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 18 Jul 2016 08:13:47 -0700 (PDT)
In-Reply-To: <1468852986-2487-3-git-send-email-tom.hochstein@nxp.com>
References: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
	<1468852986-2487-3-git-send-email-tom.hochstein@nxp.com>
Date: Mon, 18 Jul 2016 12:13:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp++LrcTb0wpKCiC3oPY4iLJzCdEmWd-xastZRqZu48dw@mail.gmail.com>
Message-ID: <CAP9ODKp++LrcTb0wpKCiC3oPY4iLJzCdEmWd-xastZRqZu48dw@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] weston-init: Fix weston-start to allow weston args without openvt args
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
X-List-Received-Date: Mon, 18 Jul 2016 15:13:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 18, 2016 at 11:43 AM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> The parser didn't properly handle commands of the form
> weston-start -- <weston-options>.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>



Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

