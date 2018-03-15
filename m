Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9B7788B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:41:11 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id t3so11647889wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 09:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SZIc5m9aR36VYDaJwFDrWlIjAE+QBrJ9StQblvMWi34=;
	b=bz4mmBv+7367bhooVAQlPmXiYmui1qdJaXxxRQXp1Zx3G1FxCJERImsIrB8E0nsgQd
	HvxNiWPwimgCl1mHwm7eo+XibO1DLKFFReochwxnashHkgUoIErgWa208GEq3SbDnK/k
	KhpWRzKn37lLNhJaBiVWfm/J400GdLVF348EbTj6qQxPsbTl3MHPLoUobhxd9RUPiXPj
	ipITne+5W1TrZGzDncaNSDfXyAfmtJXGtpNxlI9nMxDlSTvuGRlmGEGX5mkfgS9xOhHP
	sDYhdrtW+k8Eq04Fs16we/GEZNnpDS898+Eu3O2+u5vlbnUlxaE26WqWDvcKi/jUac9i
	HEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SZIc5m9aR36VYDaJwFDrWlIjAE+QBrJ9StQblvMWi34=;
	b=J1YEI61BZeGstkiSeuXcYlUtgIlHhjgum2Hk7e06y+IRY8SyMZgNMGcSIzRDbv2wXc
	1CHzpwuqfL6VWnFY5Ja4aWvr3hoY8dDmtqrXObSWTn5WAXOVGfbA2szSpJc4AXwn668g
	zyAfPKLW+0vyND3mBm4/4jGYufnVVjOUg1imnZm2XMb4Io90wNJ0zNexa2cie0ILAgM+
	pYICk5Xmw2CkWGAGTH7aQCR/2REG0GAkoJZ2VkQyTx/A/hHqjm2a07JfGURkPJAwngDk
	HB7AxinLLmileRKvCPxLTDsooQ5EmIHCrlQd8hLFlXIa8z62ICaAhiejdIbtE25tzDNS
	PlTw==
X-Gm-Message-State: AElRT7H0zdy/3OCFUbUYU70A76KBmx8voS8tbtshp13maF/Cl3JX2JE0
	xWhQFo6bq5G1MGL/Nt0VriASN3UEzgQztgoILxI=
X-Google-Smtp-Source: AG47ELutOzWJc37AqAXV7ahb5iLCM6v+GQBQLifn+jPKGzKHrdWlO0Zdu6FdtTK+ikssuBUZUMEkl1opU7ydhz97N3Y=
X-Received: by 10.28.148.206 with SMTP id w197mr5006707wmd.60.1521132072996;
	Thu, 15 Mar 2018 09:41:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Thu, 15 Mar 2018 09:41:12 -0700 (PDT)
In-Reply-To: <f6229a05-c425-6da9-aac2-026cdcbed92a@linux.intel.com>
References: <20180312164944.39923-1-alexander.kanavin@linux.intel.com>
	<20180312164944.39923-4-alexander.kanavin@linux.intel.com>
	<CA+chaQctko3eBUWpySaiZ19WXH+5cDrAu4Kh6TGLd9r4MTx-Qw@mail.gmail.com>
	<f6229a05-c425-6da9-aac2-026cdcbed92a@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Mar 2018 17:41:12 +0100
Message-ID: <CA+chaQe69zX2UK38ELEqbVtsYvEiJkzkgTBu9zvO38V1SCBr2Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] lib/oe/patch.py: add a warning if patch context was ignored
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
X-List-Received-Date: Thu, 15 Mar 2018 16:41:12 -0000
Content-Type: multipart/alternative; boundary="001a114b8634de165c0567762804"

--001a114b8634de165c0567762804
Content-Type: text/plain; charset="UTF-8"

Yes, this time it updates more things, but in future updates it might be
just 1 line with line numbers and then different git version in the
signature. Which will make the diff few times bigger than it would need to
be.

On Thu, Mar 15, 2018 at 5:22 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/15/2018 05:13 PM, Martin Jansa wrote:
>
>> Now when more people will use devtool to refresh patches, would it make
>> sense for devtool to use --no-signature when refreshing patches?
>>
>
> I don't think that will help much to reduce the amount of change in the
> refresh. The refesh will also update the line numbers in chunks so that
> they match reality, and convert patches into git format - all useful things.
>
>
> Alex
>

--001a114b8634de165c0567762804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, this time it updates more things, but in future updat=
es it might be just 1 line with line numbers and then different git version=
 in the signature. Which will make the diff few times bigger than it would =
need to be.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Mar 15, 2018 at 5:22 PM, Alexander Kanavin <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexan=
der.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><span class=3D"">On 03/15/2018 05:13 PM, Martin Jansa wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Now when more people will use devtool to refresh patches, would it make sen=
se for devtool to use --no-signature when refreshing patches?<br>
</blockquote>
<br></span>
I don&#39;t think that will help much to reduce the amount of change in the=
 refresh. The refesh will also update the line numbers in chunks so that th=
ey match reality, and convert patches into git format - all useful things.<=
br>
<br>
<br>
Alex<br>
</blockquote></div><br></div>

--001a114b8634de165c0567762804--
