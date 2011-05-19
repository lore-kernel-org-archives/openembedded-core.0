Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QN6bG-0005DE-Pw
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 19:01:31 +0200
Received: by vxd7 with SMTP id 7so2380846vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=czgU/tJDw+mliBCBJY9HPqmrfcFEojRA3mgt19jzu6E=;
	b=wV0rRvqOUVeskTMeiaU7Mw0B4ritdxdsRB+HkYf9nE84gTFGAgS3FGw4ZxXRK24FjI
	qRXEo1bFXo5hgih38kWoggfj38/uJSB8SX45lR1UBMXsJ75ZJS19gRiDinznjW2iyvgD
	Ib21OfIMY5RIT/72mvpEfBJOdSOcPIVIOYWfk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=XTft0jKASIhNZxQJ1gtUXD1sj4XSC1XIqxxPMXpti9WQQZT43+3pQC3H7LXHALgmrF
	uovhpJNQiU+41EG5P/wt7eEBB+HFtK4j38DITMQj+FHVqpGDglUgk/ilkAr8ZSuou6Qd
	ZJ6gj0lFEISnwYX7RpyBuolOT/JeEdaqX4J/8=
Received: by 10.52.32.102 with SMTP id h6mr4791709vdi.34.1305824310436; Thu,
	19 May 2011 09:58:30 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.183.162 with HTTP; Thu, 19 May 2011 09:58:09 -0700 (PDT)
In-Reply-To: <1305804109.3424.475.camel@rex>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
	<1305800103.3424.464.camel@rex>
	<1305801068.18415.179.camel@lenovo.internal.reciva.com>
	<1305804109.3424.475.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 19 May 2011 09:58:09 -0700
X-Google-Sender-Auth: jJgE-Fi9TJGK5wEbac7Frs00v8w
Message-ID: <BANLkTikDXFAMQCs58QL==p+_PEcs_n3=UA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Thu, 19 May 2011 17:01:31 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 19, 2011 at 4:21 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We have these variables and I know Chris has some patches submitted to
> improve our handling of such variables. I'm coming down in favour of
> extending these into some of these use cases too though.

This sounds like a nice idea. The bits I submitted only add support
for package groups as image features, but I always expected us to add
features other than just those in the future. This sounds like a good
candidate for that, indeed.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


