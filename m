Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0DE76E3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 03:29:17 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so17757751pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 19:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=jHqegxiQJzkk4+D6H7HVvHnTD7We84ZvNjAwFj/9erQ=;
	b=YYTsNxtVIO1GQ2LfAj0t0phSK3SmpWXvBB3r0mBJ0VBssPs41qlkvTPumQL4RvtbU6
	SBvo7sqNx1ZcYP+kJuXF/vFM/yAIl1SsaYVrS1FKbL7aYSh8fFEpi8Gq+ekEbknVzhLI
	Ul68BHR77YWvHjGt9+Og1ZNl9W7IrKUzWIi/2ihEi8TFp8BL/MhDG3T8zwIuI90fA4bO
	yiN66iDoK94FJ6A8ZpVnAsFGmZzfCN9zKcE+P9DxSMnQEQYWafggVWRaBsc0x1TvNDFr
	mnGjVvVszzdOQvHdsqttdhk94/24Gmwb35SOhrSnA4bT7yjaxauljLJdPK8cIOrsN/+q
	njjg==
X-Received: by 10.66.136.11 with SMTP id pw11mr10989017pab.87.1447212557439;
	Tue, 10 Nov 2015 19:29:17 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:716d:29f5:a55d:699f?
	([2601:646:8601:4580:716d:29f5:a55d:699f])
	by smtp.gmail.com with ESMTPSA id c6sm6808412pbu.51.2015.11.10.19.29.16
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Nov 2015 19:29:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3108\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZ9XcwwEhXwm0awgZ-cb9wDOC6XkiqShXyUYqG6Qi-Fhw@mail.gmail.com>
Date: Tue, 10 Nov 2015 19:29:18 -0800
Message-Id: <F5F5E082-AC9E-4E89-B6C5-8F27097249C1@gmail.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <1447197016.2907.2.camel@pbcl.net>
	<CAJTo0LZ9XcwwEhXwm0awgZ-cb9wDOC6XkiqShXyUYqG6Qi-Fhw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3108)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Wed, 11 Nov 2015 03:29:17 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_75E39D33-B797-431A-ADCE-EFD769C210AB"

--Apple-Mail=_75E39D33-B797-431A-ADCE-EFD769C210AB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 10, 2015, at 3:40 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 10 November 2015 at 23:10, Phil Blundell <pb@pbcl.net =
<mailto:pb@pbcl.net>> wrote:
> Why does gobject-introspection (presumably giscanner, right?) need to
> run binaries on the target at all?  I thought it operated mostly on =
the
> source code.
>=20
> Same reason gtk-doc's scanner executes code: vast amounts of relevant =
information can't reliably be extracted from source but is trivial to =
introspect at runtime (GObject hierarchy, properties, signals, etc).

so its not truly cross build friendly, We should try to see if this can =
be fed in artificial information which can be stored in some config =
files, similar to autoconf caching IMO.

>=20
> Ross
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_75E39D33-B797-431A-ADCE-EFD769C210AB
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Nov 10, 2015, at 3:40 PM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 10 November 2015 at 23:10, Phil Blundell <span dir="ltr" class="">&lt;<a href="mailto:pb@pbcl.net" target="_blank" class="">pb@pbcl.net</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":5kh" class="a3s" style="overflow:hidden">Why does gobject-introspection (presumably giscanner, right?) need to<br class="">
run binaries on the target at all?&nbsp; I thought it operated mostly on the<br class="">
source code.</div></blockquote></div><br class="">Same reason gtk-doc's scanner executes code: vast amounts of relevant information can't reliably be extracted from source but is trivial to introspect at runtime (GObject hierarchy, properties, signals, etc).</div></div></div></blockquote><div><br class=""></div><div>so its not truly cross build friendly, We should try to see if this can be fed in artificial information which can be stored in some config files, similar to autoconf caching IMO.</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""></div><div class="gmail_extra">Ross</div></div>
-- <br class="">_______________________________________________<br class="">Openembedded-core mailing list<br class=""><a href="mailto:Openembedded-core@lists.openembedded.org" class="">Openembedded-core@lists.openembedded.org</a><br class="">http://lists.openembedded.org/mailman/listinfo/openembedded-core<br class=""></div></blockquote></div><br class=""></body></html>

--Apple-Mail=_75E39D33-B797-431A-ADCE-EFD769C210AB--
