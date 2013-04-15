Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URmTl-0007RR-Ge
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 18:42:10 +0200
Received: by mail-vc0-f180.google.com with SMTP id m16so4090617vca.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=e2/DNnQRwRMCFFRfM0ea/MnWfebCouqwsMN2M0vwt3o=;
	b=OVn0Gz4mixf0+QEdE8o/UmMoppNL1uW5fIQOTGLdEvRoOn1Qdl1Y0uZT0BaMIPCsdT
	0TYeu2reik4P5FKG1BxQDeS9nqj5xTrzeHVMD1l22XW8yMHVgJzcvqU12l6YHGyFyJbi
	9RspiBmtpno0dCIzDkpsTK+5ao/88hhhdn3HNNRtgPl/MqnCu5vw5G5ONF8pKVdFO6Ji
	nLy8emaPRxd/VxuQyQFvjVfFMLBRi0h/1ri7U1fl1sP+wiLlPRyrvDiXdimL/VrcU0aI
	aLLZwgCzWwIaQVhUC/aEnFmut+622vXBfXftCdznLgAsgc8sQL+ePm83PFvDn2CKUz8n
	bbig==
X-Received: by 10.58.90.66 with SMTP id bu2mr16633032veb.29.1366043076153;
	Mon, 15 Apr 2013 09:24:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 09:24:16 -0700 (PDT)
In-Reply-To: <CADV-EXHFSOppcEJezD_OEUFF_Xo=c9J=560ssn5J=WKAj2x_+w@mail.gmail.com>
References: <CADV-EXHFSOppcEJezD_OEUFF_Xo=c9J=560ssn5J=WKAj2x_+w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 17:24:16 +0100
Message-ID: <CAJTo0LYOO8c25RRhX-qpOjJCuyJiALqc1tt=SXq5kg=t0QQPQA@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
X-Gm-Message-State: ALoCoQl5sQCD5UyvpbZFUgP2XVdwdlWxMHC15XQEMEyfbk/JrsFyIb7JvR6Fw05/d6lpJ63oVG1b
Cc: openembedded-core@lists.openembedded.org
Subject: Re: psplash and systemd
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
X-List-Received-Date: Mon, 15 Apr 2013 16:42:15 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 17:16, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> Is there a way to display image with progress bar during boot (using
> psplash) with systemd?

Theoretically yes, but this is one place where there isn't any
integration yet.  Systemd has native support for the plymouth splash,
so abstracting that would be the way forward.

Ross


