Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB1477F33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 11:47:51 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id a72so58437602qkj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SOAsiKwmknuDTEnUZIDV/JonU+HnFFOm4URDQ3ASQHc=;
	b=keApfycYPZhrAbWsFFh9KwqFoizvgHNxj4HyPp1ghtq345o2MMwp2CAiev6kS35g0J
	PzBShVLcyZeIICU8udtocO+uK2v6v7rMiSrQmqKqFMbXoGdnb4B4BAWFxdD0E1G+ultu
	1IjGWAc589ljkBp+fbTt4dYPBqPSIUs01jYMrenePFFJd9cFfnkvNHaqChtt0YRnH79W
	Rw13s0gBOLACLmbepqFWfzoxlwWRVG041BJhpAe29Yg2/PyWRaXP5EpPfdnXG6g5H9bv
	FVFVtWamztsKSC5OGji3YQ00MTCkvd+b6lwCv3W99G367vHVo2xezjQFn5DUpmZRoVQ+
	J8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SOAsiKwmknuDTEnUZIDV/JonU+HnFFOm4URDQ3ASQHc=;
	b=VUwl76fmFRoALteqle1EbZuou7cGjHb7uryFYOLD7QWToXu3N/Y5Rr0QR5T/bN3nL3
	+INzz1XhXayRwe0tkmeFrY5Xil/3xyWi2Q/FFDJeJGH8XO7jb0w/6zImp/RLnssqNTKJ
	dqLmYlVb1ktYgLPEziaH7WASGOpr3Vcch10ruwxoN2NtRVNZnBCeJqw8yFBkXpeq0cEX
	nuPDWAc0dZSkojVsOiNixvB/Cov9Cmd7FwjaxcWAiY+eYjaCqQpLVsPPGmVdR1Dm5MpX
	AiintiQHG14SPqb7QTpzMSdQku5oie5k5PSZXfp7dvEY1LrGVxKOJF7mMqdBIA/t4E/S
	LT6g==
X-Gm-Message-State: AODbwcDPjcWZo0T/1qpRzmBmEpzn/7W7kT3efxra6PtzWCX02FSVsXcW
	QwXy7aEwxE5A1zUzKcXoRnKPoJMTzug9
X-Received: by 10.55.111.71 with SMTP id k68mr8302166qkc.26.1495194473168;
	Fri, 19 May 2017 04:47:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 19 May 2017 04:47:32 -0700 (PDT)
In-Reply-To: <d0db7f059097d0271e5808dda280140ef49aae6f.1495183828.git.kai.kang@windriver.com>
References: <cover.1495183828.git.kai.kang@windriver.com>
	<d0db7f059097d0271e5808dda280140ef49aae6f.1495183828.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 May 2017 12:47:32 +0100
Message-ID: <CAJTo0LbxO83ka-W2znsakpTwOejgoJzmxFuehogFk5oDhZct2Q@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bind: build with threads and update configure options
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
X-List-Received-Date: Fri, 19 May 2017 11:47:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c05c2d8720e0c054fdf175e"

--94eb2c05c2d8720e0c054fdf175e
Content-Type: text/plain; charset="UTF-8"

On 19 May 2017 at 09:52, <kai.kang@windriver.com> wrote:

> Build without threads for bind is inherited from legacy openembedded.
> All libc's support proper threading on Linux now, so enable threads
> support for bind.
>
> It is also need to disable static library build which cause package dhcp
> fail to build after enable bind threads support.
>
> Options devpoll and epoll are configured to choose most preferable
> multiplex method for unix socket. The priorities are: epoll > poll >
> select. When set '--enable-epoll', it just defines a var and include
> header file that is available for cross compile. So use epoll for bind.
>
> Add PACKAGECONFIG 'urandom' that could use /dev/urandom as random device.
>
> Update file/directory ownerships to fix daemon start failure.
>

This is changing more than documented:

packages/corei7-64-poky-linux/bind/bind-utils: RDEPENDS: removed "libcrypto
(['>= 1.0.2k'])", added "bind (['>= 9.10.3-P3'])"

(and dhcp has the same dropping of libcrypto)

Is this intentional?

Ross

--94eb2c05c2d8720e0c054fdf175e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2017 at 09:52,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.kang@=
windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex"><div id=3D"gmail-:2bt" class=3D"gmail-a3s gmail-aXjC=
H gmail-m15c1fed202a4f4a4">Build without threads for <span class=3D"gmail-i=
l">bind</span> is inherited from legacy openembedded.<br>
All libc&#39;s support proper threading on Linux now, so enable threads<br>
support for <span class=3D"gmail-il">bind</span>.<br>
<br>
It is also need to disable static library build which cause package dhcp<br=
>
fail to build after enable <span class=3D"gmail-il">bind</span> threads sup=
port.<br>
<br>
Options devpoll and epoll are configured to choose most preferable<br>
multiplex method for unix socket. The priorities are: epoll &gt; poll &gt;<=
br>
select. When set &#39;--enable-epoll&#39;, it just defines a var and includ=
e<br>
header file that is available for cross compile. So use epoll for <span cla=
ss=3D"gmail-il">bind</span>.<br>
<br>
Add PACKAGECONFIG &#39;urandom&#39; that could use /dev/urandom as random d=
evice.<br>
<br>
Update file/directory ownerships to fix daemon start failure.</div></blockq=
uote></div><br>This is changing more than documented:</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">packages/corei7-64-poky-lin=
ux/bind/bind-utils: RDEPENDS: removed &quot;libcrypto ([&#39;&gt;=3D 1.0.2k=
&#39;])&quot;, added &quot;bind ([&#39;&gt;=3D 9.10.3-P3&#39;])&quot;<br></=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(and dh=
cp has the same dropping of libcrypto)</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Is this intentional?</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c05c2d8720e0c054fdf175e--
