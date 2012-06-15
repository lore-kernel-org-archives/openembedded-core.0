Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SfWPI-0003Ac-Tq
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 15:17:44 +0200
Received: by wibhm14 with SMTP id hm14so513465wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 06:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=iiiuIYgwkDAH9tN8DOHUR8Y7rar7woyxcfrSJAB3r0Q=;
	b=c3XUteE1YFcEkuqAV9M7xdg0DaJPMAH2GoG5g1n+z38zKDBi1xlvW/UF80Yb9Nb4RQ
	CEt0sdvfvp5IasYLZTo8CUJ0QU9adwbg6sH/FHuTPpAeOKvslXUbYkmFMWtvTrf6ZAjq
	2H2PPo4faXoRJz1JdCx8cfqTZ2B/+7ISfJAFOBHk/VVqogJVMCGpf2R5y3LRPh58/30C
	+8JXlkFigHB55F9St8DxlFrvrfam5IqefjKrkSjb1Z0q5xsO2D341gxVPV/bvKhIzjxs
	112Wg9GmZZV6AdUz8T431IcXnsrKGJQSuVMzlyuaWdj0K2tI0CO/uk30ciQyd42MhLno
	xVyA==
MIME-Version: 1.0
Received: by 10.180.7.133 with SMTP id j5mr4452067wia.14.1339765626465; Fri,
	15 Jun 2012 06:07:06 -0700 (PDT)
Received: by 10.216.234.92 with HTTP; Fri, 15 Jun 2012 06:07:06 -0700 (PDT)
In-Reply-To: <c49e7e2915d4ade3dd67f706f12b3979a3b5c021.1339740433.git.raj.khem@gmail.com>
References: <cover.1339740433.git.raj.khem@gmail.com>
	<1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
	<c49e7e2915d4ade3dd67f706f12b3979a3b5c021.1339740433.git.raj.khem@gmail.com>
Date: Fri, 15 Jun 2012 15:07:06 +0200
Message-ID: <CAC1BbcQqpnWqzDbfpz=VCpxUDQPtgWU63Uvi8KFpxgcxXNwt7g@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/9] sat-solver: Fix build on uclibc
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
X-List-Received-Date: Fri, 15 Jun 2012 13:17:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 15 June 2012 08:12, Khem Raj <raj.khem@gmail.com> wrote:
> futimes is not available on uclibc so use utimes

futimes is non-standard, use futimens instead (or utimes as in this case).

> qsort is also not as expected by sat-solver therefore
> for uclibc we resort to using internal version of
> qsort

What does that mean, please elaborate? uClibc does have qsort{,_r}..

thanks,


