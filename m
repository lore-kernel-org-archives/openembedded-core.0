Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QM3xq-0001WO-2I for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 22:00:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GJvXMY023009
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 20:57:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22597-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 20:57:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GJvORB023003
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 20:57:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305563063.2429.65.camel@phil-desktop>
References: <1305563063.2429.65.camel@phil-desktop>
Date: Mon, 16 May 2011 20:57:22 +0100
Message-ID: <1305575842.3424.105.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: LIC_FILES_CHKSUM fatal?
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
X-List-Received-Date: Mon, 16 May 2011 20:00:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 17:24 +0100, Phil Blundell wrote:
> This change, from commit d2d5456cd3b3bd3e52a5dedccca4d46e3a7986d1:
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 225530a..71ed5b6 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -349,7 +349,7 @@ def package_qa_check_license(workdir, d):
>          # just throw a warning now. Once licensing data in entered for enough of the recipes,
>          # this will be converted into error and False will be returned.
>          bb.error(pn + ": Recipe file does not have license file information (LIC_FILES_CHKSUM)")
> -        return True
> +        return False
> 
> means that, contrary to what the comment says, lack of LIC_FILES_CHKSUM
> is now a fatal error.  Was this a deliberate change or an oversight? 
> 

It was a deliberate change, the comment was missed in the change though.

Yes, its annoying and we can have some way to turn it off but for at
least the core, having them present is a good thing.

Cheers,

Richard



