Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 96E9475D4A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 14:22:14 +0000 (UTC)
Received: by igbdj2 with SMTP id dj2so11725142igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=D8lWy50w4cEJmEpq7G87sg1mybMUb6aYwpf+tZTh/vQ=;
	b=Mp8bVqesVIkfFFxPKZK69hGxGSK43jyPtbz1tlgTAypJnSX9b1i7xxvpuMVsScP9nK
	iSnQxjAJwvE8iLeouR+zAtWUC15SUTFzvN0GIXPo/GWDpjUSgWygl31WfIeN3MIGQYl/
	GwObVC48r3aZyE9Wom9jZ6ZDpNr3rA3tGXN/TK88g0k4RcMgVvVadKd3GpifGAALWwvB
	Nm6u7lToVnms1SvCB2aIE8U9vP5PeuKJCA7SEHVEMRy1k/bJxSNW9zC0L/xN4twqqpkD
	3SLwht0K7b4jlKxKVWUY7+4jKed33WhgTG38G4agEm8okRrtURmn+WMxWb5SmMubnPYV
	xuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=D8lWy50w4cEJmEpq7G87sg1mybMUb6aYwpf+tZTh/vQ=;
	b=Dr3DWPe79wvhdRM47q6/nyfrJ0aZYkfxXzH0FYUKQQlI8iPunfbHAcdY1ZJP+Aovwi
	KhmhLjKz+CF0ePEC/sYFBjLYZpcXQMW/mZqEG5ctD8/dSL9iImPbKo2Yw6b1+xQvCwyF
	dUF74bUT5YwQUS8T13PMBYna2fvm48BUMSd03uqjC1rSBcQI0lc26lIJQkdB8QZ9tLxg
	m8+6PB7lqQozmdyamORn6REC9XRaMZ2imj9uf+pbDuLEPLVObh5pWSJcA2sV7/OV2PFK
	6q7zxJNwg54sORdIXLFE+/UbYUd0bSvsljpVjTLiBr2Hb7M2UyK6yd1ONo5ZsklKrObf
	ITZQ==
X-Gm-Message-State: ALoCoQmhuonqPY6/4cVePVWqZwW2ND9axwqjFKjmRq62Un5KVBoaa6gQyFLZ35IT4HdOSoS8/28y
X-Received: by 10.50.79.165 with SMTP id k5mr1522963igx.76.1446733334442;
	Thu, 05 Nov 2015 06:22:14 -0800 (PST)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181]) by smtp.gmail.com with ESMTPSA id
	x1sm11235910igl.14.2015.11.05.06.22.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 06:22:13 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioll68 with SMTP id l68so91932056iol.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 06:22:12 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.17.160 with SMTP id 32mr41292ior.28.1446733332568; Thu,
	05 Nov 2015 06:22:12 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Thu, 5 Nov 2015 06:22:12 -0800 (PST)
In-Reply-To: <563B56B6.6070307@pseudoterminal.org>
References: <1446653201-6456-1-git-send-email-radek.dostal@streamunlimited.com>
	<CAP9ODKqFTU76yL_DqeNku4G3502R00C4K8qwdEtCp5zk1pmJRw@mail.gmail.com>
	<563B56B6.6070307@pseudoterminal.org>
Date: Thu, 5 Nov 2015 12:22:12 -0200
Message-ID: <CAP9ODKrhSmSsx1aSY0oyoqYeV8zHm_NVtp3mH=4X8zX-BEmL3w@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: properly specify CC for EXTRA_OEMAKE
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
X-List-Received-Date: Thu, 05 Nov 2015 14:22:20 -0000
Content-Type: text/plain; charset=UTF-8

Hello Carlos,

On Thu, Nov 5, 2015 at 11:16 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> So, this is because of the TOOLCHAIN_OPTIONS ?
> Also, what about the ${CC} ? Right now it won't work properly with clang for
> example.

The clang is problem might involve us to rework something but all this
needs to be based on last U-Boot releases; we shouldn't put
workarounds and hacks on OE-Core without good reasons.

Has the clang been tested with 2015.10?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

