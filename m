Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id C608D6093B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:11:09 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id r4so13439748oti.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=2qvL9+DcrU5/6L9T20TLncDmtYJn02eS0q9imm17p98=;
	b=ZJywSWzMDgAyWKCNv/VAjt/qIaFt6WDC+leGIfWVUAmimhsbyBfj334Lj+6gaq+LPG
	s2u52zlz3s3F2lv6fVCT/z4r+1kKfDmv/+ulS17sEin/5h+orBs+lk0rrozovBD2F3De
	Dhw9SJVwCcgYi0UzGUR1yG0R13rH6QlVL2hZFE/TGE3uEoTXLUu6gQfg2TMxZ1dPrydP
	izYt263Etc3y9EJq/5/VSm8OvuWkg/cF6nk6UgmEi026NR4pIpQsqzHZkEa7xvjgRfaE
	/h9TXwB8ST5ZvuIR906jZhuhutE4e6VdP1rPeQ71i/lUIRy1cU5eJha1ZDRHHFEJ/QVa
	3Nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=2qvL9+DcrU5/6L9T20TLncDmtYJn02eS0q9imm17p98=;
	b=ccJlmQHTpPvx9onlxsdBclzjTxoRhFDTHTR/D5sjP/LdtIikLdjhJLXcxU+Y2cPYcZ
	kTi4+q4wP6GPGQlWMLmi7kVYzU1BNvjEhLEzuWkLdUPS7gaaVevii1xq570xr2ggV3/6
	+gCWx2z10o+/3u6RK0IO5nRfMRtKLk6JaLvuQ0yTjMBwvExOgBgcH8koMkgZ4W0Oltqz
	nHLJbVcRDAnhSwMdwGKu2i8xp4NtG2FMA8cjQL1nkV9gW8KeMWH6CbG55MV2BrGY7LUj
	N4h+Faa3eGgz5zLN3Gc+5gJxo0B/rAF1AcgtBrrdcp9Ete1kwS/jTE8VBBUbCcWgnRlX
	a4zA==
X-Gm-Message-State: AKwxyte7jazjRLmJC4I271jhSoZeV3JVXEpLbq7QnlrHtxVxVT5hkYOz
	Y9HAR4pT7gGYw9WGo2P6P7whPusf
X-Google-Smtp-Source: ACJfBotabPjHIQrqiQxB9NIxPEDDoyNidLpDfGYzQacTw9AXKKBTNZ6dKV27hYkxN7U21nh3p+Hpgw==
X-Received: by 10.157.56.103 with SMTP id r36mr1425435otd.35.1516205470178;
	Wed, 17 Jan 2018 08:11:10 -0800 (PST)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	s63sm1947325oia.33.2018.01.17.08.11.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 08:11:08 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id d124so13469462oib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:11:08 -0800 (PST)
X-Received: by 10.202.195.71 with SMTP id t68mr1440909oif.216.1516205468222;
	Wed, 17 Jan 2018 08:11:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 08:11:07 -0800 (PST)
In-Reply-To: <20180116132516.27653-1-ross.burton@intel.com>
References: <20180116132516.27653-1-ross.burton@intel.com>
Date: Wed, 17 Jan 2018 14:11:07 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqNr8ckJg_7fLaqHiLRTEtesuUJN-a6zUG8RTExPdC88w@mail.gmail.com>
Message-ID: <CAP9ODKqNr8ckJg_7fLaqHiLRTEtesuUJN-a6zUG8RTExPdC88w@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cmake: allow target names to be overridden
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
X-List-Received-Date: Wed, 17 Jan 2018 16:11:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 16, 2018 at 11:25 AM, Ross Burton <ross.burton@intel.com> wrote:
> Don't hardcode the targets used in do_compile and do_install, instead build
> "all" and "install" by default but respect OECMAKE_TARGET_COMPILE and
> OECMAKE_TARGET_INSTALL variables.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

