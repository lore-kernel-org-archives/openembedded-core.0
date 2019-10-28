Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5F91B6D4B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 03:16:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 71so7255380qkl.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 20:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eP6uMjWI8g8do/6dKR0MEAB45ScM84oS4G30GqPr9Z4=;
	b=BG4676sjl4I5ZeoQZF2fCY1dKEBqS3RDySgFx5ynjJMPDkWNfNkFO0OzyVwyA8vBWF
	gpHGJPgEUKw0BsDjxJMtwCRKgOxr5hM41P27IFx/fiHI/ujqde9Yd/AWMfanFXuIMkyI
	pieM42dynDbPe0JjGvinbRrJZ2yuGbGwWITNSni+ETZNEvlgiOv/LH+MflKl/YZw4V41
	fYhx/gx1qI1Zsaqtzl608YQAEFRuNyZaifEGQEF0IET+lK2i2JmnqFOEjIIhlAIt+C48
	VKBnVBVqLQNOfDWhilX5ro2uwLhlUGSVWlUKcbh4IxfbEgUqo4sAKOsbD2M7t+XLGECl
	4oHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eP6uMjWI8g8do/6dKR0MEAB45ScM84oS4G30GqPr9Z4=;
	b=aFmIGL8LbUnV/dQBgtfjKXFatvMC2UzAEy6FfMXQVmzA+JJYI5s6rbO0IlUqLv3jvS
	VhwZhKoksZ1rEA2c9qf3oQS3tevVwIPCyDTva7LdCka0UIc7kYcaA1ZDEA5YV0y/i0oA
	YNGVsQoblqIqM0cC1CE7vzYDOluKbOy5HUwGGCiqtRNGoP9tE24Bj2ncR55rqDcPdTuz
	HjZY8/yGpBvm34eiFUEhDJOeNS03SSMTeyqyxJQTHHAJGTPGYNSpPKOnLZHgB9nIs3ME
	MA78LAGgRcrSmMPCBgPY68flPWt1x2+82GEyea6ylc6/hzKxXP/+ZMN5mxXXWwz6vrte
	Htwg==
X-Gm-Message-State: APjAAAU28ovzQpqdBmCbIvdP3GKCG1vFGv5TMtEICtb76MTGSOSrYqB2
	X8wDY60NqYN3gmstlc2LTzU7IGPm
X-Google-Smtp-Source: APXvYqwd5HZQCQg6O5MFsRByzjqkZmfoukOEmcVRIJuzHzR9EEIFWUNiHaGH+hEyzo4ntDW3XiPbvg==
X-Received: by 2002:a05:620a:237:: with SMTP id
	u23mr12150444qkm.484.1572232573146; 
	Sun, 27 Oct 2019 20:16:13 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95]) by smtp.gmail.com with ESMTPSA id
	x64sm5077074qkd.88.2019.10.27.20.16.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2019 20:16:12 -0700 (PDT)
Date: Sun, 27 Oct 2019 23:16:10 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191028031609.GA4004@linux-uys3>
References: <20191025202008.23715-1-twoerner@gmail.com>
	<CAMKF1soPy2WuaB_z8CPPbTgKXsnztTVTVVVEv+gWSbt569qWSQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soPy2WuaB_z8CPPbTgKXsnztTVTVVVEv+gWSbt569qWSQ@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcap-ng: undefined reference to `pthread_atfork'
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
X-List-Received-Date: Mon, 28 Oct 2019 03:16:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat 2019-10-26 @ 10:03:58 AM, Khem Raj wrote:
> >  EXTRA_OECONF += "--without-python --without-python3"
> > +LDFLAGS_append_class-native = " -lpthread"
> 
> Please use -pthread instead of -lpthread

Okay, v2 sent.

