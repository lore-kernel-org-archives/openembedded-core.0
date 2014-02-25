Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id E809D6EAFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 16:33:04 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id ar20so500229iec.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 08:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fgyY8rIQqctJXJzs0p9oL8xGKAjZRPLzErfPt/mydEo=;
	b=fLVws0YZaQN4XOEMTAtobXd0lT+uVrAAQjoaVHllvKVpbqKMJoAdIoocgnUpYQ6zrH
	bq0qlypVjbqyAF+VaWfqjRgOJE2dtLOmJylB+FPO+EoT5tURbhZ7kNAl3ce8W6FkUUG6
	QXIc2feP5mnpdC/ELuZAOER5ZZ+oDNKX+yZCoRAQ/sedxMzj7mCAt5EVBruGiAKwcnEd
	Zeiz9y2zGFRCR3rzaLfzSp8ppShgR5bNsXVhjsJMsonUeqffN+IWSki26W31pkCP0ILC
	3tuh0nv7WqIFCmt0ufuhVuAUlTmYuuvbTdgigq8q3P5F+YHMBWrOOLwaem1X11yR1BR3
	ruBA==
X-Received: by 10.42.85.140 with SMTP id q12mr618688icl.51.1393345985679; Tue,
	25 Feb 2014 08:33:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 25 Feb 2014 08:32:35 -0800 (PST)
In-Reply-To: <CAJTo0LY1+hNB9hfjDTkB3N2uQZfgRSkP64F8=cBQxGWerT3W_w@mail.gmail.com>
References: <1393253881.31769.6.camel@ted>
	<CAMKF1spGuggEKfnLchYMeU0ounonupUhsLkC0wU_7S6nX-W8KQ@mail.gmail.com>
	<CAJTo0LY1+hNB9hfjDTkB3N2uQZfgRSkP64F8=cBQxGWerT3W_w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2014 08:32:35 -0800
Message-ID: <CAMKF1soVzSmgP9RGQDePhqr0EdVazL8L96z-=5Gb0Vf=Q==7rA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Tue, 25 Feb 2014 16:33:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 25, 2014 at 1:52 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 25 February 2014 05:46, Khem Raj <raj.khem@gmail.com> wrote:
>>> b) We introduce an "autotools2" class and have recipes inherit that.
>>> This version would default to separate builddirs. It does mean change to
>>> all the "good" recipes rather than the broken ones though and hence a
>>> fair bit of churn.
>>
>> probably a better migration path can happen over time. may be we can raname
>> existing autotools.bbclass to autotoolsold and have autotools.bbclass
>> default to S != B
>> that way the recipes which break can inherit autotoolsold and can have quick fix
>> then we can slowly remove inheriting autotoolsold and finally remove
>> the class itself.
>
> I really don't see the point of this churn.  If autotools defaults to
> B!=S then the recipe is going to need changing anyway, and adding
> B=${S} in the recipe is far lower impact than having a fork of
> autotools.bbclass

OK yes.

that has one change and would need to remain (and be
> maintained) for several release cycles.
>
> Ross

