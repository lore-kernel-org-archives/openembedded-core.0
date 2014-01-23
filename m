Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 99C326B05F
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 15:01:26 +0000 (UTC)
Received: from [12.157.112.67] (helo=[10.71.2.210])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W6LmX-0003Bo-OT; Thu, 23 Jan 2014 16:01:27 +0100
Message-ID: <1390489278.24755.16.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 23 Jan 2014 15:01:18 +0000
In-Reply-To: <1390487566-13569-2-git-send-email-jason.wessel@windriver.com>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
	<1390487566-13569-2-git-send-email-jason.wessel@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Thu, 2014-01-23 at 08:32 -0600,
	Jason Wessel wrote: > +++
	b/meta/files/common-licenses/unfs3 > @@ -0, 0 +1,
	24 @@ > +UNFS3 user-space
	NFSv3 server > +(C) 2003, Pascal Schmidt <unfs3-server@ewetel.net> > + >
	+Redistribution and use in source and binary forms,
	with or without > +modification, 
	are permitted provided that the following conditions are met: > + > +1.
	Redistributions
	of source code must retain the above copyright notice,
	> + this list of conditions
	and the following disclaimer. > +2. Redistributions in binary form must
	reproduce the above copyright notice,
	> + this list of conditions and the following
	disclaimer in the documentation > + and/or other materials provided
	with
	the distribution. > +3. The name of the author may not be used to
	endorse
	or promote products > + derived from this software without specific
	prior written permission. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] unfs3: Add a NFSv3 user mode server for use with runqemu
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
X-List-Received-Date: Thu, 23 Jan 2014 15:01:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-23 at 08:32 -0600, Jason Wessel wrote:
> +++ b/meta/files/common-licenses/unfs3
> @@ -0,0 +1,24 @@
> +UNFS3 user-space NFSv3 server
> +(C) 2003, Pascal Schmidt <unfs3-server@ewetel.net>
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions are met:
> +
> +1. Redistributions of source code must retain the above copyright notice,
> +   this list of conditions and the following disclaimer.
> +2. Redistributions in binary form must reproduce the above copyright notice,
> +   this list of conditions and the following disclaimer in the documentation
> +   and/or other materials provided with the distribution.
> +3. The name of the author may not be used to endorse or promote products
> +   derived from this software without specific prior written permission.

Isn't this just the 3-clause BSD licence?

>--- /dev/null
>+++ b/meta/recipes-devtools/unfs3/unfs3/alternate_rpc_ports.patch
>@@ -0,0 +1,158 @@
>+Add ability to specify rcp port numbers
>+
>+In order to run more than one unfs server on a host system, you must
>+be able to specify alternate rpc port numbers.
>+
>+Jason Wessel <jason.wessel@windriver.com>
>+
>+Upstream-Status: Pending

I think you said in the cover letter that the patches had been sent
upstream.  If that's the case then it should be Upstream-Status:
Submitted.

>+RDEPENDS_${PN} = "pseudo"
>+RDEPENDS_${PN}_class-native = "pseudo-native"
>+RDEPENDS_${PN}_class-nativesdk = "pseudo-nativesdk"

That looks a bit odd.  Are the latter two lines doing anything very
useful?

>+# This recipe is intended for -native and -nativesdk builds only,
>+# not target installs:

Why?  If this is really the case, shouldn't it be named unfs3-native in
the first place?

p.



