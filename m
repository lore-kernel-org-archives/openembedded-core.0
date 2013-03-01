Received: from mail-ve0-f178.google.com ([209.85.128.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UBNYu-0004YK-9t
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 11:51:51 +0100
Received: by mail-ve0-f178.google.com with SMTP id db10so2749138veb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 02:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=Wuy1YCSNVUxpKRu9OgICm0bKTFjMP2noDJcgJUf6V9U=;
	b=AmCnbDYqatxRcu45UfRT/wy7v0rmclXEP/0aRjHnGEem8iQjbxJurq3u72t4Y2JwT+
	p0Bd7QFimbhVNv5JgUSFS2tmgULxFDX5UtHRnRx+nlO+3/FCjF9kWOxVL//+ghOxg5RJ
	T4SJreNDJ7hE9LSMaYXLQFHCvtdCpBCXShnF9I0kwNuUrgOHa6mxwWolOtT9JUY6nUiT
	WLt+zvkba/VsJqeZm22JnXdA3Kd01rWRIFtaiCJ5cGC9QORus8TjcfnGIPjiT9sqhZ42
	X67XSawpukAvYuQpnAma+pQPEmYg0gTjewAYFKt+m0oWyFjY9nlmKSJ0m+ygZFSbF/S6
	2M0g==
X-Received: by 10.52.69.74 with SMTP id c10mr3392571vdu.3.1362134112067; Fri,
	01 Mar 2013 02:35:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Fri, 1 Mar 2013 02:34:51 -0800 (PST)
In-Reply-To: <20130301091804.GF3279@jama>
References: <cover.1362003285.git.sgw@linux.intel.com>
	<1362093308.1055.4.camel@ted>
	<20130228234226.GC3279@jama> <1362097609.1055.35.camel@ted>
	<20130301091804.GF3279@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 10:34:51 +0000
Message-ID: <CAJTo0LaUrnbH1a+pCR8NgRK5VOu=vzigMxT=gZcbfyEd-BC2Wg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQliUgBVm8Pn91V9Xo28j9IcA8yWVa2nIH6Ulo6MyHx/O8XwHbOa9mYgSu2G2cAtkGw4coy+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/40] Post-ELC Patches and Updates
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
X-List-Received-Date: Fri, 01 Mar 2013 10:51:59 -0000
Content-Type: text/plain; charset=UTF-8

On 1 March 2013 09:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> I'm not using poky as DISTRO and don't have access to most of those
> distros to check lsb_release output.
>
> I'm sure about Ubuntu where it's easy:
>             Ubuntu-10.04 \n \
>             Ubuntu-11.10 \n \
>             Ubuntu-12.04 \n \
>             Ubuntu-12.10 \n \
> but with others I'll need some help.

This is what lsb_release -a says on Debian unstable in it's
soon-to-be-released state:

$ lsb_release -a
No LSB modules are available.
Distributor ID:	Debian
Description:	Debian GNU/Linux 7.0 (wheezy)
Release:	7.0
Codename:	wheezy

So that's "Debian-7.0".

On Fedora 17:
$ lsb_release -a
LSB Version:	:core-4.1-ia32:core-4.1-noarch:cxx-4.1-ia32:cxx-4.1-noarchesktop-4.1-ia32esktop-4.1-noarch:languages-4.1-ia32:languages-4.1-noarchrinting-4.1-ia32rinting-4.1-noarch
Distributor ID:	Fedora
Description:	Fedora release 17 (Beefy Miracle)
Release:	17
Codename:	BeefyMiracle

So "Fedora-17".

Ross


