Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id D71F06AC7B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 18:04:00 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id 9so3448019ykp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Sep 2014 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=GfWy13pNXt/bDIqE3sXBPcKm6w7doA42FVDBLce6bzo=;
	b=soPHZ1uZQArZf4z3sJyzC00cnzMoohMiBRFQkdmKRlFM3R7ziTL1aGb5Va6c0S+PXI
	4gGk8brrrWMBkM30+44IHrNBojbjVjxX0ufixT1vX4YsQDwJMevM5Z8EYVWlCVbm3KOK
	uUBdiLX5fEfoaQo6SlbSu6tNxbXCTGtDrR6OK5Da4mg5V4p8ov4/dJ6lq/DhwjQ29JDT
	X/FIVHc3vkVgDMrr5jMtoE9X7AgNLTVUaM3CWLt0qG3bjNGbLI5hdEL2wC5ndqb2el1T
	q0JBhtxND2zHJNuhSjpE2I4VayjNH9zcU2jkdtGdSKKBeYcaoRYWxubrzcQyUm7NpSZc
	EaAw==
MIME-Version: 1.0
X-Received: by 10.236.85.10 with SMTP id t10mr16306653yhe.86.1409594641039;
	Mon, 01 Sep 2014 11:04:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 1 Sep 2014 11:04:00 -0700 (PDT)
In-Reply-To: <CAOMwXhP+A40Kcb-KcgCh8rh-oNXh-9DjyBJ4hAunJ7Q7_i8VUA@mail.gmail.com>
References: <1408720803-11737-1-git-send-email-lpapp@kde.org>
	<5400C6A5.6040001@linux.intel.com>
	<CAOMwXhPptiMrE7_VNi1rLtv0qzVf=0CHSJ5nn=dTi8GxBtFtHQ@mail.gmail.com>
	<CAOMwXhP+A40Kcb-KcgCh8rh-oNXh-9DjyBJ4hAunJ7Q7_i8VUA@mail.gmail.com>
Date: Mon, 1 Sep 2014 15:04:00 -0300
X-Google-Sender-Auth: Ka1f5BfMdwkiNO_FyJFPSjfaXcI
Message-ID: <CAP9ODKqCq4FZj920GW1ztu_r73MgKuiTfZtThbfZKi2710_BGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for ccache builds with the SDK
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
X-List-Received-Date: Mon, 01 Sep 2014 18:04:01 -0000
Content-Type: text/plain; charset=UTF-8

Laszlo,

On Mon, Sep 1, 2014 at 2:47 PM, Laszlo Papp <lpapp@kde.org> wrote:
> Just in case the severity is not clear. Without this change, the Yocto
> SDK breaks the build for our software since we do prefer to use ccache
> for speeding the build process up. We are probably not alone with that
> ...

Saul request is very valid. He is asking you to conform to the commit
guidelines we use and it is no-sense you to expect that he or someone
else does this for you.

So I think if you expect this to be merged you need to fix and send a v2.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

