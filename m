Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.931.1587849923609349863
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 14:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fB5ZVGcX;
 spf=pass (domain: gmail.com, ip: 209.85.208.196, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f196.google.com with SMTP id f11so9007094ljp.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/wR9Ryt8bKJM3HonnffYNyzM7441PaUMfL7j1Od3KY0=;
        b=fB5ZVGcXnbOwarLffpTZrmTtFVz6H/kePQ1QNnhIb4H4tHKOPbVRaz1AwxRLV0AyzY
         pCvNT3F0c4HjkFDVw0ITLzM/npLTAF7rzl5me4Z1QeLU2Z4WfwWNzJJ29nvNDMsoMSum
         BfgwGp7042+MKEzZXwUZHqShLNKQDlNy3iUNUHUIS8pnlZxhGUGQQusbkPf1nDeAe08/
         Idz9wKySlHpka8nJUJZzz/s2kSB3NUUzr7lmyouQ5G2sdQ0zxD7+E4Yq/mUsbTRCHGU4
         7lLV/rbZRR9c7EWUoUekzwRbxxcw94lBgp2XlJNbTj6JXopa23ETNRWIDmO5G+Etwa+J
         azCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/wR9Ryt8bKJM3HonnffYNyzM7441PaUMfL7j1Od3KY0=;
        b=smCqzUaOfrBXMnD47UC/WVbCj65rqEdW0QkhLDqVVtXvNKk5J4Df0bF7uAR+7ErIwV
         SYP1NffEFIjntWBdq1PkLoReT95Wq6mZm5uvcwzwfZ51sZdkJ1v4H1dx4geFpDr4Rfzu
         uQqMx0Q0rdLsQF5Ck0SiIBju72guLOHDxl95jmhuXZZjHXtjQtopmrbH83kVIdtzMYGg
         rkP0uMlsuDh1fXnB/Y5uOggnoIHIKkHgwH9o8+qSnF/V4RdObVJUAN/dS+/9AAe209Z7
         lsKMXXC4NM2a1+5fMKVl+Ow6AuIJoIFDxYZd1xeJ8xzN2MtVvZtPusi63Pcc8Wahzwhx
         FJwQ==
X-Gm-Message-State: AGi0PuazETJ4zC6+dAo9YCYIr6t5GEjpDObfIIMft+resDzs8xAbxpPL
	r/ByO443WYumxJepXIu/WKU1ypYfTMqTLz37nkM=
X-Google-Smtp-Source: APiQypLdcqEomxAlNZaH/8mrKAVb9JMJnocPMrwT02t++tnicGgA3XgiJFtK0yvK/BSXwsLg3oR7H3AY2DV70+M6xoc=
X-Received: by 2002:a2e:8e22:: with SMTP id r2mr9635115ljk.286.1587849921736;
 Sat, 25 Apr 2020 14:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200419063539.1467641-1-ricardo@ribalda.com> <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
 <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
 <16086D1E57B63D5A.14079@lists.openembedded.org> <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
 <d15d1601fdec27b7667dd16f62db13fc9ff475cd.camel@linuxfoundation.org>
In-Reply-To: <d15d1601fdec27b7667dd16f62db13fc9ff475cd.camel@linuxfoundation.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Sat, 25 Apr 2020 23:25:05 +0200
Message-ID: <CAPybu_0n37=eUhXtAZiOoxogY6Wyb4N8VLJSQre=RUO7U8ScqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

Hi Richard

Thanks for the update!

On Sat, Apr 25, 2020 at 11:07 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-04-23 at 15:17 +0200, Ricardo Ribalda Delgado wrote:
> > On my setup, using debian crops the error is even different :(
> >
> > If you want I can keep trying, otherwise I will leave it to the
> > experts ;)
>
> Just to update, I bisected this down to my sysroot patches in master-
> next. Which makes no sense, how would sysroot changes cause wic to fail
> in runqemu?
>
> I've discovered that you have to run two tests in the same build one
> after the other, specifically:
>
> oe-selftest -r  devtool.DevtoolExtractTests.test_devtool_deploy_target wic.Wic2.test_qemu_efi
>
> and I think my sysroot change "causes" problems as it adds a new test
> class. This reorders tests and triggers this magic order problem. I
> haven't confirmed but I think the above will fail without my patch.
>
> The key is the wic test failing with:
>
> FileNotFoundError: [Errno 2] No such file or directory: '/media/build1/poky/build-st/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0-r0/testimage/qemurunner_log.20200425200658'
>
> i.e. why is it writing to oe-selftest-image which is only used by the
> devtool test?
>
> The answer is I think the runqemu code is leaking logfile handles
> somehow.
>
> At least now we have a simpler and consistent reproducer and some idea
> of the problem this should be easier to track down.

I have also been working on the issue, and eventhought I have not been
able to replicate locally the bug, the code insspection was pointing
to the same direction.
My running hypothesis is that the logger keeps writting to the
filehandler because nobody has removed it, so the second time we use
qemu, the log file is missing and all dies


Eg: Here I cannot see where the handler is removed
https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/targetcontrol.py?h=master-next#n122


Eg: Here I can

https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/utils/commands.py#n353


Unfortunately, as I said, I cannot replicate it, so it is a bit frustrating.

Since you can replicate it, could I send you a couple of patches, not
to fix it, but to find out if I am on the right direction?

Can you also publish a git branch somewhere with the current error, so
we work on the same codebase?

Or you just prefer to continue on your own?

Thanks

>
> Cheers,
>
> Richard
>
>
>


-- 
Ricardo Ribalda
