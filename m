Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnGlf-0003Ww-Gb
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 23:08:19 +0200
Received: by pzk1 with SMTP id 1so8637346pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 14:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=Aan9Inz31ewy5YXJMpRQeGkU1ydVX64xOHxGTdqBEZw=;
	b=HAmjqorwWdzyzUqESdEUQBFTWOedtgiu6+Qj7OWMnzzgawZeZXRYqe9kTuRfWOuUcM
	xTMPrXQob++uGaMWPWCZgN1u/Z6Ngd/Xfke4Q8accwXPZJ41XDBBJ1kCp0T2YmPzoScX
	PmUqSSpQ+zKIdJqSi7pLZTytgnzVH3K9Ryf5c=
Received: by 10.68.16.197 with SMTP id i5mr4149921pbd.410.1312059840340;
	Sat, 30 Jul 2011 14:04:00 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p7sm3603003pbn.65.2011.07.30.14.03.59
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 14:03:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 14:03:57 -0700
Message-ID: <3203108.rdKDhXfA9V@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <1312051187.3497.9.camel@lenovo.internal.reciva.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
	<9242177.qDpCW2S6UF@perseus>
	<1312051187.3497.9.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] sudo: Drop sudo_cv_uid_t_len from site files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jul 2011 21:08:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, July 30, 2011 07:39:47 PM Phil Blundell wrote:
> On Sat, 2011-07-30 at 10:25 -0700, Khem Raj wrote:
> > On Wednesday, July 27, 2011 03:56:45 PM Tom Rini wrote:
> > > We were just setting this to the assumed default.  If anything, this
> > > belongs in the libc files if we must set it.
> > 
> > uid_t is not a libc controlled define. Its kernel controlled (though
> > kernel- headers)
> 
> No, that's incorrect.  The uid_t that applications see is controlled by
> libc and decoupled from __kernel_uid_t.  There is logic in glibc to
> convert between types if necessary.

uclibc passes on whatever kernel defines it to. rethinking, probably libc is 
ok for it.
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-- 
Khem Raj


