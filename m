Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6177D758D7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 20:22:32 +0000 (UTC)
Received: by qkhq76 with SMTP id q76so14922094qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 13:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uyDx3PFy2p/YmRD2FSP2xpF9KvdODwwrqPkMIIt3D3g=;
	b=E8r5MIC2K7j1cbnS7euKxOXLddDX48DdXoaPqx0RYwzLfEn1j77LGbCKTncYhxe98g
	4/RoU1gsBe1Bc+fhINeUIQ5Puh8+kBZfsuGNwaRuRBGo1kIKDj+g62a889DUvX8ElDHm
	BldOz1PNubbnOunPGHOoAyTKSDv6FhGK9wntCyDtFxqKvuo1X8x7asGfAj7/py9ARYJr
	+pWZckV/+399+CNouTdWpKLj1MCiWFgUFSfrUdVZvGE6wiza+TgGTBFYkJCu5+bbt8AN
	vvM/ZOXqSsy2+/Yf30JanQ3Lf3+OAbYrcwQTtLKO2H3txq/nfXDn4DlIDnOnghq6DXWy
	EsMQ==
X-Gm-Message-State: ALoCoQmPpRH0m5fmX7wPKZQXlntNMKMq89kMRcXI7yub4E26n5WqmRZQf5L/hWaYrogsY2Rr09/k
X-Received: by 10.140.235.195 with SMTP id g186mr30143148qhc.64.1433881353583; 
	Tue, 09 Jun 2015 13:22:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 9 Jun 2015 13:22:12 -0700 (PDT)
In-Reply-To: <1433871515-528-1-git-send-email-henning@itconsulting-heinold.de>
References: <1433871515-528-1-git-send-email-henning@itconsulting-heinold.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jun 2015 21:22:12 +0100
Message-ID: <CAJTo0LZfi9uQuXAjR0axNR0D=F1UZLWQ=PSiRr26fzGTb+RDkw@mail.gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-2.7/3.4-manifest.inc: add missing dependencies for python-netserver
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
X-List-Received-Date: Tue, 09 Jun 2015 20:22:34 -0000
Content-Type: multipart/alternative; boundary=001a11354c8abb181e05181b84e6

--001a11354c8abb181e05181b84e6
Content-Type: text/plain; charset=UTF-8

On 9 June 2015 at 18:38, Henning Heinold <henning@itconsulting-heinold.de>
wrote:

> * raised the PR number as mentioned in python.inc
>

This isn't required anymore, please leave it at r1 (yes, the comment should
be deleted, feel free to send a patch doing that too).

Ross

--001a11354c8abb181e05181b84e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2015 at 18:38, Henning Heinold <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:henning@itconsulting-heinold.de" target=3D"_blank">henning@itconsulti=
ng-heinold.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":2i7" class=3D"a3s" style=3D"overflow:hidden">* raised the PR number =
as mentioned in python.inc<br></div></blockquote></div><br>This isn&#39;t r=
equired anymore, please leave it at r1 (yes, the comment should be deleted,=
 feel free to send a patch doing that too).</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11354c8abb181e05181b84e6--
