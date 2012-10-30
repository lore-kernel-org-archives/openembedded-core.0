Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TT9mD-0005bX-72
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 12:14:33 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 30 Oct 2012 04:00:56 -0700
Received: by mail-ie0-f197.google.com with SMTP id 9so346899iec.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 04:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=KzOJYmf4pfA4sxu8yQk6F30jZLPxIKVcH0/9Cxz2m7k=;
	b=aC8bMqoDZAvIF7W92ZPphYiguXAIn5c8ftP8fnRFrPZu4kzwHpxasHzT2SBvptbcv3
	cSGp2V8J4wA6sEMtl4Oz23ItjfBoFEyyy+V6Co9E9Y1CELYQImjOwEvY8lCFpnXX62IQ
	mP21sPtvA7a0Gn/u0B+coIFwA+jQDhIt1EZ0eT9lOS3Y3e97tGFfMsI98jlQ7I2uf9Sz
	DJaFAxv6hsKM36SDQCI/hSOnCFtl/R9iYedtrj0H9IFxLQ+uju9HWupacJTPujL04ETw
	0yt5s5OJkNc4v/aNAxY1Vh4F367HmPrsT0c2NrPNUQy4yejc164WBr9E2KeBWBi3OGTV
	Vgvg==
Received: by 10.50.237.6 with SMTP id uy6mr1066083igc.31.1351594855727;
	Tue, 30 Oct 2012 04:00:55 -0700 (PDT)
Received: by 10.50.237.6 with SMTP id uy6mr1066071igc.31.1351594855544; Tue,
	30 Oct 2012 04:00:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.68.41 with HTTP; Tue, 30 Oct 2012 04:00:35 -0700 (PDT)
In-Reply-To: <CAK18fxFcMPNVPXy6QcFAKAUmgyF83fBAX_BdUS8nLG=f=KQgyw@mail.gmail.com>
References: <1351096656-32438-1-git-send-email-ross.burton@intel.com>
	<CAK18fxFzwdCszev=Ss+rMdytAqUgDcnA4e9HEC4_psz2SAJbxw@mail.gmail.com>
	<CAJTo0LZ=t_sWFtkbdt=uwyCEGuMmHnWdu7cO3=qMmseiMtVTHQ@mail.gmail.com>
	<CAK18fxGFUy_+pzBvGtvknjj3AQFkGqBA6mjkHDgJTamXOMr5RQ@mail.gmail.com>
	<CAJTo0LZcHi16POq8_bQpURnjLxvj7fy=9m_LX27+Nz_RADQT2w@mail.gmail.com>
	<CAK18fxFcMPNVPXy6QcFAKAUmgyF83fBAX_BdUS8nLG=f=KQgyw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2012 11:00:35 +0000
Message-ID: <CAJTo0LZ1=uTF26dn2MdE6ZwRgOYcVS9i-uqGWYab4uEXnAGTtA@mail.gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQkEr63vjA9mvmhE79OiAFmmKp5p83XYfY9xV4Uvp/yUZ9XDHJMnavOtJ6+3Qi4Oe03s0NeShDzM5i7zlrP9AtN/L/H7MTTEXcj0YcYqmOqinHHsbys1H4LpQCf8UP42AgT9ZGr2qVk5WGY4oV9yAmz3yBNEmR1VEI4MYE/ftmCidWEB0+o28YdTE/g77uslTuBVOjt8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] pulseaudio: add GConf dependency
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
X-List-Received-Date: Tue, 30 Oct 2012 11:14:33 -0000
Content-Type: text/plain; charset=UTF-8

On 30 October 2012 10:31, Andrei Gherzan <andrei@gherzan.ro> wrote:
>> Oh joy, one of those instances where GPLv3 isn't actually a problem.
>>
>> gnome-common is some scripts and tools used at configure time, so
>> there isn't any linkage, so there isn't any GPLv3 in the images, so
>> there isn't a problem.
>>
>> The question is how do we express this?
>
> Should it be whitelisted?

So I did some digging.  The file in git that is explicitly v3 only
appeared in 3.6, so I considered reverting to 3.5.5 before it
appeared.  Then I noticed that we're still shipping gnome-common 2.28
from 2009, which doesn't have any v3 code in (to be honest it barely
has any license at all, but it's definitely not v3.  I've pinged
upstream.

The v3 license in the metadata came from:

commit 8a2b4e2a5e85f4937e72f03e579b1aaa264074a1
Author: Zhai Edwin <edwin.zhai@intel.com>
Date:   Thu Jul 1 15:35:11 2010 +0800

    gnome-common: Fix the metadata

    Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>

diff --git a/meta/packages/gnome/gnome-common_2.20.0.bb
b/meta/packages/gnome/gnome-common_2.20.0.bb
index 075ac14..c2eae72 100644
--- a/meta/packages/gnome/gnome-common_2.20.0.bb
+++ b/meta/packages/gnome/gnome-common_2.20.0.bb
@@ -1,7 +1,11 @@
-LICENSE = "GPL"
+DESCRIPTION = "Common macros for building GNOME applications"
+HOMEPAGE = "http://www.gnome.org/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv3"

Looks like a misguided attempt at fixing a warning from not specifying
what version of GPL was in use.  Traditionally the bulk of GNOME is
LGPLv2.1

But following the dependencies, gnomebase adds DEPENDS=gnome-common.
Shouldn't that be gnome-common-native?  It won't make much difference
to the structure of the sysroot as it's allarch already, but it makes
it clear that in this instance it's a build dependency only.

(patch coming)

Ross


