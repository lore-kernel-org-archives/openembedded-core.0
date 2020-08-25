Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.14156.1598364188348928915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 07:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ENWrkSt8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 83so2538086wme.4
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YJ2KK25FLDfATP7MC3NPE+49AwGeGfhefx6J5EL5HBI=;
        b=ENWrkSt8danftmAXq91AexA+/kOKuGot/A1zcG73ud+M2Ur7YhfIUyn711gELpBzZg
         6KXdmunkavcLGvDyHqy988NDA++Js1XbkHmgoYXJlpdLgLKyXMJVq/w2Xan/XDAV9Khx
         jgyVD2y4d9fPE7HdfWON2ySWwKJEH7mpkiOxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YJ2KK25FLDfATP7MC3NPE+49AwGeGfhefx6J5EL5HBI=;
        b=Zu5QuSpxbRKvT9plA8V5Qyw7xVZSwoYJFnQRJOUSMuwP50GJWVVVAzRN3cmj6m82/l
         SrYO2nNdN0EGOr4FY1t6qv4hQ08ByZ1Al6TNU8cC3NPeyH8oXwazuumkjtW4QgGdBwpc
         95yTTXQE3KhkS9XgvMrrZUtHQA9Ad6x6yR4tr7tTwifHI3cOCU8I+pc3OjjUytpFjlBa
         VlwKamqVhy4vfJIVDLvvSUB4tAfWdy84I9rx3jTx6qizkiEi2qi28MhZs9kbNZuUfnGS
         i3ymE/onbH5bpms2940m5A1mj5gy9P1NhnudgvItJNFunSW/OACZnfXlexxyXS/pVVvO
         qLnA==
X-Gm-Message-State: AOAM531eSXHKxXhaiGb0r/ESaLZmY1oOkCwZuKgD47MhsH3IfANfqEqL
	4e0yYz4yLtObFgDozVaodgiijQ==
X-Google-Smtp-Source: ABdhPJzNk8ExRwxKb1I+3lFRT7oAWyj8qUQyD+tf0GlSwckygDigiZ6PBcrkzGFXv1mve3eIlN48kA==
X-Received: by 2002:a7b:cd09:: with SMTP id f9mr2197340wmj.52.1598364186638;
        Tue, 25 Aug 2020 07:03:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id v20sm3043554wra.72.2020.08.25.07.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 07:03:05 -0700 (PDT)
Message-ID: <b744c1816cb4d50ae05ed1a8f6bb4049083f126d.camel@linuxfoundation.org>
Subject: Re: [OE-core] file checksums versus SRC_URI globs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Quentin Schulz
	 <quentin.schulz@streamunlimited.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Kjeld
 Flarup <kfa@deif.com>, Per =?ISO-8859-1?Q?N=F8rgaard?= Christensen
 <per.christensen@prevas.dk>,  Paul Eggleton
 <paul.eggleton@linux.intel.com>, Kurt =?ISO-8859-1?Q?=D8stergaard?=
 Frandsen <kof@deif.com>
Date: Tue, 25 Aug 2020 15:03:02 +0100
In-Reply-To: <7540f712-dc06-4ab7-22e7-124aa733025c@prevas.dk>
References: <aaad9ac7-be6a-1ffb-6990-ab371ed40015@prevas.dk>
	 <20200701140321.wueczs4qd34rbhwh@qschulz>
	 <161DDC5BD88A8AE5.10798@lists.openembedded.org>
	 <7540f712-dc06-4ab7-22e7-124aa733025c@prevas.dk>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-09 at 21:31 +0200, Rasmus Villemoes wrote:
> On 02/07/2020 08.42, Rasmus Villemoes via lists.openembedded.org wrote:
> > On 01/07/2020 16.03, Quentin Schulz wrote:
> > > Hi Rasmus,
> > > 
> > > On Wed, Jul 01, 2020 at 03:51:19PM +0200, Rasmus Villemoes wrote:
> > > > Hi,
> > > > 
> > > > We have a recipe that uses
> > > > 
> > > >   SRC_URI += "file://somedir/*"
> > > > 
> > > 
> > > Glob aren't supported. Use "file://somedir/" instead.
> > 
> > Thanks, that actually works for one of the cases we have (there are
> > others that use globs which cannot be solved quite that simply, but for
> > now I'm just listing files explicitly instead).
> > 
> > However, I'm not sure that "globs aren't supported". The commit I
> > referenced clearly tried to make that work (better), it also "works" in
> > the sense of unpacking the expected things when building from scratch -
> > there's even
> > 
> >     def test_local_wildcard(self):
> >         tree = self.fetchUnpack(['file://a', 'file://dir/*'])
> >         self.assertEqual(tree, ['a',  'dir/c', 'dir/d', 'dir/subdir/e'])
> > 
> > in bitbake/lib/bb/tests/fetch.py. And the two upstream recipes
> > connman-gnome_0.7.bb and matchbox-desktop_2.2.bb both use that exact
> > pattern.
> > 
> > So either
> > 
> > - this is a plain bug in the signature computation,
> 
> I'm guessing the culprit is
> 
> commit 6c0706a28d72c591f1b75b6e3f3b645859387c7e
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Mon Dec 8 21:25:23 2014 +0000
> 
>     cache/fetch2/siggen: Ensure we track include history for file checksums
> 
> which was the one that introduced the ":True: or ":False" suffixing via
> 
> +                filelist.append(f + ":" + str(os.path.exists(f)))
> 
> and then also did
> 
> @@ -981,6 +980,10 @@ def get_file_checksums(filelist, pn):
> 
>      checksums = []
>      for pth in filelist.split():
> +        exist = pth.split(":")[1]
> +        if exist == "False":
> +            continue
> +        pth = pth.split(":")[0]
>          if '*' in pth:
>              # Handle globs
>              for f in glob.glob(pth):
> 
> which practically guaranteed that the "if '*' in pth" would be dead code.
> 
> Richard, do you agree that this is a bug in the signature computation?
> 
> As I wrote previously, there's no warning anywhere that using globs in
> SRC_URI will fail to take the contents of the referenced file into
> account in hashes, but there's obviously still a some code that makes
> file://*.c work wrt. unpacking (and a test case for that).

Sorry about the delay in replying to this, it was flagged in my inbox,
I've just lacked time to investigate and resolve it.

I agree its a bug but my patch above didn't break globing support for
file checksums, its simply never worked even before that change. After
a lot of thought, I've also concluded that I don't think it can work in
a sane way (which is why it was never implemented).

The checksum code needs to know about the files that were searched that
didn't exist as well as those that existed and were checksumed. For the
simple file://xxx/* url that is possible but for more imaginative
globs, its hard. In the file://xxx/* case it may as well be file://xxx/
 in the url which works and is already checksumed correctly.

I've therefore sent out patches to remove the globbing support and
clean up the couple of existing references in OE-Core which are
trivially adapted.

I appreciate this isn't the answer you want but I can't realistically
see how to make this work properly in a sane way that scales. I do
agree the pretence it works is bad though so want to fix that.

Cheers,

Richard


