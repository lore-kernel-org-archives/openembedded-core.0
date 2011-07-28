Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QmNYo-00043K-JV
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 12:11:22 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QmNUj-00030w-HB
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 12:07:09 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 11:07:08 +0100
In-Reply-To: <CAGiJk9fwxUGUbb1Fwf731X+Ujz4RN_3OkXpGHcJq+ER_sYMRQQ@mail.gmail.com>
References: <CAGiJk9fwxUGUbb1Fwf731X+Ujz4RN_3OkXpGHcJq+ER_sYMRQQ@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311847629.30326.428.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Sanity check failed after glibc deletion (was: Re: [PATCH] glibc: deleted)
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
X-List-Received-Date: Thu, 28 Jul 2011 10:11:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm not familiar with oebb.sh or its functionality.  But, from what
you're saying below it sounds as though it works something like
"git-am".  If I'm understanding correctly you used it to apply the glibc
deletion patch, and now you get this sanity failure (whereas you didn't
get it immediately before applying the patch).  Is that right?

I can't think of any reason why deleting the glibc recipes would cause
the 32-bit header check to start failing, and that error certainly isn't
happening for me.  If you revert the patch, does the failure go away?
Have you verified that you really do have gnu/stubs-32.h installed in
the appropriate place?

p.

On Thu, 2011-07-28 at 09:30 +0200, Samuel Stirtzel wrote:
> My current configuration was set up with the help of the Angstrom
> instructions [1], and I applied patches via the "oebb.sh update"
> command.
> Running Bitbake would show the following sanity error on any image / machine:
> 
> samuel@S-Linux:/var/oe-core/setup-scripts$ bitbake console-image
> ERROR:  Poky's config sanity checker detected a potential misconfiguration.
>     Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
> 
>     You have a 32-bit libc, but no 32-bit headers.  You must install
> the 32-bit libc headers.
> 
> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
> 
> 
> For me it looks like an error with my configuration, but on the other
> side, before the update building images with bitbake worked.
> Well I don't know exactly if this is caused by the glibc deletion, but
> IMHO it seems very likely.
> Anyone else faced the same problem?
> 
> Help would be very appreciated.
> 
> Regards
> --Samuel
> 
> [1] http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/README
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




