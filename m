Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 41F12600E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:54:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f193so2897162wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 03:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xcsh5PQ3ebJWrwaad2D4Yzx7giNC9lsJVHtU22/O/S8=;
	b=GbIQgPZwlr/7Xulb3jzwIilRDLA+5wa53yl4s/XQcx0gR1ygvmq8tP2YgceLEB9Ft1
	L/6A9ZRNLyLXx66/hRPrSXEFtXK0cQiJoDc+PobuS42h7YKn+ASBFT1u3SVnGMpeRA5D
	0ldkORl15CcQm7xE1T/68xDVEivGQzrncMdWLJrI+MVCTAgHyLLnU307IvbzvW6zRLdp
	V4GylhEuv2ganIVYOsn+jQ+znVtNVgUUEVvDQNVfjgdWklin++wr5ZT12tjVl/b7gsSm
	fMZ3JxqR22phDATY5KWk9GTTjWUqV91RDCt5FR1R4oAkQkSk/0G8X7ci+7798G6F/dan
	qEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xcsh5PQ3ebJWrwaad2D4Yzx7giNC9lsJVHtU22/O/S8=;
	b=Tfxtxxjjrs4CZwII094HGmBy0gMkzMH7TogH9xP69dC8ZCoBZJ5WAJpjroWntFLUZY
	0k5tsPBU1qq5ZQ3MFyzBXpaM/RnLmgJJHbrRYoUfsKW3OW4gOTtPUE/Pymtk4H1/3ObM
	4AVlO+k6Qy3LYiAAvae0k/BHBJ1C+QUvS10AsxCBak6Tm4H6hSxcnuZKVolQ1AZ/OQOZ
	msdAAPMF45MsHePD0EksiZsfO7mqlm9xL8kl934FmcDCcOkILTkmARSkLwEv3WYy0Sc2
	NV9GART3nw+z7xCNRehCJeq6ULDKrnHX2hkb+FncM6QcXOKf+cbSirUtCBCCvwW1nwud
	uM+Q==
X-Gm-Message-State: AA6/9RlGHUvm9fH/KUdekzWxwTJNpzRXhyT1O2N919ItQ1NM5Ute5+0Dm1lfRbyeFRkEqyzYptn13f/EQisFzg==
X-Received: by 10.28.41.131 with SMTP id p125mr7921779wmp.15.1475751293154;
	Thu, 06 Oct 2016 03:54:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.159.203 with HTTP; Thu, 6 Oct 2016 03:54:52 -0700 (PDT)
In-Reply-To: <CA+chaQeh3Y2jYm97R6cWw3OvuQrTqHQn1NMWaUfGjFRQN4okEQ@mail.gmail.com>
References: <20161006082332.29189-1-Martin.Jansa@gmail.com>
	<1475750706.30475.539.camel@linuxfoundation.org>
	<CA+chaQeh3Y2jYm97R6cWw3OvuQrTqHQn1NMWaUfGjFRQN4okEQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Oct 2016 12:54:52 +0200
Message-ID: <CA+chaQcyvfvyZ8xDYmHMkbhQcTaZWbLheaVSW5so2zPA=UTA-w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth][PATCH] binutils: fix AR issue when opkg is unpacking IPKs containing empty entries
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
X-List-Received-Date: Thu, 06 Oct 2016 10:54:54 -0000
Content-Type: multipart/alternative; boundary=001a114e262e9afaa5053e301f44

--001a114e262e9afaa5053e301f44
Content-Type: text/plain; charset=UTF-8

I see this strange line also in that branch, I'm checking log.do_patch to
see how it's possible that it did apply to me OK.

On Thu, Oct 6, 2016 at 12:46 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Strange,
>
> it's included here:
> http://git.openembedded.org/openembedded-core-contrib/log/
> ?h=jansa/krogoth-backports
>
> until next rebase it's this commit SHA:
> http://git.openembedded.org/openembedded-core-contrib/
> commit/?h=jansa/krogoth-backports&id=9d56d74bc2f42cbd6ee6ad1dbddb37
> 8a020bbe93
>
> Thanks for quick reply
>
> On Thu, Oct 6, 2016 at 12:45 PM, Richard Purdie <richard.purdie@
> linuxfoundation.org> wrote:
>
>> On Thu, 2016-10-06 at 10:23 +0200, Martin Jansa wrote:
>> > ++    # This commmand used to fail with: "Malformed archive".
>> > ++    set got [binutils_run $AR "-t $archive"]
>> > ++    if ![string match "empty
>> > " $got] {
>> > ++    fail $testname
>> > ++    return
>> > ++    }
>> > ++
>> > ++    pass $testname
>>
>> The patch fails to apply due to the above corruption (line not starting
>> ++). Could you resend or point to a branch with the patch on please?
>>
>> Cheers,
>>
>> Richard
>>
>
>

--001a114e262e9afaa5053e301f44
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see this strange line also in that branch, I&#39;m check=
ing log.do_patch to see how it&#39;s possible that it did apply to me OK.</=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Oct 6=
, 2016 at 12:46 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Strange,<div><=
br></div><div>it&#39;s included here:</div><div><a href=3D"http://git.opene=
mbedded.org/openembedded-core-contrib/log/?h=3Djansa/krogoth-backports" tar=
get=3D"_blank">http://git.openembedded.org/<wbr>openembedded-core-contrib/l=
og/<wbr>?h=3Djansa/krogoth-backports</a><br></div><div><br></div><div>until=
 next rebase it&#39;s this commit SHA:</div><div><a href=3D"http://git.open=
embedded.org/openembedded-core-contrib/commit/?h=3Djansa/krogoth-backports&=
amp;id=3D9d56d74bc2f42cbd6ee6ad1dbddb378a020bbe93" target=3D"_blank">http:/=
/git.openembedded.org/<wbr>openembedded-core-contrib/<wbr>commit/?h=3Djansa=
/krogoth-<wbr>backports&amp;id=3D<wbr>9d56d74bc2f42cbd6ee6ad1dbddb37<wbr>8a=
020bbe93</a><br></div><div><br></div><div>Thanks for quick reply</div></div=
><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Thu, Oct 6, 2016 at 12:45 PM, Richard Purdie <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" ta=
rget=3D"_blank">richard.purdie@<wbr>linuxfoundation.org</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><span>On Thu, 2016-10-06 at 10:23 +020=
0, Martin Jansa wrote:<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0# This commmand used to fail with: &quot;Mal=
formed archive&quot;.<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0set got [binutils_run $AR &quot;-t $archive&=
quot;]<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0if ![string match &quot;empty<br>
&gt; &quot; $got] {<br>
&gt; ++=C2=A0 =C2=A0 fail $testname<br>
&gt; ++=C2=A0 =C2=A0 return<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0pass $testname<br>
<br>
</span>The patch fails to apply due to the above corruption (line not start=
ing<br>
++). Could you resend or point to a branch with the patch on please?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a114e262e9afaa5053e301f44--
