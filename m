Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id A0261788E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 17:17:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1521134221; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=1cyWgb2V48L81JmK1iwQyI763MAG+NrzRR1FFpgScMM=;
	b=AsrzIJO4QntVxjB9NbE3jVfP/03XHBYpi0qqCXIYmbIyLKwvtQhL8XqiUN0BeE3NH23yIGRt
	0HRIU2WlhIYRzLEn7fp6UdYGcL8T6/ybfTLCD+uZvT3qHJLABYtCXHZ/5TEY47OeljiXFLv6
	7lEn2XXxubq8v4gzj/l5+q5sMOc=
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mxa.mailgun.org with ESMTP id 5aaaaa8d.7ff25814a4f0-smtp-out-n03;
	Thu, 15 Mar 2018 17:17:01 -0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id h23so9434553iob.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:17:01 -0700 (PDT)
X-Gm-Message-State: AElRT7GVI8G/sHptpOd5P5AjzeTIr/ohCCjqMCa+yJxzXW+FRDmLMSb0
	KTaA34Z5exOgitduXbsFA5B/Fyba07WaWCne4L4=
X-Google-Smtp-Source: AG47ELtL98IdALmZbCTH6E6sLJo3l4sUA1WyQxfezIwed5ijXu+3ajWCYKeG4RpmyC8PpooyQq1QCO/kt5wnY1pqa38=
X-Received: by 10.107.28.203 with SMTP id c194mr3534065ioc.30.1521134220762;
	Thu, 15 Mar 2018 10:17:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.74 with HTTP; Thu, 15 Mar 2018 10:16:59 -0700 (PDT)
In-Reply-To: <c44dd7f9-8f0b-c19b-311e-8364171c8cb3@linux.intel.com>
References: <1520806702-5879-1-git-send-email-derek@asterius.io>
	<0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
	<CADNbA1pbbMD+7e8xXwOmzGAUmQXbis_cGx3zTrXLCNnRXqyrVA@mail.gmail.com>
	<c44dd7f9-8f0b-c19b-311e-8364171c8cb3@linux.intel.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 15 Mar 2018 13:16:59 -0400
X-Gmail-Original-Message-ID: <CADNbA1ontzC-45M0e01w1NE=+U01WRqsn-tGuj+j9+1++2ANoA@mail.gmail.com>
Message-ID: <CADNbA1ontzC-45M0e01w1NE=+U01WRqsn-tGuj+j9+1++2ANoA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
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
X-List-Received-Date: Thu, 15 Mar 2018 17:17:00 -0000
Content-Type: multipart/alternative; boundary="001a11409fe2e265e4056776a800"

--001a11409fe2e265e4056776a800
Content-Type: text/plain; charset="UTF-8"

I'm about half through the 3.6 updates.  I was hoping to get time in the
next two weeks to finish it up.  I can just look at going to 3.7 if that's
preferred.  I don't have a personal preference at this point.

On Thu, Mar 15, 2018 at 1:06 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/15/2018 06:37 PM, Derek Straka wrote:
>
>> Definitely.  I just didn't do the git add.  I'll send out the v2
>> shortly.  Thanks for catching that!
>>
>
> While we're on the subject of python upgrades, I'd like to ask, what kind
> of plan do you have for 3.6/3.7? Is anything in progress? When you have
> some kind of patch ready, we can test it on the autobuilder to iron out the
> issues, and have it ready for when oe-core master reopens for version
> updates.
>
> (I also think that at this point it makes sense to go straight to 3.7 and
> test with various pre-release versions)
>

--001a11409fe2e265e4056776a800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m about half through the 3.6 updates.=C2=A0 I was ho=
ping to get time in the next two weeks to finish it up.=C2=A0 I can just lo=
ok at going to 3.7 if that&#39;s preferred.=C2=A0 I don&#39;t have a person=
al preference at this point.</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Thu, Mar 15, 2018 at 1:06 PM, Alexander Kanavin <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=
=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><span class=3D"">On 03/15/2018 06:37 PM, Derek S=
traka wrote:<br>
</span><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
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

--001a11409fe2e265e4056776a800--
