Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 441A877A53
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 09:23:08 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id o21so24052219wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eouTkkFcvHjN/PvBxZjw2uNZqsS0AhmjCdoGty/h6D4=;
	b=knE+tPADgvDeUCgbDmBZvDtu1CsvAwXbMEZdzXYOHtEifKaYUeV0vyHgJ+FtGTCutk
	W5qbDJbmJ/C/0I8Ufvf7U50e/xgJdtNFMylkdqOVig840+qIYv+s4oJsiQ3J5OYbTVMD
	NgIoyXwfxhRXyW+3P346hwJ+LX3mc2m9TAywwjqRsuWgIz8iWoi0wsOlP+uK6eEa4e40
	Xjolm2JGdp8YT2XUBKKsfy58M02bAZ2zDnOX1tC43ehu2+lisjsz08t76mdSEP6isdHA
	qOznoQDVcjXzcrcCc6zsHMBVPuRBibrV61GqL0osxy7dgoBzEOx4pwWHqCUjnJF3p7un
	i7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eouTkkFcvHjN/PvBxZjw2uNZqsS0AhmjCdoGty/h6D4=;
	b=ZjMihX1WRiz5TbIw+7iBwjhOeQfEW/s8bVuEmgGVcg8785Mu5xkV/ssvBsxJcLw5nJ
	F/IcPr7Vum16I6M1/2NmvDtW4tcZRCQCvWl0IWIuy+9J0K5PbNcqx82eWdCr+hxmgzXq
	sIXg/VuGc0AqGDkj8qVnooaZ/MFPAGHtbOtg/FSTMTWQYl3NUyJivRcpMHLyoJGgdDcD
	IdJz3hqjjjbk18wMKCoQe3UgksIZy+56Fdtxv+iXdDrzMt/C/O2JmH9/YEf1M8BbtuDe
	K5+3bKHlHvRJ+j3rbfYitOL6J2CJGwIbhfWktwgFVoMgvVwRHxNrlkEgMK84S59A2NDE
	/1Dg==
X-Gm-Message-State: AN3rC/6j8wZ0h9/WKzEAwoF5QskJOToRC3O/Y2+fjpSMBoBXCxJbLDrO
	wMLaRTjrpsTtpDua
X-Received: by 10.28.191.75 with SMTP id p72mr3859111wmf.136.1491470589696;
	Thu, 06 Apr 2017 02:23:09 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	o15sm1341214wra.61.2017.04.06.02.23.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Apr 2017 02:23:09 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 06 Apr 2017 11:23:02 +0200
Message-ID: <2234508.nmKqqo84gx@crde-port-20.cahors.local>
In-Reply-To: <CAHiDW_GH-WhDow0+nP-JnTq1kUKqfBmtS__BuqfUSuroNvsawg@mail.gmail.com>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<CAHiDW_GH-WhDow0+nP-JnTq1kUKqfBmtS__BuqfUSuroNvsawg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Thu, 06 Apr 2017 09:23:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On mercredi 5 avril 2017 09:30:52 CEST Jussi Kukkonen wrote:
> This apparently breaks key generation with openssl-native because the file
> doesn't exist.

Looking at the recipe right now, I understand why key generation is broken for 
native build (I should have been more careful). I see two ways of fixing it :
	- either recreate the symlink in do_install_append_class_native
	- or simply modifiyng the OPENSSL_CONF variable in the same task.

> 
> I can fix it by adding one more complication to the recipe (will send a
> patch) but I don't think the current solution is all that great: I've been
> looking at this patch for a while now and still don't really understand why
> it is needed and how these different packages interact. I'm sure it makes
> sense when you look at the other recipe but ... isn't it a bad sign that
> that context seems to be needed?

OK, I will provide some context because maybe my approach was wrong. In some 
of my builds, I require some images to have a very specific configuration to 
make OpenSSL use engines. My idea was to provide a package for this task since 
the default file can not be overridden (and in fact shouldn't be for the native 
build). This way, using RCONFLICTS I can provide a new configuration package 
for these specific builds while maintaining the default behavior for all 
others.

> 
> Jussi
> 

David

