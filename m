Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web12.3229.1608763292836007308
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 14:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tnvrEXHA;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id 2so493576ilg.9
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 14:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cFN7zrGM5J2NSrDHiGyVFaJ/Hx7cF59KLjZdnzcQ2H4=;
        b=tnvrEXHAVyBiYsIJjITiB7iOE7hoS/KjzRgKkL0P6t6NQ9HF/b53hAysWxdBMwnLiR
         9bY9LVCi7wztvf4ZLJla/PTGDmOBL+XHTnOqsplZljkM8Vyw8kVuKgz/fqdgAl1Lcxgk
         8eYjcsDV2e93xddKH5C+rhWYjlQ3swk5cwhryEfud9UhcPfG7r7RiQdkNdzdP7CtGi/R
         1FZ99SC2ym4Y+qsOEV4ouA/N33K/97OAjQZ0LSUhoXLPAwE13gpOQv765c0qQ4m0Kmfu
         jdqR1CtB+BoMvePG1sff2fzNSbu72vNoawYPNfIOs3ho/FRg+6VsKtBSNOviYsKjL+Oz
         3vIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cFN7zrGM5J2NSrDHiGyVFaJ/Hx7cF59KLjZdnzcQ2H4=;
        b=JXM8y7/11UP00dYu3j1LR1hsP81AW8AN4CG/4AlN3Z5Ne0Pfu4FVzwW5sJOmhvuw4Y
         rdjKX9QewM/AUlFrd0Uvlqk5xS+q+IqHIRJk8rn5YHQgQLjaj+bO72OvYLXnW+wchn4b
         5NcZOKnHC4Lm4Y+5k22i+JnlSP+85dwFsZDavoeHVTZTZ81kQx5N3X6KGgYi0V8VyiGC
         TWoIGsEO6W1oD1RzpSAHazZlCcZY8fPLnocsOsCHoSRE0SWkCfUb7yrueqjPIzdFAGJG
         LrUY87XTb4xR8wIpgZxEBvUiaoSeEMHCL3NncKviTNo7pR2ZCx+ieXkIwM6jU/Ly8EFF
         DUfQ==
X-Gm-Message-State: AOAM531B7GS/1anoPOtepZf8DmjA02dmKoYvv5RGFt5ZXpSz0yhiFX0G
	ONLgOD5mG0C04hWl4p6ubwk=
X-Google-Smtp-Source: ABdhPJwuV7ZS78Fy6u1wdei26BLAAJ1h2fQ28yjdUIcWYC26RxyGuZ6r29mEMnps7WL4AqEh7j197Q==
X-Received: by 2002:a92:d40d:: with SMTP id q13mr27123066ilm.253.1608763292325;
        Wed, 23 Dec 2020 14:41:32 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id n10sm18737694ila.69.2020.12.23.14.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 14:41:31 -0800 (PST)
Date: Wed, 23 Dec 2020 17:41:29 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [master-next][PATCH 2/3] psplash: work on first boot (sysvinit)
Message-ID: <20201223224129.GA1691@localhost>
References: <20201223170621.35727-1-twoerner@gmail.com>
 <20201223170621.35727-2-twoerner@gmail.com>
 <743d9e91ea6fb99193e315f8b20778e418109da7.camel@linuxfoundation.org>
 <20201223215005.GA9542@localhost>
MIME-Version: 1.0
In-Reply-To: <20201223215005.GA9542@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed 2020-12-23 @ 04:50:05 PM, Trevor Woerner wrote:
> On Wed 2020-12-23 @ 06:00:21 PM, Richard Purdie wrote:
> > Personally, I don't really like the idea of having a top level
> > directory called .psplash,
> 
> Neither do I, which is why I also added the code to remove the directory once
> the psplash program is done running. Whenever psplash is run the directory is
> created just before it starts and removed when psplash is done.
> 
> > is there a reason it doesn't work in /mnt?

specifically…

	mkdir: can't create directory '/mnt/.psplash': Read-only file system
	mount: mounting tmpfs on /mnt/.psplash failed: No such file or directory
	mkfifo: Read-only file system

then
	umount: can't unmount /mnt/.psplash: No such file or directory
