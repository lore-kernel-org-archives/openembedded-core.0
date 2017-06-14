Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2A502782E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 10:50:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5EAogTY019985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 14 Jun 2017 11:50:43 +0100
Message-ID: <1497437441.3942.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jun 2017 11:50:41 +0100
In-Reply-To: <CANwerB1QqCKneUPuFbjKSNMf++der72-11B_Ad-MzaG+xN2d2w@mail.gmail.com>
References: <20170605235952.16856-1-net147@gmail.com>
	<CANwerB1QqCKneUPuFbjKSNMf++der72-11B_Ad-MzaG+xN2d2w@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 14 Jun 2017 11:50:43 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [pyro][PATCH] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Wed, 14 Jun 2017 10:50:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-06-14 at 20:42 +1000, Jonathan Liu wrote:
> On 6 June 2017 at 09:59, Jonathan Liu <net147@gmail.com> wrote:
> > 
> > If ASSUME_PROVIDES contains libsdl-native, we need to add sdl-
> > config
> > to HOSTTOOLS to allow access to the host sdl-config.
> > 
> > (From OE-Core rev: eeb248c1a017e07e36b6fbaafe45006e3869f41a)
> > 
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/conf/bitbake.conf | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 8e4f4bbb56..3ad905c917 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -471,6 +471,9 @@ HOSTTOOLS += " \
> >  # Tools needed to run testimage runtime image testing
> >  HOSTTOOLS += "ip ping ps scp ssh stty"
> > 
> > +# Link to sdl-config if using host SDL
> > +HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-
> > native', 'sdl-config', '', d)}"
> > +
> >  # Link to these if present
> >  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc
> > sftp socat sudo"

Backported, thanks.

Cheers,

Richard

