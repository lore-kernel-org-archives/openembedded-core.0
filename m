Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.10379.1587905342822710354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 05:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QFhoopEa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id t14so17164476wrw.12
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3cdqdRswlCLvX5C/JhBE1wpiUBpSnv2KKggPbbnghS0=;
        b=QFhoopEa3Wzqk/6BWUlnNPxbxojgs0R4onAAt4I6n/9mJZZaJ+QkgLPzXwPkD5xPQt
         ZOSsbCmFf4u6xNnJDKobt3tYvSgCDmxs5l2vbOgrcpoCn3ws1kqiwDv/wIPJAFKOimMu
         rx6UAkZovOYNv2HFWsp8uQ8DH6I5jJ26KGsCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3cdqdRswlCLvX5C/JhBE1wpiUBpSnv2KKggPbbnghS0=;
        b=aR5Rgv0d59rXyj8tahjnmfoQ4r8HNqePzUmYcrtxMOs/g9SRnXg+W8BNUWr3RiQQMH
         lDSCm1vF6vBK10L9PXmD6DRd5lHZX7ohRMyA1QYVYE7PHZ1DpFAmQLdAtVpsmR0FVDWp
         RF+Hpcg8uhg2iLu++foZdgQbNels+BySz3Tbpk6C6HBYpRQ3k7IvhlDU/OgNs2OIxY+S
         ZYnCM65o/T/XZ+ViOA9WYQ21AL3qzMK6VevBfiuZzvRSTjq0TEoxd0WejDJD9pme6/yp
         dXky2sVa6M88bI+Ox2Jt9RcpLhX77mH/0ESOPOeijb2bl3krv4GfJalOG20asaLQYXNa
         Hrdg==
X-Gm-Message-State: AGi0PubBnaTb0EBwX3C4+RIUzQ5pYJ24+7A1X5UEqIOtUmY8P1b4FFq1
	wvHrK8hy9kB5sMY06CnuWj7g8w==
X-Google-Smtp-Source: APiQypKB04tFj5nwBmbf6yELrtNSNhoZ8FhssWXwI+XCYCLr9H0M+5gAtd5+KYrkmvbDViWLjF/OCw==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr21988585wrq.14.1587905341039;
        Sun, 26 Apr 2020 05:49:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id o6sm7862522wrw.63.2020.04.26.05.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 05:49:00 -0700 (PDT)
Message-ID: <320ff316b47f80476fd072c34ef6111f4d3222fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Paul
 Barker <pbarker@konsulko.com>
Date: Sun, 26 Apr 2020 13:48:59 +0100
In-Reply-To: <CAPybu_3ho1BpD9fz4s_eEWrcBhm9jq=AuAb1itARRFtBHJn-Eg@mail.gmail.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
	 <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
	 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
	 <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
	 <16086D1E57B63D5A.14079@lists.openembedded.org>
	 <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
	 <d15d1601fdec27b7667dd16f62db13fc9ff475cd.camel@linuxfoundation.org>
	 <CAPybu_0n37=eUhXtAZiOoxogY6Wyb4N8VLJSQre=RUO7U8ScqQ@mail.gmail.com>
	 <714c9522fe1f5377f019f67cf43ec75eecf6fec0.camel@linuxfoundation.org>
	 <CAPybu_3ho1BpD9fz4s_eEWrcBhm9jq=AuAb1itARRFtBHJn-Eg@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-25 at 23:35 +0200, Ricardo Ribalda Delgado wrote:
> On Sat, Apr 25, 2020 at 11:29 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2020-04-25 at 23:25 +0200, Ricardo Ribalda Delgado wrote:
> > Since my other email I couldn't resist poking at the code. Locally
> > this
> > patch fixed it so its now also running on the autobuilder:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=3e7d64adba65559e9b8af42e973c8524988b216a
> > 
> > > Can you also publish a git branch somewhere with the current
> > > error,
> > > so we work on the same codebase?
> > > 
> > > Or you just prefer to continue on your own?
> > 
> > Happy to have help but I'm simply using master-next and with any
> > luck I
> > might have found it.
> 
> If you could replicate it locally, and this fixes it. I am almost
> sure
> you found it. I was looking in the same place ;)

I think you'd have found it as you were on the right track and we came
to the same conclusion! Sorry about the confusion about where the fault
was, it was an unfortunate situation where it was really an underlying
bug which became exposed.

I'll get the logging fix sorted out and we can finally get some patches
merged. I'm a lot happier understanding how this was triggered.

Cheers,

Richard

