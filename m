Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id A5D706E7E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 01:44:52 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 10so12702554ykt.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 17:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=yW3K/E83vZfgD5WIdPQjEw4WUTKu+5pxxhlP0FIHdt0=;
	b=JZlEJGSIFmRBt4ydiMorZmh1gr5UktgBAAGa/XzPCUB+DkXdRTHicTvrJhUtJBrvLy
	YrBQEHEkP76NXjqnXJ5/dsgAvr/J66VCizBoJe3nm9Ubmr2HrqFgafMVLFI8wTDBqBCD
	LbOnQtEoFgUv8EgTMnR+m3/+g9HWI/K4bbvKGUJwytu7q0EQA+lnmknyehkFGQccAZHH
	8Sqy5T220sQOueTlRfvZYTEzhYRMiU96UBfPl4Ls/NnNlSHOusN0JuzjHuj+XRorLP5J
	oDVZ84Gz7zuWBg9hPvnXod4gS/UyMxN0ao/WABzzp7YCLhNQ2uMhKfsI1KEiQwfs4rAG
	JMtg==
MIME-Version: 1.0
X-Received: by 10.236.93.208 with SMTP id l56mr222458yhf.112.1393897492931;
	Mon, 03 Mar 2014 17:44:52 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 3 Mar 2014 17:44:52 -0800 (PST)
In-Reply-To: <1393781961.22581.7.camel@ted>
References: <1393781961.22581.7.camel@ted>
Date: Mon, 3 Mar 2014 22:44:52 -0300
X-Google-Sender-Auth: w5-GnhHdr68SDo6onbnrG0N12uk
Message-ID: <CAP9ODKo48jjpaCW3=rcMZDWYRv1wQi8toK=unzyeCe885v4dVA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] bitbake.conf/base.bbclass: Drop PRINC support
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
X-List-Received-Date: Tue, 04 Mar 2014 01:44:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Mar 2, 2014 at 2:39 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> PRINC is no longer needed since we have the PR service instead
> which people should be using. Drop the PRINC code.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Nack! Layers still use it. Please, delay removal for 1.7 and add a
WARNING for 1.6.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

