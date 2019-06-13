Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id C86FA7E7D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 09:10:58 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id h6so15438574ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CU443Q6oegh02blq3AKWUV6SBEKReNlaCok18ySYcXw=;
	b=WiqFO2OMEztpvIa0E7AJPQGHDytTcbeC1iHbjpGMDenxUS1Pl5n144Xwjsbj/F9C4j
	eXJdMDGd+8dXTHabvLN9P7l8pFkt+sUhe+PohDZ15wNCSPCGHOX1+ZMDA4RO8WQGrnw8
	B67dCdZR6dvhKCQmywpyuUca+llq3HLgzWle4bPR5NgxNfoMS+VIAVZXkz56pHtzbkFW
	aBYzsjfzkQv2mlWTQPUJdZFanaGTsig80hFyvLUtegPC+KpiVq3nY0xkUyYZ0X/0NtQa
	yzTG9kZZXTc690ii8Tbw7TSXCZXnuT3sUPHrG+rIE5n8mRjV1HsrGt6HMwaGZuaqFLGO
	oo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CU443Q6oegh02blq3AKWUV6SBEKReNlaCok18ySYcXw=;
	b=DaKQMVs9pJsX540mqBV0K7lfequLUho5tteWAF/jzxn4D5mTvRVMMSV2b+IM6HeC0p
	tJiI9UNFaF1q4AIUitPss6DcBOWlpUgXFewR1SRRvKI7oUl/yItvgvE/K4zF+FA+XM1U
	DEQHPmKlMYuZiA1Dv6zA97E+m+eavNIQ3BpZgqm66K+lZuXbSkOb396rHZcl9usjpuyc
	h3CMOjhdVkfK2mN4civn9AaIZUPhbio7Bernvf6ak7/MzjKiwib4rNC2+6eRVgfdcjNo
	G3aRqWOkGTAhgI/8Ts5ReaE+VZvM/ZZ/FCB07nej64rY6uZ+U/d1SZ3APJUyeSr/l1JY
	PzHQ==
X-Gm-Message-State: APjAAAXGH82H4tJrp5z06O9E98CPrfyzu5E+DNrwXRv1UT5OToMTvPmy
	CuNH8uA4iRGmQWWkx4GOmGxDH8gX6lF8HNjEtMw9bg==
X-Google-Smtp-Source: APXvYqw1+lt0rcRfVcH+XjZpNSSgdSwnS0xwOcim4NdqVx085goArduXXzl88xvTWtdXL2vLOAL/O4+SjjPS8xzI2ok=
X-Received: by 2002:a5d:9e11:: with SMTP id h17mr51533257ioh.261.1560417059487;
	Thu, 13 Jun 2019 02:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <1559336914-6411-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJTo0LYinJhqtqjZkw3+icj44niSTu8CJFyGu2i7oBv9mjyEug@mail.gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FD01BF12B47F@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD01BF12B47F@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Jun 2019 10:10:48 +0100
Message-ID: <CAJTo0LZ3f8kWX1rg0AP2ruG+Ue7g+tXjgy-iAQyYKB9Pr+WFoQ@mail.gmail.com>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][warrior][PATCH] at: Fix a spelling mistake.
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
X-List-Received-Date: Thu, 13 Jun 2019 09:10:59 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry, I was failing to read the patch of the patch. :)

Ross

On Thu, 13 Jun 2019 at 02:57, Lei, Maohui <leimaohui@cn.fujitsu.com> wrote:
>
> Hi Ross
>
> > You do more than fix a spelling mistake in that commit.  Please
> > explain the other changes.
>
> I'm sorry, I don't understand. I just fixed "acount" to "account". I didn't do redundant change.
>
> > > -+acount     include    common-account
> > > ++account     include    common-account
>
>
> Best regards
> Lei
>
>
> > -----Original Message-----
> > From: Burton, Ross [mailto:ross.burton@intel.com]
> > Sent: Wednesday, June 12, 2019 5:33 PM
> > To: Lei, Maohui
> > Cc: OE-core
> > Subject: Re: [OE-core] [master][warrior][PATCH] at: Fix a spelling mistake.
> >
> > You do more than fix a spelling mistake in that commit.  Please
> > explain the other changes.
> >
> > Ross
> >
> > On Wed, 12 Jun 2019 at 04:09, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
> > >
> > > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > > ---
> > >  meta/recipes-extended/at/at/pam.conf.patch | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-extended/at/at/pam.conf.patch b/meta/recipes-
> > extended/at/at/pam.conf.patch
> > > index c9f337e..38e7fc1 100644
> > > --- a/meta/recipes-extended/at/at/pam.conf.patch
> > > +++ b/meta/recipes-extended/at/at/pam.conf.patch
> > > @@ -24,7 +24,7 @@ index 3674c0a..2f8d586 100644
> > >  -@include common-auth
> > >  -@include common-account
> > >  +auth       include    common-auth
> > > -+acount     include    common-account
> > > ++account     include    common-account
> > >   session    required   pam_loginuid.so
> > >  -@include common-session-noninteractive
> > >  +session    include    common-session-noninteractive
> > > --
> > > 2.7.4
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>
>
>

