Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2AF771DF
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 08:59:30 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id o80so19925672wme.1
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=M2c50Mmwvlr3BL2kvGUOz/Ksz4zu+Sx2MBdADIh7mHE=;
	b=kORyfez6egSd+h7nh/xxmybAeOqnmZhdUuToIjS+8ndOLeE321qfgnkj6zZAZqjBsS
	7ffoudzRs8QoPKnIZsxWVzoaCFqrQjQTa9cyPErUyOClIszDjECtlYVzjtkDAdvPGTh0
	tm+hxiCYzfF8NW4hSSu9o7tb/NZLdiTu5g/51pK0Npq/3ohJVl/lTGbqLkuqDAZvBChX
	B9gHa2w3JS1hayY5C/rW1BiDi733OcacR/35+q7MKI3IKzBStPfPtdKNlKVaoVciZ4q2
	Lqciu9KgaywAmbAgY0BjgFfSITsKsPJbEhhXppBRCFuDI50d+B/b9cEHxFPna5tVwBwD
	rW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=M2c50Mmwvlr3BL2kvGUOz/Ksz4zu+Sx2MBdADIh7mHE=;
	b=XNYlR0r11jr1iyFGwIqFJwZWt9ExBh4IucJ/Cj85rqdFAxB0ImEG/1Qk3jbEYAEJ9r
	qcrPKBZ88vsDyRVLHirjg1qaG+PCTkt+m6qJ+7+fkc3EnFqK+BHSERKHbllry2zDJFE3
	vWlOEjQMJiXwYG0VHwfiEGVBjeiItvq96AmWw4Gy1a4vORHDJWTgO/KkdMDP6Vdw4NIM
	kGgVtF2DN7RKndVpqD+mYmzgmq1P/EzrvEDvcwgyjSMpmomlhl4BZfgbiVfo51qElC+Q
	bHpPu7bkwaDrHxJG643EYN4rJqMnIkz3BqIHLCYLBLiFTqhCOSzzmCvYP9GRJ220uR8n
	qaMQ==
X-Gm-Message-State: AEkoouuS4TwqeIHVbQ+PNSmZjN1eM1ULQooKl7I/nv54DuDHyBsQJumJZRuXHX29WP3FUg==
X-Received: by 10.25.165.71 with SMTP id o68mr23389962lfe.95.1470733170371;
	Tue, 09 Aug 2016 01:59:30 -0700 (PDT)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	f22sm6390384lji.13.2016.08.09.01.59.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Aug 2016 01:59:27 -0700 (PDT)
To: Openembedded-core@lists.openembedded.org
References: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <275cc866-5fc3-580a-d532-8b187d4ee7e5@mender.io>
Date: Tue, 9 Aug 2016 10:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
Subject: Re: [krogoth] systemd network service fails to start on boot
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
X-List-Received-Date: Tue, 09 Aug 2016 08:59:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ping!

Is there no interest in fixing network services under systemd?

-- 
Kristian

On 20/07/16 09:53, Kristian Amlie wrote:
> Hey,
> 
> on our krogoth build the systemd network service does not start, and it
> seems to be because of missing users, which has already been fixed on
> master. I've cherry-picked the two patches that fixed the problem for
> us. Note that they are not written by me, but by other people on this
> list. I hope they can be applied to krogoth.
> 
> Regards
> Kristian Amlie
> 

