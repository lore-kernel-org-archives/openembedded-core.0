Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UBZ3E-0000g6-H3
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 00:07:41 +0100
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 3101420A2C;
	Fri,  1 Mar 2013 17:45:58 -0500 (EST)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute3.internal (MEProxy); Fri, 01 Mar 2013 17:45:58 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=teQMGZC/LuC/SHocyc7TdB
	qHtcY=; b=sa0sXOYfsTgQx/M4RO8WdidmSSXg/Td4skokA5r3DWvnKOl5XoDTFb
	HChvvNqR7MAMTkqOeV0L02g4ZCsjK2d4cLRL6FmVCk3ll4RE7EViFFlVCjuVrR1O
	TTFTfHAHcEogjlsZIjcLr9oMKviW9lkjDKr7HKG7ptzgwT89VO8uA=
X-Sasl-enc: /cbUyD6vvReFmgjdrJflfKlY4QO1wutQFfOFrKX6MlV7 1362177957
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id BCD48C80E8B;
	Fri,  1 Mar 2013 17:45:57 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1362085289.5119.119.camel@ted>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
	<4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
	<512EDDE0.2060907@linux.intel.com> <1362026705.2588.33.camel@empanada>
	<512FA8B6.4030909@linux.intel.com> <1362080697.2588.75.camel@empanada>
	<1362085289.5119.119.camel@ted>
Date: Fri, 01 Mar 2013 17:45:56 -0500
Message-ID: <1362177956.3782.6.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libaudit: new package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 23:07:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-02-28 at 21:01 +0000, Richard Purdie wrote:

> We fixed some issues in mesa-dri and gtk+ using techniques with these
> variables (all of which are now upstream in the appropriate sources).

For reference here's the gtk+ work he landed upstream:

https://bugzilla.gnome.org/show_bug.cgi?id=691301




