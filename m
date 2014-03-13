Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 711BC6B25F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 01:53:19 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id v1so398133yhn.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 18:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=mHxVbNA0dt58aNDghOAZKDqkE8/LgMgDI4QsUXjrAWY=;
	b=HCoecPPUKVL56nfdY18FG7Z7Zlwc+PjGVljWxzADD98cqfaXpcNXZxtTGekeUALajb
	BTSms16sh7WTwhc8KR8lPd2QbMAXkggWdbvxr5WgLhKTEmvEHjIdgS1snYzijxZ6XN3z
	JwfcJWV8dMPWPUcjPUyfaSJvW7DBbEjjdki/dmCNqkZ1dGUdtClbi93ssvXO0XLyEz3B
	UtnydvPm/1mhVwtse/PJoTbN4BoQ/+e0s8wAWvIsKbqKsFKM1MNnJQ7qKRLiTIag3Z6f
	a4luwpouoAsrfijmQ8VAcN1XH42mToahKUjR+aBBVbzjRX77ojBL/7z+1Hh3zf35P7AL
	q80w==
MIME-Version: 1.0
X-Received: by 10.236.191.67 with SMTP id f43mr1061957yhn.60.1394675600810;
	Wed, 12 Mar 2014 18:53:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 12 Mar 2014 18:53:20 -0700 (PDT)
In-Reply-To: <1394630043.19455.62.camel@ted>
References: <1394617589-29064-1-git-send-email-yanjun.zhu@windriver.com>
	<1394630043.19455.62.camel@ted>
Date: Wed, 12 Mar 2014 22:53:20 -0300
X-Google-Sender-Auth: iF5s-RIn3TGEXT9flAnNeMOlPv8
Message-ID: <CAP9ODKpnuMPh42qf7CY1KKnMNcv4n4zVZa6CJ51kdMD3iMuacQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libparted: make sure not to treat percentages as exact
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
X-List-Received-Date: Thu, 13 Mar 2014 01:53:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 12, 2014 at 10:14 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2014-03-12 at 17:46 +0800, Zhu Yanjun wrote:
>> ---
>>  ...ke-sure-not-to-treat-percentages-as-exact.patch |   22 ++++++++++++++++++++
>>  meta/recipes-extended/parted/parted_3.1.bb         |    3 ++-
>>  2 files changed, 24 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-extended/parted/parted-3.1/parted-libparted-make-sure-not-to-treat-percentages-as-exact.patch
>
> There is no long log in the commit message (why is this patch
> important?) and no Upstream-Status in the patch.

Please send the patch to the upstream mailing list. I can help with
the handling there if needed (I was quite involved in GNU Parted
development, in past).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

