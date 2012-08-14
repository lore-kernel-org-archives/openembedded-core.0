Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1CZQ-0003sX-Ji
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 10:33:48 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 14 Aug 2012 01:21:52 -0700
Received: by obceq6 with SMTP id eq6so184622obc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 01:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=PPYkaUS46n58BR56lYnN5sEvcqenPVApzgxHsu1Xh5w=;
	b=a9EbAnClOLokoh7Jx64y4DMcxJpngcOSUcjoqiJGuKa/GPPqyicdxxT4YkloD35pkq
	orrTe1/pm5QJmryLYiGxk7rB30sk1MRiimNkoUgt4S0D5uYTYh42M9DiML8VZ9oQk+Xf
	xMiC+GJXuMXjQuy4JCFS1QQXsrbExOzi+U254o1IgBY3skGt9SoqJO+FgnodPSnUfMWg
	U7hdgc6pZM4u9rPfI/vW22TR0fI0Pb37zXF/UcKUPsk41cLFcFQGRB9NWebOSiKBLoDW
	c2fedEbAA08Zsy6/o63LfUW4arK7RwMsJoNeikZ4qfoqaNvZLhrTiIh75rKpR6lsnt90
	KVfA==
Received: by 10.182.50.98 with SMTP id b2mr16997892obo.28.1344932511696; Tue,
	14 Aug 2012 01:21:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Tue, 14 Aug 2012 01:21:31 -0700 (PDT)
In-Reply-To: <5029DC55.4030906@linux.intel.com>
References: <1344524789-17424-1-git-send-email-ross.burton@intel.com>
	<5029DC55.4030906@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Aug 2012 09:21:31 +0100
Message-ID: <CAJTo0LaoYDVi-mbB5h3YEobKodoNRgL89RA=nZHOMdAhgsiZcA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmyd+Zqy6AI/6+EXvMRJaHOWlX9qu0OOg1+DirvEI42kPlK9SAcjtFPmGlm6gCDrbMKcRKv
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
X-List-Received-Date: Tue, 14 Aug 2012 08:33:48 -0000
Content-Type: text/plain; charset=UTF-8

On 14 August 2012 06:04, Saul Wold <sgw@linux.intel.com> wrote:
> Did you do a world build or build any SDK images?
>
> Looks like you missed somethings in task-sdk-gmae.inc

So I did.

Two options.

1) Remove the Pimlico applications and image feature, but keep
evolution-data-server for the GMAE task.
2) Remove the Pimlico applications and evolution-data-server, also
removing the GMAE SDK tasks.  Add e-d-s and the GMAE SDK tasks to
meta-gnome instead.

I'm leaning towards (2).

Ross


