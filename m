Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4B6C76D3A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 21:06:55 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id i2so18003416ite.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 13:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Nr0XBaxwUIRu5GyhZbLUSDkQV0EjPQE4ogC54+wOU4M=;
	b=vZ9lrkDdL/rzO0Y4HMHyYvCISiH+EJ+Oo1ApLkQ3Krw3yShZitlE4OOl9iLM75RVxt
	1k33I5LwguB33CGj5nTG/fbfH1WN2Kgu+cDL2nqZMzS4ooHh6fmXdOcG7rdgpwLWrIXh
	TQXfnlT8enG8f0MbkvcGrrV3eMjxbmduOg7nSYq7hWdxSIQgIjo3cRjStYW/ucId6/GD
	pUm6W8XSIEQyUEyNARSG+Q+dFM+g/WMlfrmBQJrvny17RCS0J+a7meiGAo7As/kteE7o
	px98O+Zd08u3+khwCXpUZCH2uZz7Wsc5YdwZqO4h59nRfqRZlTJO38Y+5bdyCQgzL8Am
	TG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Nr0XBaxwUIRu5GyhZbLUSDkQV0EjPQE4ogC54+wOU4M=;
	b=WIRiYv5Vq1k16P4lW/x3huttKJDxnOfQjaNF86JloHR0YuWAdCdGlK1gkrTxOdUE1o
	tkp+h5s2ErPefGIi2jdhlBE1JxiYUUHWAxxBBB3ak+dol7KbvJflvw6B3wqxQfYsrrka
	Hz6+D+yrfazci4y3v4aZeERDQwx/Di297p/FB/XJeKiMuGpg+FGIzH5NbRbXrCzttdVa
	oaU1mFR385kB59OJ3gCyaNtPrakMoqSVXVqFlXrAHCWFLyLr8TqjUC3huy7xO+muezEI
	q+s+dWJ71qAMzUc468nOHO+0M4ZrgB2jImKvirzGM9M/C41f3QdjCYjhv32UkWBnIQGa
	gI4Q==
X-Gm-Message-State: AHQUAuawYlWD4PicRNcq48xGlpDHbikm/LSfXo0KygIyme/6WTzdwibN
	+f4OFaOXNELqRZwrAFUXD/6UAVy8SCnSJZ4kl/qjAg==
X-Google-Smtp-Source: AHgI3IZbwQQkacXl9J1PgWJYbAK9FiNw4IwTIIUWwu6P15tzlKnlxNOInE4hUeD/n58gPVhaG6SCw6YNt89ym8dNNAM=
X-Received: by 2002:a6b:ee1a:: with SMTP id i26mr3349078ioh.201.1550178416374; 
	Thu, 14 Feb 2019 13:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20190214191706.87864-1-ddedrick@lexmark.com>
	<CAJTo0LYqdpCricB39Yz0PAZn99wLkUGn0JZwtUAtySeHhr-=-Q@mail.gmail.com>
In-Reply-To: <CAJTo0LYqdpCricB39Yz0PAZn99wLkUGn0JZwtUAtySeHhr-=-Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Feb 2019 21:06:45 +0000
Message-ID: <CAJTo0LZU2-__-fVEwCDmB=8fpyh84CS++WxudVqshD9b4Qo=Rw@mail.gmail.com>
To: Dan Dedrick <dan.dedrick@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cve-check: allow filtering out patched issues
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
X-List-Received-Date: Thu, 14 Feb 2019 21:06:55 -0000
Content-Type: text/plain; charset="UTF-8"

Also, be aware that cve-check-tool is notorious for unreliable reports
and shouldn't be relied upon: the false negative rate is huge (and not
something that can be fixed in cve-check-tool either).

Ross

On Thu, 14 Feb 2019 at 21:03, Burton, Ross <ross.burton@intel.com> wrote:
>
> The report explicitly lists would-be-vulnerable-but-patches issues and
> marks them as such, so why can't you just ignore them in the report?
>
> Ross
>
> On Thu, 14 Feb 2019 at 19:18, Dan Dedrick <dan.dedrick@gmail.com> wrote:
> >
> > It can be useful to filter out patched issues since they are no longer
> > vulnerable. This makes it easier to sift through what CVEs still might
> > need to be fixed.
> >
> > Signed-off-by: Dan Dedrick <ddedrick@lexmark.com>
> > ---
> >  meta/classes/cve-check.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> > index 743bc08a4f..a486d686ae 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -35,6 +35,7 @@ CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
> >  CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
> >  CVE_CHECK_COPY_FILES ??= "1"
> >  CVE_CHECK_CREATE_MANIFEST ??= "1"
> > +CVE_CHECK_EXCLUDE_PATCHED ??= "0"
> >
> >  # Whitelist for packages (PN)
> >  CVE_CHECK_PN_WHITELIST = "\
> > @@ -54,6 +55,8 @@ python do_cve_check () {
> >      if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
> >          patched_cves = get_patches_cves(d)
> >          patched, unpatched = check_cves(d, patched_cves)
> > +        if d.getVar("CVE_CHECK_EXCLUDE_PATCHED") == "1":
> > +            patched = []
> >          if patched or unpatched:
> >              cve_data = get_cve_info(d, patched + unpatched)
> >              cve_write_data(d, patched, unpatched, cve_data)
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

