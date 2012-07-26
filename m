Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SuWOV-00066D-6e
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 00:18:55 +0200
Received: by lbol5 with SMTP id l5so1611778lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 15:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=qm0kyY3gf7xcm74z77t5/IF7Juusb5ib0Bk7ggstIHo=;
	b=v8BeyKnr4zJMD1TxfgyOMOUr8aw5kVgmywmmy3+7CLsdybz2k1/mYp8dv/EMFZ25zn
	Bgt0pXX3n8C2/1kwiKaq3sXPQv8FsT+czqa6avKqCsUydIuWZU2YiiNzTs0l5qpKpBO2
	a3e8dYkpMm51OoQ9sLjyrlFCp7OkxyxkQ5DsL5YFirmr1gMnszh6ul0wrAkjiJTXPpLp
	RdNthF5i/GFcVEf35N4yLeMw/6Z/BSr/tw+r83CsjLAoq6khXmNI6mD6sxo2dx/OTljJ
	ltgvX02zQtUYrNqZH+QTEef3wd+LmUSEwh0nM8ulWa/UAjrYWT7ajkUiSyCYHdFZqmhD
	wt+A==
Received: by 10.112.85.225 with SMTP id k1mr407903lbz.38.1343340443905; Thu,
	26 Jul 2012 15:07:23 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Thu, 26 Jul 2012 15:07:03 -0700 (PDT)
In-Reply-To: <CAKSdS8LwF4XvBcuAoJ=36tOMMGF=VRLPoar5Tp9dCf+69JtiOw@mail.gmail.com>
References: <CAKSdS8LwF4XvBcuAoJ=36tOMMGF=VRLPoar5Tp9dCf+69JtiOw@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Jul 2012 15:07:03 -0700
X-Google-Sender-Auth: Rp-8J7AFzJE0zcF8NxpPLCLyM44
Message-ID: <CABcZANkzOGiVmzyP-3YDwSSieiMTE03SyaL-bTe6a+6FGnGRnA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libc-common.bbclass and uclibc
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
X-List-Received-Date: Thu, 26 Jul 2012 22:18:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 26, 2012 at 2:51 PM, Manuel Bessler
<manuel.bessler@gmail.com> wrote:
> It does not seem to care about uclibc.
> Maybe libc-common.bbclass is only for eglibc and might need a better name?
> Since this is checking for "DEBIAN_NAMES" and I guess debian is not
> uclibc based,
> maybe this code is not really the issue...
>
> Do I just need to create a uclibc-common.bbclass ?

Debian-originated shared library-based package renaming occurs
regardless of what C library you use, and isn't relevant.
-- 
Christopher Larson


