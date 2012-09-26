Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TGsaT-0002pt-2k
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:27:41 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 8CA7F20D2D;
	Wed, 26 Sep 2012 10:14:52 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute3.internal (MEProxy); Wed, 26 Sep 2012 10:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=3Y1D4W+8OqYfvtL9P+0wOH
	Yh2U0=; b=VFnjLZHQFpNCVNdH/atr02W/INnM5PIPwweVhwUb7UFInAThf7A4AW
	L4URlR3mZP1c+IfLoe/nA6ntlPuxG59jb9qyB+J2ti3YWHAFWkZkUWfOrt3cm5PY
	I7udAbGuOvhjtZ5C6zabE8g7K5cJIvhSb3mH1tJHI/WhXg3YtE4KQ=
X-Sasl-enc: TnWW+BxTEEH/CERvVNr2IPvEGOpCYJceUfUHduXqX3fh 1348668892
Received: from [10.193.23.134] (unknown [66.187.233.203])
	by mail.messagingengine.com (Postfix) with ESMTPA id 26851482624;
	Wed, 26 Sep 2012 10:14:52 -0400 (EDT)
Message-ID: <1348668853.7240.5.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Phil Blundell <philb@gnu.org>
Date: Wed, 26 Sep 2012 10:14:13 -0400
In-Reply-To: <1348668794.7240.4.camel@lenny>
References: <1348661842.31293.108.camel@phil-desktop>
	<1348668794.7240.4.camel@lenny>
X-Mailer: Evolution 3.4.4 (3.4.4-1.fc17) 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Update to 2.34.0
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
X-List-Received-Date: Wed, 26 Sep 2012 14:27:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 10:13 -0400, Colin Walters wrote:
> On Wed, 2012-09-26 at 13:17 +0100, Phil Blundell wrote:
> 
> >  meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch   |   34 ++++++++--------
> 
> This should not be necessary anymore; see:

http://git.gnome.org/browse/glib/commit/?id=f084b603771f78126bc0b07229a1574b76e776bb



