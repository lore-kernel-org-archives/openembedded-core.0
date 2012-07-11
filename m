Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sp3AZ-0005Wg-HX
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 22:05:55 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Jul 2012 12:54:41 -0700
Received: by qcmv28 with SMTP id v28so940427qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 12:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=66ZCmHx2YLbovjHPkEGoeDcfbvEbPIRPb+SNMVbfs+E=;
	b=UZvkl1tu7RskwgEDR3nbcMWbPDjnFBjtAueHFayzuzELU2AcEKwzKm5WiM0rFtbxOS
	G6DG71zAZlEPLUPXNbUqckV4plYt1fVZOKMdKFq88TtpQZunXHczq0b0wRyHeU/1Czwa
	Uq5WfSJILl+bpaErmtgMCQauaOjDKJ9n8yRNlXjlPbk8yQseIqw6mhmaSZEFwzM6xhlk
	/MFFMyvQrJpcD4hZ2hFPOp65Ff42By+cZ9SOdlXAh8zbMh0/mzKLpXmUqbMPmynlht4s
	+srOKkP4jsA7gZYjB8ZUPdJcbpDsMfwaccKvnHa8e7PsE677H1Exk8jNPWhXW+tx8VEl
	pyuw==
Received: by 10.224.196.135 with SMTP id eg7mr17588955qab.24.1342036480880;
	Wed, 11 Jul 2012 12:54:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Wed, 11 Jul 2012 12:54:20 -0700 (PDT)
In-Reply-To: <CABcZANmXGq8kccKxaqtwG7ekBqSsEzCwmwjTHSbXo9c5VsS-Pg@mail.gmail.com>
References: <cover.1342022120.git.peter.seebach@windriver.com>
	<22e5e5adc39fb855badc6d1260fbd4b30d966530.1342022120.git.peter.seebach@windriver.com>
	<1342023149.11939.22.camel@ted> <20120711113333.76632780@wrlaptop>
	<1342028210.11939.35.camel@ted> <20120711135455.72b90a06@wrlaptop>
	<CABcZANmXGq8kccKxaqtwG7ekBqSsEzCwmwjTHSbXo9c5VsS-Pg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jul 2012 20:54:20 +0100
Message-ID: <CAJTo0LYQTGihjGz5iYC+L34QY4gf00urFqr92MyiHrwWyMC==A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkWrl4Cxbq154l1S8wzdmF3YddDMNAFtsCEj5oAPsVqxlMsT5wBkJcwUmMaokr/8iBY/8b7
Subject: Re: [PATCH 1/1] package.bbclass: Allow overriding of debugedit starting path
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
X-List-Received-Date: Wed, 11 Jul 2012 20:05:55 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2012 20:01, Chris Larson <clarson@kergoth.com> wrote:
> That's one possibility. The other would be to treat _append/_prepended
> functions as independent entities. Rather than concatenating
> functions, it'd add them to the prefuncs/postfuncs or equivalent.
> Without concatenation, there'd be no issues with mismatches.

I always thought it would be best to give each append/prepend chunk a
unique name and then call them sequentially instead of gluing them
together.

Ross


