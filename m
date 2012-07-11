Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1Sp58c-0007w6-2H
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 00:12:02 +0200
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 7278220FB0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 18:00:51 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute6.internal (MEProxy); Wed, 11 Jul 2012 18:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=7dHLY4saDM/aqsBRj1rvEp
	XzL+w=; b=aumzDHRXovT3bWAq7zdkQF9Ksu9+twomAODYY1SCSXUp4XmVUjxVC/
	sSNR3/5UKFpZeUV+8ZnI5CyOdGcVeI5kI7aoGDs5gNpZ3gysumg6KmJ95QceSREE
	3naGa7DWCOmWF/7/ijCT5rwkFI5maL+kP2GG9ApjphWN4HohgzqdY=
X-Sasl-enc: ZtRc5HTLgkABDk4BJiZHM9SEJcFEwcU5lFp3dhwQkin7 1342044051
Received: from [10.16.189.124] (unknown [66.187.233.206])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2449E4825B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 18:00:51 -0400 (EDT)
Message-ID: <1342044016.4095.45.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 18:00:16 -0400
In-Reply-To: <1342021183-30173-1-git-send-email-ross.burton@intel.com>
References: <1342021183-30173-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.4.3 (3.4.3-1.fc17) 
Mime-Version: 1.0
Subject: Re: [PATCH] connman: fix build with automake 1.12
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
X-List-Received-Date: Wed, 11 Jul 2012 22:12:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 16:39 +0100, Ross Burton wrote:

> +	# Automake 1.12 won't install empty directories, but we need the
> +	# plugins directory to be present for ownership
> +	mkdir -p ${D}${libdir}/connman/plugins
>  }

Did you consider patching upstream to do this in install-data-local
rule?  That way everyone gets the fix (Debian/Gentoo/Fedora etc.), not
just you.





