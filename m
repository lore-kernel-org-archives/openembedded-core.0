Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E031787AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 13:53:00 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f69so14014249oig.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=pOdtnIr43vbMeuft/U3oM1+uEOc7KA+Sun/iLygnPnA=;
	b=KGFycm3hA/KK3SA3V8paqKwyd4vKFCvtyIbgVTBrG5MzbGcxQrRSCqURS08dyg4/qr
	OOuLQTDgiZiOQYA1kUVB0Gaeb+gBZPFeUwg2l2hL8CxE36GHGNOElFD9l8xoG79b3gH6
	Iwae1C/HFfBDKamXq7yu6SmgBDqCZuQ2iFKfPjHBAmNugSQ6pVUQdi3I6qaSdcIfJhcP
	14DPezuKxACOLaZyv+dciUdbO7Nf5lL+X3Xp/ldfSZSdt6SQG2yTB7K+Tlj9HsmjfAkJ
	GLev74MNRglx2UksE0cJErJy2cQWVga2GmysONmuKh0ddp4TTgzp5PQvHnwfZBzhTAJ0
	dQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=pOdtnIr43vbMeuft/U3oM1+uEOc7KA+Sun/iLygnPnA=;
	b=GQ6rEPU0888RDNj5q0SdqXWe8GU3wx6HFhyG41iqrM257JmGCun4uWDVTXq60JR+ey
	DrLLdNNjVAdiV+DCcxy63X2pqeQTESHUs/ZMeZ7XOdvfE0Zz8ksUImGYK2u4d6NdYezs
	bDLl+UHGbUlNkSqnI0gqNfzXs+yvtZIlRNi/YeXnhmufgHPX/vEMFi8HkYl+HhEUz6xY
	2Rx1WEt1gYfEP53jHNCsVobN4+kkjl5hc7/oW9uDvx67Oiqb4Okfv3EyrqjRSScA3oW3
	caQf7QVoAt9PPO8fvnOY1st3+hp7U1KJl1geL/Kbtr7wUpSDMQo7HbJ25aC2AUaR9v4N
	oqSA==
X-Gm-Message-State: AKGB3mJ+5AdGNBb0VZq6z6Kh0bSnc7Yq6uzDZpNGGozWrF1mAdCNYf1J
	XWSO6gpvQHnLAGdyjvbsR0XJy5KB
X-Google-Smtp-Source: ACJfBou9PvI/JA8chl+36hJkxG82jeg6ncsyrBUYK671KMhMZ/wvvX6DJTa7shusZuS/eivGZk2d7Q==
X-Received: by 10.202.169.212 with SMTP id s203mr3056916oie.73.1513086781797; 
	Tue, 12 Dec 2017 05:53:01 -0800 (PST)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49]) by smtp.gmail.com with ESMTPSA id
	s101sm7995401ota.17.2017.12.12.05.53.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 05:53:00 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id o64so14021268oia.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:53:00 -0800 (PST)
X-Received: by 10.202.215.85 with SMTP id o82mr2855945oig.166.1513086780035;
	Tue, 12 Dec 2017 05:53:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 12 Dec 2017 05:52:59 -0800 (PST)
In-Reply-To: <20171212132755.30556-1-stefan@agner.ch>
References: <20171212132755.30556-1-stefan@agner.ch>
Date: Tue, 12 Dec 2017 11:52:59 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpnnA7yuNY6_wnxVZYJB5bxFVtzjZZe9LEeYG4XPhqorg@mail.gmail.com>
Message-ID: <CAP9ODKpnnA7yuNY6_wnxVZYJB5bxFVtzjZZe9LEeYG4XPhqorg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] waf.bbclass: explicitly pass bindir and libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 13:53:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 12, 2017 at 11:27 AM, Stefan Agner <stefan@agner.ch> wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> On some build hosts distros (e.g. Fedora 26) waf tries to be
> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
> This obviously is not what we want for 32-bit targets and usually
> fails in the do_package phase:
>   WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue: gstreamer1.0-plugins-imx: Files/directories were installed but not shipped in any package:
>     /usr/lib64/libgstimxcommon.so.0
>
> Waf knows prefix, bindir and libdir as default options. Explicitly
> pass those three.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

