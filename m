Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S37I0-0007AA-E6
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 15:47:28 +0100
Received: by lagw12 with SMTP id w12so824315lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 06:38:58 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.152.110.6 as permitted sender)
	client-ip=10.152.110.6; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.152.110.6 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.152.110.6])
	by 10.152.110.6 with SMTP id hw6mr4898132lab.8.1330612738703 (num_hops
	= 1); Thu, 01 Mar 2012 06:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6l+iUIU9Tnk80DImYJPjMCOUyJTZZBHaZ5drNvwHqd8=;
	b=dfbUBBVPRPjegpOSVKORDlxp3fWH5jgGMPVOkjLiG3G8MqdtV0iQ2T3K0BmOYMpzh/
	5oAvGlu7foo0e+gJVz1RGz/EvGfjvhRQihYszrPmQBbjT58Df8DZYCOa7IUT7cbhFaRD
	Ooo03kaVBbeYPKYfBXkGIMrW2klyIc0PijF9I=
MIME-Version: 1.0
Received: by 10.152.110.6 with SMTP id hw6mr3998739lab.8.1330612738626; Thu,
	01 Mar 2012 06:38:58 -0800 (PST)
Received: by 10.112.29.74 with HTTP; Thu, 1 Mar 2012 06:38:58 -0800 (PST)
In-Reply-To: <13179298.lVtZb3KUcf@helios>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
	<FA3D8228-A311-4588-90C8-0A12F89723AC@dominion.thruhere.net>
	<CALbNGRQBCeQj=0dHAwAddM5cvJZhKLzyk8J5+WLAh7QFQBx_rg@mail.gmail.com>
	<13179298.lVtZb3KUcf@helios>
Date: Thu, 1 Mar 2012 15:38:58 +0100
Message-ID: <CALbNGRS9k8Qu6O_gZgTFd6peYcwzHPn7ddzf-8PfNKb_OaHGyA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [oe] Buildhistory, was Re: do rootfs does not create log files
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
X-List-Received-Date: Thu, 01 Mar 2012 14:47:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 1, 2012 at 3:31 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 01 March 2012 13:38:04 Andreas M=FCller wrote:
>> Would it be big effort to have the package scripts (pre-/postinst,
>> postrm) handled by buildhistory?
>
> Do you mean you would like the contents of the scripts recorded in
> buildhistory?
Yes that's what I meant :)
> If so, I guess this is possible; if we just output each script
> to a separate file I don't think it should be too difficult. Making it wo=
rk
> nicely if you switch back to the old (symlinked) mode would be an extra t=
rick,
> though I'm starting to wonder if that's worth continuing to support.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


