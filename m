Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNopj-0005CG-3E
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 20:24:26 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq13so1565131pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 11:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=gmyLvDtmpr7oRcMLYUWwVHNg+pqmQOzgx+zNcFd6TN0=;
	b=j98XtQzu4pxrjjTLJKsibKKiiUcO12QIgaZ/ybRk5dFjZW29fjpB6YLuQvOTF0q1yi
	UKFWRL6OlQ08UiIFZu8CMcvL/zllqBVvfgSDb6HBjgXN3YNoROXe+WJ4Ov+/RrF8b/Aq
	qv06K1z8odmrAJNiiLL2AKem1XOQz6HdHTOIUOulRpgRuzUp9S0+10rlHS/I7hmkNoLP
	gGZQRu3fYePUQIm+Sh5pI3nGnqxBfdplsDkRhkKtGQYhgQ8ry3LJKy+mGrY1vJ8KGLFd
	Y6DHO/w4ghjGcIPIEkPzBE7M5wILVAeBcgnK/s5DmKzT05lESQl1Ns9auAAXZu8S7TRh
	DNqQ==
X-Received: by 10.68.44.195 with SMTP id g3mr10169908pbm.141.1365098829399;
	Thu, 04 Apr 2013 11:07:09 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id fk1sm11014836pbd.36.2013.04.04.11.07.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 11:07:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1365092291.6526.114.camel@ted>
Date: Thu, 4 Apr 2013 11:07:07 -0700
Message-Id: <248A454E-7AEF-4AFB-9200-EB361D589EF7@gmail.com>
References: <1365077355-17673-1-git-send-email-mihai.prica@intel.com>
	<E88E88F5-90AE-4280-AE38-735E593E6DC6@gmail.com>
	<97BD068FB200C44AA73C2B641F162ECF97E89B@IRSMSX101.ger.corp.intel.com>
	<1365092291.6526.114.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] qemu: Enabled SDL when compiling for target architecture
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
X-List-Received-Date: Thu, 04 Apr 2013 18:24:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 4, 2013, at 9:18 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> I'd ultimately like to see PACKAGECONFIG used here but we haven't
> managed the right patchset yet so I took this one earlier today as a
> short term fix :/.

i think its not a good thing for headless systems as I said earlier =
there are additional packages showing
up on target for no reasons, I could reverse it via a bbappend in my own =
layer but thats not pleasant=


