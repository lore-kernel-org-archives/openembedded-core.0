Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 99AAF6FC70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 09:21:52 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id k15so1667902qaq.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 02:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Z6WAAJwl/Ty76Lu3ue/TcVlNu3krKsXW9FhoSYnjFr0=;
	b=YF/Gl74vcGyDSDbYeZN2VH1ZUPQcUxM1P13usd4sQAVDMklvarnyYO4D/LHlCGQqph
	xNiIokzLE4eGFlHT5aU5Cvulanavu0xsb3O7rN/C2z/9Ehm2WR4dioGzRS07bDgvgdvO
	bWiOdr6ol6sU+evQBDSjifWaeSZartjUbWqL62lL7bQNjdMof4Sp83/sy1zfnQXoYy89
	e19J6ERaylEJz3gTD8NzIKuwW+lqGtQ11oT7YMwdjvEiDh+vjfTScgKq4PfVNf1bD4BH
	jeCl041ihmLHhqEgphy/XJcSFUBkWMLoHI7vH98vBAUahYpE4eHrCjtVMsw7SAnQbLn2
	ndNw==
X-Gm-Message-State: ALoCoQkhYkjjFk/RvGm5cNeBmU+v3BlXlT9vIA/t9eWE/f4qldFVtjBioLuCz/JjdH04k+SyL4FR
X-Received: by 10.229.84.133 with SMTP id j5mr55710550qcl.14.1405588913555;
	Thu, 17 Jul 2014 02:21:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 17 Jul 2014 02:21:33 -0700 (PDT)
In-Reply-To: <1405583899-13188-3-git-send-email-ming.liu@windriver.com>
References: <1405583899-13188-1-git-send-email-ming.liu@windriver.com>
	<1405583899-13188-3-git-send-email-ming.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Jul 2014 10:21:33 +0100
Message-ID: <CAJTo0LaqmvZ7yoXtEOShd0TKNGzTXidoOd_dLhEu=DiCoyvr=Q@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gettext: fix implicit build result
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
X-List-Received-Date: Thu, 17 Jul 2014 09:22:02 -0000
Content-Type: text/plain; charset=UTF-8

On 17 July 2014 08:58, Ming Liu <ming.liu@windriver.com> wrote:
> Some "once only" variants are being defined instead of standard autoconf
> macros, for instance, AC_CHECK_HEADERS_ONCE like AC_CHECK_HEADERS. The
> advantage is that the check for each of the headers will be put only once
> into the 'configure' file, therefore it keeps the size down. But there
> is also a drawback that the checks then will turn to be statically inserted
> to the configure and cannot be conditionalized any more. It will
> definitely break the dependencies chosen as internally included.

I'm confused as to why this breaks anything, and if it does break
gettext then it's not embedded-specific but an upstream bug in the
configure script, surely.  Can you explain what the problem is?

Ross

