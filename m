Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6gx-0008OL-Es
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:05:11 +0100
Received: by lahd3 with SMTP id d3so1254839lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=29266DO6H0DUGQJSwGWl5dr5MuucudB4iNFP6msj81o=;
	b=S2KNjAFy282Jx/mXsUdNP9VktKMr+oL5wGR0m8BlJqsGOCiL3ljBGT2st3sFlJXVd9
	I+p2G4me/S/zhp5K8pciiTSwZN318OEg0XZm/c5G7mUtxDLS8GBlI1FsZDJJ6t2y5eeB
	kw0advjKoOMnOMskheOp0ccJ+sbYCPInIZrR4=
Received: by 10.152.134.179 with SMTP id pl19mr5877073lab.13.1323460695268;
	Fri, 09 Dec 2011 11:58:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 11:57:44 -0800 (PST)
In-Reply-To: <1323437428.5309.154.camel@ted>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<b3e01cfa4f1561a77b07e3365459e9498d8c4585.1323286080.git.elizabeth.flanagan@intel.com>
	<1323437428.5309.154.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 11:57:44 -0800
Message-ID: <CAMKF1sp3MfaSGpAQMiafWxJw8VEv9_BNNVEpzzYcBQbsxpihdg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] [YOCTO #1776] license: manifest and license path
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
X-List-Received-Date: Fri, 09 Dec 2011 20:05:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 9, 2011 at 5:30 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The above line is a bashism and is breaking builds with dash
> as /bin/sh :(

I thought bashism was too deep in oe. I can certainly revert to using dash if
thats no longer the case.


