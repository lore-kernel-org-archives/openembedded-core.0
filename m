Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDB3C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 16:54:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.858.1634230464226376045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YxPwB0mS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id i12so21492690wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=e99eLFCMuNktCZm/2I5TwjAvAYMajZgaIGGMPsfYuxM=;
        b=YxPwB0mSN/2dZExOXJUyOZuivHcdBQD/a79P/PYLaQPxWpJg3keTvS9JdOlvvKKLzy
         FYsYm5nVu66VgjbGjUtj+IPHaMwlZ3PpMKJjFNxLP8HGXeN3BK5LaePrvg0/0aH4fyyr
         K9nIZoqQgek5pVJ/hNs4D6SqHOAc5yGS/ctcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=e99eLFCMuNktCZm/2I5TwjAvAYMajZgaIGGMPsfYuxM=;
        b=aIyYK4Ph2LoXbOXvES5593lmT1IzSkbLBUSl9wGhElJcRE6nBWsXFiU3IZEXIrJdOc
         fAvZfc1BWdBGJazktCsC8Z3JAv4E3tZyrJV4gB8joOQ7ElWCYOnK/H5NDb6vWWCkQMHb
         YyzjHlpjMeuQLqkGSgQSiKk7E1V4u00xsYrgyOAluKPZJlsbwPsoRzOLeHgUiw66ddXZ
         P/pRw8Gl2gKe/2aqzNsRB3WE1rOVStOrNlyPTn3u7bEjCyKeE1cHiZcuygyFcabK+tlr
         zga3MiOY3TnsLa1mwVAQAMFRYos+oza6a1FdLRg9utENXACUy/dLmSTPIaqgEZXAE6LW
         YGDg==
X-Gm-Message-State: AOAM532ruGrHtGMpZ9cyCo6iMHL4tRwG7lsLtz4e2bWfGahfkDM9o3Bn
	8wPNMhqhYZPPw5du/kXVlIIikA==
X-Google-Smtp-Source: 
 ABdhPJxxzSd0KmYN1JfXHDNCcLWBJQ+OicBPoZHMeSmPlTKI77uv+5pX8beQLO8vx2qsBy1ifjzlDw==
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr8026557wrs.96.1634230462702;
        Thu, 14 Oct 2021 09:54:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb5c:837c:62b1:b238?
 ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 q204sm8750761wme.10.2021.10.14.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 09:54:22 -0700 (PDT)
Message-ID: 
 <ba53cc97609bb6c79f513756760292a80e08612d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/2] license: Allow treating missing
 license as error
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mac@mcrowe.com, openembedded-core@lists.openembedded.org
Date: Thu, 14 Oct 2021 17:54:18 +0100
In-Reply-To: <YWhd8iAnlEd/XuR6@mcrowe.com>
References: <20211013104805.646626-1-mac@mcrowe.com>
	 <20211013104805.646626-2-mac@mcrowe.com> <YWhd8iAnlEd/XuR6@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 16:54:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156967

On Thu, 2021-10-14 at 17:42 +0100, Mike Crowe via lists.openembedded.org wrote:
> On Wednesday 13 October 2021 at 11:48:05 +0100, Mike Crowe wrote:
> > Use the same WARN_WA and ERROR_QA variables as insane.bbclass to allow
> > individual recipes, the distro or other configuration to determine
> > whether a missing licence should be treated as a warning (as it is now)
> > or as an error.
> > 
> > oe.qa.handle_error isn't immediately fatal, so track the overall sanity
> > state and call bb.fatal if required at the end to ensure that the task
> > really fails. If only bb.error is used then do_populate_lic isn't re-run
> > on subsequent builds which could lead to the error being missed.
> > 
> > It seems odd for the license- error classes to be listed in
> > insane.bbclass but implemented in license.bbclass. All recommendations
> > for somewhere else to put them gratefully received.
> > 
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  meta/classes/insane.bbclass  |  1 +
> >  meta/classes/license.bbclass | 27 ++++++++++++++++++++-------
> >  2 files changed, 21 insertions(+), 7 deletions(-)
> > 
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 895216d3e8..57456c99ad 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -28,6 +28,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
> >              invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
> >              mime mime-xdg unlisted-pkg-lics unhandled-features-check \
> >              missing-update-alternatives native-last missing-ptest \
> > +            license-exists license-no-generic license-syntax license-format \
> >              "
> >  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
> >              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index 45d912741d..6bbb71392e 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -112,6 +112,7 @@ def find_license_files(d):
> >      import oe.license
> >      from collections import defaultdict, OrderedDict
> >  
> > +    sane = True
> >      # All the license files for the package
> >      lic_files = d.getVar('LIC_FILES_CHKSUM') or ""
> >      pn = d.getVar('PN')
> > @@ -146,6 +147,7 @@ def find_license_files(d):
> >              self.generic_visit(node)
> >  
> >      def find_license(license_type):
> > +        import oe.qa
> 
> There's a "sane = True" missing here.
> 
> >          try:
> >              bb.utils.mkdirhier(gen_lic_dest)
> >          except:
> > @@ -178,7 +180,8 @@ def find_license_files(d):
> >              # The user may attempt to use NO_GENERIC_LICENSE for a generic license which doesn't make sense
> >              # and should not be allowed, warn the user in this case.
> >              if d.getVarFlag('NO_GENERIC_LICENSE', license_type):
> > -                bb.warn("%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type))
> > +                sane &= oe.qa.handle_error("license-no-generic",
> > +                    "%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type), d)
> >  
> >          elif non_generic_lic and non_generic_lic in lic_chksums:
> >              # if NO_GENERIC_LICENSE is set, we copy the license files from the fetched source
> > @@ -190,7 +193,8 @@ def find_license_files(d):
> >              # Add explicity avoid of CLOSED license because this isn't generic
> >              if license_type != 'CLOSED':
> >                  # And here is where we warn people that their licenses are lousy
> > -                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
> > +                sane &= oe.qa.handle_error("license-exists",
> > +                    "%s: No generic license file exists for: %s in any provider" % (pn, license_type), d)
> >              pass
> 
> and a check for not sane missing here.
> 
> >  
> >      if not generic_directory:
> > @@ -215,7 +219,8 @@ def find_license_files(d):
> >      except oe.license.InvalidLicense as exc:
> >          bb.fatal('%s: %s' % (d.getVar('PF'), exc))
> >      except SyntaxError:
> > -        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF')))
> > +        sane &= oe.qa.handle_error("license-syntax",
> > +            "%s: Failed to parse it's LICENSE field." % (d.getVar('PF')), d)
> >      # Add files from LIC_FILES_CHKSUM to list of license files
> >      lic_chksum_paths = defaultdict(OrderedDict)
> >      for path, data in sorted(lic_chksums.items()):
> > @@ -233,6 +238,8 @@ def find_license_files(d):
> >              for i, data in enumerate(files.values()):
> >                  lic_files_paths.append(tuple(["%s.%d" % (basename, i)] + list(data)))
> >  
> > +    if not sane:
> > +        bb.fatal("Fatal QA errors found, failing task.")
> >      return lic_files_paths
> >  
> >  def return_spdx(d, license):
> > @@ -398,6 +405,8 @@ def check_license_format(d):
> >          Validate operators in LICENSES.
> >          No spaces are allowed between LICENSES.
> >      """
> > +    import oe.qa
> > +    sane = True
> >      pn = d.getVar('PN')
> >      licenses = d.getVar('LICENSE')
> >      from oe.license import license_operator, license_operator_chars, license_pattern
> > @@ -406,14 +415,18 @@ def check_license_format(d):
> >      for pos, element in enumerate(elements):
> >          if license_pattern.match(element):
> >              if pos > 0 and license_pattern.match(elements[pos - 1]):
> > -                bb.warn('%s: LICENSE value "%s" has an invalid format - license names ' \
> > +                sane &= oe.qa.handle_error('license-format',
> > +                        '%s: LICENSE value "%s" has an invalid format - license names ' \
> >                          'must be separated by the following characters to indicate ' \
> >                          'the license selection: %s' %
> > -                        (pn, licenses, license_operator_chars))
> > +                        (pn, licenses, license_operator_chars), d)
> >          elif not license_operator.match(element):
> > -            bb.warn('%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
> > +            sane &= oe.qa.handle_error('license-format',
> > +                    '%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
> >                      'in the valid list of separators (%s)' %
> > -                    (pn, licenses, element, license_operator_chars))
> > +                    (pn, licenses, element, license_operator_chars), d)
> > +    if not sane:
> > +        bb.fatal("Fatal QA errors found, failing task.")
> >  
> >  SSTATETASKS += "do_populate_lic"
> >  do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
> 
> and license_image.bbclass probably needs the same treatment. Patch series v4 coming soon.

I did have to rework it a bit as I also ran into a few issues and was just
trying to get around to writing them up.

I added:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=9e980f1a71e8b6af5ff6da9b02fac0f8bfd9d4fb

which means you can drop the imports.

You can use the nonlocal option to help the "sane" problem:

http://git.yoctoproject.org/cgit.cgi/poky/diff/meta/classes/license.bbclass?h=master-next&id=110fa545ac84e560691c7d9e0d1e6e8f70c66980

The autobuilder also shows issues as some of the functions you moved are
referenced in other classes. The patch became:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=110fa545ac84e560691c7d9e0d1e6e8f70c66980

I was also just thinking we should probably add a new function and add calls at
the end of the tasks like:

oe.qa.exit_if_errors(d)

with a definition similar to:

def exit_if_errors(d):
    qa_sane = d.getVar("QA_SANE")
    if not qa_sane:
        bb.fatal("Fatal QA errors were found.")

and then renaming QA_SANE to something like QA_FATAL_ERRORS and exitting if set.

Cheers,

Richard


