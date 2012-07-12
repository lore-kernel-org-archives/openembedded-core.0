Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SpGND-0007hW-IU
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 12:11:51 +0200
Received: by obcva7 with SMTP id va7so2773294obc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 03:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=S0imG3zHEJ0ZTmcvsHxv1AnhJHUghUGREqu2PwzbkDY=;
	b=PzeMPuFxtC3zxoT93d8wQ2oq3A6sKWqC9NhbPIfR9Rkp4EXlNW0B4o3itFySSByq2h
	6u+GUTXMYSFTP52CCWtgAd0nuptOUv6BDWMaybDain6j5luK/WWTHPTcOGjm0RrAbDEC
	EAC8RwkBPCbHPXHwOupPzdBl0SCrU8tNhW/k+WJwK1nIJakFLiijCamMYbTRxIT1XuDX
	CUTDkTpvqeV17SzuuehnLKsYXqoGQH48G2XbDI7ZsIR/mYF758IMfq+Rqrk0GzA0fF/0
	lCFOU3jlb13R5TJNMBhiG8ue8mO0ObxD+375mmQt1lckeJycSRUcg5M8IdRzH1p2d8/m
	wLsg==
MIME-Version: 1.0
Received: by 10.182.116.2 with SMTP id js2mr18191447obb.38.1342087237883; Thu,
	12 Jul 2012 03:00:37 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Thu, 12 Jul 2012 03:00:37 -0700 (PDT)
In-Reply-To: <1603531.7in6lz8L8l@helios>
References: <1341990302-30459-1-git-send-email-dennis.yxun@gmail.com>
	<CAF1ZMEfMmkx9q8H1-TY9h3-Bc=Ljxq=5SfHHjokEaKs-FC25Pw@mail.gmail.com>
	<1603531.7in6lz8L8l@helios>
Date: Thu, 12 Jul 2012 18:00:37 +0800
Message-ID: <CAF1ZMEcvoa_pHgAtHVOf1xvUmFMr=KXAMO8Fmy7A4-+02GXy5w@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu/mips: adjust runqemu script to support mipsel machine
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
X-List-Received-Date: Thu, 12 Jul 2012 10:11:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 12, 2012 at 5:46 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 12 July 2012 11:08:40 Dennis.Yxun wrote:
>> On Wed, Jul 11, 2012 at 3:05 PM, Dennis Lan <dennis.yxun@gmail.com> wrote:
>> > -if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumips64" ]; then
>> > -    if [ "$MACHINE" = "qemumips64" ]; then
>> > -       QEMU=qemu-system-mips64
>> > -    else
>> > -       QEMU=qemu-system-mips
>> > -    fi
>> > +if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemumips64" ]; then
>> > +    QEMU=${MACHINE/qemu/qemu-system-}
>
> Unfortunately substitution like this is a bashism (i.e. does not work in
> purely POSIX-compliant shells such as dash). Can you rework this?
>
> Thanks,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

re-sent with patch v2


