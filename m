Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQh8R-0007D4-PX
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 18:15:20 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 23 Oct 2012 09:01:40 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so11960257obb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 09:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=GMMjhSdtrDxAz1KW/0OujBe6YWSwdREY6ALaiX9rXck=;
	b=Do3PKK9XmZikoX7udF18CUI+lN9h+7NFRnCeDu9WB630jZb7Pl6CMa+3gtpSWUdJiB
	38p3siry5mWqz5/cT/1WbHbEcjzO329uc3Y23coDBmFFCrY2MqXmLuyQmCBFnk8OQCNT
	e9e9bboPSJi+0+rz6hOPIptVA95kv5qBKVgfeRJ/SSygQCHdxgj1srfuJ4RDjt2LvZcj
	yXdEZHdya85zrlAo79eJYeS9RqKtFq5vXPdePjsfMQXHaKPAiq0dhqk7l0gY3PmMHSJE
	HIfVfTb5+l/fACDfr05Rieaey4zE9s4jQCtnxNQa9mCLRWIZqAz/z8GeZmzYUQzyQIoU
	SsMQ==
Received: by 10.182.228.69 with SMTP id sg5mr5168071obc.2.1351007796855;
	Tue, 23 Oct 2012 08:56:36 -0700 (PDT)
Received: by 10.182.228.69 with SMTP id sg5mr5168065obc.2.1351007796764; Tue,
	23 Oct 2012 08:56:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Tue, 23 Oct 2012 08:56:16 -0700 (PDT)
In-Reply-To: <5086BD5E.3040904@communistcode.co.uk>
References: <50869BDC.6050401@communistcode.co.uk>
	<CAJTo0LZHTGaVLnrYidOmLwvqB3Z+n9m5itr_4hA9krEPHihdsQ@mail.gmail.com>
	<5086B713.30708@communistcode.co.uk>
	<CAJTo0Lb0Fv=Hwhp88EUjurQO_Lnr319M-q_2Y6Js0fbzfO7Xfw@mail.gmail.com>
	<5086BBB2.7070601@communistcode.co.uk>
	<CAJTo0LZ0t1j=UpHAHR7Q=1FZ-LWGhT2TV0L+NPScEzEBmfd_Sg@mail.gmail.com>
	<5086BD5E.3040904@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Oct 2012 16:56:16 +0100
Message-ID: <CAJTo0La7QBQ-f=v8Rknh6nSYEiz70vcp_fA5crDjXOiOP-=XPA@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQm18FhluMJR0mcMiWNJNahW773lDq18iqqG/Rug+R9/uz6l06DIIS1PiseY1e16svMNWb+bM4kcRexF4T25AiG26xwpHDaPV5MdIHSzHNfjgiEziMtKuu8quZ8OUxsGMduPxZL5AoMZdkQiNG1bnFnfhO0ORKUpF42pYR0QjHsJgPGnmnAvZy1yrLb+BwIeuQVjTOKL
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues building meta-toolchain, libxau
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 16:15:20 -0000
Content-Type: text/plain; charset=UTF-8

Only a few hits, try cleaning those.  God knows why your sysroot is
hosed.  Maybe we should forcibly prune .la files from the sysroot...

Ross


