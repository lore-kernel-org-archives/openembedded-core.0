Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9C93460702
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jun 2014 08:02:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5T822Bb017422; Sun, 29 Jun 2014 09:02:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Xe4Yww8_5fsB; Sun, 29 Jun 2014 09:02:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5T81x0l017418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 29 Jun 2014 09:02:00 +0100
Message-ID: <1404028912.28648.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Sun, 29 Jun 2014 09:01:52 +0100
In-Reply-To: <20140617140348.GD26745@lpalcu-linux>
References: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
	<20140617140348.GD26745@lpalcu-linux>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate_sdk_base: add auto-completion in setup
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
X-List-Received-Date: Sun, 29 Jun 2014 08:02:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-17 at 17:03 +0300, Laurentiu Palcu wrote:
> On Tue, Jun 17, 2014 at 03:16:53PM +0200, Dennis Meier wrote:
> > Signed-off-by: Dennis Meier <meier.dennis@siemens.com>
> > ---
> >  meta/classes/populate_sdk_base.bbclass |    3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> > index 35d837d..1182425 100644
> > --- a/meta/classes/populate_sdk_base.bbclass
> > +++ b/meta/classes/populate_sdk_base.bbclass
> > @@ -173,9 +173,8 @@ if [ $verbose = 1 ] ; then
> >  	set -x
> >  fi
> >  
> > -printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
> >  if [ "$target_sdk_dir" = "" ]; then
> > -	read target_sdk_dir
> > +	read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
> >  	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
> >  else
> >  	echo "$target_sdk_dir"
> Moving the above printf in the 'if' branch will make this 'echo' look
> strange when the target directory is provided with the -d option... I
> believe you can remove this 'echo' completely though. There is another
> message, later, informing the user where the SDK gets installed.

I've applied a second patch to tweak this, thanks for the review.

Richard


