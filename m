Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EC28B763A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 22:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1IMsDeM011066; Thu, 18 Feb 2016 22:54:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nUBicbauCgUV; Thu, 18 Feb 2016 22:54:13 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1IMs9Qq011063
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Feb 2016 22:54:10 GMT
Message-ID: <1455836049.28376.99.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Date: Thu, 18 Feb 2016 22:54:09 +0000
In-Reply-To: <CAJ86T=WUd+Zi5feRe4iVShnkj5qdFHTPM42NCthbZc5-RrjcXg@mail.gmail.com>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
	<1455823285-32028-3-git-send-email-armccurdy@gmail.com>
	<CA+chaQcvFnZAjNKCsc3xvPq36zPWXK5xrmi+goTonnu-i4j7sQ@mail.gmail.com>
	<2046956.ogQECgGtmI@peggleto-mobl.ger.corp.intel.com>
	<CAJ86T=WUd+Zi5feRe4iVShnkj5qdFHTPM42NCthbZc5-RrjcXg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libsoup-2.4: disable libsoup-gnome by default
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
X-List-Received-Date: Thu, 18 Feb 2016 22:54:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-02-18 at 13:33 -0800, Andre McCurdy wrote:
> Aside from automated detection of such problems, what's the best fix
> in this particular case?
> 
>   1) Use LEAD_SONAME to force renaming, even in the case when the
> libsoup-2.4 package contains both shared libs.
> 
>   2) Split libsoup-gnome-2.4 into it's own package, so that both
> libsoup-2.4 and libsoup-gnome-2.4 get renamed.
> 
>   3) Use DEBIAN_NOAUTONAME to prevent renaming, even when the
> libsoup-2.4 package only contains one shared lib.

Probably 3) IMO, its what several other packages do.

>   4) Drop the gnome PACKAGECONFIG option so that people can't mess
> with it (in combination with one of the above).

Cheers,

Richard

