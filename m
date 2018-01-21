Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB4A785E7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 21:33:04 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id b11so4670302oif.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 13:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Qh5mgyPenpEVzUVHucqrQhB44EuT46D6LEQ2xSHyfi4=;
	b=cXVijZEvKSbvhPKrCVMnbrrMZKx8YRzSaiDeC52NQnyGecggs0pPrwTWHc9hQt7PRX
	NVbitnDNNiC+s1/OMJbM6L0Z/UWs1viazG3SwN7MR34cb7qNnEtnqmXikxYJS2e+0qwT
	A4EA/hU0RID7rhTg9clU/+RCpxXWqANHLncIy1EIl3na6PnvCa8hsPqrAttY1fK2sft+
	Xo24/BG+6JJHwX+TJZVqrK4rczGp+UaitgBNVdmvgGMttW+vvWb2WIm7wgJeQxNxU4Hj
	ZzqR6rTjX6uCTO/Lr3vZvmKL8bgu43CFLidOP0CM7sDEEq8QWKAMwfWVD0rApXEUKOng
	DCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Qh5mgyPenpEVzUVHucqrQhB44EuT46D6LEQ2xSHyfi4=;
	b=kCctEieBp/EJkiJeS/CCpQsSrC11VgNjfb+oBak0+kRfAP0yJiY1dbsBYcD/wozuHZ
	MiHLpQDwWKG9JP56Y6W3XuzGPBJ8s8Egd1+rxe2UsU4x11Be31gAz840pIe2QTDid0uy
	Y4zKSIAOt0jraCwozr8IX3HpzDlAerhRxrURnyAaqvX+ZYmxDD/2CDDAuamneeAbDMyq
	syFU/rEwaCYGAOk1hGYjSIpOhiBKTkpawFEQv+G4Mi/hgxetY77m++whk3Bvg7eJAE8+
	ABtp/0BrSTb0PVxfcSflF9nrnGjA4y4NLy+rXzNLKI0QzrQHrdtaZ/p8SlnX4swzUT3s
	ZcHA==
X-Gm-Message-State: AKwxytc1KHwDdWLEWMXuJenUIbbRJu+EjEPQXpRgiVnFXsblYoIZGx5r
	7mL5+N6PDJsStB88sWwtWalQjTwf
X-Google-Smtp-Source: AH8x2265djOE31A3tJME9nS+MzGqVZWEsMniEQFfP0iV0x2G6r0E5u/kM6qz2h8XnNV3ehGcnXov9A==
X-Received: by 10.202.114.22 with SMTP id p22mr2805672oic.228.1516570385086;
	Sun, 21 Jan 2018 13:33:05 -0800 (PST)
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com.
	[74.125.82.175]) by smtp.gmail.com with ESMTPSA id
	r28sm7121655otc.68.2018.01.21.13.33.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Jan 2018 13:33:03 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f175.google.com with SMTP id 53so5877863otj.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 13:33:02 -0800 (PST)
X-Received: by 10.157.23.138 with SMTP id j10mr2793006otj.370.1516570381686;
	Sun, 21 Jan 2018 13:33:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.92.130 with HTTP; Sun, 21 Jan 2018 13:33:01 -0800 (PST)
In-Reply-To: <20180119201208.22752-1-alex.stewart@ni.com>
References: <20180119201208.22752-1-alex.stewart@ni.com>
Date: Sun, 21 Jan 2018 19:33:01 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp1qWudKU5Lsx2TwO=7JadORXaU_6buBvCmKyW=CY57rQ@mail.gmail.com>
Message-ID: <CAP9ODKp1qWudKU5Lsx2TwO=7JadORXaU_6buBvCmKyW=CY57rQ@mail.gmail.com>
To: Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Sun, 21 Jan 2018 21:33:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 19, 2018 at 6:12 PM, Alex Stewart <alex.stewart@ni.com> wrote:
> * Move the hwclock.sh initscript from the busybox recipe to util-linux.
>   This script is generally useful for distros that get their hwclock
>   implementation from sources other than busybox and we follow debian's
>   example by providing it in util-linux.

The script now is an independent unit and as such, it should be not
using the busybox or util-linux on its name. Please move it to
hwclock-init and adjust both to depend on it. It can be in
meta/recipes-core/hwclock/hwclock-init.bb and I'd add a comment in the
recipe explaining why it has been split out.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

