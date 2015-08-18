Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B54FE767D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 16:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7IGZ4eg019313; Tue, 18 Aug 2015 17:36:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CXZP5h87z5Gq; Tue, 18 Aug 2015 17:36:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7IGaDlf019335
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 18 Aug 2015 17:36:24 +0100
Message-ID: <1439915773.12105.128.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Tue, 18 Aug 2015 17:36:13 +0100
In-Reply-To: <CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
	<CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Aug 2015 16:36:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-18 at 09:00 -0700, Christopher Larson wrote:
> On Tue, Aug 18, 2015 at 8:53 AM, Christopher Larson
> <clarson@kergoth.com> wrote:
>         Bringing this back up again, as I think we really need to at
>         the *very* least pull in iw from meta-oe into oe-core, and
>         adjust packagegroup-base (worst case, with a VIRTUAL-RUNTIME),
>         and better yet also drop wireless-tools / move it to
>         meta-networking.
> 
> Worst case, we could keep both in VIRTUAL-RUNTIME for compatibility,
> as a temporary measure, but I think we need to get iw into oe-core and
> into the base images for sure.

Agreed, patches would be welcome!

Cheers,

Richard



