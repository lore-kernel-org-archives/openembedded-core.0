Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCEE60034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 13:15:00 +0000 (UTC)
Received: by ignm3 with SMTP id m3so51615010ign.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=M1Rh7tD+trJG/Hxkv/kdcdQGHj6A9GFRrn1OxF65ZSk=;
	b=klstrbsD4j5GVANRNpsEDwk7fKRYj4mi7ZxKCU83fwwJBalOFQkKBoLsqwk0d8sjia
	yO1Xf3V0sXBMb3W006AsY0F7FtaVjfGux7lk5M0mDtnOMnrguD3gbg9h7IxAHQdPbcUk
	kWNcWSKKXBKcvfFhbdO/EdOVB2o9XHUqjF7bns/DEVUKQQOr2CfxmzOa/BwY96/jUQ0A
	yDX97dIPCBDXJMKsc9x4Sx3rIDHgrB2sDIUB9AVecVriEVjm9B6QZv6/sdQtB70T3dU5
	+ERW9fUjfS9jtEQ/2+Tl6+8IRJb2w0yBCASdHcUdZVZniwRvqlNevOv4GGnBz4wxb1XZ
	2UTw==
MIME-Version: 1.0
X-Received: by 10.42.67.19 with SMTP id r19mr966965ici.30.1427202901834; Tue,
	24 Mar 2015 06:15:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.133.21 with HTTP; Tue, 24 Mar 2015 06:15:01 -0700 (PDT)
In-Reply-To: <BY2PR03MB441043B1B2A76B4CA483B3B840A0@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1426066820-19627-1-git-send-email-B40290@freescale.com>
	<CAP9ODKp=O30ACKGr8niGVg-ER6VxLwc32b5q6X5pa7eqP0F7iw@mail.gmail.com>
	<BY2PR03MB441043B1B2A76B4CA483B3B840A0@BY2PR03MB441.namprd03.prod.outlook.com>
Date: Tue, 24 Mar 2015 10:15:01 -0300
X-Google-Sender-Auth: rlc6GW8HrLwPLJcU46edPoa4tgE
Message-ID: <CAP9ODKpeNRLu+sVRKZMaO4ikxuqyHQam17u-H=XUdc4HMYLCjg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "B40290@freescale.com" <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] u-boot.inc: fix rename image error
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
X-List-Received-Date: Tue, 24 Mar 2015 13:15:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 24, 2015 at 4:34 AM, B40290@freescale.com
<B40290@freescale.com> wrote:
> Thank you for your comments.
>
> But I do not understand what "old one" is.

If you build a 2014.10 and next a 2015.01 version in a roll, you
cannot infer the version in deploy or pick previous release (as
possible in kernel).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

