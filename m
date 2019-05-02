Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 21C317C132
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 14:23:59 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id e9so3683197wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=ZmdXqO2ZglbfHqV09TtohWKT3aYOgD64DqKZgBbvvns=;
	b=QVGEyDqSpd+6kjp+RwYdZwuyELoYBfetACYrVvKnTC4OSKFMG87/F0ESqI14DCaDkZ
	35DiVa3BCux+XFGEhrBAzUzGaTLO2dN/zEejRwV+F4Df57+6rhDdW6BawgxqtiAL6Jj3
	B69TMakjsuRQpcyHQ8GTn0UtE/fodwZakjtR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=ZmdXqO2ZglbfHqV09TtohWKT3aYOgD64DqKZgBbvvns=;
	b=YOm4W0nW1wEzm6f2qsvJJcL0dCZPOyrbFrqSq4oorNeCoh6BX+PuxkTIQa/y4nuE8h
	PQUuEcEf/C0FlvxE+FgF4xE+v7QEVOqjwKKfMpPUzRhZz9Y60NrRjOtNmoYryns6wv+I
	jXZ45b0T1hbjwhk+koiDvXwJR3JUcvsuG5EbSS7/Cju4txqvyTpINCjxqGsXwbMXgrnV
	GeAz33XVintnpRsimnWT2Uew81jUc0qxuGnEZsYj0a3ihrIGAdlrDamYH7Wsyk0+TGYD
	ZACWiC/9/bL7+Tw5pVeL0kt10gXJ+gzU4WcRggMaWrfLCMY0Zz68L5bD1lwRPKYBmySM
	kUGw==
X-Gm-Message-State: APjAAAVN6Iw0fgbCByjHBKFzjbqTOjvN7vfcJkDY5jDcXE6GQUkGZqdE
	SRtn6uN4TyFAB5GOLg8m4gKA2A==
X-Google-Smtp-Source: APXvYqzB9grO5PcMTRcq89MW15BIo6ewId++FrCA+dbLaWeJOxt3D7fXDqST6os9F3RvPGpHS14zKg==
X-Received: by 2002:a05:6000:10cc:: with SMTP id
	b12mr3226418wrx.182.1556807039989; 
	Thu, 02 May 2019 07:23:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c18sm25131320wrb.16.2019.05.02.07.23.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 07:23:59 -0700 (PDT)
Message-ID: <9d66b2dc947c7368a84285b8c1fb3ef30fdc5220.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>
Date: Thu, 02 May 2019 15:23:58 +0100
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Newcomer bugs
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
X-List-Received-Date: Thu, 02 May 2019 14:24:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Apologies for cross posting but I wanted a wider audience to see this.

The triage team is starting to try and collect up and classify bugs
which a newcomer to the project would be able to work on in a way which
means people can find them. They're being listed on the triage page
under the appropriate heading:

https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs

The idea is these bugs should be straight forward for a person to help
work on who doesn't have deep experience with the project.

If anyone can help, please take ownership of the bug and send patches!

If anyone needs help/advice there are people on irc who can likely do
so, or some of the more experienced contributors will likely be happy
to help too.

Also, if there are people interested in helping mentor newcomers and
help develop newcomer suited bugs, please talk to me about it as we
could definitely do with help there. 

Other roles where we could do with particular help are toaster
development, website improvements/maintenance, QA framework
documentation/development + testcases and our CI testing along with the
usual other things but these are not really suited to newcomers.

Cheers,

Richard


