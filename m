Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnB8H-0001Wx-UW
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 18:11:49 +0200
Received: by eaal1 with SMTP id l1so3573469eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2012 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=X3FjSFY9k57KxXtUIVIV+XhW6joPv085BFI0yGQykj4=;
	b=M4sSqaVARxV8LO1t3e9iwsBjzOGWvU6cYnAiEYmSSFIWjZNCX/Jp8b80OAEptN5B4Y
	SIt/T3UIZQMZ4dRVLV0mR47VnFJtk4+u0v57zUaTTsFbx+Yz+PTzobQqS76Ye+FA+Z8O
	iF2vsQlie+QmgjjNBRzgTCBQMEWzHIC2jxedBJ742/uf34N10NKBX6M90PVgTbVb0EV/
	5vRQ9dO4EA59Pf63V44SdE8T1NXfj49JD7QAlRZDiCanIk4kh3SbtE3WEWXPxNKIpvl0
	rkVM0yY8o9R+5xXxZpCgzojRZ+Jjtsul9exU8bphGGEFLJrY4PdwTj660UBvmLc1Y0w/
	XibA==
Received: by 10.14.99.201 with SMTP id x49mr5824531eef.142.1341590444315; Fri,
	06 Jul 2012 09:00:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 6 Jul 2012 09:00:14 -0700 (PDT)
In-Reply-To: <1341564942.3104.3.camel@ted>
References: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
	<4FF453EC.8030007@linux.intel.com> <1341413143.3906.31.camel@ted>
	<CAJ2CSBuRsmRDCaj5oY8xToURc3GkCJzRj8y6auzTUxA32AZBMQ@mail.gmail.com>
	<1341414137.3906.33.camel@ted>
	<CAJ2CSBtESa4NVB1YF_VSN3BOj-n8NipPN7krkuLHH-nRdEVfcg@mail.gmail.com>
	<20120704152111.GB15100@jama.jama.net>
	<CAJ2CSBvQJtFPBXf-QEVm7bO84W4_K2ziYAOR=1kiQfENyK_D_Q@mail.gmail.com>
	<4FF5F32C.7080905@gmail.com> <1341564942.3104.3.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2012 09:00:14 -0700
Message-ID: <CAMKF1so=LN+cXK37B9Eu1msE-kmVUJDkSzvcCLm9jSFNDaZM_w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc errors while building core-image-sato-sdk
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
X-List-Received-Date: Fri, 06 Jul 2012 16:11:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 6, 2012 at 1:55 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I merged a couple of gcc changes fairly quickly to address a variety of
> problems people started hitting (including the autobuilder). The svn
> nature of the recipe is causing a few issues with the subversion 1.7
> change. I am wondering if we should just point it to the svn checkout
> tarball by default and leave the svn url for use when updating only and
> populating the mirror?

or we can use git instead of svn. http://gcc.gnu.org/git/?p=gcc.git


