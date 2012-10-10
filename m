Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TLsbl-0003VD-Sj
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 11:29:42 +0200
Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 10 Oct 2012 02:16:31 -0700
Received: by mail-ia0-f175.google.com with SMTP id b35so193093iac.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 02:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Z4a8y4lTgYoVOv8OO7bOX7NO68W2eDmgib6ylDPZL+Y=;
	b=lgz/k+znO0M3kixhqNhlRguw76jlffIUof0L6SbhrWXertdBG8d3KiNpHdVnhquQ3s
	BIFV0Txe6ar7mhox8gVrFSzhhXX9/1yGIErx4DImOFAi3Tw1NzAhNRGSTdjbqesBsjpk
	XnKyvwmxOpkwy0yKyNtfJZmjXI3X7rXzzvzkgfTt3958i+T+66I+rhvWvyRbZPh8TZwe
	XOZYp8Zs9N1O5f2pna5JLpA02oNWLqA6/j3yBGV/SMkdsI+4XwwJhwYWb2M1VCmD2sGq
	gDqiCP1G8c8wmWeS+IjatGw6w969yt+MnCIN/UfUhtR+PI/BIH+tekOPzmAFz/4GGU4a
	LjoA==
Received: by 10.50.153.162 with SMTP id vh2mr166684igb.67.1349860589529; Wed,
	10 Oct 2012 02:16:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.141.70 with HTTP; Wed, 10 Oct 2012 02:16:09 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6ED3E4@039-SN1MPN1-002.039d.mgd.msft.net>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_MgcYVomQbn=j_w=+BCDjUAdDe1D==CsQ_eFTJm1=rwQw@mail.gmail.com>
	<4F58B564.5040708@opendreambox.org>
	<70CC66F5C30A414DADDA6973E4CA391A6ED3E4@039-SN1MPN1-002.039d.mgd.msft.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Oct 2012 10:16:09 +0100
Message-ID: <CAJTo0LZ2hwkk58_jQQx9a5mjEFSjyexuk0trRL5_8z_FGyZiRg@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Gm-Message-State: ALoCoQn5z3faho6gFYzDLgRgRcBjOjtM+lmsIrqcA9pGmeDq5QgJ6DJNU4Ot+CWCFRHVXTj2afIi
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with disabled parallel make
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
X-List-Received-Date: Wed, 10 Oct 2012 09:29:42 -0000
Content-Type: text/plain; charset=UTF-8

Hi Matthew,

On 10 October 2012 02:45, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>>> 1. Recipes (files) confirmed to fail with P_M enabled (need to have
>>> P_M disabled as it is now):
>>> meta/recipes-connectivity/bind/bind_9.8.1.bb
>>> meta/recipes-extended/slang/slang_2.2.4.bb
>>> meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
>>> meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
>>> meta/recipes-support/pth/pth_2.0.7.bb

Lack of parallelism is one of those things that really bugs me...

Do you still have the failure logs to hand?  I'd love to see a patch
which put the failure alongside the PARALLEL_MAKE=0.  It's also
probably worth removing the PARALLEL_MAKE for the other targets once
master opens for development and seeing if they break on the
autobuilders (as some parallel races are rare to hit).

Ross


