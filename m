Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 791617884E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 17:00:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1521133210; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=bee7uKNQchF6QrQX9Ct/FvSNzW5SR4Sl5yZCdoEMTrY=;
	b=TFE4m7pgdiVIEzJlvSO+cHy5ojWLh7yYE77HWNB+DiBam0eh/eBq4wVOpwUZc6GE1+5O890Z
	he1NFmcPFsYcc4YNBz0g+PQ7rFCN82Hte62a3G1/Ocez3T7c09xEX8N0E22vbym1RQ0TPHpU
	4nIPZl4ohY7p0fi2YNDSupJ3UIM=
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mxa.mailgun.org with ESMTP id 5aaaa69a.7f3c08cc6570-smtp-out-n02;
	Thu, 15 Mar 2018 17:00:10 -0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id w3-v6so9944375itc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:00:09 -0700 (PDT)
X-Gm-Message-State: AElRT7GyIh3Gv51Hp+HJqnxoEcEwG9ETOuLc1RyHsr7x8T6kDIOFBQBI
	sFKzKjfzu6fx2+xAGWBUxUytvDo+Y/6RLs5ZaBE=
X-Google-Smtp-Source: AG47ELuKafLXBUFHQE1biwbXle5bPSeDGeI/wDVWR/bTL4Rxvbf54tN+EmG/f7Gf8Om/dPjnlKlEFOeH1zm6aCA1wL8=
X-Received: by 2002:a24:ad4a:: with SMTP id
	a10-v6mr3061957itj.42.1521133209382; 
	Thu, 15 Mar 2018 10:00:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.74 with HTTP; Thu, 15 Mar 2018 10:00:08 -0700 (PDT)
In-Reply-To: <5baad61a-a285-5aa5-3a7f-ee4dabf3242a@linux.intel.com>
References: <1520806702-5879-1-git-send-email-derek@asterius.io>
	<0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
	<CADNbA1pbbMD+7e8xXwOmzGAUmQXbis_cGx3zTrXLCNnRXqyrVA@mail.gmail.com>
	<5baad61a-a285-5aa5-3a7f-ee4dabf3242a@linux.intel.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 15 Mar 2018 13:00:08 -0400
X-Gmail-Original-Message-ID: <CADNbA1q6JMK=x49Q3VDKC58hLNrK4uKhudf_Zia=CCURiDVMEQ@mail.gmail.com>
Message-ID: <CADNbA1q6JMK=x49Q3VDKC58hLNrK4uKhudf_Zia=CCURiDVMEQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Mar 2018 17:00:09 -0000
Content-Type: multipart/alternative; boundary="00000000000099f68d0567766c78"

--00000000000099f68d0567766c78
Content-Type: text/plain; charset="UTF-8"

I'll stop failing eventually... I'm surprised I didn't get a bounce from
the patch test script.  In any case, I sent the native version.

On Thu, Mar 15, 2018 at 12:31 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/15/2018 06:37 PM, Derek Straka wrote:
>
>> Definitely.  I just didn't do the git add.  I'll send out the v2
>> shortly.  Thanks for catching that!
>>
>
> The change is already in master, so you need to rebase.
>
> Alex
>

--00000000000099f68d0567766c78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ll stop failing eventually... I&#39;m surprised I di=
dn&#39;t get a bounce from the patch test script.=C2=A0 In any case, I sent=
 the native version.=C2=A0=C2=A0</div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Thu, Mar 15, 2018 at 12:31 PM, Alexander Kanavin <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" ta=
rget=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">On 03/15/2018 06:37 PM, Der=
ek Straka wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Definitely.=C2=A0 I just didn&#39;t do the git add.=C2=A0 I&#39;ll send out=
 the v2 shortly.=C2=A0 Thanks for catching that!<br>
</blockquote>
<br></span>
The change is already in master, so you need to rebase.<br>
<br>
Alex<br>
</blockquote></div><br></div>

--00000000000099f68d0567766c78--
