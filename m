Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9797566F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 21:46:52 +0000 (UTC)
Received: by oiww2 with SMTP id w2so88683882oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 14:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5Ym2GOpaiWUIhkjNAPxor/2pvpqjoqG13Um8sRGH75A=;
	b=HgesLpHMemvYvNZYqKXG0X/zxgL/1B9tjh+eRnYQIddSpaxwJ/5IX+RfQb9XwGle/C
	i5lz3yxyHlRvBCa2Bm1Oso0cBPnBPPtfREj0ITmHd+yY4icUeBAX4+XlHAb7CWyYufaO
	vYzSP69M5pD7m7JLCjNxWYSBehuXvgcIQY6v/2ODNzFmtjCt4mTEQDy9ivLSbI5JnF4g
	DikZAbvgU9dJ9Q7miP0non+XA5FCRJPckX+SSoIKuFjQObTQ+/wfrYcDljv6wJvw9VVO
	nIsYd+fDmOLnCmXDklQtYGidLKj94c/PVxHsUWRed8bWthpcpfSmYllEY3ARYmtfB84R
	k2Wg==
MIME-Version: 1.0
X-Received: by 10.202.94.215 with SMTP id s206mr22278430oib.15.1432676813236; 
	Tue, 26 May 2015 14:46:53 -0700 (PDT)
Received: by 10.202.44.23 with HTTP; Tue, 26 May 2015 14:46:53 -0700 (PDT)
In-Reply-To: <CAJTo0LZmhhLMVRhHkpQxA0WGhhrA5CZ-G1VHrK31=XSzjiEmZQ@mail.gmail.com>
References: <1432344088-10846-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LZmhhLMVRhHkpQxA0WGhhrA5CZ-G1VHrK31=XSzjiEmZQ@mail.gmail.com>
Date: Tue, 26 May 2015 14:46:53 -0700
Message-ID: <CAJ86T=UnK-HkAKk3L1yxeMsK-MMtj6NGve+6acdMK7JBC0KN0g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnu-config: improve detection of perl setup errors
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
X-List-Received-Date: Tue, 26 May 2015 21:46:58 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 26, 2015 at 7:46 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 23 May 2015 at 02:21, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Warning: This patch causes building of some packages to fail if OE and
>> host perl versions differ, so should not be merged until those issues
>> are resolved. To reproduce the current issues:
>>
>>   - Use a host with perl 5.18 (e.g. Ubuntu 14.04)
>>   - Apply this patch to oe-core master or fido
>>   - bitbake -fc configure intltool
>
>
> Does this caveat apply to minor perl versions too?  This patch causes
> gcc-source to break when it runs gnu-configize on my Debian machine (perl
> 5.20.2, OE has 5.20.0).

I don't think so. I see the gcc-source error now too and it seems to
be a different case of a pre-existing failure from "autoconf --trace"
which is made visible by the patch.

Running the "autoconf --trace" command manually for gcc-source gives the error:

 | configure.ac:34: error: Please use exactly Autoconf 2.64 instead of 2.69.
 | config/override.m4:12: _GCC_AUTOCONF_VERSION_CHECK is expanded from...
 | configure.ac:34: the top level
 | autom4te: m4 failed with exit status: 1


> Ross

