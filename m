Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED1060102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 12:54:46 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id u12so170290841qth.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 05:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YTgL5XCmN0Q2L59x8EVor/XnmROS7S3y8KUcmKgbkgE=;
	b=mHRWfXNBaKs0BZx3Z6Jv7B1XM63Ya+H22hKHnCzMEFfGbh6MkHyjFLoumQH4CQm7XF
	E/s3wqIu7uSNNJiFK/3MrYMPR9+8fKXek9u/YITOFku8ooYbQGveVwxnJA9MQtao7tR8
	YWfjvBL3QKVgvaX+z5Fibwyb5Icweh7YZzJ5uDGIGwGtE32Shm7OA2u1/tzj0mqQF/q5
	UfRCdDylDLMufnTTccptpvx93zEDxDsYSdrzEWoyqZ6CeP4XizkGZVjpwlQ15xcoHDTu
	xcqafQ1+HHkHBQoPFxoX7nJhmy/FsWObd95fdIT29J7n1dliSxgr2p7kEC7gF1WEgrGJ
	b/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YTgL5XCmN0Q2L59x8EVor/XnmROS7S3y8KUcmKgbkgE=;
	b=RLKX0oa5KKTmBbVLQc5pMGa+Kzbp064yfncRh0wYtghec8rKn/iS0dp/DFLORHxh2N
	BpeuDPaWObubqETQ23TOHD7gUTiUKQNzAyif/xEyzlu013QamWFYoz3Ihf5rKu0GBFJL
	I7Z4qx/mgL+WPsuFajiy5wqjSS0mkJrOfwHGP7k13dH6eB8bhyNr+zCwSfrNY1vYoiSC
	Ee5XmBdVFGG+IchgmWWMpY2zNLqhzZ1KHgPTR/AzjMp+nz8UIaT7+qpxZMJtn5fgPTMA
	eAEl3gabXbgT3GpqPgvbgeiXm7QpsTxAyAJcHuIWk5ma8BGyvswBnGX4iQYu7f2wFqbc
	jcbw==
X-Gm-Message-State: AKS2vOymxCeRswaXooNoywS3CyN8irj3Tad7xofH9BZ1RrHDJgU9CsJy
	2L8dCNLYM3qSWUSWJqk1ik1s89cow9xclpY=
X-Received: by 10.200.45.206 with SMTP id q14mr27651356qta.177.1497358487294; 
	Tue, 13 Jun 2017 05:54:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 13 Jun 2017 05:54:26 -0700 (PDT)
In-Reply-To: <1497354952-16557-1-git-send-email-ed.bartosh@linux.intel.com>
References: <c9ea2fd10e9cf1b06c06d9a9ea402ba1ba8471ac.1497348496.git.ed.bartosh@linux.intel.com>
	<1497354952-16557-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jun 2017 13:54:26 +0100
Message-ID: <CAJTo0LYMK_QA0oBOpU5t9pNgYM+XmiB_B37AcAFR-hQa0RE9fA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] mtools-native: disable reading host configs
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
X-List-Received-Date: Tue, 13 Jun 2017 12:54:47 -0000
Content-Type: multipart/alternative; boundary="001a11379256bcbf990551d6f04c"

--001a11379256bcbf990551d6f04c
Content-Type: text/plain; charset="UTF-8"

On 13 June 2017 at 12:55, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> +Upstream-Status: Pending
>

Inappropriate would be the right choice here.

+SRC_URI_append_class-native = "file://disable-hardcoded-configs.patch"

Whilst the leading whitespace isn't required here, it's good form to
include it

Ross

--001a11379256bcbf990551d6f04c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 June 2017 at 12:55, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:y7" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15ca15125a57183b">+Upstream-Status: Pending<br><=
/div></blockquote></div><br></div><div class=3D"gmail_extra">Inappropriate =
would be the right choice here.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra"><span style=3D"font-size:12.800000190734863px">+S=
RC_URI_append_class-native =3D &quot;file://disable-hardcoded-</span><wbr s=
tyle=3D"font-size:12.800000190734863px"><span style=3D"font-size:12.8000001=
90734863px">configs.patch&quot;</span><br style=3D"font-size:12.80000019073=
4863px"></div><div class=3D"gmail_extra"><span style=3D"font-size:12.800000=
190734863px"><br></span></div><div class=3D"gmail_extra"><span style=3D"fon=
t-size:12.800000190734863px">Whilst the leading whitespace isn&#39;t requir=
ed here, it&#39;s good form to include it</span></div><div class=3D"gmail_e=
xtra"><span style=3D"font-size:12.800000190734863px"><br></span></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11379256bcbf990551d6f04c--
