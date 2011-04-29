Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFqL1-0001tR-LC
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 18:14:39 +0200
Received: by ewy5 with SMTP id 5so1208944ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2011 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=B4JPBUGl4wgEbEiidx1vyLeEk8IA/7hn8AEgAllAwcU=;
	b=iTFtPdP8YN+eAcRSLtt4JCr56W8i3eDgRxeh4sRPaoRjwJajH4OzrxCWsv1dTvglpX
	XjHbOW0hAAkLoUnbsfdrPtbt1OKBx1z+WPg5flSNePFPkDVZVDZJQ5blolaIA+YJGXDQ
	58IEzbQOKSFjPTQuNQvcwtAbOmHNBBLRhSVzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=GobJEyPhhzR42rPN30FE8zHY6mikX6q3/3iOFHVZrHSeQ/DsGckqhdqlwVBKM7ImGn
	hpA4yAza5emivY1iHIgUV9hKEeuomdwT4BKB6R8edowflZ0+TbfR3AmoZ78YuC+PKGqA
	zLDhwbbDJf50AWJ+aJ2NnYOK/EzGmdi+JTQvg=
Received: by 10.14.125.4 with SMTP id y4mr2297936eeh.109.1304093526346; Fri,
	29 Apr 2011 09:12:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Fri, 29 Apr 2011 09:11:36 -0700 (PDT)
In-Reply-To: <1303981290.21461.39.camel@rex>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
	<1303981290.21461.39.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Apr 2011 09:11:36 -0700
Message-ID: <BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Antonio Ospite <ospite@studenti.unina.it>,
	Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Fri, 29 Apr 2011 16:14:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 28, 2011 at 2:01 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We can make this simpler. We should just setVar("DEPENDS_GETTEXT", "")
> in the INHIBIT_DEFAULT_DEPS case. If anything is expanding the variables
> somewhere, we should fix that.
>

Infact the virtclass stuff complicates this since they are evaluated
specially and I am not clear weather _append gets
evaluation before that or after and also the anon python function
evaluation as the one we are defining in this class.

I tried to empty out DEPENDS_GETTEXT but it does not work in nativesdk cases.

> In fact, rather than all this ugly manipulation can't we just set
> DEPENDS_GETTEXT to "" in the INHIBIT_DEFAULT_DEPS or USE_NLS cases? If
> that doesn't work, the recipes dependencies are broken and should be
> fixed to inherit this class, right?
>


