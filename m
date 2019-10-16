Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id AC25B7E447
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 12:14:49 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b24so2495360wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=p8QvJZtblDgxnu1m9ibuubJplmefFzrHDsPx22BF3TY=;
	b=WWuq4CBUfrzA7jAvOhA7v6BLo+8+SiEoIphqAkrOvTWdIZ7YD1YbzqKWJuKmV+8Zqd
	ccEy8XLjoo3Ir4LY/+mreMvO27qFYi64Zw8ok0yCWhz57wQLsby9p+CzEq7O9QLf5qcF
	5M22k3Sir58y9VoA5oTWYt9H8fTbVSWh6xz6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=p8QvJZtblDgxnu1m9ibuubJplmefFzrHDsPx22BF3TY=;
	b=N0Ifi5XGuXMM4PJpYJMOUTO33C1zJGivH+iluB09WCdIv0dgqgdeO8WDjUte3tF0bL
	OaYMV7zBJDB/+iIMHBL59goxVZsJxg3A5pyMfLidvILjFB1dHn/nSv30hlpr6UD8Rivk
	KpYknV/cQa4pCa27qQoA53chkvHrooX1srAPcF1ifyEwiavcoHHij4ov1RyP7TBNzHc1
	N757zYd9xsIrxhkvJqjMbZBqcUOIj+izKD/0SS2pdDTaCOkY7LB9EHHAz+n4/V6HB/zV
	EylJ3d7S5TX203AnsYouKhQf7L7y4cX6rtwNzD0rtGHvuACEMswo5jhc5NEtAcOdMcVy
	pgaQ==
X-Gm-Message-State: APjAAAXQZIeUg0pHaWa/I7v4N8OK8evvZOmkWxOg5zSIjT/mYCHgxsuL
	vdrOIEuRpy2v5HVYIvUhsiuIJcIDtx4=
X-Google-Smtp-Source: APXvYqzvvWWu3Wg7boY+XN23iOvLryMQCDhd17ULaK33y+6paDm+Vvc/t0L2Ueg+Wi99il4QtM/cJQ==
X-Received: by 2002:a1c:4456:: with SMTP id r83mr3169411wma.44.1571228090367; 
	Wed, 16 Oct 2019 05:14:50 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f143sm3944029wme.40.2019.10.16.05.14.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 05:14:49 -0700 (PDT)
Message-ID: <a326534ef946ab81da4c160bd4cc629f5ff112f9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dan Callaghan <dan.callaghan@opengear.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 16 Oct 2019 13:14:48 +0100
In-Reply-To: <1571178617-sup-8448@galangal.danc.bne.opengear.com>
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
	<20191015061510.21803-1-dan.callaghan@opengear.com>
	<e41fa2a4-1744-993c-d38a-f98229726251@gmail.com>
	<1571123420-sup-6304@galangal.danc.bne.opengear.com>
	<84b5c0f5-e790-84e4-967c-6eace1f673ba@intel.com>
	<1571178617-sup-8448@galangal.danc.bne.opengear.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Wed, 16 Oct 2019 12:14:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-16 at 08:46 +1000, Dan Callaghan wrote:
> Excerpts from Ross Burton's message of 2019-10-15 11:55:31 +01:00:
> > If you need bzip-native for the libraries, DEPEND on
> > bzip2-replacement-native.
> 
> Oh, thanks for the hint! I hadn't seen that trick used before but
> now 
> I see it is in quite a few places. I will post a fresh patch using
> that.
> 
> It does seem like it would be simpler to just take bzip2-native out
> of 
> ASSUME_PROVIDED, but I guess leaving it in there lets people avoid 
> building bzip2-native under some circumstances.

Its in ASSUME_PROVIDED since we do rely on bzip2 being there so that
people can have .bz2 files in SRC_URI.

I have a small preference for disabling bzip2 in elfutils-native, just
because we only really want to build things that are necessary. The
more dependencies we add in, the longer builds take.

Do we really need bzip2 in elfutils-native?

Cheers,

Richard


