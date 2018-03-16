Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9256F600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 05:06:53 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id l17so1731346uak.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 22:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CKL29hnHnaYI5DvEch8+vu2tA6K6+F12g2Puhc8XjSM=;
	b=F1etORHBC7DOUgLhRVJEZWxpcYpVBmryqDTiwNBxpBD4C5huWJwo6/fIYT8thWJMG2
	1goybJC6VQj7liVFnTI2jJfWRYFhyPQ1cPiY14/IjjTZAv0l/JCxsz7r2zhJCXWbr5Tx
	44992Pm0iYkv8D5Ph93W8xTyzUomud24W81u6nI4tQQQzlA5pZWFtv5/KX2Ltq9cxLZf
	Zbv/rshdg/0x4lc/8zKIkQHU7x4xrCLHXKLu+Knzsqswcl74HPLiTu4OvdD0xCjWxVJo
	knPeqsE9Oboy/g+m0MwFuvPWoQDDFcDp/FQ2CRofD+ACMIEwLiGoGwurCfEOrhWVhNcc
	nixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CKL29hnHnaYI5DvEch8+vu2tA6K6+F12g2Puhc8XjSM=;
	b=Nel6UVZXM7hV5jJi6QUpb1IjKr2nHhkFxqrecWo6+SDRAdm4awNIctklwfTOObeejG
	ZqidssQ8PrVUMhdj0Tsz7quQhbCVaYc8ZIhsvTiXixz1SyygCpVp/7O94aYrqRlG21SP
	Kzu/1dCpk5djoqtKGDFe6njvOJ79zY47RZpmtPFo3P7e9k+WcEHcX4k07JehSmGPOPbN
	RYWbhLJ27UYmSn1oi1VbnK9m2sJskPGiELyY+xiKVy0qlqyslGhfuN2FevMk2UZ+jeKL
	0h97IIZ5FxcUwXk+RGI825zlxEquSPJiH1cSpGEY2oPJkZYEUqVclukKN8uN9VZctTYh
	Hznw==
X-Gm-Message-State: AElRT7E9UyA/5E1iKia1qyM3Otct56YCMqH2AXiD8FNB8yg0zzeV+UDv
	bgAnstQXf7cNsA493975q15JXoXTPDhww7HOjiRQSw==
X-Google-Smtp-Source: AG47ELs1q+DXBRzT3SHzzf1PmxtfAlYGNQOdAyf6/Hjcj1xeWqIzibeNMijZPfQlM+qNZDY5mx4F1VXcKQEIiuDyOzI=
X-Received: by 10.176.68.35 with SMTP id m32mr257097uam.87.1521176814347; Thu,
	15 Mar 2018 22:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <1520806702-5879-1-git-send-email-derek@asterius.io>
	<0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
	<CADNbA1pbbMD+7e8xXwOmzGAUmQXbis_cGx3zTrXLCNnRXqyrVA@mail.gmail.com>
	<c44dd7f9-8f0b-c19b-311e-8364171c8cb3@linux.intel.com>
	<CADNbA1ontzC-45M0e01w1NE=+U01WRqsn-tGuj+j9+1++2ANoA@mail.gmail.com>
In-Reply-To: <CADNbA1ontzC-45M0e01w1NE=+U01WRqsn-tGuj+j9+1++2ANoA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 16 Mar 2018 05:06:43 +0000
Message-ID: <CANx9H-BtAsgq9fhAaodGDXB0aO8vd0rb924Db6rj1GioYTRW6Q@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] python3: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Fri, 16 Mar 2018 05:06:53 -0000
Content-Type: multipart/alternative; boundary="94eb2c06a2c0a8ec0a05678093f8"

--94eb2c06a2c0a8ec0a05678093f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I looked into 3.6 as well, but the sheer number of patches we apply is a
pain point to rebase.

I am inclined to vote for 3.6 first and pick up 3.7 when it matures a bit
and is more widely supported. I have fears of rather massive failures in
our python ecosystem (especially in meta-python). Perhaps backward
compatibility will be there, but I need to be convinced. If 3.7 is widely
the _default_ in traditional distros we support, then I will sing a
different tune. Also, I hope to have a ptest strategy for python by the end
of 2.6, which would dramatically increase my comfort level.

=E2=80=94Tim
On Thu, Mar 15, 2018 at 10:17 AM Derek Straka <derek@asterius.io> wrote:

> I'm about half through the 3.6 updates.  I was hoping to get time in the
> next two weeks to finish it up.  I can just look at going to 3.7 if that'=
s
> preferred.  I don't have a personal preference at this point.
>
> On Thu, Mar 15, 2018 at 1:06 PM, Alexander Kanavin <
> alexander.kanavin@linux.intel.com> wrote:
>
>> On 03/15/2018 06:37 PM, Derek Straka wrote:
>>
>>> Definitely.  I just didn't do the git add.  I'll send out the v2
>>> shortly.  Thanks for catching that!
>>>
>>
>> While we're on the subject of python upgrades, I'd like to ask, what kin=
d
>> of plan do you have for 3.6/3.7? Is anything in progress? When you have
>> some kind of patch ready, we can test it on the autobuilder to iron out =
the
>> issues, and have it ready for when oe-core master reopens for version
>> updates.
>>
>> (I also think that at this point it makes sense to go straight to 3.7 an=
d
>> test with various pre-release versions)
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c06a2c0a8ec0a05678093f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I looked into 3.6 as well, but the sheer number of patches we apply is a pa=
in point to rebase.<br><br>I am inclined to vote for 3.6 first and pick up =
3.7 when it matures a bit and is more widely supported. I have fears of rat=
her massive failures in our python ecosystem (especially in meta-python). P=
erhaps backward compatibility will be there, but I need to be convinced. If=
 3.7 is widely the _default_ in traditional distros we support, then I will=
 sing a different tune. Also,  I hope to have a ptest strategy for python b=
y the end of 2.6, which would dramatically increase my comfort level.<br><b=
r>=E2=80=94Tim<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Mar 1=
5, 2018 at 10:17 AM Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">d=
erek@asterius.io</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v dir=3D"ltr">I&#39;m about half through the 3.6 updates.=C2=A0 I was hopin=
g to get time in the next two weeks to finish it up.=C2=A0 I can just look =
at going to 3.7 if that&#39;s preferred.=C2=A0 I don&#39;t have a personal =
preference at this point.</div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Thu, Mar 15, 2018 at 1:06 PM, Alexander Kanavin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D=
"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><span>On 03/15/2018 06:37 PM, Derek Straka wrote:<b=
r>
</span><span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
Definitely.=C2=A0 I just didn&#39;t do the git add.=C2=A0 I&#39;ll send out=
 the v2 shortly.=C2=A0 Thanks for catching that!<br>
</blockquote>
<br></span>
While we&#39;re on the subject of python upgrades, I&#39;d like to ask, wha=
t kind of plan do you have for 3.6/3.7? Is anything in progress? When you h=
ave some kind of patch ready, we can test it on the autobuilder to iron out=
 the issues, and have it ready for when oe-core master reopens for version =
updates.<br>
<br>
(I also think that at this point it makes sense to go straight to 3.7 and t=
est with various pre-release versions)<br>
</blockquote></div><br></div>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--94eb2c06a2c0a8ec0a05678093f8--
