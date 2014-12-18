Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 41CC7728B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 23:48:45 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id i50so193188qgf.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 15:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OOZxd0wMQHdB7Ind2TMmCf6nmYg2cLSmflmgrYoFgNo=;
	b=SGG31NyKXHvQVaooKLSW7SHrAC9NFmVqjs82OeM9w/ma0DELMyoupxNKRy/6CwFV2o
	NHUoEi8TCIKICt+SJ/29DTome22bIJ4SY50pt/FV/wtlCfi2x3LEL9pPlapJVZqNY5DG
	3nyZBeiMC+5ew4HaHJ9xUS0r5hZBZRqV9QR6EQIKA/Vb4ibP2MxFBzXYlvuHzcOJ59fK
	pIJn4zWYQVSWYtUR2ptIjgsJsU4kDldh+V6AnvOe52kA/0wbosEKx4n6RONnOzXtSCNR
	67SO+PFMsdFrrLVwxQ3f3PDQu8w95IRpdmiatlt/RYgaNvT8p0RDVqDhYdvBPCEtBeRf
	nm3g==
X-Gm-Message-State: ALoCoQmXYg68CTbumEUUBE0g6kTPcscdCaIY2/5KwrtJd44HUAyqRXGbeKk6JPc9mjgl6K12OyW1
X-Received: by 10.224.92.205 with SMTP id s13mr9025006qam.52.1418946526363;
	Thu, 18 Dec 2014 15:48:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 18 Dec 2014 15:48:26 -0800 (PST)
In-Reply-To: <CAJTo0La1Dqzu7cDqkVknM7WxqnnF6fGrrHLLHgoy83ZmM5mO9g@mail.gmail.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<b18c4c9970004784d031a0776245fad792fc6a28.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0Lb3-sYAyMreFv2AFhEo4Ejzmg3eDYOs6avJMjVO5SVjOQ@mail.gmail.com>
	<54931166.2050006@windriver.com>
	<CAJTo0La1Dqzu7cDqkVknM7WxqnnF6fGrrHLLHgoy83ZmM5mO9g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 23:48:26 +0000
Message-ID: <CAJTo0LbU8feubsmN9LAmg54-CDRVFiS9MokEdwQCJFTRUhBDrw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] linux-libc-headers: update to 3.17
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
X-List-Received-Date: Thu, 18 Dec 2014 23:48:51 -0000
Content-Type: multipart/alternative; boundary=089e015375e4a8da23050a863bf3

--089e015375e4a8da23050a863bf3
Content-Type: text/plain; charset=UTF-8

On 18 December 2014 at 20:46, Burton, Ross <ross.burton@intel.com> wrote:
>
> I worry that this is just a workaround in one recipe for a test that is
> failing in other recipes with the 3.17 headers...  doing a clean build to
> see if I'm being over-cautious or not. :)
>

For what it's worth, socat appears to be the only recipe in oe-core that
has a configure-time check for errqueue directly, according to grep
errqueue tmp/work/*/*/*/temp/log.do_configure.

Ross

--089e015375e4a8da23050a863bf3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 December 2014 at 20:46, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div class=3D"gmail_extra">I worry that t=
his is just a workaround in one recipe for a test that is failing in other =
recipes with the 3.17 headers... =C2=A0doing a clean build to see if I&#39;=
m being over-cautious or not. :)</div></blockquote><div><br></div><div>For =
what it&#39;s worth, socat appears to be the only recipe in oe-core that ha=
s a configure-time check for errqueue directly, according to grep errqueue =
tmp/work/*/*/*/temp/log.do_configure.</div><div><br></div><div>Ross</div></=
div></div></div>

--089e015375e4a8da23050a863bf3--
