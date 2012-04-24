Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SMjwv-0006bL-Hi
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 19:54:49 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 24 Apr 2012 10:44:06 -0700
Received: by lahi5 with SMTP id i5so644861lah.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 10:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=BKPs614EiMpdVq0uxCJESLR8dm4t4r/kTr/AMV/kshc=;
	b=WOSURdsgEnP2Ax4synMANJXjMfFj9Kbm4VbhXxJTWbL+dmkFr9cMONtvBv8NsfE5En
	KXuKlmKJBZ8xHmXwhsDFK61Qz5xW6ikbrpp0bPcf+0dSEaR3I93ZCeBGCEL5iNNKc79o
	mMAhlaxBhUIMQRnF72LU52WTBnfK+MrX85J6rlDpkH/jlb2mkJH44cFyNJp6rC7oLFwk
	TCP1CTNiuw7dNUkWWdoPKCh4u+tkOReJ/ZXO3ahberDdknVwfKstaSCFIsCtk8lnZkRB
	NyjxuWlCFHM+iCNlJXZxnosghOr1ixmCNSkse1aPHJN8L8TQtXCTT+Mfxq1z6F8RyigW
	SdnA==
MIME-Version: 1.0
Received: by 10.112.103.202 with SMTP id fy10mr10095134lbb.43.1335289444002;
	Tue, 24 Apr 2012 10:44:04 -0700 (PDT)
Received: by 10.112.107.137 with HTTP; Tue, 24 Apr 2012 10:44:03 -0700 (PDT)
In-Reply-To: <CAK18fxFXyj7U1RgBSigrED+H6BjJjx3uCcWY2nVONCOULxL+iw@mail.gmail.com>
References: <CAK18fxFXyj7U1RgBSigrED+H6BjJjx3uCcWY2nVONCOULxL+iw@mail.gmail.com>
Date: Tue, 24 Apr 2012 10:44:03 -0700
Message-ID: <CAPhnLPDr2epHUeCjDaeg473mv8cR9jf6gA-BpxT=jU_BDcq3sg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlbUmSMLEWw7PgjnK5JewRA2eE68AzDEC6+LqL8ijb2ag0miu04WwcZ02BkjdmqyHg28D7j
Subject: Re: LICENSE_{X}-xxx is parsed?
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
X-List-Received-Date: Tue, 24 Apr 2012 17:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2012 at 10:25 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> Hello everybody,
>
> Is there any=A0mechanism of parsing LICENSE variables for every provided
> package in a bb file?
>
> To be a little more clear about this.
>
> If i have an app named myapp. Let's say the myapp_1.0.bb includes:
> LICENSE =3D "GPLv3 & LGPLv2.1"
> LICENSE_${PN} =3D LGPLv2.1
> LICENSE_${PN} -tests =3D GPLv3
>
> If this app is not whitelisted, this file will pe ignored (assuming
> INCOMPATIBLE_LICENSE =3D GPLv3) even if the only needed package on the fi=
nal
> fs is the ${PN} package.
>

As you have package level licensing set, it will actually check the
LICENSE_${PN}. See:
bdf2d94c35b7e5ed1723f987696a6c865bff212c Which means it will go and
use the PN level
license to determine if it should be excluded. If no PN level exists
it should fall back to LICENSE

> For files in these case (like gnults) we use right now WHITELIST. In this
> way license=A0checking=A0on those packages is skipped.
>
> If nobody works on this (or this is already done but i couldn't spot it i=
n
> the code) i can dig and propose a way to solve this issue.
>
> @g
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


