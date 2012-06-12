Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SeRuL-0000AK-54
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 16:17:21 +0200
Received: by eekd49 with SMTP id d49so2406129eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 07:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kzG5/zijlzAme6pD7IUwH/zT21nNUqdDTMaEwkmGdRY=;
	b=x6UN2/g7yWG7ED4QfTXttFyMEJvnngmvn2umA+IiEC6n7YattR7lT8lZBRTzbh+kBW
	rdVl0lvKn1LXWuAQmeEh0J/o/qb6Lm0RwIlyTNWb0BcDeFtNFZtlSbmobPC4WlNCAMM0
	wVDl2jiN0sDcGf51Vxw0xfX6G/iqKn/nekmsZW4n0YKL6g4A3kx266grRFSP+aRmhOWh
	PXRQGmcUdlVfQ7kUoHRFheMkg3LU84I4J96hfYHFSitv4j4v7uWcvkKX/+1w8YpFEmpI
	0JivOd1dvZtcraxJhdxoVeDwMqd7jdKv7f/YK/mz3/9eaycMXXnWfb8YZz+SRK6H4aAm
	TU5g==
Received: by 10.14.187.141 with SMTP id y13mr257295eem.79.1339510006311; Tue,
	12 Jun 2012 07:06:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 12 Jun 2012 07:06:15 -0700 (PDT)
In-Reply-To: <1339508359-6581-1-git-send-email-andrei@gherzan.ro>
References: <1339508359-6581-1-git-send-email-andrei@gherzan.ro>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jun 2012 07:06:15 -0700
Message-ID: <CAMKF1so63e0OB6Q9JzbJQc_4LOqPpHjcugH_0U70bRki3_kfDA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc-package: Reorder PACKAGES to avoid having static libraries in dev
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
X-List-Received-Date: Tue, 12 Jun 2012 14:17:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 12, 2012 at 6:39 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> Move ${PN}-dev at the end of $PACKAGES to avoid having some static libraries
> in dev and let staticdev have those libraries packaged first.

did you compare buildhistory output before and after this patch ?
*_nonshared.a is special e.g. it should not go into staticdev


