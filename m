Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3Spw-0003lk-Ae for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 14:47:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22DdPJ3032200
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 13:39:25 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31378-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 13:39:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22DdGHD032188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 13:39:17 GMT
Message-ID: <1330695560.309.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 13:39:20 +0000
In-Reply-To: <3707B894-6275-45C8-B2A3-37263D2C9B1C@dominion.thruhere.net>
References: <cover.1330684260.git.liezhi.yang@windriver.com>
	<81a428ea0e7515ab09e707fbdaba9b1a1b5050b6.1330684260.git.liezhi.yang@windriver.com>
	<1330694798.18076.3.camel@ted>
	<3707B894-6275-45C8-B2A3-37263D2C9B1C@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] V2 Fix libpam's chmod
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
X-List-Received-Date: Fri, 02 Mar 2012 13:47:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-02 at 14:31 +0100, Koen Kooi wrote:
> Op 2 mrt. 2012, om 14:26 heeft Richard Purdie het volgende geschreven:
> 
> > On Fri, 2012-03-02 at 18:34 +0800, Robert Yang wrote:
> >> The libpam's has an error when generating the rootfs:
> >> 
> >> chmod: cannot access `/usr/sbin/unix_chkpwd': No such file or directory
> >> 
> >> This is because the following code in libpam_1.1.5.bb:
> >> 
> >> pkg_postinst_pam-plugin-unix () {
> >>    # below is necessary to allow unix_chkpwd get user info from shadow file
> >>    # on lsb images
> >>    chmod 4755 ${sbindir}/unix_chkpwd
> >> }
> >> 
> >> This is to set the setuid permission for unix_chkpwd (the lsb test
> >> requires this), but it lacks a "${D}", and we can do this in the install
> >> stage.
> >> 
> >> [YOCTO #2049]
> >> 
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > 
> > Robert, in future patches could you use a subject line like:
> > 
> > [PATCH 1/1 v2] Fix libpam's chmod
> > 
> > instead of:
> > 
> > [PATCH 1/1] V2 Fix libpam's chmod
> > 
> > so that when the patches get applied, the V2 is stripped off?
> > 
> > The reason is that the value isn't particularly within the repository
> > once merged and doesn't look good when looking through commit history.
> 
> Actually both versions above are wrong, the right version would be similar to:
> 
> libpam 1.1.5: fix chmod in postinst
> 
> We can debate the usefulness of the version specifier, but we do need to follow the commit guide for the rest.

Good point, I was just commenting that the patch version specifier
didn't look good. As you say, the package name should be first too, as
per http://wiki.openembedded.org/wiki/Commit_Patch_Message_Guidelines
under Common Errors in Patch and Commit Messages: '- Short log does not
start with the file or component being modified. Such as "foo: Update to
new upstream version 5.8.9"'.

If I was going to be picky, I'd suggest capitalisation of "fix" in your
version ;-)

Cheers,

Richard



