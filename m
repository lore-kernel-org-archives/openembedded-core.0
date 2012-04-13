Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SIYmv-0005z9-MZ
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 07:11:13 +0200
Received: by lagw12 with SMTP id w12so2037617lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=mBm0ZZM1H1+Y1rsICL13sVWJcbg0Ub2AiPHBD8YbipI=;
	b=EfWSRXCC2oHD4IIq0/9z8UvXVAIQh9RDGV1gl+g5H5DS6zhvhfrQuR1UBHuMjqZoFK
	8QYp1cC6UaksxtRsjFwikKhD6C8pyOfBEgaAIPHpuuk4yNHbLHzi3zmsLM1e58WQ0U9r
	BWznwbgqDJFQsarEmezsZjJbvbg/9NdDmiFNm4wEl+A0x+o6NyywQLklze2B3YZqYXsf
	UHRMlt08/ui6JpF8hEvkcTJ6SgQmGbO9DWFgSnN8yYZ9MCwxQ9z/0runzaAA4qqnsXz/
	Ti4iZa5jRhfmzp1wLGXfTBnAumRXvW2qRTcNX1ck3cpQNymSynM86WNeDP6INyW1SzFM
	XFqQ==
Received: by 10.112.83.105 with SMTP id p9mr127666lby.43.1334293312608; Thu,
	12 Apr 2012 22:01:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 12 Apr 2012 22:01:22 -0700 (PDT)
In-Reply-To: <521759489c1e0af1ab878926ea0df290054139eb.1334292091.git.nitin.a.kamble@intel.com>
References: <cover.1334292091.git.nitin.a.kamble@intel.com>
	<521759489c1e0af1ab878926ea0df290054139eb.1334292091.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Apr 2012 22:01:22 -0700
Message-ID: <CAMKF1sogxc05rGipJTrQ=Nu2HJ3Hx0FPTonwvZr+JEa_-ZNGEw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] eglibc: fix perl path in target scripts on fedora 17 alpha
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
X-List-Received-Date: Fri, 13 Apr 2012 05:11:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 9:43 PM,  <nitin.a.kamble@intel.com> wrote:
>
> fedora 17 has /usr/bin/perl as well as /bin/perl, which results in
> =C2=A0the perl path set in thetarget =C2=A0perl scripts as /bin/perl
> While we install perl on target at ${bindir}/perl i.e. /usr/bin/perl
> Hence the target perl scripts are broken when build is done on fedora 17.
> Work around the issue by providing cached value of perl path to eglibc

is this issue in eglibc-nativesdk ?


