Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC49731A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 17:28:10 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 1so245961753ion.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 09:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QtoBBqbmaEvjOs9EHmtjyorh9k5WXIAxtm28PU6ppSg=;
	b=xGbVDyjavCKlHZSI8ACWvdDCfjJHBpfuGrkjciAreR9RELndyYpsRIz+osc4f9vYc1
	uufYPz5ya6wKTxb2QtH56gNnDQ2sxggeQG/mzZB9ZddRFnN4lQd13O1z/je7RXXCIn+K
	f8NgkumB5wI0plHwfXcgPM5PS6vlcwbb/2kx7M+jYclh8NYIAWr77Djri9lSHpBYnN2d
	wVxR8ZSg+TxTzAUE8aSFq2OEqFMGiDzE37IZR39w0A6giRqT8J+CTols8d8aiJ4dQLga
	ghK4yWdwbxD/XIZDV7yrdaTo8JCDvfq/8IWElX2i57dC7UpgGb8VbRE6X8pHzw5hsZ3A
	6Y6g==
X-Received: by 10.107.9.224 with SMTP id 93mr98157112ioj.112.1452274091219;
	Fri, 08 Jan 2016 09:28:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 8 Jan 2016 09:27:41 -0800 (PST)
In-Reply-To: <CAJTo0Lbvw5fsvSAPQXpV_E341ZDa53uVzOMnkgHpRSVROcLP7g@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<baa98869574d7bb44be4171ff58d5abdc76f7d69.1452248145.git.raj.khem@gmail.com>
	<CAJTo0LbiNhcb3G_omDB=V37p53dpG3MGA0O28T19BQiT4aL8Zw@mail.gmail.com>
	<CAJTo0Lbvw5fsvSAPQXpV_E341ZDa53uVzOMnkgHpRSVROcLP7g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 09:27:41 -0800
Message-ID: <CAMKF1sqXi2PLEkpfA7tM0iM52cbx0RU52r+Uy01VtcLR0-KQ9A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/53] mtools: Fix build with uclibc
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
X-List-Received-Date: Fri, 08 Jan 2016 17:28:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 8:25 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 16:17, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> It appears to be the first time that virtual/libiconv-native appears.
>> Should we just ASSUME_PROVIDED that?
>
>
> I think this is the right solution - patch sent.

yes thats the right solution , I havent done builds for qemux86/64 for
sometime after RPs change in the bbclassextend area. Since I had
reverted that fix in my tree I did not see this error.

>
> Ross

