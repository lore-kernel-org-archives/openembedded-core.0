Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 327BE784F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 17:16:51 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id g104so5172714otg.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 09:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=2VQJ8QRulvC9ydPppBrbj59+s83OjesNi/Qon2BM8AY=;
	b=YzeZ+sf6g76cFMdmhYxXgdeb1jb0PAll8ugeKrHKtu+0/95mBySgyt46HNO2v8aoSk
	xeusDl2nGaGfLg6QbeZoh3wGJ9EADVWtpQwhCbW16PGiqnXh4dqZY9PCF0VqvAd1edZy
	ezsqLM5PMwFucE2UDHxFZ7vVdg65e19dkYjHih0moo905qKnWeWRuqfZNq63VCE8eYmg
	xw3itOiEkxgfzvd1qgrlntm3bhiIY0k/SoLfkSY8iijQR4sFNQB4CzJ6Uxtli3XYGaKn
	pk2M3YHZHxihaVdXZ4WZsmA9ZMjgc949z9bWZgo+nEMh6oP7tioMKzFsbE4TbG7JIBli
	N78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=2VQJ8QRulvC9ydPppBrbj59+s83OjesNi/Qon2BM8AY=;
	b=P+pSzzb/PoJBo1ehf/rJVZPZ+vpF2D7ztq/XX1lhPUOh+JPgaC7cBeOVQ3D8tbqdfj
	EXew0ss0lZQLfHySlkxbwyPyhFkN2UogHBp17eVNpuonIJCU1eQoURv7srtoz6ZsULqs
	BTrqMKtxZzHNr1Jodog9NJ1D5Iz991n/oyys2vbF1YseOOvwfNPYqkwjl8j9hrqrro4e
	c65PIbX3Eg6ZFzR8ngX6J1ehgKf+y92ZGfZa5VqgFtuaEi5TcseV7bz7XTwzt+XLswqg
	9H2acx8vmUZcxvp2tcwsrd4CkhWFJ8NppsT32jWuutRKGLUxymTpKmOuCWvQA/GT4xIE
	/5PA==
X-Gm-Message-State: AJaThX5BC7X8MxcNpEpCYobfhIxVT4qca9O91EeUKJu6hOnzJUhNIn15
	nqXt4WI++57lHLthpkv1mAUToing
X-Google-Smtp-Source: AGs4zMaA7UM7CBvKTFlUilxMK7yfLj0GxzyYEgQwxustSMkQn37aQkmAM7X5QTZO6cd0OxVrDynx6w==
X-Received: by 10.157.7.10 with SMTP id 10mr7530019ote.474.1510679812792;
	Tue, 14 Nov 2017 09:16:52 -0800 (PST)
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com.
	[74.125.82.177])
	by smtp.gmail.com with ESMTPSA id y51sm5870653oti.9.2017.11.14.09.16.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 09:16:51 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f177.google.com with SMTP id o9so17271326ota.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 09:16:51 -0800 (PST)
X-Received: by 10.157.86.177 with SMTP id o46mr7929795oth.158.1510679811163;
	Tue, 14 Nov 2017 09:16:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 14 Nov 2017 09:16:50 -0800 (PST)
In-Reply-To: <CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
	<CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
Date: Tue, 14 Nov 2017 15:16:50 -0200
X-Gmail-Original-Message-ID: <CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
Message-ID: <CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Drop rng-tools
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
X-List-Received-Date: Tue, 14 Nov 2017 17:16:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Ross,

On Mon, Nov 13, 2017 at 5:55 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Can you explain why?

We are using QEMU ARM for runtime tests on CI for updatehub, on this,
when we run something that required entropy just after boot and
especially if running inside of a Docker, it fails badly for 140s.
Adding rng-tools solves it :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

