Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sn4He-0001LT-GP for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 10:53:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q668fwcZ007987
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 09:41:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07892-01 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 09:41:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q668fo25007980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 09:41:51 +0100
Message-ID: <1341564109.3104.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jul 2012 09:41:49 +0100
In-Reply-To: <alpine.DEB.2.02.1207051957500.8240@oneiric>
References: <alpine.DEB.2.02.1207051957500.8240@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: someone broke the bitbake user manual
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
X-List-Received-Date: Fri, 06 Jul 2012 08:53:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-05 at 19:58 -0400, Robert P. J. Day wrote:
> it needs this:
> 
> diff --git a/doc/manual/usermanual.xml b/doc/manual/usermanual.xml
> index 81b301a..e776b43 100644
> --- a/doc/manual/usermanual.xml
> +++ b/doc/manual/usermanual.xml
> @@ -336,7 +336,7 @@ SRC_URI_append_1.0.7+ = "file://some_patch_which_the_new_versions_need.patch;pat
>                  <para>The 'depends' flag for tasks is a more generic form of which allows an interdependency on specific tasks rather than specifying the data in DEPENDS.</para>
>                  <para><screen>do_patch[depends] = "quilt-native:do_populate_staging"</screen></para>
>                  <para>means the do_populate_staging task of the target quilt-native must have completed before the do_patch can execute.</para>
> -                <para>The 'rdepends' flag works in a similar way but takes targets in the runtime namespace instead of the build time dependency namespace.
> +                <para>The 'rdepends' flag works in a similar way but takes targets in the runtime namespace instead of the build time dependency namespace.</para>
>              </section>
>          </section>
> 
> 
> whoever wants to fix it, go wild.

My fault, fixed, thanks.

Richard



