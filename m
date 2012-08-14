Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1IYe-0006dJ-Rn
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 16:57:25 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Aug 2012 07:45:28 -0700
Received: by obceq6 with SMTP id eq6so557955obc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 07:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Z0MdIV6qMDQ6sXY4/d+P7A4MRCx0noM6iwAThGZMRT0=;
	b=AsDSg+APNVUevM9oadxvGs+gOuVCKEGiBu11EgENykHhtxBI2MTkYC+hscAjuzv63Q
	JE+KbOCL0BOSBEiZ0ozIter4UIgumXnFhTRMJd+RIHC1a8geP1t0jZBrZZSjqigoc9Ki
	D4+n9hKqo2Njq1nXQByBiD3JZ25W5H9dQDdiGPNetWhvYeveHIo+N0RBecxW9toiZO2D
	RRvrsP/VGfYuEa1U971qufudbhd5BDvm36Jg59pj/txj0XYq2vQp0GDIYjSFgRGxqesR
	uYWz6Qz03K2ij4Sm0QDeKspwgmjh6M+VfF4a+8Q9/pJUyk2pgc0ESGaf79HXdDXTakdz
	Acsg==
Received: by 10.182.86.225 with SMTP id s1mr19218493obz.73.1344955527319; Tue,
	14 Aug 2012 07:45:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Tue, 14 Aug 2012 07:45:06 -0700 (PDT)
In-Reply-To: <CAJTo0LaoYDVi-mbB5h3YEobKodoNRgL89RA=nZHOMdAhgsiZcA@mail.gmail.com>
References: <1344524789-17424-1-git-send-email-ross.burton@intel.com>
	<5029DC55.4030906@linux.intel.com>
	<CAJTo0LaoYDVi-mbB5h3YEobKodoNRgL89RA=nZHOMdAhgsiZcA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Aug 2012 15:45:06 +0100
Message-ID: <CAJTo0LY_Sfn_jd2-_iMWpW85svp82ZAdk99WEzydrC3m1sJXVg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlaZswnP/JBHsFOoBdbl33U3mTasLG4BLLlowrB9g5qKjXekX2QgnONFMRDLtMZ+S2mHYYg
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pimlico: Remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Aug 2012 14:57:25 -0000
Content-Type: text/plain; charset=UTF-8

On 14 August 2012 09:21, Burton, Ross <ross.burton@intel.com> wrote:
> Two options.
>
> 1) Remove the Pimlico applications and image feature, but keep
> evolution-data-server for the GMAE task.
> 2) Remove the Pimlico applications and evolution-data-server, also
> removing the GMAE SDK tasks.  Add e-d-s and the GMAE SDK tasks to
> meta-gnome instead.

Three options:

3) remove the apps now, and decide e-d-s later.  Incremental change++.

poky-contrib:ross/sato has been updated.  The apps are removed,
leaving eds/libical for now.

Ross


