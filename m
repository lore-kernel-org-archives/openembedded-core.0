Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id DE20072859
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 12:43:09 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id l89so8275987qgf.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jan 2015 04:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=edkQRpzGHPs/aHOggZ0z1fg45vLkpq5A6LeAbfhdoyM=;
	b=XApSw0i7pjAgZ9nWZTtGR0eRiiEf6lb0oNM2UVtjtl9/wduIyn/LdepoFlHu3upsho
	QO5HHyoWe9xVp/Z2EFrO0bUTCJjjDO6vLsvxvno/9TVZZuhvjtNMLCGRB5aiTOpwPmdW
	S73bO8YUlH0ELDLl0cyPKXzjYDlFjJu1l5lpkjyKozKkQmyeIoaqi96Zy7zJ1RYVMHIZ
	WTPCewIA8JYNZlwyJpMPNHw9k8tYENQRBhu6beFAVj9uB7BbCQ7sqd6zAzr9I3p9mWRA
	SVfCVgFp2vd/Z4OGTJRVltVh8slMHQNE0H5xeTj4QqJBdFkhbMKWdkFUS6IOrNJrsWGH
	b5Rg==
X-Gm-Message-State: ALoCoQlWof+GkOxQ7kvlisSrPVuOl15hltjZex596SEnfKe6jgN2TpoE6+JjKSHpp5yZTUKIw6/a
X-Received: by 10.224.20.133 with SMTP id f5mr15201233qab.17.1420807389955;
	Fri, 09 Jan 2015 04:43:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 9 Jan 2015 04:42:49 -0800 (PST)
In-Reply-To: <cover.1419823473.git.hongxu.jia@windriver.com>
References: <cover.1419823473.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jan 2015 12:42:49 +0000
Message-ID: <CAJTo0LacBzaWR933BAViPfMqR5cc+6O-PJBwmjCV4PSjJhJXXw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/4] Packages upgrade: groff and directfb
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
X-List-Received-Date: Fri, 09 Jan 2015 12:43:19 -0000
Content-Type: multipart/alternative; boundary=001a11c2b82ec5df21050c377f30

--001a11c2b82ec5df21050c377f30
Content-Type: text/plain; charset=UTF-8

On 29 December 2014 at 05:47, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Hongxu Jia (4):
>   groff: upgrade 1.22.3
>   groff: fix native perl path
>   directfb: upgrade to 1.7.6
>   qt4-embedded: support c++0x stand for directfb
>

I've merged all of these into MUT apart from "groff: fix native perl
path".  Adding a dependency on perl-native seems like a massive overkill
when the problem appears to me that we just need to ensure that all Perl
scripts in ${bindir} get fixed, or that we set PERL appropriately.  Setting
PERL seems to be the right solution but we need it set for target builds
only, so would this work?

EXTRA_OECONF_append_class-target="PERL=${bindir}/perl"

Ross

--001a11c2b82ec5df21050c377f30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 December 2014 at 05:47, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D":b45" class=3D"" style=
=3D"overflow:hidden">Hongxu Jia (4):<br>
=C2=A0 groff: upgrade 1.22.3<br>
=C2=A0 groff: fix native perl path<br>
=C2=A0 directfb: upgrade to 1.7.6<br>
=C2=A0 qt4-embedded: support c++0x stand for directfb</div></blockquote></d=
iv><br>I&#39;ve merged all of these into MUT apart from &quot;groff: fix na=
tive perl path&quot;.=C2=A0 Adding a dependency on perl-native seems like a=
 massive overkill when the problem appears to me that we just need to ensur=
e that all Perl scripts in ${bindir} get fixed, or that we set PERL appropr=
iately.=C2=A0 Setting PERL seems to be the right solution but we need it se=
t for target builds only, so would this work?</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">EXTRA_OECONF_append_class-target=3D=
&quot;PERL=3D${bindir}/perl&quot;</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a11c2b82ec5df21050c377f30--
