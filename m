Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id E53BE73DD9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 20:07:21 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so47871772qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 May 2015 13:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vCNFbbdI/QvVBpsBySDe7J4TzeLyltSWE4s2TNtHFNA=;
	b=S81mNEHkL2Sb3GLNgBUUTNZRMUNsSRkImP80F+wK3F9Me6XqR0Az//9iBKilquDpB7
	dSPYJKkCmAvdQEXXWNg+z5TxXhTd1Cj3E1RVWX6so6EQYW+v/697wpiVOW6g1x8/V5+z
	K/H3ri0ojcxkGKnBSlCL1AnzniTtp3baS2aqGhcIwmSv+9nCLXc1tI10cte5DD+FkVg8
	omo+rML/dJOxmYE2PjzyD9BhHrrkqNbYTnCu5kRFMQOq10NhTnydljweuJ6WzsOLhOMG
	o0G20pE0hOs/EFe8E2o6JvCmEaAG2Eqi/CoY6pSqHMdwkC0AE0XphqaF98OpoVg1KMCh
	MDuw==
X-Gm-Message-State: ALoCoQlBx34MWoWLFPG48QUYzpVgcTTDaB+q5K1ltF6vgooQc/Qzfp6SgnSSc6FqCd1WhSK1yT44
X-Received: by 10.55.50.20 with SMTP id y20mr22487802qky.58.1430510842197;
	Fri, 01 May 2015 13:07:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 1 May 2015 13:07:01 -0700 (PDT)
In-Reply-To: <5F36DEAE-E6AB-4E52-A105-B48B0B1CCD9B@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
	<278c32ff3aaa351237215ff41060a0bc8aa7fd36.1429846255.git.raj.khem@gmail.com>
	<CAJTo0LamJfd_=oqKfiAvoRueB=7EQu5GCYfaQO1r3ADnNdjQzA@mail.gmail.com>
	<5F36DEAE-E6AB-4E52-A105-B48B0B1CCD9B@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 May 2015 21:07:01 +0100
Message-ID: <CAJTo0LYNKMRhUXX5O=ggk=MC1g=4PSszEQx+uj0Fa6er_LZp4g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/14] subversion: Add -P to CPPFLAGS
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
X-List-Received-Date: Fri, 01 May 2015 20:07:23 -0000
Content-Type: multipart/alternative; boundary=001a1147139298cbbe05150ac244

--001a1147139298cbbe05150ac244
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 27 April 2015 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:

> Don=E2=80=99t have the error handy right now something swig related, howe=
ver
> because its needing python2 for its bindings and some systems have
> switched to using python3 as default.
>

Requiring a fresh install of Python 2.x when we can just force the python
version seems overkill to me...

Ross

--001a1147139298cbbe05150ac244
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
7 April 2015 at 16:48, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div style=3D"word-wrap:break-word"><div=
><div>Don=E2=80=99t have the error handy right now something swig related, =
however</div><div>because its needing python2 for its bindings and some sys=
tems have switched to using python3 as default.</div></div></div></blockquo=
te><div><br></div><div>Requiring a fresh install of Python 2.x when we can =
just force the python version seems overkill to me...</div><div><br></div><=
div>Ross</div></div></div></div>

--001a1147139298cbbe05150ac244--
