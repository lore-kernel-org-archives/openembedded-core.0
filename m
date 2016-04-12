Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id A3A276FF7F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 11:18:47 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id o126so23675451iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 04:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DpWpDW25GJiUaRo2bZ90g2OQ1gTeoO03tzKsf74sHI8=;
	b=qCWE6AxlBJUl8oSzRaGD2mbATvEX9XtLs3T8P1c1F9i4G8fAViq+ADfsRB4PzgkRDQ
	8RxPzJl+xIhznw6bmlE/8h/A2PrLyoFLUZ9PPGRsM1IAqHhB1YOs8biWdKXHJY2M+HVt
	lFD9CJp3HRlFqwyp03J1WNW5hTN1rinXUSzQdXakkwtFC7X/UG9+qYExk02LF3Ca92BG
	z+a2tgCoFMWz49nJtBH9QGXtdxqUxvUmdWuXTEI8YMkFhDqqW9sJaKQUcfowZbwT6dWm
	ByWnZDxlsbJj4mhsWcITpgOprX3CBadHrfLiG6ESiuSRCyYu3Mr6p9ScwzqeQYfNuLpQ
	T9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DpWpDW25GJiUaRo2bZ90g2OQ1gTeoO03tzKsf74sHI8=;
	b=HxkWEyVIqfmDfzyvss8pcPdw0oSOSdiLXlx3ssVq4tRssYEBX+1/kVPC7i+zTD/wjc
	jvDEj2BJhbt1YG57KZCZETOttV3VUpJDzatR/99aljayXG6VC38sHjHfd9A+jr6Gd3GM
	lURZ0bkZcdElGiedZMpLYdEyZDN7kmvOZLjP+wyxuMHpXPrMlH8fFrh4rQvKdllD/Fz6
	OY1GvEyvhfUS2ROicW3+wWC3vf3tqXrRUQEiZ8fH0RoPS1x8oOMW7naXvt+hplEYmDDx
	w2CPfVk0c67KPQ/Aw3HS0Sl8xfawrU+f+VWBlAFPT21JgH6qNBfpWxxCZDj/jycE31hO
	IEgg==
X-Gm-Message-State: AOPr4FX4DtLkwmAlY1tly4n+JrPKgnx7PKhQ94LoAOOYdUjhUdnWdGQ/JudsiXjvLa3EbhUl9HreIlQrsPvD5dIo
X-Received: by 10.107.134.84 with SMTP id i81mr2983410iod.99.1460459928171;
	Tue, 12 Apr 2016 04:18:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Tue, 12 Apr 2016 04:18:28 -0700 (PDT)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48ABBA7F11@sestoex09.enea.se>
References: <1460092326-34326-1-git-send-email-sona.sarmadi@enea.com>
	<1460458938.3309.7.camel@linux.intel.com>
	<3230301C09DEF9499B442BBE162C5E48ABBA7F11@sestoex09.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Apr 2016 12:18:28 +0100
Message-ID: <CAJTo0LYUZ0y6uQ9Y5qtQHR_aTEhCPbz3uHjPyDKXpY+Ho2Wpxg@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][fido] bind: CVE-2016-1285 CVE-2016-1286
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
X-List-Received-Date: Tue, 12 Apr 2016 11:18:48 -0000
Content-Type: multipart/alternative; boundary=001a113febc83a502b053047d30d

--001a113febc83a502b053047d30d
Content-Type: text/plain; charset=UTF-8

On 12 April 2016 at 12:11, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> I guess you need this patch:
> https://source.isc.org/cgi-bin/gitweb.cgi?p=bind9.git;a=patch;h=a078c9eeae8c2db7edf2b15ff1d25a3a297c751
>

Was this patch not build-tested then?  Where any of the bind patches
build-tested?

Ross

--001a113febc83a502b053047d30d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 April 2016 at 12:11, Sona Sarmadi <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sona.sarmadi@enea.com" target=3D"_blank">sona.sarmadi@enea.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":xum" class=3D"=
a3s" style=3D"overflow:hidden">I guess you need this patch: <a href=3D"http=
s://source.isc.org/cgi-bin/gitweb.cgi?p=3Dbind9.git;a=3Dpatch;h=3Da078c9eea=
e8c2db7edf2b15ff1d25a3a297c751" rel=3D"noreferrer" target=3D"_blank">https:=
//source.isc.org/cgi-bin/gitweb.cgi?p=3Dbind9.git;a=3Dpatch;h=3Da078c9eeae8=
c2db7edf2b15ff1d25a3a297c751</a><br></div></blockquote></div><br>Was this p=
atch not build-tested then?=C2=A0 Where any of the bind patches build-teste=
d?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a113febc83a502b053047d30d--
