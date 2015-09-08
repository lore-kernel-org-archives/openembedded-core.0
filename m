Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9F50065C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:14:58 +0000 (UTC)
Received: by qgez77 with SMTP id z77so78260556qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 03:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3tFzN1AWjK24rVSJAft/AqaKUn+Zwc47jp6ZtVZ74cg=;
	b=c+UUBKXMe4iqjcnHg0WhIS/LFV9en3mokI76JW5jgO1hErl9xeR7NZAraziBTz5i60
	4v2WUQXCSK6Y3p2PE5fQ4G4svyxPxogHQlQibZZWovMQ8NP+PVa4XlOWU5X6uD8H/En8
	iVyfiGNqL2j51fBeXUk2iJ0ZSROuwKeBRT20L1naoq/LQ6jGUY3jfu9m8C5qmi/TH8Do
	gxumxV+FqVB099v/8YfupgGzhbAOfEa7C8xay5LfsZbLnIrvvZZV8z+bCMSkr5B6r0kG
	a4jYc+hzZ4kGkiQTF3MGnSpWmyO7mqFlUvoV6U9iztuUKSgG3Y0E1z2VraobUQ9Y4kYu
	dpvA==
X-Gm-Message-State: ALoCoQnOpfGQxC/WT3hibvlfJJlJHTlZoNYYOwKCdnujgGv+Bzjwyqg5F07leAs94CvSVOPOqzGe
X-Received: by 10.140.237.150 with SMTP id i144mr33933865qhc.22.1441707296713; 
	Tue, 08 Sep 2015 03:14:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 8 Sep 2015 03:14:37 -0700 (PDT)
In-Reply-To: <38a54062b7480324d2a289cc18f4c3a8f4d72c8a.1441706663.git.kai.kang@windriver.com>
References: <cover.1441706663.git.kai.kang@windriver.com>
	<38a54062b7480324d2a289cc18f4c3a8f4d72c8a.1441706663.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Sep 2015 11:14:37 +0100
Message-ID: <CAJTo0La8c1nnrCzrfDwfahJ96NeoBfv-qMTDHcfAFou9XS1+Ng@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gdk-pixbuf: 2.30.8 -> 2.31.7
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
X-List-Received-Date: Tue, 08 Sep 2015 10:15:00 -0000
Content-Type: multipart/alternative; boundary=001a113595aa4a8ecb051f39a3ab

--001a113595aa4a8ecb051f39a3ab
Content-Type: text/plain; charset=UTF-8

On 8 September 2015 at 11:05, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> * drop backport patch
>

gdk-pixbuf is a GNOME project, so odd-minor-versions are development
releases and we won't be merging this.  If there's a particular fix you
want integrated, please backport it.

Ross

--001a113595aa4a8ecb051f39a3ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2015 at 11:05,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.=
kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":2h3" class=3D"a3s" st=
yle=3D"overflow:hidden">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windr=
iver.com">kai.kang@windriver.com</a>&gt;<br>
<br>
* drop backport patch</div></blockquote></div><br>gdk-pixbuf is a GNOME pro=
ject, so odd-minor-versions are development releases and we won&#39;t be me=
rging this.=C2=A0 If there&#39;s a particular fix you want integrated, plea=
se backport it.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a113595aa4a8ecb051f39a3ab--
