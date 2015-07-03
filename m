Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id D659075D17
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 08:27:21 +0000 (UTC)
Received: by oigx81 with SMTP id x81so73564246oig.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 01:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=Bu+S1woAOs8gEpboj0odhF+UQ4RPjiDVyO83d3SlBJ4=;
	b=T6Fo0OiHm4WIM1pjGJfzM7rsNqh/yuAxXRW8VCUhgKG3l38xiM3R39USaSAFfMV1m5
	kd4Z4y0a6hvzkHCcRXH44wH8EF4XWVcO33CLmPH3qxR7wnkjIkzXChXzKFYqsf+uHY68
	SylIKA/pZEogVY1m4gaSTtG/6hWSSRyw/TjMlqOHQdzCGUpHaVqImlbqPKiPVEU2iCc+
	Q3kbh6sbk7QLXjp24nH7dMGePUfvgLvHhKmIGPjH5MyDwAryK64Z6AnTDBUT7x9ZjKL1
	w9Zrf6r14lgcLjxGd8T3GKSvaNSl6j6aKqFMFrBtxtLGDe/+Jjv3Ezh4uluOvySAZW5Z
	+Qsg==
X-Gm-Message-State: ALoCoQlXBKtU03SGx3okgMQALj0PayK0D6aLOOQD3dTSDJKJLK5NHZ6R++/ZsXkFIHljg2Wun+FD
X-Received: by 10.202.0.212 with SMTP id 203mr26709446oia.58.1435912041348;
	Fri, 03 Jul 2015 01:27:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Fri, 3 Jul 2015 01:26:51 -0700 (PDT)
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836@deeres07.ebgroup.elektrobit.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 3 Jul 2015 11:26:51 +0300
Message-ID: <CAHiDW_FZoQudwPMdV-zTF-SZ2OVoAjNXuoYY8vUTkSQfoMXDtQ@mail.gmail.com>
To: Steffen.Pankratz@elektrobit.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Upgrade to 2.4.62
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
X-List-Received-Date: Fri, 03 Jul 2015 08:27:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3 July 2015 at 11:11,  <Steffen.Pankratz@elektrobit.com> wrote:
> Hi,
>
> attached you can find a patch to upgrade libdrm to version 2.4.62.

Thanks Steffen. Could you resend the patch inline and not as an attachment?

 - Jussi


> I added a temporary workaround, as Valgrind support is enabled by default=
 currently,
> this was already fixed upstream for the next version.
>
>
> Regards
> -Steffen
>
> --
> Steffen Pankratz
> Expert, Software Integration & Services
>
> EB - Driving the Future of Software
> Phone:  +49 9131 7701-6605
> Fax: +49 9131 7701 6333
> steffen.pankratz@elektrobit.com
> http://automotive.elektrobit.com/
> PGP-Key: http://keyserver.elektrobit.com/
>
> Elektrobit Automotive GmbH, Am Wolfsmantel 46, 91058 Erlangen, Germany
> Managing Directors Alexander Kocher, Gregor Zink
> Register Court F=C3=BCrth HRB 488
>
>
>
>
> ----------------------------------------------------------------
> Please note: This e-mail may contain confidential information
> intended solely for the addressee. If you have received this
> e-mail in error, please do not disclose it to anyone, notify
> the sender promptly, and delete the message from your system.
> Thank you.
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

