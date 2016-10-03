Return-Path: <mateusz.cz.nowakowski@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id D4B3162135
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 14:53:21 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id b75so1507328lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Zdp0zj0lXSXiu2fcFI4o2QWawJY+z3q3fjBjJJkxSg4=;
	b=qdwJi5RZsZD1lNo5R+7wG5yJWyfYwChakidoaKxhot2+k+elDRcm5gxFn3RlI6sqI6
	rbxrcbi7UJBfYv0PQLQREGx+AJBBAQ8ej5HKbYQpf+1fzeUqkpjQthpXoTwvD9sJhKsR
	kga76lkVTCtA/TuFWc4KVFDiYuH0ioHD1bI2wnHe9krzTpcu+/AZF/I3QhWnHW5+hIZc
	PKcFJ9MA925arcwiIpkMOp4aQVXhBtVpsqZvI9jmVT6tNa9w2sjw0u61b4LXi/3lySRy
	0unhH8FpziBu5+kkc1Dq37A1ckCWmVeQd6z5RZfAeV7ZIoJM+5aUfJKD7phtk8F5fIFF
	gZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Zdp0zj0lXSXiu2fcFI4o2QWawJY+z3q3fjBjJJkxSg4=;
	b=ZNDi5EaZ/S014SPJBW6ii3SWLWojgV3GRZfmEdKt0ePDhexeUF3AvF9A8kgXKjKjLR
	h48cWQI8LZ+A2Krjm/myJAxP+P9z8EJ1MKauu+JDsH3tjjl/G45gdbW/tvvNyHbcFQUS
	wPgAdTAh1svzc9poIpAmcXE1wIiyLduhyyhS4rQxWyua9CJv7eED/1K/54i6mkS4YRot
	fD1mczQcAdYnm04nVtMDfrQOAxLF5nGWP/P+Ck7NnVdraGUO+eK8qXxBlyiWXmDlTrJH
	9apOzj5/fDBRYfJ+BiZt8N18zFvm7IDhr6HORH7huJL4atLDSnMPdqmgtZgqbxmxhbDn
	VtxA==
X-Gm-Message-State: AA6/9RlbPXZD7Vsa+rdtrHPVKjCqB9k5QMkmnKn35O3f6wT5YhM5zq/0M/wOd3yzUuFOQQ==
X-Received: by 10.25.87.12 with SMTP id l12mr8317155lfb.153.1475506402732;
	Mon, 03 Oct 2016 07:53:22 -0700 (PDT)
Received: from localhost.localdomain (87-206-133-125.dynamic.chello.pl.
	[87.206.133.125]) by smtp.googlemail.com with ESMTPSA id
	l65sm5757881lfl.30.2016.10.03.07.53.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Oct 2016 07:53:22 -0700 (PDT)
Message-ID: <1475513596.1426.0.camel@gmail.com>
From: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 03 Oct 2016 16:53:16 +0000
In-Reply-To: <CAJTo0LZLygmJSSKQpt2Aa2-yKyjimy2OnK0BdOJ5W1YQDgjmLg@mail.gmail.com>
References: <20160930221813.4209-1-mateusz.cz.nowakowski@gmail.com>
	<CAJTo0LZLygmJSSKQpt2Aa2-yKyjimy2OnK0BdOJ5W1YQDgjmLg@mail.gmail.com>
X-Mailer: Evolution 3.20.5 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmock: fixed installing pkgconfig file and libraries on x86_64 architecture
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
X-List-Received-Date: Mon, 03 Oct 2016 14:53:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

ok, done :)
On Fri, 2016-09-30 at 22:42 +0100, Burton, Ross wrote:
> 
> On 30 September 2016 at 23:18, Mateusz Nowakowski <mateusz.cz.nowakow
> ski@gmail.com> wrote:
> > Signed-off-by: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
> > 
> 
> As this is for meta-oe, the patch should go to openembedded-devel@lis
> ts.openembedded.org.
> 
> Thanks,
> Ross

