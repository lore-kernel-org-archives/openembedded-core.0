Return-Path: <ross.burton@intel.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 14E8675791
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:33:29 +0000 (UTC)
Received: by obnw1 with SMTP id w1so5682335obn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=93gHCbdEbRxLmGX3ipb/FwrA0K0Lc9t/rzDQzL6egyM=;
	b=GpsFKNw9v/x7i7LN0Ui5mMp68Ud9zGJyZN7GY5K/jGUqaDHy6FFRAeOowIsFqe5006
	ejsoVcZ/XfnbsbShGs9/nN8ikMzIObJT0uraGnc8gj15NUzyTPS4lX86xMsXB791Tya8
	z+rlvCU5MfzedzBAn01qmVwnT6F1Zj9IWF1eTRHBMzkd3Uy7NNwYLCGIEV/VGOxo02oP
	qHFi9ZfAp5RVoT2/zzl/qpAhzF0iYs6uLko+MIndNKAGAJPtUU3m1KY0WVTzRysUqVUq
	phJbVt5PC6cUzEavqbF43tLwDqWNKwL16Zl5swGHVkJTqpwbMsZT4m1ZOsGCqWpxggiC
	4aBA==
X-Gm-Message-State: ALoCoQm91ViHuhqJmMjqmBbTtCg7/IktMR4iFrCVC3XBP9mCcQEfVv7pQlXZqi8scDFzKhwKy0nQ
X-Received: by 10.182.200.131 with SMTP id js3mr12286010obc.58.1437690809328; 
	Thu, 23 Jul 2015 15:33:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.4 with HTTP; Thu, 23 Jul 2015 15:33:09 -0700 (PDT)
In-Reply-To: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>
References: <1437610956-27049-1-git-send-email-gary@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jul 2015 23:33:09 +0100
Message-ID: <CAJTo0Lb41pKOft88tttTNE-47wDekSbSUbYyUWT12WydtKgaCw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: Use native python3
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
X-List-Received-Date: Thu, 23 Jul 2015 22:33:32 -0000
Content-Type: multipart/alternative; boundary=001a11c23aeafcc995051b927988

--001a11c23aeafcc995051b927988
Content-Type: text/plain; charset=UTF-8

On 23 July 2015 at 01:22, Gary Thomas <gary@mlbassoc.com> wrote:

> This recipe needs python3.  This patch arranges to use the bitbake-built
> version, not the host version (which may be missing or not work...)
>

Needs is a strong word.  The configure script does this:

AC_CHECK_PROGS([PYTHON], [python3 python2 python])

What's actually happening as a patch to simply remove python3 from that
list will also solve most problems - we obviously depend on a fully working
host python 2.

Ross

--001a11c23aeafcc995051b927988
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 July 2015 at 01:22, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mail=
to:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ft" class=3D"a3s" style=
=3D"overflow:hidden">This recipe needs python3.=C2=A0 This patch arranges t=
o use the bitbake-built<br>
version, not the host version (which may be missing or not work...)<br></di=
v></blockquote></div><br>Needs is a strong word.=C2=A0 The configure script=
 does this:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra"><table class=3D"highlight tab-size js-file-line-container" style=3D"b=
order-collapse:collapse;border-spacing:0px;color:rgb(51,51,51);font-family:=
Helvetica,arial,nimbussansl,liberationsans,freesans,clean,sans-serif,&#39;S=
egoe UI Emoji&#39;,&#39;Segoe UI Symbol&#39;;font-size:13px;line-height:18p=
x"><tbody style=3D"box-sizing: border-box;"><tr style=3D"box-sizing: border=
-box;"></tr><tr style=3D"box-sizing: border-box;"><td id=3D"LC43" class=3D"=
blob-code blob-code-inner js-file-line" style=3D"padding:0px 10px;vertical-=
align:top;font-family:Consolas,&#39;Liberation Mono&#39;,Menlo,Courier,mono=
space;font-size:12px;white-space:pre;overflow:visible;word-wrap:normal">AC_=
CHECK_PROGS([PYTHON], [python3 python2 python])</td></tr><tr style=3D"box-s=
izing: border-box;"><td id=3D"L44" class=3D"blob-num js-line-number" style=
=3D"padding:0px 10px;width:50px;min-width:50px;white-space:nowrap;font-fami=
ly:Consolas,&#39;Liberation Mono&#39;,Menlo,Courier,monospace;font-size:12p=
x;color:rgba(0,0,0,0.298039);vertical-align:top;text-align:right;border-sty=
le:solid;border-color:rgb(238,238,238);border-width:0px 1px 0px 0px"></td><=
/tr></tbody></table></div><br><div>What&#39;s actually happening as a patch=
 to simply remove python3 from that list will also solve most problems - we=
 obviously depend on a fully working host python 2.</div><div><br></div><di=
v>Ross</div></div>

--001a11c23aeafcc995051b927988--
