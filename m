Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CB4D772F44
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 16:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v35GP917021753; 
	Wed, 5 Apr 2017 17:25:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rTKwZ21HEBA6; Wed,  5 Apr 2017 17:25:09 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v35FmrCo018861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Apr 2017 16:48:55 +0100
Message-ID: <1491407333.17200.22.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthew McClintock <msm-oss@mcclintock.net>, Ravi chandra reddy
	<vlsireddy@gmail.com>
Date: Wed, 05 Apr 2017 16:48:53 +0100
In-Reply-To: <CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
	<CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
	<CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe [patch] modification to generate a static library instead of shared library
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
X-List-Received-Date: Wed, 05 Apr 2017 16:25:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-05 at 10:33 -0500, Matthew McClintock wrote:
> On Wed, Apr 5, 2017 at 10:18 AM, Ravi chandra reddy <vlsireddy@gmail.
> com> wrote:
> > 
> > Hi All,
> >           I am using meta-oe to generate libxml2 library using
> > AARCH64
> > compiler. However it generates shared object [.so] library.
> > 
> > is there any setting in recipe to modify this, to generate static
> > library
> > [instead of shared library]
> > 
> > if so, please point me to the recipe/file to change.
> > 
> > if not, i will try to add it as patch, plz point me to appropriate
> > files to
> > change
> Is the ${PN}-staticdev package getting generated for you?

Its possible you have conf/distro/include/no-static-libs.inc included
in your build (bitbake -e would tell you).

If so, you could remove that include or set:

DISABLE_STATIC = ""

as it would currently be set to this if that include file is included:

DISABLE_STATIC = " --disable-static"

We tend not to build static libraries as they're a waste of space/time
on the most part.

Cheers,

Richard

