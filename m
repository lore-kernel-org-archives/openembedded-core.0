Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3Rsj-0008CR-Dm for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:46:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CcFw2031327
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:38:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30659-09 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 12:38:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22Cc9f5031321
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:38:10 GMT
Message-ID: <1330691892.15224.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 12:38:12 +0000
In-Reply-To: <CALbNGRRKMKQx1ZSzJruX26J2NGYFBYS+Cgp3W2Pk9ETCRtfY+g@mail.gmail.com>
References: <1330547595-11631-1-git-send-email-ynezz@true.cz>
	<1330617040.31767.25.camel@ted>
	<CALbNGRRKMKQx1ZSzJruX26J2NGYFBYS+Cgp3W2Pk9ETCRtfY+g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q22CcFw2031327
Subject: Re: [PATCH] image_types.bbclass: fix link creation failure if the target already exists
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
X-List-Received-Date: Fri, 02 Mar 2012 12:46:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-02 at 13:29 +0100, Andreas M=C3=BCller wrote:
> On Thu, Mar 1, 2012 at 4:50 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2012-02-29 at 21:33 +0100, Petr =C5=A0tetiar wrote:
> >> | ln: failed to create symbolic link `beagleboard/systemd-image-beag=
leboard.tar.bz2': File exists
> >> NOTE: package systemd-image-1.0-r0: task do_rootfs: Failed
> >>
> >> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> >> ---
> >>  meta/classes/image_types.bbclass |    2 +-
> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > Is this still necessary after the recent image_types.bbclass fixes?
> >
> I pulled ~3-4 hours ago and the error persists. I don't know if it is
> important for this problem but I am using opkg and get:
>=20
> | ln: failed to create symbolic link
> `/home/andreas/tmp/oe-core-eglibc/deploy/images/overo/xfce-base-image-o=
vero.tar.bz2':
> File exists
> NOTE: package xfce-base-image-1.0-r0: task do_rootfs: Failed

Could you see what the IMAGE_FSTYPES variable contains please?

(bitbake xfce-base-image -e | grep ^IMAGE_FSTYPES)

The code shouldn't be trying to create this symlink more than once so
whilst I understand the intent of the patch adding -f, I'd like to
understand the root cause of the problem to ensure there isn't some
other issue.

Cheers,

Richard



