Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 58B7777515
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 16:27:32 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 203so26439535ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 08:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=mV12B9lX/dWoWcj0hP+HHHKld+5EsnRA6CQx5AB4f+Q=;
	b=VIBbyOSlD3uk5SirSV5SjtKVAEM3NCiyGJrcYAilCWOJY7eEGMery2HQxFoE+Mc9zQ
	9oXXZx+T/9kxIYHDnEGbYb7YUbONdBKjlL0+L2EGKlCKjrNU6G8mcs6+bZwVMTmqdT0/
	aA3l+PERosPM7j60mOvg73VQ4bFdFDPHM5wF8F+t3l3WX7tSL2PHHXkCjurNuCUcjkAS
	Ls2JbKe0BcOc4o4Jwrm3fT6E2Oa8f7xOdWaLmM5XvqKgBxNEMK73VlvfwWLM83NbySF2
	p/LCbaxvEXGyhRPi6F3+KjmEu8yLH+ijV8Ku7xaUUtvgzyhqPaRLomu9JV+J6wPj70sP
	Qtgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=mV12B9lX/dWoWcj0hP+HHHKld+5EsnRA6CQx5AB4f+Q=;
	b=PRs8nmIc4oNgr8DVhMvpoEnANS/oX0AX5OQYIW9iLtPc81IYoKJbLVrI93FN0nv80P
	aSnUGfGzel8NqNkJKShWJ1NUeLFbLIE/B7X6uRN3qOstBYGQAKJEBZd2/LkzR9ZiGn1q
	T0SFq3kQAGmT6S0QKpT67yZ5eGiN01kYJeXgA2irH2yJY8bOQhdPAb6JsRwW/6aSPNHV
	J0FFKfVOeNxTvkFRw6Bz8uxcm7Du2tuqmp73i66vr82607YEE8c84j9ybNWTGvIVWjS+
	zoyUhTMaDB4i9hwAjdewmVx67YizZYYcayJTsTf+KEY+Ab8qraSa/dDnsI5fl8v5r+0w
	hnjw==
X-Gm-Message-State: AMke39n+9P3lnqzIoyG+xhdY3Zyb/Jyy14rw828Iz4q7y5z3Y9XjN2WFMArH7KOPvFOgGglU
X-Received: by 10.107.20.84 with SMTP id 81mr3145447iou.145.1487953653451;
	Fri, 24 Feb 2017 08:27:33 -0800 (PST)
Received: from pohly-mobl1 (ip-64-134-128-59.public.wayport.net.
	[64.134.128.59]) by smtp.gmail.com with ESMTPSA id
	u63sm3282619iou.29.2017.02.24.08.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Feb 2017 08:27:32 -0800 (PST)
Message-ID: <1487953650.10512.14.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 24 Feb 2017 17:27:30 +0100
In-Reply-To: <d20dc7dc-c3d0-ab79-948e-2caab91d3caf@mlbassoc.com>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
	<26abf96d-d224-0795-4870-cdd496f541de@linux.intel.com>
	<1487946072.10512.9.camel@intel.com>
	<d20dc7dc-c3d0-ab79-948e-2caab91d3caf@mlbassoc.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patchwork not picking changes from the ML
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
X-List-Received-Date: Fri, 24 Feb 2017 16:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-02-24 at 15:33 +0100, Gary Thomas wrote:
> On 2017-02-24 15:21, Patrick Ohly wrote:
> > On Wed, 2017-02-22 at 15:56 -0600, Jose Lamego wrote:
> >>
> >> On 02/22/2017 02:55 PM, Michael Halstead wrote:
> >>> I've seen several issues with hooks. I was working on them yesterday and
> >>> will continue today.
> >>>
> >>> These are currently managed by hand but we are moving them into
> >>> configuration management which should help keep them working consistently.
> >>
> >> Michael: one syntax error in patchwork code was pulled into production
> >> yesterday. This is the cause for missing patches. The error is fixed in
> >> the Yocto repo now, please perform a server code update ASAP.
> >>
> >> Martin: I will look at the UI issue you are describing and file a bug if
> >> needed.
> >
> > Would it perhaps make sense to reply to the original author with an
> > email confirming that his patch is now in Patchwork? It should include a
> > link to the patch series, too.
> >
> > This could have several advantages:
> >       * submitters not aware of Patchwork or whether their target
> >         currently uses it learn about it and then can follow the
> >         progress of their patch
> >       * everyone gets a confirmation that the submission made it through
> >         the various mail servers and Patchwork itself
> >
> > It still relies on the original submitter to watch out for breakages in
> > the processes, but I guess that can't be avoided with an asynchronous,
> > mail-based process.
> >
> 
> I would love to see this added to the process - +1 :-)

Let me clarify that my original proposal was to reply only to the
original author. That was meant to keep noise down on the list. However,
perhaps it should also go to the list?

Then others can help check that Patchwork works, as the original author
might not be aware that a response is missing. It also tells everyone
the relevant link in Patchwork.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




