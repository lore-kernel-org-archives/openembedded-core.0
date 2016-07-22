Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2BDDD6067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 15:11:25 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id f6so49213715ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p97xi/Eleof/mousOf8CrMo403vssklgMcQ9a3JgJO0=;
	b=atzsJFiaSJLlaMC+8NT36oxV1fRyGh3HdRgJwuiE0Tbjvz2xFfiBSdH2Q4AgRkn/FO
	7x6srdrD7LX6IwO0BSXNQ6WwQ469DWxkTrW+UCgIVCaMnZDfB1yT07K8o7cxrtx0mNFK
	J9z/nESoGDeEDNyWKrMt2C+gcoRLjCM6v6yl6dLsbr87Z8yFq2DmZybGl1SXVbTkU5pf
	rpa4fh/67IuiEHytZOqk9/PRAnnI3McYMC9LHToDPRNVe/y65tPZ+AI7eetKGCH37AnH
	hDqzGS4JtiiYQ8oxDEuGllqEnrOSVn6Gli1hIjZ/d4rQFlZz/ifjdEGXLD3paiU1QLaS
	EBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p97xi/Eleof/mousOf8CrMo403vssklgMcQ9a3JgJO0=;
	b=Ai67o4twkpPHVuafySuivAz41ET1mGOqZBJZz96C0BtaiORjtBI7QBR6zjbKO8tPTG
	Q+MMcuJEDQLC3Akfgcm8rtMRItaPg/cPIpOLYMhyP03e0RayzoFvzuxh8kEbllELHBrZ
	grUaSaIU9/uYKnJBqB5927Zy9xQGWsWtEFn+dC8CPZTqUORfSmL1o3zablCykU1YVwIi
	9pFE89sdG3B7FgpknNROwvu2Fhb47e1GqeofZTwSLqjKBmWSAWpsjAoCxIxkXjKKoyzl
	5FWwEjkPAQudThXsru90AjTswO04QBfD5T+sAlZdqiY5x+wdrInwKW+gryZbXjqUEbNM
	73ZQ==
X-Gm-Message-State: ALyK8tLBnvelqEvgPndAiTdQxnsRl1hRwW4w1U8jAjsS1k6oOnaESpl6R5Nw+aI01+75j+tsS16lDtfI+ButyFU7
X-Received: by 10.36.121.204 with SMTP id z195mr59303432itc.22.1469200285624; 
	Fri, 22 Jul 2016 08:11:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 22 Jul 2016 08:11:06 -0700 (PDT)
In-Reply-To: <CAMKF1sqfNqA=EDATUOBauPBDOTQ6uYXhvfH9SuP84jDmT2xw6w@mail.gmail.com>
References: <1469196210-29675-1-git-send-email-ross.burton@intel.com>
	<CAMKF1sqfNqA=EDATUOBauPBDOTQ6uYXhvfH9SuP84jDmT2xw6w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jul 2016 16:11:06 +0100
Message-ID: <CAJTo0LZCPbO2p3quqztesy0dj5UeueNuzgpBG9ZPMVOeyC6V5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oeqa/decorators: handle broken links when creating new symlink
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
X-List-Received-Date: Fri, 22 Jul 2016 15:11:26 -0000
Content-Type: multipart/alternative; boundary=001a114aa46621019805383ad99b

--001a114aa46621019805383ad99b
Content-Type: text/plain; charset=UTF-8

On 22 July 2016 at 15:13, Khem Raj <raj.khem@gmail.com> wrote:

> I think it will fail if the existing file is not a symlink ?
>

No, the only difference between lexists and exists is that exists follows
links.  So in the case of a broken link, exists returns false.

Ross

--001a114aa46621019805383ad99b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 July 2016 at 15:13, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":562" class=3D"a3s aXjCH m=
15612f501a5113f5">I think it will fail if the existing file is not a symlin=
k ?<br></div></blockquote><div><br></div><div>No, the only difference betwe=
en lexists and exists is that exists follows links.=C2=A0 So in the case of=
 a broken link, exists returns false.</div><div><br></div><div>Ross=C2=A0</=
div></div><br></div></div>

--001a114aa46621019805383ad99b--
