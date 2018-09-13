Return-Path: <geissonator@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 106EE7459B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 00:47:05 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id x197-v6so7468659oix.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 17:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ByAVEPvDDBzbUc++kwG8ZnyF/+k5Ir3lAVL5crg6otw=;
	b=dkEmbTb1VYWlts9vhU+0bAKKh2EvJJYqw/SLg1F0PF67fKMksPPjXM06VxKnYeSWr4
	IKzQKFM7OPog6nqShhn5Ch39mXO+QPKIx61nwHc33AVOakE75BQbLHPrum7jKa1BbItc
	pjxFmt4dWLKRMh3JisR9xnqsYaWdW5La7QFeXMkonAZzLCxg1wOwn7FtyS1r6JISMtO6
	Gnumu92FP/Hmz3k8ZWRTFtwYQhKEXCKb6n4S/dxMQBSMGo55M1VOoKsOIj478GaLVZCO
	2NvNk+tRJBOpQwUNNrH5jIoz/HrAv9AqG7BC5nwe8oEybYPurMVlXDUzNLBsshlTnts8
	XVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ByAVEPvDDBzbUc++kwG8ZnyF/+k5Ir3lAVL5crg6otw=;
	b=uPxLG3rLVVy2KmReQFMm1s56LPliz1SvD4j7YFD3VxxG5U4UedxUhMGwn5os0iB02K
	IWWgBLH52KRYatFelJcyqCso+3uuGNRH4b2SwjsSV+6r4DymjN1YOyqUQG5knEJgk4xi
	09Oz5K1WFhjZPn+hErCobPoRdYOrt5dAwXIiQneXRYcMPWS7+LVE0Bn7F4l1AWTP1KTq
	9Td2Sfd1Qx63ii0MtcOvpKebZLqW6VQCNy8Uw4sn2hlsu9nzDE7RvRhkcbq9YTUtta5T
	BWlT2Zb8kwI3DkEeMVRznHihEYT/OR4GBgQmagUsVUQn5g6HyvYZcHUvR5myObKhr9OP
	kpUA==
X-Gm-Message-State: APzg51COKEuXNADy2zVd2yg2+MQ98FZNVuHfkrMUyJbczd8Ys7Jza16l
	n76gFxmBSIUo8Ow7sj0h38G6TXJIAAraisbWjiY=
X-Google-Smtp-Source: ANB0Vdb47YczeI3OpBXCnTHSPe7bfYqWfjtGXRE124rrrYHN5ZZSdqG51W8z47gf1RWptu531zGhpYZLgQuGFgsdbi0=
X-Received: by 2002:aca:dec6:: with SMTP id
	v189-v6mr4420973oig.98.1536799626857; 
	Wed, 12 Sep 2018 17:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <1536784825-4476-1-git-send-email-geissonator@gmail.com>
	<1536784825-4476-2-git-send-email-geissonator@gmail.com>
	<CAJTo0LZo8o+RNJR1KgqfQybfcv-QfNDEs+6a5NaR0U1tQ6uSJQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZo8o+RNJR1KgqfQybfcv-QfNDEs+6a5NaR0U1tQ6uSJQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 12 Sep 2018 19:46:55 -0500
Message-ID: <CALLMt=rAOhVp4N9amv0ohjVpAkq9FYpadKg2GP1tL+ptb6D+YQ@mail.gmail.com>
To: ross.burton@intel.com
Cc: alejandro.enedino.hernandez-samaniego@xilinx.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] python/python3: Add option to remove test files
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
X-List-Received-Date: Thu, 13 Sep 2018 00:47:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 12, 2018 at 4:11 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> What are these files?  Are they needed by the test suite?  If so, lets
> just put them into python-tests along with the test suite.

I did have a brief email exchange with Alejandro in
http://lists.openembedded.org/pipermail/openembedded-core/2018-September/155471.html
where we talked about how certain packages require the test files
during build, so they'd need to be removed during install.   I figured
it was easiest to just do them all during install.

I see that python2-manifest.json does have a sqlite3 and sqlite3-tests
entry.  Is that the type of thing I should try with the other packages
or were you thinking something else?

I'm definitely very new to the python recipe, but willing to try out
whatever you guys think best.

Thanks!
Andrew
>
> Ross
>
> On 12 September 2018 at 21:40, Andrew Geissler <geissonator@gmail.com> wrote:
> > A quick search in the python package shows the following test
> > directories being included in the python image:
> > ./Python-2.7.14/Lib/bsddb/test
> > ./Python-2.7.14/Lib/sqlite3/test
> > ./Python-2.7.14/Lib/ctypes/test
> > ./Python-2.7.14/Lib/unittest/test
> > ./Python-2.7.14/Lib/lib-tk/test
> > ./Python-2.7.14/Lib/email/test
> >
> > In some distributions, the extra space taken up by these test files
> > is very valuable.
> >
> > The default is to still include the test files.
> >
> > Signed-off-by: Andrew Geissler <geissonator@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python3_3.5.5.bb | 9 +++++++++
> >  meta/recipes-devtools/python/python_2.7.15.bb | 9 +++++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
> > index c919a97..5d1397a 100644
> > --- a/meta/recipes-devtools/python/python3_3.5.5.bb
> > +++ b/meta/recipes-devtools/python/python3_3.5.5.bb
> > @@ -160,6 +160,11 @@ EOF
> >         fi
> >  }
> >
> > +# Some packages include test/ directories and files. Provide option
> > +# to not include them.
> > +
> > +INCLUDE_TESTS ?= "1"
> > +
> >  do_install() {
> >         # make install needs the original Makefile, or otherwise the inclues would
> >         # go to ${D}${STAGING...}/...
> > @@ -189,6 +194,10 @@ do_install() {
> >         fi
> >
> >         oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
> > +
> > +    if [ "${INCLUDE_TESTS}" -ne "1" ]; then
> > +        find ${D}${libdir}/python${PYTHON_MAJMIN} -name test -exec rm -rf {} +;
> > +    fi
> >  }
> >
> >  do_install_append_class-nativesdk () {
> > diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
> > index 82b65d2..1839624 100644
> > --- a/meta/recipes-devtools/python/python_2.7.15.bb
> > +++ b/meta/recipes-devtools/python/python_2.7.15.bb
> > @@ -90,6 +90,11 @@ do_compile() {
> >                 OPT="${CFLAGS}"
> >  }
> >
> > +# Some packages include test/ directories and files. Provide option
> > +# to not include them.
> > +
> > +INCLUDE_TESTS ?= "1"
> > +
> >  do_install() {
> >         # make install needs the original Makefile, or otherwise the inclues would
> >         # go to ${D}${STAGING...}/...
> > @@ -127,6 +132,10 @@ do_install() {
> >      if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'bdb', d)}" ]; then
> >          rm -rf ${D}/${libdir}/python${PYTHON_MAJMIN}/bsddb
> >      fi
> > +
> > +    if [ "${INCLUDE_TESTS}" -ne "1" ]; then
> > +        find ${D}${libdir}/python${PYTHON_MAJMIN} -name test -exec rm -rf {} +;
> > +    fi
> >  }
> >
> >  do_install_append_class-nativesdk () {
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

