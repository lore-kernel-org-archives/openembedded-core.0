Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1ScS7N-0005DX-22
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 04:06:33 +0200
Received: from compute6.internal (compute6.nyi.mail.srv.osa [10.202.2.46])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1459120A97;
	Wed,  6 Jun 2012 21:56:07 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute6.internal (MEProxy); Wed, 06 Jun 2012 21:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:content-transfer-encoding
	:mime-version; s=smtpout; bh=0IF+iuhim6D4LtCO3qZPPZaIBFc=; b=JeY
	zO2q/928B9gbCokdES/AJQHXRrnFIyyj5O39PDI+aKxqAY+mhvH5OyfG02x8RYw3
	koQwjwr0A+O3sHncdZ8k2odFIs1B8wuxcCv87sjSLsNq2AfuzrTdjEU0AWDl8viv
	+X+k/e+zNVwyiixaWbRRaFFg/wW9kOTTN1rT+OS4=
X-Sasl-enc: NXmQR+5Ulwhp2CEHep/L3dNI530oxsXXSUEbnldob7eJ 1339034166
Received: from [192.168.1.7] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id BF5EA482515;
	Wed,  6 Jun 2012 21:56:06 -0400 (EDT)
Message-ID: <1339034166.14663.13.camel@meta>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jun 2012 21:56:06 -0400
In-Reply-To: <1337238171-27308-1-git-send-email-Martin.Jansa@gmail.com>
References: <1337238171-27308-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.3 (3.2.3-3.fc16) 
Mime-Version: 1.0
Subject: Re: [RFCv3] glib-2.0: upgrade to 2.32.3
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
X-List-Received-Date: Thu, 07 Jun 2012 02:06:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 09:02 +0200, Martin Jansa wrote:

> +Subject: [PATCH] configure: add option to disable libelf support

Grr...please CC me on GLib patches (and GNOME in general).  In this
case, yes, we should have an option.  

Anyways, there is one issue with this patch; we should be using AS_IF()
apparently.  See
https://bugzilla.gnome.org/show_bug.cgi?id=674483#c9

I fixed this and committed it:
http://git.gnome.org/browse/glib/commit/?id=9e1d4da14d8e69fb60da1a9733ac1d58d0dcd8b2



