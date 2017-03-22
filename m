Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id DD2A87302A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 10:54:30 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id x35so150162409qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 03:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rq/xgPu1uRtPz6vMyMFXLLmwQcuW5OesZ01OSZU5n4I=;
	b=qnEP67kc2djNJfgxCt/Ei1KwvQHfV13pQ6pns5vWvBktAU9ZtDLv5lRuO+CQpvCwoI
	oXkeQpmH6kd21q7D/32GOGgvpiAIfLo+D8v9+IGJPuz+oNJp9mlSrQmdcsqM7iuFFj9q
	zVHvG14qiCr2YpAzjp04165A1YvbvS+k3jS6z90ekeD9RZR5Mjm1aZXsLhI8X9s+BZfW
	K71YStarM94tTlXxD1C7AGj19mS3AVD7ttz+yGVWxFa7Pso2JEd8GbYFsvAZEzhkq92P
	rck8wGUTLcokoScBoMmp1A1wCpbENG9R497qhwU7mzBnV5SyVhf8tRn7ea9jo7vtBgel
	xq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rq/xgPu1uRtPz6vMyMFXLLmwQcuW5OesZ01OSZU5n4I=;
	b=FfCypKtxMqtkzYO0AZ2ysMyAyhwOxs+eJ3OrL+sVThJz1epNUjrwnKrtCKuz2lAWyV
	/kXO0+qx7tf4sO/4ns71tNqqyWuMs1X5PvNT2OElnS1Vqtiiu1GhijCZZsmIbTdGviuR
	3D4zHFx58LEDwtQRMDR5IcQ5UZS8NDJ6fCGEfQZcZj21hORgQYV/HCFb4Y+Bip2lxjWU
	c5Sdk3icdm3mhd1BZthgfJ4xI1EOHgvWAZkRYbLR4FLTMSfKyN4VT1olqki0SwOm+Pmm
	wbWqxCrZAlafJ4s3KNsb/4Z+GQhu8lJDhVYqbhRIlGGHVHYAGen9zXua9hP+YePSD9MF
	gWYw==
X-Gm-Message-State: AFeK/H0xSezBU2W+jBNm5KNg64GA7VIORGmLopDGPEo8IYk7uZDxEffrb319IoGJC7Z1tZK3lTnrIo1MPgdfcB14
X-Received: by 10.237.53.9 with SMTP id a9mr35731833qte.188.1490180071543;
	Wed, 22 Mar 2017 03:54:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 22 Mar 2017 03:54:11 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703220648410.15178@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703220648410.15178@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 10:54:11 +0000
Message-ID: <CAJTo0LbY4m=t5wzMnoOJxd0EuA+mVai6kovk7YRfZYPT_ymnLw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: possible content for site.conf?
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
X-List-Received-Date: Wed, 22 Mar 2017 10:54:32 -0000
Content-Type: multipart/alternative; boundary=001a11c0285ed117db054b4f9564

--001a11c0285ed117db054b4f9564
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 10:51, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   from site.conf.sample, the obvious content is things like:
>
> * download dir
> * reference to local (in-house) source mirror
> * http proxies/fetching configuration
>
> and so on. any other things people throw into site.conf i can just add
> to a list so readers can understand what that file is truly designed
> for?
>

That's pretty much the expected use.

Ross

--001a11c0285ed117db054b4f9564
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 10:51, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1hz" cla=
ss=3D"a3s aXjCH m15af5a5962d7836a">=C2=A0 from site.conf.sample, the obviou=
s content is things like:<br>
<br>
* download dir<br>
* reference to local (in-house) source mirror<br>
* http proxies/fetching configuration<br>
<br>
and so on. any other things people throw into site.conf i can just add<br>
to a list so readers can understand what that file is truly designed<br>
for?</div></blockquote></div><br>That&#39;s pretty much the expected use.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a11c0285ed117db054b4f9564--
