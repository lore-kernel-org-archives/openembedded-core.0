Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 616D97589F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:31:51 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so216587723qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JvOyvVNDo8iMA/lftUn7FC00Cpt8JG9J/OHP1D3kex0=;
	b=KwDOLfti3jNeJJ4SfurvZOJbgH3YMTtsGwtuTz6+vVgmyrCEt6TjJsSjJoeqx/7ATW
	cMRFw8+a7m1xu1+aaOpRBuxVikI8P0hmb/CWv7+YLhsPiq56vvWNxcqBGo9srXLNvaPo
	E26o+/VI5APBsdk4ll/IWe6QZnf7poP3uW8SYiaanJILD8uIa2ZyhduYkEWC8mvef7B8
	k00yOi3bueHGuLyULyfGwWEeSTAtyXetB66fxmFVY6Zu+MBUwdvPZheAtGPsw6Jyteoy
	36ZezAaSCc9FlXCio4XuqPRxSym1f5NhiqVCAUTsTxOJBzlzCkgBnvcnPwHYqD7jH3WH
	5+XA==
X-Gm-Message-State: ALoCoQn9Hhi6TaOeEDZdtww1OQLsRxqT8w4gYRaXjuQFpXY6NhsEP8g7nG3FOaxz/7z0jbVqQ2WQ
X-Received: by 10.55.23.86 with SMTP id i83mr37099825qkh.100.1436567511677;
	Fri, 10 Jul 2015 15:31:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:31:32 -0700 (PDT)
In-Reply-To: <CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:31:32 +0100
Message-ID: <CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Fri, 10 Jul 2015 22:31:51 -0000
Content-Type: multipart/alternative; boundary=001a11470c8a3aceeb051a8cf098

--001a11470c8a3aceeb051a8cf098
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 12:38, Otavio Salvador <otavio@ossystems.com.br> wrote:

> Parted 1.8 is very old and not supported at all. The number of fixes
> after it is such huge which makes Parted mostly useless in new storage
> and disk formats. I see NO benefit in having it and a serious
> maintenance burden.
>

I wasn't aware the situation with the old parted was that bad...  maybe
this should be in meta-oe (if anywhere) after all?

Ross

--001a11470c8a3aceeb051a8cf098
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2015 at 12:38, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ja" clas=
s=3D"a3s" style=3D"overflow:hidden">Parted 1.8 is very old and not supporte=
d at all. The number of fixes<br>
after it is such huge which makes Parted mostly useless in new storage<br>
and disk formats. I see NO benefit in having it and a serious<br>
maintenance burden.</div></blockquote></div><br>I wasn&#39;t aware the situ=
ation with the old parted was that bad... =C2=A0maybe this should be in met=
a-oe (if anywhere) after all?</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a11470c8a3aceeb051a8cf098--
