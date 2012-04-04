Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1SFYUh-00052Z-Bb
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 00:15:59 +0200
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 4BAE721CE0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2012 15:01:30 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute5.internal (MEProxy); Wed, 04 Apr 2012 15:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:content-transfer-encoding
	:mime-version; s=smtpout; bh=tZgr1f1gM4ftJHVESw3YYVmTX1U=; b=Esf
	/C8lMxyUMNhOiwQ42CxTwltdZL9j9HhCOfLuvMgbaSrp0vaVb3sSGvAbZq/VyH51
	6wGA3lSs9ugYCjtTsqEx/LxmoKfRaEW2OZ3WnNWZsGKMSJf2e5zlgmSl8grdibW4
	vCzrl1G/sM3xlPhWIyZpFbX+RuSpR7zNVsdXMGAI=
X-Sasl-enc: ntG35g+imItdvIDsujjF+kSRBPzxMNDHOm7E4scsQArm 1333566090
Received: from [10.16.189.124] (nat-pool-rdu.redhat.com [66.187.233.202])
	by mail.messagingengine.com (Postfix) with ESMTPSA id F1173482592
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2012 15:01:29 -0400 (EDT)
Message-ID: <1333566060.10230.76.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Apr 2012 15:01:00 -0400
In-Reply-To: <4F7B3EAE.2000301@windriver.com>
References: <4F7B38C7.6010909@mlbassoc.com> <4F7B3B8C.6000200@windriver.com>
	<4F7B3C75.5030200@mlbassoc.com> <4F7B3EAE.2000301@windriver.com>
X-Mailer: Evolution 3.2.3 (3.2.3-1.fc16) 
Mime-Version: 1.0
Subject: Re: Schizophrenic package management
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
X-List-Received-Date: Wed, 04 Apr 2012 22:15:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-03 at 13:17 -0500, Mark Hatle wrote:

> (And RedHat based linux distributions don't have any concept of alternatives. 

True...until about 10 years ago.

    Sun Jan 27 2002 Erik Troan <ewt@redhat.com>
    - reimplemented update-alternatives as just alternatives

http://pkgs.fedoraproject.org/gitweb/?p=chkconfig.git;a=commit;h=e68fd156aa94245e111a50ff4bee31f304b52727




