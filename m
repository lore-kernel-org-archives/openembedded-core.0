Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3897174D03
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:39:31 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id e74-v6so18779021ita.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3O4oygk8u/5g8z0LqBZCll6+S9l6kK8ooBNadsXKBp8=;
	b=UEkw15+N4iDB6QUeQ92krFUt464UzeNNSIKCsBWlEr9ZzT90hSIdSylyL3UVgrP6N8
	fDt3VVQuO9Hd7LavJ+8eGK/Oor5QOcSzitlOl2Y/tThXO7LpY3U4llE1Jifn6StW/YWU
	lzNv0ECerLFK9KHasI9mXHF0NzGUpWIuZ2H8qtOqQrK/yNSLXs3r9owXvNptBCIblljA
	CnYboqeHjP6g+TtgEvDiDf0nCoEAgrHPjweIkwJMj026zkE9biOWC7b8uCQFRsmaOWzi
	pPgvN0w0c62cG5cxYfrdVNctUNCPNekI/JHH7RDhf+zpX8Expo0o5f4pObUpyisZRSo2
	MIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3O4oygk8u/5g8z0LqBZCll6+S9l6kK8ooBNadsXKBp8=;
	b=tYD3V/k9rby/YZt7xEbziD444xtTG3jjA433t+zLx43SYrAtoM0wdmdt966NrWALPr
	/lansOe09DUBDIrnGlnqqmAtEo8gTm8EEgvKOfJTc0oh8IYdff077ZufHLWV5utnDyvp
	dAh/2wLtqP7kgcwDbpb8bdVPp/m8QPf2xMp30V0rhUprwTaIPLEWlGI6tsJptHQwzxpR
	hS5ZY/AhJhZ6nU1HxwqkErL7gtaKLcswEIo8FGy9JYFDCbxRO79eHVTs7vmGhrATSNiq
	4T8tHsZ2jY6riIOr2Yfq/J1Y/yjnzuxPBHAgO4+OAGCsuMw4hQc7CzmFvaw8QLHI8f8F
	Sqxw==
X-Gm-Message-State: ABuFfoiZd1Zbp+yzKjw73iJ3F6EZ5q6tS+eQ28BPYLrkImfayllku/yV
	3n0rDMi/LOIEbpK3nQIUb9o=
X-Google-Smtp-Source: ACcGV617R/53MtvfZzGmkYYxNLNMSijZr0pEgfhL36udMuPy3lcyMe/Y7/RC8yj8V87bjoKxsrwZkg==
X-Received: by 2002:a05:660c:8c3:: with SMTP id
	g3mr5619198itl.53.1539358772093; 
	Fri, 12 Oct 2018 08:39:32 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	d6-v6sm595721ite.39.2018.10.12.08.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Oct 2018 08:39:31 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <99f922d9cae66c4cd6d1d295af65b29fe9264f98.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 10:39:31 -0500
In-Reply-To: <7fe513b6dcb00e887b7fce35e25ff74cff263070.camel@linuxfoundation.org>
References: <20181011180843.13983-1-JPEWhacker@gmail.com>
	<7fe513b6dcb00e887b7fce35e25ff74cff263070.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Subject: Re: [PATCH] initscripts: populate-volatiles: Speed up processing
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
X-List-Received-Date: Fri, 12 Oct 2018 15:39:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-12 at 08:33 +0100, Richard Purdie wrote:
> On Thu, 2018-10-11 at 13:08 -0500, Joshua Watt wrote:
> > Checking the requirements for each volatiles file in the
> > populate-volatiles script can be very slow when there are a large
> > number
> > of volatiles files, easily consuming over 80% of the processing
> > time.
> > These checks don't usually uncover any problems so concatenate all
> > the
> > volatiles files together and process them as one large file for a
> > "fast
> > path" option. This ensures that the penalty for checking the
> > requirements is only incurred once. In the event that checking the
> > requirements for the unified file fails, fall back to the slow
> > process
> > of checking each one individually so that the offending one can be
> > skipped.
> > 
> > [YOCTO #12949]
> > 
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> 
> As yet I little evidence for it but I think this caused: 

Yep, this was caused by my change. Turns out that for whatever reason
this configuration doesn't have /var/volatile/tmp created before
populate-volatiles.sh is run... not sure exactly *why* that is
different, but this is actually the reason that the 00_core volatile
file requirements aren't checked (e.g. there is no tmp directory to put
the files until it is done).

Anyway, the fix is fairly simple. V2 is coming shortly.

> 
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/35/builds/69/
> steps/7/logs/step6c
> 
> You can see the config in:
> 
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/35/builds/69/
> steps/7/logs/stdio
> 
> the key bits for 6c are:
> 
> DISTRO_FEATURES_append = ' systemd'
> VIRTUAL-RUNTIME_init_manager = 'sysvinit'
> 
> Cheers,
> 
> Richard
> 
-- 
Joshua Watt <JPEWhacker@gmail.com>

